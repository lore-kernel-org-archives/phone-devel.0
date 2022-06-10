Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3884C43334
	for <phone-devel@archiver.kernel.org>; Fri, 10 Jun 2022 23:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348918AbiFJXUl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 10 Jun 2022 19:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347449AbiFJXUk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 10 Jun 2022 19:20:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC1413274D
        for <phone-devel@vger.kernel.org>; Fri, 10 Jun 2022 16:20:35 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y29so634155ljd.7
        for <phone-devel@vger.kernel.org>; Fri, 10 Jun 2022 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+1KGEkwWLM43iC+5lY7oAILbV9nPk+PkPYaUeBPSvSU=;
        b=OZ5TGaBWVxQM1BG7nUmMRhWQAL0bYjQvzCHtYv6pljRCEtdbqyzh2WSR8NfirAf1BE
         0PowjHzxVk9/i33L8CiF/ZufMvQOtZSalpnddvGcmybO/ujen0XQ2iYowO7K2O1H+F1p
         pOEn7Fw7aSEY+3lVQsSfEYbuf6K0bl8jWQ8dQavVd/Q2BVLvT1FG7KfTFyheVpZHLQPC
         lHJswhn4ESNUIGF2TqbmWTGjYoEc4xQQEzxM4tTF4m57D6wcSYdD0P7DNwmXqXX9Gktm
         4Bc7LOdaT/wFPBcXkeQCwWXdSdOyUp07/y3Ya52DTEezPPov3bL8fcPpZr9PhfWVJjkj
         BDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+1KGEkwWLM43iC+5lY7oAILbV9nPk+PkPYaUeBPSvSU=;
        b=hDsRfWDQ2uSOJpGlSJLv+YMTo3O5b9E2zVSyh/Cc89saoHHAzQEB/HR+QN97snrhDe
         LNI+kmtSBPf+jDnNA/RD76alpaKudlXevL0DicY4VzYMLl4P9gFI30xTNxUAmeKp0W/V
         S0FdcdfhbQZdzCzGI/lGKz35A1QFCpgf6L5NGSqq52EXGa6Z4CABvPGlKsVOLY/T67At
         Q7dwrIyRvCHJjJlJkOf7mELJpNrAHZJe3fKm9oIzjfTLQOlkWr7MzbeNorCWN09FO9Pg
         v/qTtEWx+IedZzQLHQQdpJFeOHETSXetL66be1QhJYucDhCerts81uScE9dXgrWdB9LR
         qsYw==
X-Gm-Message-State: AOAM533sYPoqwyTEQoikqMKnefyg8a9/XxBW9K1cMD/0W6AIHARtIsDB
        akgNJ0Xl0Cg78dpUNZ0/NumT+w==
X-Google-Smtp-Source: ABdhPJz9HqxCw3RkPKOT33MrJqEv4Egm/i22eg8F0ELVG+l7eXyL6eq7p9b0mPQsY6A9+1k0yXttRw==
X-Received: by 2002:a05:651c:1543:b0:255:92f8:6e8b with SMTP id y3-20020a05651c154300b0025592f86e8bmr16098939ljp.489.1654903234104;
        Fri, 10 Jun 2022 16:20:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v27-20020ac2559b000000b00478d4df81f6sm35031lfg.85.2022.06.10.16.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 16:20:32 -0700 (PDT)
Message-ID: <c7ac47e0-20a2-3972-e760-61276964445c@linaro.org>
Date:   Sat, 11 Jun 2022 02:20:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8953: add MDSS
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220610225304.267508-1-luca@z3ntu.xyz>
 <20220610225304.267508-2-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220610225304.267508-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/06/2022 01:53, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the MDSS, MDP and DSI nodes that are found on msm8953 SoC.
> 
> IOMMU is not added because support for it isn't yet upstream and MDSS
> works fine without IOMMU on 8953.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Looks good, few minor nits below.

> ---
>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 202 ++++++++++++++++++++++++++
>   1 file changed, 202 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index ffc3ec2cd3bc..a2aca3d05899 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -726,6 +726,208 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
>   			reg = <0x193f044 0x4>;
>   		};
>   
> +		mdss: mdss@1a00000 {
> +			compatible = "qcom,mdss";
> +
> +			reg = <0x1a00000 0x1000>,
> +			      <0x1ab0000 0x1040>;
> +			reg-names = "mdss_phys",
> +				    "vbif_phys";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>;

Please also add GCC_MDSS_MDP_CLK at the end of this array. It might be 
required to read HW_REV register.

> +			clock-names = "iface",
> +				      "bus",
> +				      "vsync";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;

status = "disabled";

> +
> +			mdp: mdp@1a01000 {
> +				compatible = "qcom,mdp5";
> +				reg = <0x1a01000 0x89000>;
> +				reg-names = "mdp_phys";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				power-domains = <&gcc MDSS_GDSC>;
> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_VSYNC_CLK>;
> +				clock-names = "iface",
> +					      "bus",
> +					      "core",
> +					      "vsync";
> +
> +				// iommus = <&apps_iommu 0xc00 0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdp5_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdp5_intf2_out: endpoint {
> +							remote-endpoint = <&dsi1_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@1a94000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0x1a94000 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
> +						  <&gcc PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>,
> +							 <&dsi0_phy 1>;
> +
> +				clocks = <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_BYTE0_CLK>,
> +					 <&gcc GCC_MDSS_PCLK0_CLK>,
> +					 <&gcc GCC_MDSS_ESC0_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core";
> +
> +				phys = <&dsi0_phy>;
> +				phy-names = "dsi";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;

status = "disabled";

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
> +			dsi0_phy: dsi-phy@1a94400 {
> +				compatible = "qcom,dsi-phy-14nm-8953";
> +				reg = <0x1a94400 0x100>,
> +				      <0x1a94500 0x300>,
> +				      <0x1a94800 0x188>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;

status = "disabled";

> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>, <&xo_board>;
> +				clock-names = "iface", "ref";
> +			};
> +
> +			dsi1: dsi@1a96000 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0x1a96000 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <5>;
> +
> +				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
> +						  <&gcc PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>,
> +							 <&dsi1_phy 1>;
> +
> +				clocks = <&gcc GCC_MDSS_MDP_CLK>,
> +					 <&gcc GCC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_MDSS_AXI_CLK>,
> +					 <&gcc GCC_MDSS_BYTE1_CLK>,
> +					 <&gcc GCC_MDSS_PCLK1_CLK>,
> +					 <&gcc GCC_MDSS_ESC1_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core";
> +
> +				phys = <&dsi1_phy>;
> +				phy-names = "dsi";
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi1_in: endpoint {
> +							remote-endpoint = <&mdp5_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi1_phy: dsi-phy@1a96400 {
> +				compatible = "qcom,dsi-phy-14nm-8953";
> +				reg = <0x1a96400 0x100>,
> +				      <0x1a96500 0x300>,
> +				      <0x1a96800 0x188>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&gcc GCC_MDSS_AHB_CLK>, <&xo_board>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +		};
> +
>   		spmi_bus: spmi@200f000 {
>   			compatible = "qcom,spmi-pmic-arb";
>   			reg = <0x200f000 0x1000>,


-- 
With best wishes
Dmitry
