Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067DFC54E94
	for <phone-devel@archiver.kernel.org>; Thu, 26 Jan 2023 12:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbjAZMYZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Jan 2023 07:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236969AbjAZMYY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Jan 2023 07:24:24 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3F448612
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 04:24:23 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id bk16so1571635wrb.11
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 04:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5pNGXCwTz1ENoQLou7f9bsrBU5EaiVdGvV9v2obRuBo=;
        b=XQqTEu19UhkD7aJwyXWepofFMTYNPVg5MUjoQokJAc8MOKKTiuCcp39R9LNPyoqYj1
         WVwVZNAZdxxSuiI/Ww/SML0loU3PMCNrsTAt1/A8HWQbhabfxjm7+XQVrxg/vsrz0emZ
         eN9S5+yCHXLWLrv1NPHwLNPqyKBslxQx4i/sMkS0fgNymEDE0z+7b6ROaQQ+iOhpLE8A
         gEfTmPlvoV7tR6RmurHTfQ+lPiURsaDE5cz03UsF7qTMl6vT7Epv9DaTtsOV/4hWq4cG
         bQhHRUo5cHLUtAqRd2E5pHE1nJw47vv5toB5jOT5J2fHIve82YptqGjqkgwv07LxVvSY
         /cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pNGXCwTz1ENoQLou7f9bsrBU5EaiVdGvV9v2obRuBo=;
        b=BsbIPUXPWA9MeLGmwUqunuQtluK2gBwdmQHi5OYli4DKWgdlhXCbrZo41xouKmRxp4
         R8oAXIDpRCoPmR9/sYO1lNHR6HVx/ZOZnfyWKnIjoE7A7LFABD3dImBFERn/ptorC66a
         itluI9Ro81PH5US4F0eaA8rZPm8Wxlx37RLI+U+1qpEMjPVjri4+s90x0RD9K1vPR5bR
         3aammq2rz+Njn0fmKn/RGFOnL2BT4rKmqJTGc1VOEk7Fa0vbhpoIsTJWYx8ijrDQBcK+
         cK0pZkr6Ipgq44Xmq7wpGuBH4OM+sTKScbVPqUdV6z3gwFXkA9ktiqUS7Ssi5kKgX67M
         v/sg==
X-Gm-Message-State: AFqh2koPxqHF/BwMv+gk4LGUva4S28PmGA09DOp5kmx5dHke0LL8MtfK
        J26q4fS6bUBedvuy+3aauo5/pKjJ848oWXNB
X-Google-Smtp-Source: AMrXdXv1mD7Bd2DEJwqeRZUx/xVG3lQxh5SAaI5vzwvRWUvpWrdrSRZeYzUrSTRNk3c/aSYWOuwUDA==
X-Received: by 2002:a5d:4eca:0:b0:2be:47d7:b56a with SMTP id s10-20020a5d4eca000000b002be47d7b56amr23147789wrv.11.1674735861676;
        Thu, 26 Jan 2023 04:24:21 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l12-20020a05600002ac00b0029100e8dedasm1367125wry.28.2023.01.26.04.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 04:24:21 -0800 (PST)
Message-ID: <bfbff227-7a97-a45e-40b7-ed73085f9be3@linaro.org>
Date:   Thu, 26 Jan 2023 13:24:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/6] ARM: dts: exynos: add mmc aliases for Exynos4412
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230126103828.481441-1-henrik@grimler.se>
 <20230126103828.481441-4-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126103828.481441-4-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26/01/2023 11:38, Henrik Grimler wrote:
> So that mmcblk numbering is fixed for the eMMC and sdcard, no matter
> if a storage device is attached or not.  Also remove old, no longer
> used, mshc alias while we are at it.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
>  arch/arm/boot/dts/exynos4412.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
> index 7b4e2c442888..9625e9fe63b1 100644
> --- a/arch/arm/boot/dts/exynos4412.dtsi
> +++ b/arch/arm/boot/dts/exynos4412.dtsi
> @@ -28,7 +28,10 @@ aliases {
>  		pinctrl3 = &pinctrl_3;
>  		fimc-lite0 = &fimc_lite_0;
>  		fimc-lite1 = &fimc_lite_1;
> -		mshc0 = &mshc_0;
> +		mmc0 = &mshc_0; /* eMMC */
> +		mmc1 = &sdhci_1;
> +		mmc2 = &sdhci_2; /* uSD */
> +		mmc3 = &sdhci_3;

This is definitely not correct. Several boards do not have mmc1 or mmc2
exposed at all.

Best regards,
Krzysztof

