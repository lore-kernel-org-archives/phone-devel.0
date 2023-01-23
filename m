Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99095C54E94
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 16:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbjAWQsx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 11:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbjAWQsw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 11:48:52 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265E229414
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 08:48:51 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mp20so32093639ejc.7
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 08:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juz46s3FiDdEs9rs33v7d1aVH0ysvr9X47OMEfmTYQc=;
        b=WM067+mlI+8i8h6eAVzT3eiVHH1jMagTYEqEfRdIxfo0u9PTlFH3WSgssTQRu9o3E3
         bA/cQVnqbcC56QccNtZNX5kVFYCha9pvIvzJMhySudiZqCAi984l0Z0HxyU383a3a0gl
         PjIth1WpGBOVzPHuM8ds158mGDYJr7Fma/QzL9vvV0T3Igun6drqfkFpAyV0znKwgVM/
         RbaHv1M6SAK16t9CYre/8p6SNonsLnL3WKflCNlXZvjPDfZF6VZEI+LFp/OPpdXc6gmO
         iz/DWwNWFUglzAaogygWT3O+2o+EZsAiiVcCvXqZoGoGVuow0NzxMUN+xhX7DqF1fC2z
         0Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juz46s3FiDdEs9rs33v7d1aVH0ysvr9X47OMEfmTYQc=;
        b=8FmrHrrKPhvdM1K0qI6uqXmkSJZFiYxEMySMjLN4f9/tIsIOznVMyuuTEDAcEzhkl+
         v7ZWcksrLnTlltBLOz3YWKPePN2KlsPC5Mk6vK1Wnv+tvgN8tS2N/dyurhCx+dYjFUGa
         +z3miZWwc0/GxpJKh0lhUCHQMBMqVbIYBez+UqKjn0zZhonGilE7/HSXL2NhTgAz3Zwf
         szh5XXiY9n+iwX92knanyixGsh2CUsrnrKYn7SG9fKb++/wiTSIFc+Tn0TNVERCeTyNR
         DE7eLTKfrOH1F/pXYAcAwg9VggFIvJabpueCnZ5oni6Am/j6wFlx3pU1Q/UKBi5k4MMe
         1QSQ==
X-Gm-Message-State: AFqh2kpxZhVK7iywUFTJ2ELnzn1cd/hUEhGls+WNy/cL6ctUdOPeBQoW
        Xa9fXcOGjtkHcp5MWtPRFppDdQ==
X-Google-Smtp-Source: AMrXdXvIXcbH4UEK131yDd+ts6HxEAsmVjpAtgm2xSNtt/vtSspvA+02QUO23mOp0JMcMj5zO6ulMw==
X-Received: by 2002:a17:907:d401:b0:7c0:c220:a33d with SMTP id vi1-20020a170907d40100b007c0c220a33dmr29196610ejc.9.1674492529690;
        Mon, 23 Jan 2023 08:48:49 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id c10-20020a17090618aa00b0084c6ec69a9dsm22186837ejf.124.2023.01.23.08.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:48:49 -0800 (PST)
Message-ID: <a373c719-a4f7-20d1-1b97-efdd5c350035@linaro.org>
Date:   Mon, 23 Jan 2023 17:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] ARM: dts: qcom: Add support for Samsung Galaxy Tab 4
 10.1 LTE (SM-T535)
Content-Language: en-US
To:     Stefan Hansson <newbyte@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-4-newbyte@postmarketos.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230122144749.87597-4-newbyte@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 22.01.2023 15:47, Stefan Hansson wrote:
> Add a device tree for the Samsung Galaxy Tab 4 10.1 (SM-T535) LTE tablet
> based on the MSM8926 platform.
> 
> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
> ---
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../dts/qcom-msm8926-samsung-matisselte.dts   | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d0c07867aeab..e1fad9eb0d26 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1061,6 +1061,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8916-samsung-e7.dtb \
>  	qcom-msm8916-samsung-grandmax.dtb \
>  	qcom-msm8916-samsung-serranove.dtb \
> +	qcom-msm8926-samsung-matisselte.dtb \
>  	qcom-msm8960-cdp.dtb \
>  	qcom-msm8974-lge-nexus5-hammerhead.dtb \
>  	qcom-msm8974-sony-xperia-rhine-amami.dtb \
> diff --git a/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
> new file mode 100644
> index 000000000000..6df568f1f36d
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2022, Matti Lehtimäki <matti.lehtimaki@gmail.com>
> + * Copyright (c) 2023, Stefan Hansson <newbyte@postmarketos.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "qcom-msm8226-samsung-matisse-common.dtsi"
> +
> +/ {
> +	model = "Samsung Galaxy Tab 4 10.1 LTE";
> +	compatible = "samsung,matisselte", "qcom,msm8926";
> +	chassis-type = "tablet";
> +};
> +
> +&pm8226_l3 {
> +	regulator-min-microvolt = <750000>;
This is identical as the common value.


> +	regulator-max-microvolt = <1350000>;
> +	regulator-always-on;
This value already exists in common.

> +};
> +
> +&pm8226_s4 {
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <2200000>;
> +};
> +
> +&reg_tsp_3p3v {
> +		gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
The indentation here seems off.

> +};
> +
> +&sdhc_2 {
> +	/* SD card fails to probe with error -110 */
Maybe this SKU has some different pin properties or
needs some external GPIO/regulator?


Konrad
> +	status = "disabled";
> +};
> +
> +&tsp_en1_default_state {
> +	pins = "gpio32";
> +};
