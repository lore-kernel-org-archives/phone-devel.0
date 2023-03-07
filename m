Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7FBC678D4
	for <phone-devel@archiver.kernel.org>; Tue,  7 Mar 2023 18:49:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbjCGStc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Mar 2023 13:49:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbjCGStL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Mar 2023 13:49:11 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BA4BE5D6
        for <phone-devel@vger.kernel.org>; Tue,  7 Mar 2023 10:37:39 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id m6so18338947lfq.5
        for <phone-devel@vger.kernel.org>; Tue, 07 Mar 2023 10:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678214239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMmwYY2pGzkzSB5ytf8m0RJgBXPWAAa+gKUWc1OULJw=;
        b=so7LEuVRSsWNM9+euTAo1bxo7J/6iHbLQQVZwsXb5HDivVcmtfujaD+VwbqO1Fd41P
         k5IJQWX6zwHjUXKRR8ivCD8Rw3nGDI/lGZ16oq6Kkn45Xb2FddhsSUmbRJZFK1eRnrkY
         1RWLpG9RrHdN+k7lRgu+z/lfBG6CkysKPpTE6ggRQG5rWrA8hkgALMNiFe7oLomhpZN8
         hJtxgq7CFij8NBXXaJLlsl3P7WNIyMkJ00E6jtlY7/wSCkomHhvwdBT5TZeOkyCXMyJ+
         d+nwGSiHDnybScBRXK7OPLFytCrWEsa8J756WZQ1PGnnZHd4WMh6AffQ1nLriATV5417
         /Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678214239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMmwYY2pGzkzSB5ytf8m0RJgBXPWAAa+gKUWc1OULJw=;
        b=DObglcdvI1qb0ndhfqz+oGeizuYG5IfBLtnRr+5tkU6CoI/vUjhZc/zdOo4qe2HRuJ
         aVkECwqGLIawvakPmNTC/5PSkXXF1pMwedsYKqahXt3MpekPA7vQBmjVqzZTPVcBTvaL
         Evcoe5U8qizahO9xNJuRhsl8XyshA8QOulUuo8VZgsod++wU67iWAumFKkfRRt/jLOIl
         Xc0OWmsGLor+PQE7Ofxw2CnO8dHKHOE6/8mdnr7hvEoDHX6rFENIHXTbDKAttIx7TG9z
         t8xZa2T7bKhq3Y+r4jYCYpgIBhHr5Pm4h59haHqHT41BaVIxUko0Mh7BXG5upjMmx9TS
         880w==
X-Gm-Message-State: AO0yUKWnrnKeoaUL137A7oxmCBd3kD1Llx5K91hcG7VMpGva0TX+nJY5
        INRF9TSPRzyV7NtlznZur6ZVSA==
X-Google-Smtp-Source: AK7set+nOGQBW+k8K+d7jpihJIfCw0ggnA5E1cu3X+tgp+RVqS4IKjkohoMrigAYMnhAN5l2mSYvaA==
X-Received: by 2002:ac2:5106:0:b0:4df:c2bd:58e0 with SMTP id q6-20020ac25106000000b004dfc2bd58e0mr4264560lfb.59.1678214239278;
        Tue, 07 Mar 2023 10:37:19 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m15-20020a056512014f00b004d34238ca44sm2093851lfo.214.2023.03.07.10.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:37:18 -0800 (PST)
Message-ID: <6897084a-79bd-809f-763e-6451034b40fa@linaro.org>
Date:   Tue, 7 Mar 2023 19:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: add PN553 NFC
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20230307183219.1643743-1-soyer@irl.hu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230307183219.1643743-1-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 7.03.2023 19:32, Gergo Koteles wrote:
> The OnePlus 6/6T both have a NQ330 (PN553 + P73N2M0).
> The PN533 supported by the nxp-nci-i2c driver in mainline.
> It detects/reads NFC tags using "nfctool".
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 64638ea94db7..4dfc9ade7596 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -380,6 +380,25 @@ zap-shader {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +	clock-frequency = <400000>;
status last

> +
> +	nfc@28 {
> +		compatible = "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <63 IRQ_TYPE_EDGE_RISING>;
interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
> +
> +		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> +		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&nfc_int_active &nfc_enable_active>;
property-n
property-names

> +	};
> +};
> +
>  &i2c10 {
>  	status = "okay";
>  	clock-frequency = <100000>;
> @@ -753,6 +772,20 @@ &usb_1_hsphy {
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
While it works as-is, I think adding a separate gpio node
for the firmware pin would make more sense logically.

Konrad
> +		pins = "gpio12", "gpio62";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
>  	tri_state_key_default: tri-state-key-default-state {
>  		pins = "gpio40", "gpio42", "gpio26";
>  		function = "gpio";
