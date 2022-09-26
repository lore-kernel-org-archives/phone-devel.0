Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86C1C6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:51:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiIZIvN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbiIZIvH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:51:07 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3402872C
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:51:04 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id n10so9024802wrw.12
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=23K9mktk1PipGt+2cteektluJX33ahCAvQ1DGF6APT4=;
        b=JmssjflPqoPY9anMurCZuqhieS6y3ia/3PGdGODIDzU05ComsQHirsz6xrCPfNV7zx
         wtx3/hpTVAIoaf6w/0QCt824bChE8DApjkS+ughVXtMNqa+/betw0/t5r5oR5uhGtA70
         9WwbTcOyi0rs8EmJlrsL6YerHYyJnGN2nluKPDvta1S7Nb+4dDYq80UTGFHpc0Yl27p7
         UloD8hS8ZSN1Xa2MBIA1iU3pHp437ZUug7bz8wxg7O9uDuMigCZjp7VX0zNqPIhb8BOy
         d4jISGb3wDMfsqEGmCKF6yw4IjO9DFtyjhiXnJT5Wc2NmLxoWaV1GYW/QTcZNnfqfF+l
         VV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=23K9mktk1PipGt+2cteektluJX33ahCAvQ1DGF6APT4=;
        b=bI6zFYKcFxr0wgdjL0zcBQgFrrWVlW8k+PKDbOtkA7TIc21TQFFADjMHtAlTIA6zBs
         yDajpRS8NzgSdVdnc8ljnDriOPY8ZqN96Bs6E6/QxHByqH2VkgKwkZsGdjgvf8RudV43
         9ictLSOko6LEBbimVfOb/2qar7Uqr8X/lkc9zQ5jEm0E09jh1Jk5SHc2W8nv4T3DcbHk
         LeoHXwAyBNanI950cHGQMFDTYYPoamJcSEeTTpB+is7o/hh1SbXxmFZxd8Ojt4R6BMQ4
         eMyiHkaAqqpWcJDzqNLFcCjGfLGr9OOkR7D4l7qIDHZoqAmh+fnVstThAgHNFzuuhx73
         gv+g==
X-Gm-Message-State: ACrzQf2ZjSwDBaLlVa+Mm1waXWVE5xZvgeBgGG3Z3ZeldnXowD+HO1sv
        FQBSgxlcKg/c07Eb5ii8EaI3hQ==
X-Google-Smtp-Source: AMsMyM50EBUEmT0EBoFm8XVGuuN4X5dJUr4H1dnP3Kz+Hi9L3OwRFxsgT9Sn8oqcDVZvLh+FH/p1WA==
X-Received: by 2002:a05:6000:1cc:b0:22a:e8c6:9f57 with SMTP id t12-20020a05600001cc00b0022ae8c69f57mr12101861wrx.527.1664182263030;
        Mon, 26 Sep 2022 01:51:03 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003b33de17577sm11880036wmq.13.2022.09.26.01.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:51:02 -0700 (PDT)
Message-ID: <b0f42da0-c302-dd95-8fd7-95f125a9d4f2@linaro.org>
Date:   Mon, 26 Sep 2022 10:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-sony-*: fix multi-led node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925175631.103535-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925175631.103535-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 19:56, Luca Weiss wrote:
> The name rgb-led is not allowed, multi-led is supposed to be used.
> 
> <snip>/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dtb: pm8941@1: pwm: 'rgb-led' does not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
>          From schema: <snip>/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi           | 2 +-
>   .../arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> index 5a70683d9103..c1d97190ea71 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> @@ -178,7 +178,7 @@ &pm8941_lpg {
>   
>   	qcom,power-source = <1>;
>   
> -	rgb-led {
> +	multi-led {
>   		color = <LED_COLOR_ID_RGB>;
>   		function = LED_FUNCTION_STATUS;
>   
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> index 85348562e861..94daa1a3240a 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> @@ -295,7 +295,7 @@ &pm8941_lpg {
>   
>   	qcom,power-source = <1>;
>   
> -	rgb-led {
> +	multi-led {
>   		color = <LED_COLOR_ID_RGB>;
>   		function = LED_FUNCTION_STATUS;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
