Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AB7C433E1
	for <phone-devel@archiver.kernel.org>; Mon, 22 Mar 2021 16:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D64D6198D
	for <phone-devel@archiver.kernel.org>; Mon, 22 Mar 2021 16:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhCVQSs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 22 Mar 2021 12:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbhCVQSP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 22 Mar 2021 12:18:15 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4371CC061574
        for <phone-devel@vger.kernel.org>; Mon, 22 Mar 2021 09:18:14 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id hq27so22244323ejc.9
        for <phone-devel@vger.kernel.org>; Mon, 22 Mar 2021 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5fPU70P+apIZaZ90738281RBQVtiFO6xyPzB24/nFj0=;
        b=PPVMKoO2LmrxB/EqF6MdsVCuOvCwzdnYIGu2CT53plAQh+yZIwJP+JPbBQG8Mez/X4
         dL+oIx21/VF4Hq39I/bVUmtrzWJmFH7xgszYCiT6J/He6X7upD15585k4QOPFADu+/eD
         QGre1T0qcLb0GWCg+tAd2MOaQpSFdYMLRvJ9ocygy2vTtaMWSScKS0tdYl6wOAWqz4wo
         LuanlAHsC/rGWiQE/jkEUFFhBiiHpYDaYCa8eUN8gX7TC4Pna+GrsqForZ85Nrxp3sbW
         U9FgvTr2gCIpDVhOQvLw9b1r+gGjYEy2RnlbmW5LH+1/GPpC1dGpGaafVjfP69uGspZ+
         3Chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5fPU70P+apIZaZ90738281RBQVtiFO6xyPzB24/nFj0=;
        b=KJUOHTC4WuZt7MrwsPoB/591FN/mKrxm3J1/1GzJ3vXywc5F67BN3S122n4c3IkN4J
         5Pbz9AVUUnqzfDpIhCvnyBRyXB4PrP3+IaWYh14uavaRN65cnnnOichfqm8YQXkLXVRg
         Q2ky8Li7Dqlu4YqTSurxqDQ/xADT7msG0o9GdceeJ/5AleyWsjGy0EI8U28dBB3YBXFP
         kWQ2eRC2wqqJz57VP8VGNJQgTI4W9iP/7hhUNzXKQU8kdje7LL4OC3I5pd4zQcoRgz6v
         bdaUaz3rNEhJb3hJX65ft+fo2r6Fv/SYfippcFboCCxnvTPKgT4FHVK5KDDKU8qUp5Jj
         zMIg==
X-Gm-Message-State: AOAM531fYwbREH8UgJkUxN1Vh7REUlFyM+mizS+yS3+ytZqwmFBeOSaM
        8wZUxC2iI+g9RDsK3I9zDndAqA==
X-Google-Smtp-Source: ABdhPJxWxOTWcNLPwlbFuHUTnCQvbb7chDavRLIX6ffZBF7loKDa89ZLnniTNDnUEtQqJ6ccAuewSw==
X-Received: by 2002:a17:906:b316:: with SMTP id n22mr539237ejz.249.1616429892990;
        Mon, 22 Mar 2021 09:18:12 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id q12sm9950268ejy.91.2021.03.22.09.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 09:18:12 -0700 (PDT)
Date:   Mon, 22 Mar 2021 16:18:10 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210322161810.biagj2qro66rv4gt@maple.lan>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/qcom-wled.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 3bc7800eb0a9..497b9035a908 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1704,6 +1704,7 @@ static int wled_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id wled_match_table[] = {
>  	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
> +	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
>  	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
> -- 
> 2.30.1
