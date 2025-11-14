Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B01A9FAC
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763124027; cv=none; b=cwutXs0JOpCasQVb02HzwBUSC7tnhzGi+IpV3hcyrhS483cIIBj1KT6NEhwszjd5H6mNdA7INtVdX4SLHa0pk+4t3TgPpVI9E5p6XUBWAgkA3TZdMqJMz9eVrTlR2h9LYlXWy8pZS17r8mxvnt+/bKIrrdzy+Qr0ChSfbgruP8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763124027; c=relaxed/simple;
	bh=6RjWDLI+pLbByiw5tflsFWzlyUGWfktb18dMsX6Y0m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/8PaedUTwV7oVGt9c9FNo7ffGXxCm7d4qpn8JV2ajA4Pvb3GRZ4xdrYbcPr+GhKnDHqPzoGizCPXi+b+OzR1GBw6nHPQD4PLzsIM9GUSQsy7ppNNDj6/3izjUF2CySy5RXsZsCXMbYC+FtqpgxvgNED1+x7AMi7aUVOIzVzeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jA05jM76; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jA05jM76"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957f5e2755so108828e87.3
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 04:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763124024; x=1763728824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg0PvqRezKbupz3Kg00de1ttMmCopst/jLXtGT3bTZQ=;
        b=jA05jM76wLX7UYqLFe4u1+5ESJSj+yFeHRCxb4XOeZmwOMa6HYliJpFHICDZXmjGqJ
         YiPdXULZHWWKNVF9wjwJpBd/Lf5HvLMFxi7kp8uZ6oyGhVCAVVTa1MxdVfhvfxbfzhWF
         z53FYzaPLIv2CvIbAt7rUomxQ3kwXojZckfBlYlkvaLkobg/ZAbikL0MuQ+wsqwDmNxm
         YiopAKgsU4XZE3JZecEpu58Cj/LjHAqUFsJW4xhGTkcTHFDP4ED6u+slv8qTqy9aTJOz
         sSvMeOpuI6tyuPYi7HCLcYWA4zcoFg1pE+0zYCOuxVsMe2BpB2HgCe/2t6yf+VbjfFKw
         lVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763124024; x=1763728824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jg0PvqRezKbupz3Kg00de1ttMmCopst/jLXtGT3bTZQ=;
        b=je7zC9Q9o/FSjZZ3MHOofNTAnCerI4LXCEeI+IXWDvPuW2SKpQ925QYsxUM3YVhr7+
         fCAPi9MBth1kAJf3n4XHuzFZjeBTm4fFsa99ugFKOxfI1+25q3vnkFS8mSe3dFqun7hW
         ax3kh8P9qF1rmuzDaFiBNoALmTMUBAXrMcK9CA+kvewdx6XwHtC5uh8Ty6KkQxkS/6OA
         NgFbfr2HiHL7mR86JRxbnWiS9u8S8QI9rHO0TZD1XZIWeGe0SAew2icKetOC1bZq8Wky
         XoJxljbCA9TkxTU92B4OAqIxmJW0ahCo18hx3DF+QLyh7EXbOsdEad747ogcD1r5wrsp
         xi2w==
X-Forwarded-Encrypted: i=1; AJvYcCXYF27kPaCGMYFgO4FZtOHsZ1nAy5kB5DPWqudpe/fwj9lWKUxS/DuxIGnyzMHfgonXPnu/yucRR97G8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJIyi0ucoJnh9v7F+bWQ4Tj4glKGTSjC6Lylv8MMLs3ZaPxpyo
	mnStZx4dyzOzylh70IfnierBP/vC4SZuoPLKmt3sTh4cCKaI3/l1hm83nNVFQkHVKFs=
X-Gm-Gg: ASbGnctsqzZTzOwUAes8ok6uVq3Ltx+hdXocCw7OLxitasRZZxGXhz+hii2phGrOtKu
	SgXRES6EV9jSeHX9KQdyKZcAsTs4cXIvaQvWzEAr4nrlzyPDCTUgudjedD+GW/sc7oywFnIFxxW
	aCJQv2yTN5IHm2OERKwJtmicyQC5twmHvz46m2BPVgezguRShUxysknc8I8rrJ/PPtjG1nKm54S
	/K7oduhKj1GKbCWSQ/0gsq1zN1b3fgHv7ZPpj2uVhtZNIkweFfqRn/RRr3F1UCM3B5rr/w8d7hf
	VO+e1khcxKsljr/EtHUXIe+DgJieiEs3nmgaNCrP6EVm3vC3dHyTGdTc7CYn3zFQCXfDznv//ff
	AIV1ytViJWmJaAtQLGKSZeiSrwRuNub5nuGCQwdl8jBC5kmqwu9NnZVqywWbsYC27V/Wd+PblSG
	FF/aTp049JrOuJORYADcQEscFVfLD3QJgnLL+AlUgPTrE8WaN8FAwnxyf2HwTHglGGDQ==
X-Google-Smtp-Source: AGHT+IGJYPQlaR8EvmhvGbzkYup72zeZ7xs1plmBFOUBHn0OvAXWI4uYws2IEREwIrDVLw6kZ9Ksyw==
X-Received: by 2002:a05:6512:1150:b0:594:2e4e:6996 with SMTP id 2adb3069b0e04-59584924433mr442379e87.7.1763124023670;
        Fri, 14 Nov 2025 04:40:23 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acc1asm1056622e87.13.2025.11.14.04.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 04:40:22 -0800 (PST)
Message-ID: <de7ad562-80bc-498e-a6fb-cc26bb6343f0@linaro.org>
Date: Fri, 14 Nov 2025 14:40:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251114-sm6350-camss-v2-1-d1ff67da33b6@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca.

