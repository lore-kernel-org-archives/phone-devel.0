Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890CEC7EE2E
	for <phone-devel@archiver.kernel.org>; Mon, 29 May 2023 12:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjE2MKV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 29 May 2023 08:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbjE2MKU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 29 May 2023 08:10:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6332CCF
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 05:10:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4db9987f8so4533894e87.1
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 05:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685362215; x=1687954215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l69CNvwsvVxOdGGpTP24kCQnLR92Q+STYaVRxceSaVE=;
        b=YbyxlReB4gUoqN2+Uux/itPBp3PjRZlrffduJWaRXZxM9KKG30DePhV0sz6Mjv/ib6
         ybVp6lyLlt1ETOMC3+gZ4+1unKtQ0vkATYVPWriHtOaQ3AZUdVdPnlPVbCAuuD/oeemB
         i4CE4aHYXZRpCEtKYJMg/y+7ZYrqwHPoK5YByqF3dtti8DS5PdDfVOkzPGM+0SCgk3UY
         FP11aj+eC7T0d1DqCc1yuJHvlRNIuAm0CU/FZ6SQ6HwRPyjmcrGsSSWURPa6XU+ibxUE
         2O8pDijXUBCexo4C0Odpsb87iscgLW7ggGcFHbGF9JpuSJ9veh9yFcORMIaTV4cyjPkE
         VBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362215; x=1687954215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l69CNvwsvVxOdGGpTP24kCQnLR92Q+STYaVRxceSaVE=;
        b=YJs1KJ6THqvxh0H9IOwppm4aPlgHQ9Q1gsaXPDP8Uyw9nggQNPg1TOw7Y1/zc3GJK9
         F0Zp/23q2dv+xTCvm86pms0+BtMTTMwyOrpUSOjFLSORMcKnmNiYWLJUdBnYVlqBEpK0
         U6jhwv3QGCEGdzeeWH+hF4ErGQ1eolfhViEIuIBRCOS0AKVGtOSwEISTfQbP0NQIPffj
         Nm1TNTn3zWlyyfE69zUQFz9fSIKiWrg4vEW6fBzv6yGukhe6gdxd4I9g1nipI8qGwR57
         Nk8s/DN8G1noU3Qq/2jtJH7a6mK6RNmbZhSXl2bTtZJVV7cE6wHQ2HRc65e18JQi9bTy
         PASA==
X-Gm-Message-State: AC+VfDzcM+ux8tOFQgfVEAEiCx2R6hALaPLrMSDs6Fe8fiLST51w2qh8
        JBz9LD02CWYzJ5M8rjb9Ot2usg==
X-Google-Smtp-Source: ACHHUZ4SLO0EXLJHmvPcuzw7Gf9skUZZu5F7ieOm7t2Pa05aSNTcrQE7t9swQbgYoE0bglE3+lgHSw==
X-Received: by 2002:ac2:5581:0:b0:4e8:487a:7c2e with SMTP id v1-20020ac25581000000b004e8487a7c2emr2935379lfg.14.1685362215610;
        Mon, 29 May 2023 05:10:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id e18-20020ac25472000000b004f4589808cfsm1963021lfn.300.2023.05.29.05.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 05:10:15 -0700 (PDT)
Message-ID: <6c79b99e-cc69-8cd9-c990-5c0373e1f09c@linaro.org>
Date:   Mon, 29 May 2023 14:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 7/7] ARM: dts: qcom: msm8226: Add mdss nodes
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-7-679f335d3d5b@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-7-679f335d3d5b@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 29.05.2023 11:44, Luca Weiss wrote:
> Add the nodes that describe the mdss so that display can work on
> MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 118 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index 42acb9ddb8cc..182d6405032f 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -636,6 +636,124 @@ smd-edge {
>  				label = "lpass";
>  			};
>  		};
> +
> +		mdss: display-subsystem@fd900000 {
> +			compatible = "qcom,mdss";
> +			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
> +			reg-names = "mdss_phys", "vbif_phys";
> +
> +			power-domains = <&mmcc MDSS_GDSC>;
> +
> +			clocks = <&mmcc MDSS_AHB_CLK>,
> +				 <&mmcc MDSS_AXI_CLK>,
> +				 <&mmcc MDSS_VSYNC_CLK>;
> +			clock-names = "iface", "bus", "vsync";
One per line, please

> +
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
We're not using the irq cell, is that necessary/should that be 0?

> +
> +			status = "disabled";
status should go last

> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			mdp: display-controller@fd900000 {
> +				compatible = "qcom,msm8226-mdp5", "qcom,mdp5";
> +				reg = <0xfd900100 0x22000>;
> +				reg-names = "mdp_phys";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_VSYNC_CLK>;
> +				clock-names = "iface", "bus", "core", "vsync";
One per line, please

> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
Would port { work here? I remember one mdss component's bindings
didn't allow it but don't recall which one

> +
> +					port@0 {
> +						reg = <0>;
> +						mdp5_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@fd922800 {
> +				compatible = "qcom,msm8226-dsi-ctrl",
> +					     "qcom,mdss-dsi-ctrl";
> +				reg = <0xfd922800 0x1f8>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi_phy0 0>, <&dsi_phy0 1>;
One per line, please

> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_BYTE0_CLK>,
> +					 <&mmcc MDSS_PCLK0_CLK>,
> +					 <&mmcc MDSS_ESC0_CLK>,
> +					 <&mmcc MMSS_MISC_AHB_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core",
> +					      "core_mmss";
> +
> +				phys = <&dsi_phy0>;
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&mdp5_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi_phy0: phy@fd922a00 {
> +				compatible = "qcom,dsi-phy-28nm-8226";
> +				reg = <0xfd922a00 0xd4>,
> +				      <0xfd922b00 0x280>,
> +				      <0xfd922d80 0x30>;
> +				reg-names = "dsi_pll",
> +					    "dsi_phy",
> +					    "dsi_phy_regulator";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
One per line, please

Konrad
> +				clock-names = "iface", "ref";
> +			};
> +		};
>  	};
>  
>  	timer {
> 
