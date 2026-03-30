Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E739099F
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774911457; cv=none; b=d7voKSYQGwHXg+bE7uxsH1rOR36xk5IE+k16Gdl8VBporK9OFIyQgPR/06ExS9YQdv2HaivWTaioCjyzFK9l9P/XKDE4V8ScFgsYJmWNvujKrv7SL3BZKl3FPWyYpOFS/gLaH4btUIvcvjFhawS17orsjdHYNKJM0O1xg4s9+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774911457; c=relaxed/simple;
	bh=hQsdyERR74qRKPMJNyFGbZHVahogzUjyMMONQNhrMWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlzOZIpThUnW20ScJfDx8+/wKPPQj/V1D6hCcfh/SjoMFy41Zj7veVUE7U0WMgDWGISICjZLzernVrkvknUNBikGgIKpVwqvWGFE0quGDVBNG+BH1i1mSE16k4o+E2hQJc0t8B8i8PeVc5gr+OVuFQoOObntjP0IqiBZokVlk9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcmW42Z+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcmW42Z+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a33933e99so3480571fa.0
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774911454; x=1775516254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7WoW9KojJd/EruKijMjZJsZ/emWsflnF0k0IAtenmQ=;
        b=DcmW42Z+lpgwYdPQlFcPC7/tar5UPrszZk3+uOsh1qa9U6gmTqwlGnarYUpNQTQYvw
         2J+Mn3gw/aNOAHO+2RHdNFp2l//BYZrvJX0GddBiJTmWGf/Buif7gmOqj/C8zhckWDzn
         DfW1wtvuM6bgroBsMFMsiyzzMrPsY/Wac81FYDaBVd7NXoBwX5yhPuyG2ZQOP6g161si
         DI2AYizW84d9tnBfYmMZ41OiepPf/KDxhQXOXBJetn3L1jH7CZ17BvTJNU1i20DVXBi9
         RvU3oTPxvZZrS6DxeKtZNdlzFlUH4wE8UNi13u9IL7+HIl5xGiuoLr5FRHPTfG0DJVU5
         bPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774911454; x=1775516254;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7WoW9KojJd/EruKijMjZJsZ/emWsflnF0k0IAtenmQ=;
        b=i3Tq/LjDs6ZYbBqyv2H3lQBulm/d5AtrlgwYCxTQMEr444nC6k9MowGG/QnYb+V3pB
         XxXTX3jURVwnfoFCzFF6tysaAggvzXsxz1Qs/79XqmXE6chXRPqJ0yPqEbGcrS47OTbn
         VqF0GU8NA5eaCGUlV84XiOKK+uz4XHSYqAdSuliKol96PKzlPZjhITlsmGAD3QeiTyur
         m7vUNiQb3xf+dBAAAr2kNQytfi96tyYNg9uvD5DZZ5dFebFyX8B0FFLqL9gZKWQCHw3l
         neqetGxo2yNJJ3WM3E9YqtCARY72a+Kmm2cghh5tshFtsvGyVvxhWH0u9ZFnKt0Irsa7
         31qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQcCqxPZXqQ18qswS0keDWQWxRs1yS2gEdEhqWt3o97AjgzY3k3PmbLi3oAo2ZoxMrQE7Pr5I7emJ9pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1V/5rod08w7IUs7rz3Q0SyZrV9kbqkEJ2Z4d+IhWZFLarPB5
	a1v4h7PHj1P9igYknbnfiXJqdVNpInoWD2ieNgoies10TJZtPwn6ndAMlW2mcMakc3U=
