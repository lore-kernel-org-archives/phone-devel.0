Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83D5C4338F
	for <phone-devel@archiver.kernel.org>; Sat, 14 Aug 2021 10:46:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A21E660551
	for <phone-devel@archiver.kernel.org>; Sat, 14 Aug 2021 10:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237877AbhHNKqe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 14 Aug 2021 06:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237828AbhHNKqe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 14 Aug 2021 06:46:34 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3F1C0613CF
        for <phone-devel@vger.kernel.org>; Sat, 14 Aug 2021 03:46:05 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o1-20020a05600c5101b02902e676fe1f04so8892989wms.1
        for <phone-devel@vger.kernel.org>; Sat, 14 Aug 2021 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GifoOqx6SBFwu3FmttmT9/vPFr3vQ27vYXItoPzfJbw=;
        b=iGKh7WrVF4MYNXHXmMuE4HGs2rA+BEqWJdnXx5ZB4V8/VbbgOA+EVrDUxNhEIqD3ou
         ornGW1iaYUVFiU29FPznnm5EeccA8yzASP2GO1Og95jGLgHz+Fux3CiVQh/3ppoU4wCj
         e6TXhrqpVniBVAAQhPCmNpBv327gwXRClqIw+d4GbEJubjreuydBJ0Ez2wAVAnNGlQGI
         s0gW6WB6TEi5rFjmilKmtFyCj3STAbLcnKrZiCet9tNZLODUSkClFeSs1EcXdfvmcNOn
         KhQSrlr4wcrwm3hvLDkDAjrL16ZM2AyYi85tdEAV/Z0lRBefuHBYKa+aSzTVOFm3/Vzo
         ozmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GifoOqx6SBFwu3FmttmT9/vPFr3vQ27vYXItoPzfJbw=;
        b=HojDQ/HvHGF/HdxXhLmj4T7gfGHUTei4bu2VG9a2MPQlZg+Brh3laLj/dtbKXTJ35m
         GKdKldrFQBRMOUeV9whlDJ4rffkvZTkQXmOWsSKprPI27ZXRvBThRpDdZppAhJnuAQQF
         id7N2q9SWuoANn0Mc5j5BpMzO+YC95IcTPJOSntYGzwkew15/sk1oaRGZkMV0tECDoDT
         mtwrm5JiybQsk4/MqQmtDW5BBt4pBSRTxKaT86PPjG1ARsio/l18H+dtyaAZeIjyziKp
         V4BLWE7uP8S7QXjplHgkbFBHfic96tFaDBj0wndrPLpYOsdpaL4Xc1oTEgAcQdG0xLN6
         FvtA==
X-Gm-Message-State: AOAM530Nld7txnFpszv6u+Avbz7DKv0zxKGmO8b6En/RzKLicbyVrHrW
        MGmcuXmrlbZipMAPPl2S5Y8SJQ==
X-Google-Smtp-Source: ABdhPJwD51MeaLVeBz/WK26aIMBhej+CHSLIoF//Z0NKAcKPUzPRVFdORiIYFrqgmWAsn3DfbaNlBQ==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr6639569wmi.176.1628937964110;
        Sat, 14 Aug 2021 03:46:04 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5df3:d0eb:3945:640d? ([2a01:e34:ed2f:f020:5df3:d0eb:3945:640d])
        by smtp.googlemail.com with ESMTPSA id f2sm4210847wru.31.2021.08.14.03.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Aug 2021 03:46:03 -0700 (PDT)
Subject: Re: [PATCH v8 1/5] cpuidle: qcom_spm: Detach state machine from main
 SPM handling
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, rjw@rjwysocki.net
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com,
        jami.kettunen@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        stephan@gerhold.net, robh@kernel.org, bartosz.dudziak@snejp.pl
References: <20210729155609.608159-1-angelogioacchino.delregno@somainline.org>
 <20210729155609.608159-2-angelogioacchino.delregno@somainline.org>
 <YQsbBQAdGhX7eO+5@builder.lan>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f688b8b4-4fdb-4497-22db-920bd67d255e@linaro.org>
Date:   Sat, 14 Aug 2021 12:46:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQsbBQAdGhX7eO+5@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 05/08/2021 00:56, Bjorn Andersson wrote:
> On Thu 29 Jul 10:56 CDT 2021, AngeloGioacchino Del Regno wrote:
> 
>> In commit a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic
>> CPUidle driver") the SPM driver has been converted to a
>> generic CPUidle driver: that was mainly made to simplify the
>> driver and that was a great accomplishment;
>> Though, at that time, this driver was only applicable to ARM 32-bit SoCs,
>> lacking logic about the handling of newer generation SAW.
>>
>> In preparation for the enablement of SPM features on AArch64/ARM64,
>> split the cpuidle-qcom-spm driver in two: the CPUIdle related
>> state machine (currently used only on ARM SoCs) stays there, while
>> the SPM communication handling lands back in soc/qcom/spm.c and
>> also making sure to not discard the simplifications that were
>> introduced in the aforementioned commit.
>>
>> Since now the "two drivers" are split, the SCM dependency in the
>> main SPM handling is gone and for this reason it was also possible
>> to move the SPM initialization early: this will also make sure that
>> whenever the SAW CPUIdle driver is getting initialized, the SPM
>> driver will be ready to do the job.
>>
>> Please note that the anticipation of the SPM initialization was
>> also done to optimize the boot times on platforms that have their
>> CPU/L2 idle states managed by other means (such as PSCI), while
>> needing SAW initialization for other purposes, like AVS control.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
>> Tested-by: Stephan Gerhold <stephan@gerhold.net>
> 
> Rafael, Daniel, any objections to me picking this patch through the qcom
> tree?
> 

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
