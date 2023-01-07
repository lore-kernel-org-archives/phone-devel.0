Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4203BC54EBE
	for <phone-devel@archiver.kernel.org>; Sat,  7 Jan 2023 10:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbjAGKlr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 7 Jan 2023 05:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236942AbjAGKlT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 7 Jan 2023 05:41:19 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB9A5FDE
        for <phone-devel@vger.kernel.org>; Sat,  7 Jan 2023 02:41:15 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id x37so3943130ljq.1
        for <phone-devel@vger.kernel.org>; Sat, 07 Jan 2023 02:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oltHV3xaiJRNkm48kKrVJwnasCXR4K2YIGWYLIQBEnA=;
        b=aY+xIzsS1z4eaPzLTWWkq42A4ESmq5QZ4lilbu9FHLX4Db17YC1AdVkH7Qa5xkDsYA
         qiHk0pmjNnUb7ZDAivl8NV01/5Hqhogk12v3VVPH1pMhNIWf3VJR1cvxUWuCKDgU4xPm
         3PCNHQbx97hQgheBV51io2bsUIFYCkmXBEFVroWpr862jyGsaTQDH0eeuNW+b7snnncb
         MXW5s9VuJxtauJFRm3yUKWAsACAEXvzEhTZUIuV0KZNuE2hOfPxvM0Ma90CBbf39XqOL
         Mme9bGZa8JnfVpofroX17Ui7gvcs1QgGRFX/N7FotqAgu1WFH2auVvgJykxHJX3LNWSG
         +rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oltHV3xaiJRNkm48kKrVJwnasCXR4K2YIGWYLIQBEnA=;
        b=Mz0y64DItWkthXyYAKlgedmSDPAiq2Pkln1kP5EGr/YPgGqVjlYOCUX6oiA48SgXEf
         Bg/tEwzirHXwxlw41/SFhD8U/A4+nxwMagzpCSDuylUQcYSNitloSDww5/NHbHgWReCd
         23hcGkVg7HIxG91ALBMvFc0Ya0lSOZMvNGhgTjgzwmC42RS8KUmDcoE2SuWxznpirRIy
         +eA5a6L4p22ioMWYR3QLsb42HuOFMX/Xoh0e/O/GSmBhZ6Z9fXQO3XZwEFxbTNJg2PDU
         6mLiUjsBlnxPZagzEgVzSdkUyNMqf6Trhtheaiv5GwiLeGSX3Q1GRAWxqwQqpZgm4o0/
         CpqA==
X-Gm-Message-State: AFqh2kpNEw1lEqxzJLHTMP7lsMiRcRkFtB6plNWjwDP96EDXdcAyMq5W
        t55WZb6jJcN9EhpsXz0u2tClUA==
X-Google-Smtp-Source: AMrXdXuIJtyCeFPVcjcmFGVFCKHFj5XnXuUAP16P3oV5cofSg5PqOOMfZQQgoR8ak47QFMbenbWpcw==
X-Received: by 2002:a2e:3210:0:b0:282:1326:78b6 with SMTP id y16-20020a2e3210000000b00282132678b6mr1357738ljy.31.1673088074183;
        Sat, 07 Jan 2023 02:41:14 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id a1-20020a2eb541000000b002770fb5722fsm316778ljn.123.2023.01.07.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 02:41:13 -0800 (PST)
Message-ID: <e82c70e1-5541-82c3-9c22-37ce1a43ee8c@linaro.org>
Date:   Sat, 7 Jan 2023 11:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] ARM: dts: qcom: apq8026-samsung-matisse-wifi: Add
 display backlight
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com>
 <20230106114403.275865-4-matti.lehtimaki@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230106114403.275865-4-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 6.01.2023 12:44, Matti Lehtimäki wrote:
> Uses ti,lp8556 backlight with clk-pwm.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>  .../dts/qcom-apq8026-samsung-matisse-wifi.dts | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> index 15b9590ba07b..848cfda64e5a 100644
> --- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> +++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
> @@ -23,6 +23,14 @@ aliases {
>  		display0 = &framebuffer0;
>  	};
>  
> +	backlight_pwm: pwm {
This should be sorted alphabetically.


> +		compatible = "clk-pwm";
> +		#pwm-cells = <2>;
> +		clocks = <&mmcc CAMSS_GP0_CLK>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&backlight_pwm_default_state>;
> +	};
> +
>  	chosen {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -80,6 +88,45 @@ key-volume-up {
>  		};
>  	};
>  
> +	i2c-backlight {
> +		compatible = "i2c-gpio";
> +		sda-gpios = <&tlmm 20 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +		scl-gpios = <&tlmm 21 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&backlight_i2c_default_state>;
Please reorder these two properties.

> +
> +		i2c-gpio,delay-us = <4>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		backlight@2c {
> +			compatible = "ti,lp8556";
> +			reg = <0x2c>;
> +
> +			dev-ctrl = /bits/ 8 <0x80>;
> +			init-brt = /bits/ 8 <0x3f>;
> +			pwm-period = <100000>;
> +
> +			pwms = <&backlight_pwm 0 100000>;
> +			pwm-names = "lp8556";
> +
> +			rom-a0h {
> +				rom-addr = /bits/ 8 <0xa0>;
> +				rom-val = /bits/ 8 <0x44>;
> +			};
Please add a newline between each subnode.

Otherwise I think this looks good..

Konrad

> +			rom-a1h {
> +				rom-addr = /bits/ 8 <0xa1>;
> +				rom-val = /bits/ 8 <0x6c>;
> +			};
> +			rom-a5h {
> +				rom-addr = /bits/ 8 <0xa5>;
> +				rom-val = /bits/ 8 <0x24>;
> +			};
> +		};
> +	};
> +
>  	reg_tsp_1p8v: regulator-tsp-1p8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "tsp_1p8v";
> @@ -418,6 +465,18 @@ accel_int_default_state: accel-int-default-state {
>  		bias-disable;
>  	};
>  
> +	backlight_i2c_default_state: backlight-i2c-default-state {
> +		pins = "gpio20", "gpio21";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	backlight_pwm_default_state: backlight-pwm-default-state {
> +		pins = "gpio33";
> +		function = "gp0_clk";
> +	};
> +
>  	muic_int_default_state: muic-int-default-state {
>  		pins = "gpio67";
>  		function = "gpio";
