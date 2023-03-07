Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0DEC678DB
	for <phone-devel@archiver.kernel.org>; Tue,  7 Mar 2023 19:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjCGTS0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Mar 2023 14:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbjCGTSJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Mar 2023 14:18:09 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2481EBCB87
        for <phone-devel@vger.kernel.org>; Tue,  7 Mar 2023 11:02:04 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id n2so18373888lfb.12
        for <phone-devel@vger.kernel.org>; Tue, 07 Mar 2023 11:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678215723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhAkzn/X0tQcRaS120MqIAqctrCtFwd7yVxmpVK8Ze8=;
        b=ugtRC0/JdfSlkOYQzMYd6ebNUrbAGDfDzM6Y9au0J9rak6KCP/2RNNMSHNOSmhBqzd
         RYMDrNiNTEIyrI71cvc5mZwHFETAjp4bi0rNU5XlKC/ZThEAIDFzTTLB37HQ0t5lsblo
         fgnpMeUIa7JgkuuCUfou+sVClFnuohVWxmiWD46fdcwEn7U2w3emuHB3vWEZYXrvsszG
         sM6HqW/FOMwKca9Nw2s83u4kYPg68n0xIIqKj0cwVqs2qurWc2k6OOBa8bkGh/fTYgDi
         msQQD3+oEThQ5/2ClmvqdaUVZmcJUXXTmFzRtbrIs8+TvDbqVYDRRaGqF2pRzhKABI9n
         RrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678215723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhAkzn/X0tQcRaS120MqIAqctrCtFwd7yVxmpVK8Ze8=;
        b=3V8Ezwj2QL6Oe7Gme9X6phekOSj9KYB2kZP1hbnO3K5j+5tKKeAA6umMtR0uxKytJO
         Zm6ybe0sT+wf+7Q8YVAKc+3x3As9FOdMwWqPivONGrbjicw6PvIaviG+Qfbh0QnDBkFE
         7kYLRxVeTgX2KQTmJMxYmAlzv/Y20oO3hbNP8LrKMlOIMkSgcMrz3TRSfdB3p5thpOHz
         MsaG85l2L7XfjX+Wkn+UpHzR9er3Fjnhz/352zKt3BgIni3/pOTDx2WKYA0EDg+1ZWj8
         9P1z4EdKZdcS8AGpUXvCh8Yz8KMG2otsYNwb3h51W6MC27wR/yWg51xstsHKGO4+BNgv
         1PQQ==
X-Gm-Message-State: AO0yUKUczsvVwT6MYojLVrOxopcmTXoyWqxmlnTi7/rrZn4O35/xqJVP
        Yt+QPsi6gOxWsPcHy0rGYyn2lw==
X-Google-Smtp-Source: AK7set+ZzCxPUtbFFjgd3Rb9oHP7ljagwX06FHJ57hiAloezLWgC1gkWLmtpQOAaDqcc08spLC2xcA==
X-Received: by 2002:a19:7610:0:b0:4dd:a98b:ae4c with SMTP id c16-20020a197610000000b004dda98bae4cmr3954215lff.14.1678215722993;
        Tue, 07 Mar 2023 11:02:02 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id l8-20020a19c208000000b004db3890cb53sm2119733lfc.223.2023.03.07.11.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 11:02:02 -0800 (PST)
Message-ID: <22b91a6c-7a27-039c-21b8-0d3913e73dbc@linaro.org>
Date:   Tue, 7 Mar 2023 20:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-oneplus-common: add PN553 NFC
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20230307185942.1737867-1-soyer@irl.hu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307185942.1737867-1-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 7.03.2023 19:59, Gergo Koteles wrote:
> The OnePlus 6/6T both have a NQ330 (PN553 + P73N2M0).
> The PN533 supported by the nxp-nci-i2c driver in mainline.
> It detects/reads NFC tags using "nfctool".
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
Next time include a changelog below this --- line detailing
what changed between revisions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 64638ea94db7..5e45801031d8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -380,6 +380,24 @@ zap-shader {
>  	};
>  };
>  
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	nfc@28 {
> +		compatible = "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
> +
> +		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> +		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&nfc_int_active &nfc_enable_active &nfc_firmware_active>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
>  &i2c10 {
>  	status = "okay";
>  	clock-frequency = <100000>;
> @@ -753,6 +771,27 @@ &usb_1_hsphy {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> +	nfc_int_active: nfc-int-active-state {
> +		pins = "gpio63";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	nfc_enable_active: nfc-enable-active-state {
> +		pins = "gpio12";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	nfc_firmware_active: nfc-firmware-active-state {
> +		pins = "gpio62";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>  	tri_state_key_default: tri-state-key-default-state {
>  		pins = "gpio40", "gpio42", "gpio26";
>  		function = "gpio";