X-Gm-Gg: ATEYQzwRhaGne2T/tCif7z4ny93S/jMFFGbh3iz7LMfLG3SXVEEkp1mzJVHy0TL0/q9
	LopPm9AaoOlD8jntoS5vLa0/pDWvNF5DXeQE3nPrbHFCtSSVMETZ07LofbEXBiRxV9YFUkDxECg
	wn12gP+IXpBma1iZBk+1ewWH4dNdCk5ilBEA0XCfJhZH86QonZEgN3h+x6qex7cpJuMIET///GZ
	GeO11ruVsvScbZeo3HR1gSujFBVz92+0l8I/Bta/tscT4C7EUYeu+CO277iq0Ih/oMymt6syh3f
	7YKaVqlYNqI9kHYVzafyYoEz2XjObsFlz/6TMcJWG+XUbUg5xuydJYw9KIemnwuQjwFZTGC/uGO
	lHGLaN0FweXtxz6KRGMEf1F2O0per8HR6z35jpOLFrYH9cwSUsqGQdWGzi73LWCcIP9nEt2seE9
	JkqjBMNIOhiQCJYL6GYyS7gnpLAJ9xBk3EI6y0rp7LsQKnDQEzJJH8bKOCALxGH6S2SrdzPpBD7
	H7MzQ==
X-Received: by 2002:a05:6512:1381:b0:5a2:845e:9d9a with SMTP id 2adb3069b0e04-5a2ab937b64mr3184312e87.6.1774911453823;
        Mon, 30 Mar 2026 15:57:33 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4367sm1966324e87.1.2026.03.30.15.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 15:57:33 -0700 (PDT)
Message-ID: <fe00906e-fb06-44e3-985b-3d0e95839e43@linaro.org>
Date: Tue, 31 Mar 2026 01:57:32 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 10:54, Luca Weiss wrote:
> Add bindings for the Camera Subsystem on the SM6350 SoC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
>   1 file changed, 471 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> new file mode 100644
> index 000000000000..96974d90d8c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
> @@ -0,0 +1,471 @@
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
> +    maxItems: 24
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
> +      - const: a5_csr
> +      - const: a5_qgic
> +      - const: a5_sierra
> +      - const: bps
> +      - const: camnoc
> +      - const: core_top_csr_tcsr
> +      - const: cpas_cdm
> +      - const: cpas_top
> +      - const: ipe
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: lrme
> +
> +  clocks:
> +    maxItems: 39
> +
> +  clock-names:
> +    items:
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
> +      - const: bps
> +      - const: bps_ahb
> +      - const: bps_areg
> +      - const: bps_axi
> +      - const: icp
> +      - const: ipe0
> +      - const: ipe0_ahb
> +      - const: ipe0_areg
> +      - const: ipe0_axi
> +      - const: jpeg
> +      - const: lrme
> +
> +  interrupts:
> +    maxItems: 18
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
> +      - const: a5
> +      - const: cpas
> +      - const: cpas_cdm
> +      - const: jpeg_dma
> +      - const: jpeg_enc
> +      - const: lrme
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
> +
> +  iommus:
> +    maxItems: 14
> +
> +  power-domains:
> +    maxItems: 6
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +      - const: bps
> +      - const: ipe

I've lost the content, why 'top' is somewhere in the middle?