On 11/14/25 13:15, Luca Weiss wrote:
> Add bindings for the Camera Subsystem on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   .../bindings/media/qcom,sm6350-camss.yaml          | 349 +++++++++++++++++++++
>   1 file changed, 349 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> new file mode 100644
> index 000000000000..d812b5b50c05
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> @@ -0,0 +1,349 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Luca Weiss <luca.weiss@fairphone.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm6350-camss
> +
> +  reg:
> +    maxItems: 12
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +
> +  clocks:
> +    maxItems: 30
> +
> +  clock-names:
> +    items:
> +      - const: cam_ahb_clk
> +      - const: cam_axi
> +      - const: soc_ahb
> +      - const: camnoc_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: slow_ahb_src
> +      - const: vfe0_axi
> +      - const: vfe0
> +      - const: vfe0_cphy_rx
> +      - const: vfe0_csid
> +      - const: vfe1_axi
> +      - const: vfe1
> +      - const: vfe1_cphy_rx
> +      - const: vfe1_csid
> +      - const: vfe2_axi
> +      - const: vfe2
> +      - const: vfe2_cphy_rx
> +      - const: vfe2_csid
> +      - const: vfe_lite
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid

The sorting order of this list does not follow the sorting order accepted
in the past.

I'm very sorry for the vagueness, but I can not pronounce the accepted
sorting order name, because it triggers people.

> +
> +  interrupts:
> +    maxItems: 12
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc

Please remove sf_mnoc and sf_icp_mnoc, they are not needed for enabling
IP to produce raw images, and one day you may use them somewhere else.

> +
> +  iommus:
> +    maxItems: 4
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2

Note that the list of items and the list of the item descriptions do not
correspond to each other. Titan Top GDSC shall be at the end.

> +
> +  vdd-csiphy-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdd-csiphy-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to a PHY.
> +

Please reference to the schematics or SoC TRM, does SM6350 SoC
have different pads to get supplies to different CSIPHYx IPs?

If so, then please provide hardware properties to get a proper
correspondence between supplies and CSIPHYx, and make all these
properties optional.

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - vdd-csiphy-0p9-supply
> +  - vdd-csiphy-1p25-supply

When a change to add CSIPHYx specific supplies is done, please remove
*-supply properties from the list of the requred ones.

> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@acb3000 {
> +            compatible = "qcom,sm6350-camss";
> +
> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
> +                  <0x0 0x0acba000 0x0 0x1000>,
> +                  <0x0 0x0acc1000 0x0 0x1000>,
> +                  <0x0 0x0acc8000 0x0 0x1000>,
> +                  <0x0 0x0ac65000 0x0 0x1000>,
> +                  <0x0 0x0ac66000 0x0 0x1000>,
> +                  <0x0 0x0ac67000 0x0 0x1000>,
> +                  <0x0 0x0ac68000 0x0 0x1000>,
> +                  <0x0 0x0acaf000 0x0 0x4000>,
> +                  <0x0 0x0acb6000 0x0 0x4000>,
> +                  <0x0 0x0acbd000 0x0 0x4000>,
> +                  <0x0 0x0acc4000 0x0 0x4000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite";
> +
> +            clocks = <&gcc GCC_CAMERA_AHB_CLK>,

I believe this clock is critical, and it is set so in the SM6350 GCC driver,
therefore it should not be added here.

Multiple CAMCC drivers define some of the clocks as "critical" and always
enabled, a misconfiguration in this area may cause the reported warning.

> +                     <&gcc GCC_CAMERA_AXI_CLK>,
> +                     <&camcc CAMCC_SOC_AHB_CLK>,
> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
> +                     <&camcc CAMCC_CORE_AHB_CLK>,
> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
> +                     <&camcc CAMCC_CSIPHY0_CLK>,
> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY1_CLK>,
> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY2_CLK>,
> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAMCC_CSIPHY3_CLK>,
> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_0_CLK>,
> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_1_CLK>,
> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
> +                     <&camcc CAMCC_IFE_2_CLK>,
> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>;
> +            clock-names = "cam_ahb_clk",
> +                          "cam_axi",
> +                          "soc_ahb",
> +                          "camnoc_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "slow_ahb_src",
> +                          "vfe0_axi",
> +                          "vfe0",
> +                          "vfe0_cphy_rx",
> +                          "vfe0_csid",
> +                          "vfe1_axi",
> +                          "vfe1",
> +                          "vfe1_cphy_rx",
> +                          "vfe1_csid",
> +                          "vfe2_axi",
> +                          "vfe2",
> +                          "vfe2_cphy_rx",
> +                          "vfe2_csid",
> +                          "vfe_lite",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;

Interrupt types shall be IRQ_TYPE_EDGE_RISING.

> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite";
> +
> +            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x820 0xc0>,
> +                     <&apps_smmu 0x840 0x0>,
> +                     <&apps_smmu 0x860 0xc0>,
> +                     <&apps_smmu 0x880 0x0>;
> +
> +            power-domains = <&camcc TITAN_TOP_GDSC>

It should be the last one in the list, if the settled practice is followed.

> +                            <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc IFE_2_GDSC>;
> +            power-domain-names = "top",
> +                                 "ife0",
> +                                 "ife1",
> +                                 "ife2";
> +
> +            vdd-csiphy-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy-1p25-supply = <&vreg_l22a>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    csiphy0_ep: endpoint {

An empty line before a child node is always needed.

> +                        data-lanes = <0 1 2 3>;
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir
