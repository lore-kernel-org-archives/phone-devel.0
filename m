Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D86C433EF
	for <phone-devel@archiver.kernel.org>; Sat, 11 Sep 2021 16:35:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 549B961100
	for <phone-devel@archiver.kernel.org>; Sat, 11 Sep 2021 16:35:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhIKQgg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 11 Sep 2021 12:36:36 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:41915 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhIKQgg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 11 Sep 2021 12:36:36 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A1A1A1F500;
        Sat, 11 Sep 2021 18:35:21 +0200 (CEST)
Subject: Re: [PATCH 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
        abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20210901174347.1012129-1-angelogioacchino.delregno@somainline.org>
 <20210901174347.1012129-2-angelogioacchino.delregno@somainline.org>
 <20210910214820.h6in2ffl5pwu7xtv@Marijn-Arch-PC.localdomain>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <1493d3a8-e4a6-d3f9-be4d-87bddd593997@somainline.org>
Date:   Sat, 11 Sep 2021 18:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210910214820.h6in2ffl5pwu7xtv@Marijn-Arch-PC.localdomain>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Il 10/09/21 23:48, Marijn Suijten ha scritto:
> Hi Angelo!
> 
> On 2021-09-01 19:43:47, AngeloGioacchino Del Regno wrote:
>> In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
>> checking if the relative CTL is started by waiting for an interrupt
>> to fire: it is fine to do that, but then sometimes we call this
>> function while the CTL is up and has never been put down, but that
>> interrupt gets raised only when the CTL gets a state change from
>> 0 to 1 (disabled to enabled), so we're going to wait for something
>> that will never happen on its own.
>>
>> Solving this while avoiding to restart the CTL is actually possible
>> and can be done by just checking if it is already up and running
>> when the wait_for_commit_done function is called: in this case, so,
>> if the CTL was already running, we can say that the commit is done
>> if the command transmission is complete (in other terms, if the
>> interface has been flushed).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> index aa01698d6b25..b5b1b555ac4e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>> @@ -682,6 +682,9 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
>>   	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>>   		return 0;
>>   
>> +	if (phys_enc->hw_ctl->ops.is_started)
>> +		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
> 
> In the previous commit you introduced is_started to the ops struct as
> function pointer, and you probably intend to call it here instead of
> just checking whether it might be NULL.
> 
> As far as I remember this was also the reason for previously mentioning
> that it was faulty and required a v2 in:
> https://lore.kernel.org/linux-arm-msm/bdc67afc-3736-5497-c43f-5165c55e0354@somainline.org/
> 
> Thanks!
> 
> - Marijn
> 

Ugh. I've pulled this from the wrong tree.
Sending a v2 asap.

>> +
>>   	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
>>   }
>>   
>> -- 
>> 2.32.0
>>

