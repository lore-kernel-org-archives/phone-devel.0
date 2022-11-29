Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD3CC46467
	for <phone-devel@archiver.kernel.org>; Tue, 29 Nov 2022 13:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbiK2N3m (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 29 Nov 2022 08:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiK2N3k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 29 Nov 2022 08:29:40 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB334627EF
        for <phone-devel@vger.kernel.org>; Tue, 29 Nov 2022 05:29:39 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id n1so12271697ljg.3
        for <phone-devel@vger.kernel.org>; Tue, 29 Nov 2022 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rKJhVyRGUk4beI2B134E4lnab0QniJpFD4ue42GKmoQ=;
        b=gX2VO5eWszA5m64OjvHkVs7GZV1B6rsOlcXF/Ig9YJW0gnLt8hrbou6SLhqH4rCyIl
         yZqZ5KM8+AIeNhulHYFRbN5nGcXOL5GLVql1jHTNR1iixH3Ynw/ePjOi8bQf3H/BIHts
         JbzvUhDRadwmhI7NUWo8vWscuD+dbCfhHC4TYDzuihz4srY3K4LmTjRu8z5W9kRo2Vmd
         gzYQJfFqJQAwgcYBrJ1Yj34JtyW8R/Xab+qjMiECyZaV803w7y7/mEtwj3QhgmIAT7kk
         ZUugGAPlxMyABqxl/ApMVkIujvKRG6QBjoVLWmr+c0iMyt4RnR3rv9iDsVAAB9FaeWRa
         pCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKJhVyRGUk4beI2B134E4lnab0QniJpFD4ue42GKmoQ=;
        b=c8/L8fuvP+5fRBfNNL48Pdpebrl/OE6A75kncT+ao98AgnFiduWaA6m4UxVEnkSn/F
         N5lROdMEWfKdUYptp+jEStLs9nBNyIRCmZO8DT38KBOFCV3HLUYUiJWOWDrnxFKX7rSl
         KobNmqLOnNOmzSnbxhyPiDmHWXAtStl2FYMMjhKbc5Y2uyK+9bQe/w/xz4KfTvCkUBD9
         0rp3Fp9ZGzLtV6psWclQthEvoHsqt4hY1ktHEn70/J9uMlXg1lF9cZIR7aibJ931zuEv
         L+9u4+A31Rb7NPFlZhxtnsD02y+qgEaxswx9COyWe0mKM1uTD4erOp1T76ALOnFl001/
         q7HQ==
X-Gm-Message-State: ANoB5pkSqrHmfYM9O20t+FkAQz546jfYGX4QxO0+uyIERVO+kh7sYnze
        R7uIwOCz0on+3FeBEZ+kB6hsGw==
X-Google-Smtp-Source: AA0mqf6kfHONa8T7ELuxkKXU8LMOCkZTyUF5FwXqy9geQvr+hzrnarng0//lfGE1HAaPhG1tASpVFA==
X-Received: by 2002:a05:6512:2390:b0:4ac:7d84:cba8 with SMTP id c16-20020a056512239000b004ac7d84cba8mr13811746lfv.425.1669728578076;
        Tue, 29 Nov 2022 05:29:38 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id m22-20020a197116000000b004aab0ca795csm2204040lfc.211.2022.11.29.05.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:29:37 -0800 (PST)
Message-ID: <b20432e8-115c-407f-2480-6dd429ce5c25@linaro.org>
Date:   Tue, 29 Nov 2022 14:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RESEND PATCH 2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 NFC
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221128173744.833018-1-luca@z3ntu.xyz>
 <20221128173744.833018-2-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221128173744.833018-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 28.11.2022 18:37, Luca Weiss wrote:
> Configure the node for the NQ310 chip found on this device, which is
> compatible with generic nxp-nci-i2c driver.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> RESEND to fix Cc
> 
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> index 2920504461d3..fde93cbcd180 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> @@ -63,6 +63,21 @@ touchscreen@48 {
>  	};
>  };
>  
> +&i2c_5 {
> +	status = "okay";
> +
> +	nfc@28 {
> +		compatible = "nxp,nq310", "nxp,nxp-nci-i2c";
Unless there was some binding change (that was not emailed to me with
this email, I only got 2/2), only "nxp,nxp-nci-i2c" and
"nxp,pn547", "nxp,nxp-nci-i2c" are allowed.

The node looks good though.

Konrad
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> +		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
>  &pm8953_resin {
>  	status = "okay";
>  	linux,code = <KEY_VOLUMEDOWN>;
