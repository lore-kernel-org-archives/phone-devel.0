Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA38C3526B
	for <phone-devel@archiver.kernel.org>; Fri, 18 Dec 2020 07:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A34523A62
	for <phone-devel@archiver.kernel.org>; Fri, 18 Dec 2020 07:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732941AbgLRHRF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Dec 2020 02:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732937AbgLRHRF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Dec 2020 02:17:05 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E4FC061282
        for <phone-devel@vger.kernel.org>; Thu, 17 Dec 2020 23:16:25 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id j13so849071pjz.3
        for <phone-devel@vger.kernel.org>; Thu, 17 Dec 2020 23:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ApqerofOaEIKVsWbd43tuQ+Rw2I8tWIcPWDX1I3W53A=;
        b=UAJIKEGSbpSZkC/GgKXecPne8+PC5lwlixKKGZVu5LyQCxsHV+IMqv5fqFLMjh9vAg
         OZTlDJoBuLvNqL6EZl2KHKhRN9BNqv92+iIoeedZJAdajhD5a24yUq9sHpBIgTK1ObNI
         r8z3OwDRSTTJPg9BDvdOHnmx4czylI12E7QJjLtEd96+J7s/8MShT2syR1V4InehVVuM
         zjPbea09Ef3w73FaW6HVRWPbiE0nVAruH0ORj15ArLqMuBWbePOYVhk7OqEPHmvzksZ4
         4GinLVyg33Pm7dSLfhOjO3BeIIj9vrUrireY/e1HvK8B5hTYpdD4bfvWWzcqtn0dlKlb
         quFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ApqerofOaEIKVsWbd43tuQ+Rw2I8tWIcPWDX1I3W53A=;
        b=LtJWqTqPwXiRg8353mV/FpaKRT90y9KtRe+CxuWzLOVtiKdwjgP32oVn23fcrKhJV1
         44gVbMmDIjgjlAlnm1zuJinMQWA4y0DE64bltpzkOP8TrVigPps/832dfZ4KG7QHPHxi
         yiLQWMXsBoxZlD6CU4c/mtotpeKzFNo6Ww6qCQh+fKZMPoC2Sw5hpv8VoE1/z+wTld3t
         caUcTubDFh4CN41TlcKhDSNy47W6tFNk8YThxhRNaEpi0DJagzkwU6D6SG5CQBXEkhw3
         edis9KGC3G6tk52suNoChkDxObr/IaSjnsgi6+R05FDMe10qivfi5mdwCztObMY5XXAm
         2kIw==
X-Gm-Message-State: AOAM533mcEdH09jrXRoxnpM0qj2XlJIs2CrkXYLuDtVKuNcz+6TQdtRJ
        6T29l43s3vDObJOJE+KtuxuXlg==
X-Google-Smtp-Source: ABdhPJwwkdb1HZhf5VmdNZ4g8n96cGhrXc8cKebn9Z8gCoxJuUr7hL/V8at4qPDw1zBoKcKg0fmzpQ==
X-Received: by 2002:a17:90a:9512:: with SMTP id t18mr3027950pjo.206.1608275784627;
        Thu, 17 Dec 2020 23:16:24 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id e5sm7794908pfc.76.2020.12.17.23.16.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 23:16:23 -0800 (PST)
Date:   Fri, 18 Dec 2020 12:46:21 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     bjorn.andersson@linaro.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        ulf.hansson@linaro.org, jorge.ramirez-ortiz@linaro.org,
        broonie@kernel.org, lgirdwood@gmail.com, daniel.lezcano@linaro.org,
        nks@flawful.org, agross@kernel.org, robh+dt@kernel.org,
        rjw@rjwysocki.net, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 12/13] cpufreq: qcom-hw: Implement CPRh aware OSM
 programming
Message-ID: <20201218071621.i6bc2xgn6kthvmuw@vireshk-i7>
References: <20201126184559.3052375-1-angelogioacchino.delregno@somainline.org>
 <20201126184559.3052375-13-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126184559.3052375-13-angelogioacchino.delregno@somainline.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26-11-20, 19:45, AngeloGioacchino Del Regno wrote:
> On new SoCs (SDM845 onwards) the Operating State Manager (OSM) is
> being programmed in the bootloader and write-protected by the
> hypervisor, leaving to the OS read-only access to some of its
> registers (in order to read the Lookup Tables and also some
> status registers) and write access to the p-state register, for
> for the OS to request a specific performance state to trigger a
> DVFS switch on the CPU through the OSM hardware.
> 
> On old SoCs though (MSM8998, SDM630/660 and variants), the
> bootloader will *not* initialize the OSM (and the CPRh, as it
> is a requirement for it) before booting the OS, making any
> request to trigger a performance state change ineffective, as
> the hardware doesn't have any Lookup Table, nor is storing any
> parameter to trigger a DVFS switch. In this case, basically all
> of the OSM registers are *not* write protected for the OS, even
> though some are - but write access is granted through SCM calls.
> 
> This commit introduces support for OSM programming, which has to
> be done on these old SoCs that were distributed (almost?) always
> with a bootloader that does not do any CPRh nor OSM init before
> booting the kernel.
> In order to program the OSM on these SoCs, it is necessary to
> fullfill a "special" requirement: the Core Power Reduction
> Hardened (CPRh) hardware block must be initialized, as the OSM
> is "talking" to it in order to perform the Voltage part of DVFS;
> here, we are calling initialization of this through Linux generic
> power domains, specifically by requesting a genpd attach from the
> qcom-cpufreq-hw driver, which will give back voltages associated
> to each CPU frequency that has been declared in the OPPs, scaled
> and interpolated with the previous one, and will also give us
> parameters for the Array Power Mux (APM) and mem-acc, in order
> for this driver to be then able to generate the Lookup Tables
> that will be finally programmed to the OSM hardware.
> 
> After writing the parameters to the OSM and enabling it, all the
> programming work will never happen anymore until a OS reboot, so
> all of the allocations and "the rest" will be disposed-of: this
> is done mainly to leave the code that was referred only to the
> new SoCs intact, as to also emphasize on the fact that the OSM
> HW is, in the end, the exact same; apart some register offsets
> that are slightly different, the entire logic is the same.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 914 +++++++++++++++++++++++++++++-
>  1 file changed, 884 insertions(+), 30 deletions(-)

This is a lot of code, I need someone from Qcom's team to review it
and make sure it doesn't break anything for the existing platforms.

-- 
viresh
