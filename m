Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C311C433DB
	for <phone-devel@archiver.kernel.org>; Thu, 11 Feb 2021 21:46:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25DDD64DA1
	for <phone-devel@archiver.kernel.org>; Thu, 11 Feb 2021 21:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhBKVq5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 11 Feb 2021 16:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhBKVq5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 11 Feb 2021 16:46:57 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E53C0613D6
        for <phone-devel@vger.kernel.org>; Thu, 11 Feb 2021 13:46:16 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E47B21F625;
        Thu, 11 Feb 2021 22:46:14 +0100 (CET)
Subject: Re: [PATCH v2 5/9] clk: qcom: rcg2: Stop hardcoding gfx3d pingpong
 parent numbers
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-6-angelogioacchino.delregno@somainline.org>
 <161307478271.1254594.18219937886787415438@swboyd.mtv.corp.google.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <2fb677ae-03ac-58a9-4b6e-c0c40b9a8e0d@somainline.org>
Date:   Thu, 11 Feb 2021 22:46:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <161307478271.1254594.18219937886787415438@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Il 11/02/21 21:19, Stephen Boyd ha scritto:
> Quoting AngeloGioacchino Del Regno (2021-01-13 10:38:13)
>> The function clk_gfx3d_determine_rate is selecting different PLLs
>> to manage the GFX3D clock source in a special way: this one needs
>> to be ping-pong'ed on different PLLs to ensure stability during
>> frequency switching (set a PLL rate, let it stabilize, switch the
>> RCG to the new PLL) and fast frequency transitions.
>>
>> This technique is currently being used in the MSM8996 SoC and the
>> function was assuming that the parents were always at a specific
>> index in the parents list, which is TRUE, if we use this only on
>> the MSM8996 MMCC.
>> Unfortunately, MSM8996 is not the only SoC that needs to ping-pong
>> the graphics RCG, so choices are:
>> 1. Make new special ops just to hardcode *again* other indexes,
>>     creating code duplication for (imo) no reason; or
>> 2. Generalize this function, so that it becomes usable for a range
>>     of SoCs with slightly different ping-pong configuration.
>>
>> In this commit, the second road was taken: define a new "special"
>> struct clk_rcg2_gfx3d, containing the ordered list of parents to
>> ping-pong the graphics clock on, and the "regular" rcg2 clock
>> structure in order to generalize the clk_gfx3d_determine_rate
>> function and make it working for other SoCs.
>>
>> As for the function itself it is left with the assumption that we
>> need to ping-pong over three parents. The reasons for this are:
>> 1. The initial model was MSM8996, which has 3 parents for the
>>     graphics clock pingpong;
>> 2. The other example that was taken into consideration is the
>>     SDM630/636/660 SoC gpu clock controller, which is ping-ponging
>>     over two dynamic clocked and one fixed clock PLL.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
> 
> Applied to clk-next but I modified it a bunch. Let me know if it doesn't
> work.
> 

Will check asap!
