Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79BFFA3741
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 21:14:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiJaVO4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 17:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbiJaVOu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 17:14:50 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A610325CA;
        Mon, 31 Oct 2022 14:14:49 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 28E343EB8D;
        Mon, 31 Oct 2022 22:14:47 +0100 (CET)
Message-ID: <c19fc949-e75e-1c38-3bea-02c7afcf2178@somainline.org>
Date:   Mon, 31 Oct 2022 22:14:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sm6350-lena: Configure Samsung
 touchscreen
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-10-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030073232.22726-10-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 30.10.2022 08:32, Marijn Suijten wrote:
> Use the generic samsung,s6sy761 touchscreen driver for this device,
> together with a few pins and regulators to power it up correctly.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  .../qcom/sm6350-sony-xperia-lena-pdx213.dts   | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6eb1d4e5e60f..20f35623d1ef 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -43,6 +43,15 @@ key-volume-down {
>  			gpios = <&pm6350_gpios 2 GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +
> +	touch_en_vreg: touch-en-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "touch_en_vreg";
> +		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&pm6350_l6>;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -280,6 +289,23 @@ &gpi_dma1 {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen@48 {
> +		compatible = "samsung,s6sy761";
> +		reg = <0x48>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <22 0x2008>;
> +		vdd-supply = <&pm6350_l11>;
> +		avdd-supply = <&touch_en_vreg>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts_int_default &ts_active>;
> +	};
> +};
> +
>  &pm6350_gpios {
>  	gpio_keys_state: gpio-keys-state {
>  		key-volume-down-pins {
> @@ -334,6 +360,21 @@ &sdhc_2 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <13 4>, <45 2>, <56 2>;
> +
> +	ts_active: ts-active-state {
> +		pins = "gpio21";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
> +	ts_int_default: ts-int-default-state {
> +		pins = "gpio22";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		input-enable;
> +	};
>  };
>  
>  &usb_1 {
