Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B365CC25B50
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 11:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbjATLzu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 06:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjATLzs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 06:55:48 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1330E951AF
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 03:55:46 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so13359803ejc.4
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 03:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EVtsBJ7H2KNrK3G6RxZ2DLy5xTmEMTPBpX6GkJGZa5E=;
        b=ftsAS2bHaMUmJHhKespNWM3DsCMQ2sHlG2b38WCBrjzTcUvyCIsj8fP64i7IFrkoN5
         94kRlnhNB0K75yTNIYDbe5JGl7f0i09KL4m5T/r3PGsjkKql2u0ZyJsmr4Nz4r+U+ad/
         9C9wv3H90czXJy5wA9vJNI+vvppPHehfL4/1qkyRML8GlLCSKFHOF8zjnRDcMpCWoNJ4
         yBAvvanuuNVCotO31vr8rcAyIslgwLOVgvyzuBFOrzOd/yFsRrdpE3obZR0poeaMN3Zw
         a60Q1RpP/OFh5xiWjgpMKXW7j4ralV1LtR+lxaMID3dK89DbdsW8TPxh9VujB4qw3KLu
         bjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVtsBJ7H2KNrK3G6RxZ2DLy5xTmEMTPBpX6GkJGZa5E=;
        b=UIBWlAbh516nOu8US8/Ylhuf5dUhbhjGhcV6XhuljiCuDchsFzCMA89C5o1OBMQEdf
         c/vhM5rI71nI9Bdbqr9u2mLuT6jPqpAGz3K9Jttd2QwtbTtU5kFVZsVDtcYI1BU/RNvO
         ZdvN/TeA4EKAJDzKxwk0b7saGobVG39p9bqi0ZUYZM6w98VCORqPapvwx/jPaB0ekfLS
         CVcblDjP7rphZtv710y/4XUWljGCHYVjRtViWH1/eMN/N7RsCHEBfDgeqXRQ/ZwIDXQe
         3ATjFUhNZtPW6NCI3RB+FwWfr0apoHeliNry7vR+giISUkBxtBEiWUJx1EG5LRMlNzjk
         8gRQ==
X-Gm-Message-State: AFqh2krfViD8rI4t1wezEaI9ILMKIUDl+KEz1/yUdeBjuvSLrhqCGIgw
        PcJcE+J6eCZza/sK5NNJXpgCUA==
X-Google-Smtp-Source: AMrXdXtkRellbUhEZob0odXDiTuKhEgdutMsliVFDjeutf6jQ+gx/hacBgMoHeKU47hB0GPuKhaEyQ==
X-Received: by 2002:a17:907:d506:b0:7c0:cc69:571b with SMTP id wb6-20020a170907d50600b007c0cc69571bmr17370793ejc.8.1674215744562;
        Fri, 20 Jan 2023 03:55:44 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906311200b0084b89c66eb5sm17679900ejx.4.2023.01.20.03.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:55:44 -0800 (PST)
Message-ID: <8764d815-d74b-4f67-b94c-f85966c922aa@linaro.org>
Date:   Fri, 20 Jan 2023 12:55:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm6350: Add CCI nodes
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
 <20221213-sm6350-cci-v1-3-e5d0c36e0c4f@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221213-sm6350-cci-v1-3-e5d0c36e0c4f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 20.01.2023 12:11, Luca Weiss wrote:
> Add nodes for the two CCI blocks found on SM6350.
> 
> The first contains two i2c busses and while the second one might also
> contains two busses, the downstream kernel only has one configured, and
> some boards use the GPIOs for the potential cci1_i2c1 one other
> purposes, so leave that one unconfigured.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 132 +++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 300ced5cda57..666c1c80e4e6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/clock/qcom,gcc-sm6350.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm6350-camcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -1435,6 +1436,95 @@ usb_1_dwc3: usb@a600000 {
>  			};
>  		};
>  
> +		cci0: cci@ac4a000 {
> +			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
These two belong at the bottom
> +
> +			reg = <0 0x0ac4a000 0 0x1000>;
> +			interrupts = <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAMCC_SOC_AHB_CLK>,
> +				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAMCC_CPAS_AHB_CLK>,
> +				 <&camcc CAMCC_CCI_0_CLK>,
> +				 <&camcc CAMCC_CCI_0_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
> +
> +			assigned-clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +					  <&camcc CAMCC_CCI_0_CLK>;
> +			assigned-clock-rates = <80000000>, <37500000>;
> +
> +			pinctrl-names = "default", "sleep";
Please move pinctrl-names below pinctrl-N for consistency
with other properties ending with -names.

> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac4b000 {
> +			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <0 0x0ac4b000 0 0x1000>;
> +			interrupts = <GIC_SPI 462 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAMCC_SOC_AHB_CLK>,
> +				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAMCC_CPAS_AHB_CLK>,
> +				 <&camcc CAMCC_CCI_1_CLK>,
> +				 <&camcc CAMCC_CCI_1_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";
> +
> +			assigned-clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +					  <&camcc CAMCC_CCI_1_CLK>;
> +			assigned-clock-rates = <80000000>, <37500000>;
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci2_default>;
> +			pinctrl-1 = <&cci2_sleep>;
> +
> +			status = "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
> +		};
> +
>  		camcc: clock-controller@ad00000 {
>  			compatible = "qcom,sm6350-camcc";
>  			reg = <0 0x0ad00000 0 0x16000>;
> @@ -1522,6 +1612,48 @@ tlmm: pinctrl@f100000 {
>  			#interrupt-cells = <2>;
>  			gpio-ranges = <&tlmm 0 0 157>;
>  
> +			cci0_default: cci0-default-state {
> +				pins = "gpio39", "gpio40";
> +				function = "cci_i2c";
> +				bias-pull-up;
Most other pin definitions in our directory have bias
properties below drive-strength, please reorder.

Konrad
> +				drive-strength = <2>;
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				pins = "gpio39", "gpio40";
> +				function = "cci_i2c";
> +				bias-pull-down;
> +				drive-strength = <2>;
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c";
> +				bias-pull-up;
> +				drive-strength = <2>;
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c";
> +				bias-pull-down;
> +				drive-strength = <2>;
> +			};
> +
> +			cci2_default: cci2-default-state {
> +				pins = "gpio43", "gpio44";
> +				function = "cci_i2c";
> +				bias-pull-up;
> +				drive-strength = <2>;
> +			};
> +
> +			cci2_sleep: cci2-sleep-state {
> +				pins = "gpio43", "gpio44";
> +				function = "cci_i2c";
> +				bias-pull-down;
> +				drive-strength = <2>;
> +			};
> +
>  			sdc2_off_state: sdc2-off-state {
>  				clk-pins {
>  					pins = "sdc2_clk";
> 