> +
> +  vdd-csiphy0-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy0-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY0.
> +
> +  vdd-csiphy1-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy1-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY1.
> +
> +  vdd-csiphy2-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy2-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY2.
> +
> +  vdd-csiphy3-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3.
> +
> +  vdd-csiphy3-1p25-supply:
> +    description:
> +      Phandle to a 1.25V regulator supply to CSIPHY3.
> +
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
> +                  <0x0 0x0acc4000 0x0 0x4000>,
> +                  <0x0 0x0ac18000 0x0 0x3000>,
> +                  <0x0 0x0ac00000 0x0 0x6000>,
> +                  <0x0 0x0ac10000 0x0 0x8000>,
> +                  <0x0 0x0ac6f000 0x0 0x8000>,
> +                  <0x0 0x0ac42000 0x0 0x4600>,
> +                  <0x0 0x01fc0000 0x0 0x40000>,
> +                  <0x0 0x0ac48000 0x0 0x1000>,
> +                  <0x0 0x0ac40000 0x0 0x1000>,
> +                  <0x0 0x0ac87000 0x0 0xa000>,
> +                  <0x0 0x0ac52000 0x0 0x4000>,
> +                  <0x0 0x0ac4e000 0x0 0x4000>,
> +                  <0x0 0x0ac6b000 0x0 0xa00>;
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
> +                        "vfe_lite",
> +                        "a5_csr",
> +                        "a5_qgic",
> +                        "a5_sierra",
> +                        "bps",
> +                        "camnoc",
> +                        "core_top_csr_tcsr",
> +                        "cpas_cdm",
> +                        "cpas_top",
> +                        "ipe",
> +                        "jpeg_dma",
> +                        "jpeg_enc",
> +                        "lrme";
> +
> +            clocks = <&gcc GCC_CAMERA_AXI_CLK>,
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
> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAMCC_BPS_CLK>,
> +                     <&camcc CAMCC_BPS_AHB_CLK>,
> +                     <&camcc CAMCC_BPS_AREG_CLK>,
> +                     <&camcc CAMCC_BPS_AXI_CLK>,
> +                     <&camcc CAMCC_ICP_CLK>,
> +                     <&camcc CAMCC_IPE_0_CLK>,
> +                     <&camcc CAMCC_IPE_0_AHB_CLK>,
> +                     <&camcc CAMCC_IPE_0_AREG_CLK>,
> +                     <&camcc CAMCC_IPE_0_AXI_CLK>,
> +                     <&camcc CAMCC_JPEG_CLK>,
> +                     <&camcc CAMCC_LRME_CLK>;
> +            clock-names = "cam_axi",
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
> +                          "vfe_lite_csid",
> +                          "bps",
> +                          "bps_ahb",
> +                          "bps_areg",
> +                          "bps_axi",
> +                          "icp",
> +                          "ipe0",
> +                          "ipe0_ahb",
> +                          "ipe0_areg",
> +                          "ipe0_axi",
> +                          "jpeg",
> +                          "lrme";
> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
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
> +                              "vfe_lite",
> +                              "a5",
> +                              "cpas",
> +                              "cpas_cdm",
> +                              "jpeg_dma",
> +                              "jpeg_enc",
> +                              "lrme";
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
> +                     <&apps_smmu 0x880 0x0>,
> +                     <&apps_smmu 0xc40 0x20>,
> +                     <&apps_smmu 0xc60 0x20>,
> +                     <&apps_smmu 0xc80 0x0>,
> +                     <&apps_smmu 0xca2 0x0>,
> +                     <&apps_smmu 0xcc0 0x20>,
> +                     <&apps_smmu 0xce0 0x20>,
> +                     <&apps_smmu 0xd00 0x20>,
> +                     <&apps_smmu 0xd20 0x20>,
> +                     <&apps_smmu 0xd40 0x20>,
> +                     <&apps_smmu 0xd60 0x20>;
> +
> +            power-domains = <&camcc IFE_0_GDSC>,
> +                            <&camcc IFE_1_GDSC>,
> +                            <&camcc IFE_2_GDSC>,
> +                            <&camcc TITAN_TOP_GDSC>,
> +                            <&camcc BPS_GDSC>,
> +                            <&camcc IPE_0_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "top",
> +                                 "bps",
> +                                 "ipe";
> +
> +            vdd-csiphy0-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy0-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy1-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy1-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy2-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy2-1p25-supply = <&vreg_l22a>;
> +            vdd-csiphy3-0p9-supply = <&vreg_l18a>;
> +            vdd-csiphy3-1p25-supply = <&vreg_l22a>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy0_ep: endpoint {
> +                        data-lanes = <0 1 2 3>;
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

Because CAMSS device tree nodes are far from being settled down, one
more time I can just express my opinion that there is no good enough
reason to describe all clocks and interconnects prematurely, anyway

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
