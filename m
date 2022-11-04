Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9163CC433FE
	for <phone-devel@archiver.kernel.org>; Fri,  4 Nov 2022 23:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiKDXok (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 4 Nov 2022 19:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiKDXoj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 4 Nov 2022 19:44:39 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C832ED66
        for <phone-devel@vger.kernel.org>; Fri,  4 Nov 2022 16:44:38 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C34073F73D;
        Sat,  5 Nov 2022 00:44:36 +0100 (CET)
Date:   Sat, 5 Nov 2022 00:44:35 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add configuration for PMI8950
 peripheral
Message-ID: <20221104234435.xwjpwfxs73puvfca@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101161801.1058969-1-luca@z3ntu.xyz>
 <20221101161801.1058969-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101161801.1058969-2-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-11-01 17:18:00, Luca Weiss wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> The PMI8950 features integrated peripherals like ADC, GPIO controller,
> MPPs and others.
> 
> [luca@z3ntu.xyz: remove pm8950, style changes for 2022 standards, add wled]
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since v2:
> * Pick up patch, and adjust as mentioned above sign-offs
> 
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi | 97 +++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmi8950.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> new file mode 100644
> index 000000000000..32d27e2187e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019, AngeloGioacchino Del Regno <kholk11@gmail.com>
> +
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +&spmi_bus {
> +	pmic@2 {
> +		compatible = "qcom,pmi8950", "qcom,spmi-pmic";
> +		reg = <0x2 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmi8950_vadc: adc@3100 {
> +			compatible = "qcom,spmi-vadc";
> +			reg = <0x3100>;
> +			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <1>;
> +
> +			adc-chan@0 {
> +				reg = <VADC_USBIN>;
> +				qcom,pre-scaling = <1 4>;
> +				label = "usbin";

I've previously sent a patch with labels in the node name instead [1],
what's the preferred way nowadays?

[1]: https://lore.kernel.org/linux-arm-msm/20220926190148.283805-4-marijn.suijten@somainline.org/

> +			};
> +
> +			adc-chan@1 {
> +				reg = <VADC_DCIN>;
> +				qcom,pre-scaling = <1 4>;
> +				label = "dcin";
> +			};
> +
> +			adc-chan@2 {
> +				reg = <VADC_VCHG_SNS>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "vchg_sns";

Shall we use hyphens in labels (especially if using them as node names).

> +			};
> +
> +			adc-chan@9 {
> +				reg = <VADC_REF_625MV>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_625mv";
> +			};
> +
> +			adc-chan@a {
> +				reg = <VADC_REF_1250MV>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "ref_1250v";

mv* :)

> +			};
> +
> +			adc-chan@d {
> +				reg = <VADC_SPARE2>;
> +				qcom,pre-scaling = <1 1>;
> +				label = "chg_temp";
> +			};
> +		};
> +
> +		pmi8950_mpps: mpps@a000 {
> +			compatible = "qcom,pmi8950-mpp", "qcom,spmi-mpp";
> +			reg = <0xa000>;
> +			gpio-controller;
> +			gpio-ranges = <&pmi8950_mpps 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmi8950_gpio: gpio@c000 {

It seems more common to name this label plural pmi8950_gpioS?

> +			compatible = "qcom,pmi8950-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pmi8950_gpio 0 0 2>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmic@3 {
> +		compatible = "qcom,pmi8950", "qcom,spmi-pmic";
> +		reg = <0x3 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmi8950_wled: leds@d800 {
> +			compatible = "qcom,pmi8950-wled";
> +			reg = <0xd800>, <0xd900>;
> +			interrupts = <0x3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "short";
> +			label = "backlight";

Same question here about using the node name instead, and dropping the
label altogether.

- Marijn

> +
> +			status = "disabled";
> +		};
> +	};
> +};
> -- 
> 2.38.1
> 
