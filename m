Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3058C433ED
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:18:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7956B61363
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:18:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241488AbhDSTSl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Apr 2021 15:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240737AbhDSTSl (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Apr 2021 15:18:41 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91B41C06138A
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:18:11 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id i81so36556278oif.6
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ad40NSmfYWc631w5assBYPDgHC0ZIRYbUYajOYP7WiU=;
        b=SQwZUtMWPLQTwbDdDTCG/PbRwn1zEvOPwXAPZr1PA1r1TzKJZUQ4SZTi0io5JkQnyO
         mDEFoc1SrHeYaeQnHl69l9ENUr8smTknS1Gj4zseQoR6MCTRJAhw9BQjqHxb5nW500tv
         A/MdIdLvpPSzDHIu+vfmWgGX10vph/uPEGfP/UxMsoP7wnGBk+Tmnhni12HeMc+qyOm/
         txDDSFCdE8ilejSsUn+/T2db13cSJbwbhr4lUS6LjCa9qqLgQpB09uvkITBGcOBRfed+
         3Qt7ew6IIQIwPd3LRl8DSMnBP679ote3DCWHBM+0bc+CP3kMWlQtdRF2S8U5c3l+A5AR
         oKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ad40NSmfYWc631w5assBYPDgHC0ZIRYbUYajOYP7WiU=;
        b=m8NFAgtkzhlNfXtteaDthnnX4b5ddYQFUl5tJTMvSQOc9C80eYQ1rIIaqRU2NxJnY5
         KOkx7g4JvikQvKM9+/z1VdiaMPEfkgW/YF0OSoZq7ndeVwhNfvhTeul2H0deVLy9wz9q
         j4HlOiYcEqhcgvgpHZD/0yQXAF0dbaUGrNQOVK2Dt60DaMrZirutEsytczDHYCoLtVoY
         6qJU8YbDNVxqhAPKL4KyDmsNb37RJRRs7zKSEQnP22/108r3WBGYeZw28kv/lsVOp/kL
         KM4MjBzpDcHQhsuFJWbrIWJ7najfzc9ldhPXCewIta2i6D69nTsrnuIzK3srBqPpxnhS
         peZg==
X-Gm-Message-State: AOAM530WUPvgIo2Q2Jr1WNBrfTvqlNub8Wbhe0pwgj4AQVL+AtwMqoSK
        KOSPKGhxZP5s0Al6X7Dis5Xsrg==
X-Google-Smtp-Source: ABdhPJw2qgJ5FPF8BeB5Xm2YcvlvVarZk4n5BPIPw6o9S9fpuHFTM73atAOXrpHylMurmgD3wCIFZQ==
X-Received: by 2002:a05:6808:138a:: with SMTP id c10mr420144oiw.117.1618859890998;
        Mon, 19 Apr 2021 12:18:10 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x2sm2991125ooe.13.2021.04.19.12.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:18:10 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:18:08 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     viresh.kumar@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 1/7] cpufreq: blacklist SDM630/636/660 in
 cpufreq-dt-platdev
Message-ID: <20210419191808.GT1538589@yoga>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-2-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119174557.227318-2-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue 19 Jan 11:45 CST 2021, AngeloGioacchino Del Regno wrote:

> Add the SDM630, SDM636 and SDM660 to the blacklist since the CPU
> scaling is handled out of this.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bd2db0188cbb..f82f4ec17ff2 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -135,6 +135,9 @@ static const struct of_device_id blacklist[] __initconst = {
>  	{ .compatible = "qcom,msm8996", },
>  	{ .compatible = "qcom,qcs404", },
>  	{ .compatible = "qcom,sc7180", },
> +	{ .compatible = "qcom,sdm630", },
> +	{ .compatible = "qcom,sdm636", },
> +	{ .compatible = "qcom,sdm660", },
>  	{ .compatible = "qcom,sdm845", },
>  
>  	{ .compatible = "st,stih407", },
> -- 
> 2.30.0
> 
