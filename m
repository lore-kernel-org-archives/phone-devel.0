Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC94286887
	for <phone-devel@vger.kernel.org>; Fri,  6 Jun 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206831; cv=none; b=TTgOK6ukV14RPieBbHYyHtxCVW9nXKZ1NGC5h2fTCeUfM6H5iosoXEknc9m8Sg/OkVAsfN3gvoE6egRUAExHc9lqpxvRN4wF93EnRuC4msfolaaU3gWKrF3hH2V3qqyuAz6mie7OcMx8/2wc/3CwhS7H81h6dNoyK4GrbG0wEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206831; c=relaxed/simple;
	bh=f+/j1GlnG7yRbwOXO1wHIG7cgcq9EW09L+j7P/rKe1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAn4MtvvN9QqaWQCm40dxu1EbdJHuCH7MWpncwjsQ9p6c/ZdpJx1JXW3l2xI/4iEUJ7Qo6GraWvxkT06ZS8JAAzbkNPMOSCAr3VJiJKTrHoIR5GMmaMrd1ewTCgASn1QeTxqY50E0m+bJJaxfJjPQTivP4Q/8FFmoZEzSjIDtKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPyoyjUi; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPyoyjUi"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a6c0d613eso2000551fa.1
        for <phone-devel@vger.kernel.org>; Fri, 06 Jun 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749206827; x=1749811627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sdh3DYrunzvdU87ptIswN2gqeFyihiWuxRVoLIp7jeA=;
        b=tPyoyjUiWWXQlWbmAywAoEgb95uFXimp9DGWTF9bnPOfoetyO9LhY5eRf1B3l4NS42
         p8QMipdHZ4eJ0sT9yloT19TE9BX6ywU2RNJLDrbVuryl5yDWtueOBrRxzT0qFhEwfE9H
         q+Fmg7fhwjfLzJNL9DxAG1NzmB/KjlT4zQTEAR3SWQfbE0xA9flHNZ1B5U/XRJGCnetP
         DFjo/ifQNB98y1ziAz/I2QvDGXZ5nxHRoN9RIC5ZEeLjZdktjIsorjgr9DihoDFGwt8p
         MX14o1o8bD8LnpwLu6RulESjXrste7fGpUKPLX/EMEHn1/gcPm4vdXRUgxmISnpfWPak
         h/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749206827; x=1749811627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdh3DYrunzvdU87ptIswN2gqeFyihiWuxRVoLIp7jeA=;
        b=C1+05CTVYf+hJUd2r2ETdgORjATMHiPrvb4wKK8RyNjXB0Ka9aXNrjmbouR2/NEpSh
         o/eMsG8HAOfih7Kqegoy9dufQsX65I5H0pNGSUgcj6IXxd32BI46CDLeLBgMsEtR4ZOx
         AaHtgbyXH4Aiy2mWWAlcld0aLLzpJlxrrcl3z0PaS4aX8nAPxt+HHtXLr8SZhEx4PIOv
         FdFojwQJ0H9ExGjiuaI0TsyrPE7AmCHGXfMsuVfjEP7LdBYrz5On5dr+OnjiHzCuG7Td
         eI2sCqfP0SZcdrrSJGzXscuK2ePpuN0jivWbjEumvj3AgY5zKGKZwDCBU4NK4MDc5Dt+
         q5hA==
X-Forwarded-Encrypted: i=1; AJvYcCW35kxvxAw/5JYNEkVyOFZ9NQOQ46qTNL28vdMRTI8MW6B5u5LBuQcOpabYsrbgWtnqLzmMwf9JubcK+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqr6Jqznj8Cmjj+Jfy61i5/mPJaed0fRCmQy7UlWL0yKoI1Lrk
	vTj06zuAyKT5Y/WsUE7WZS4qpPHbgWoa1zAXKrCoLmzF7pC+P/mHUhNhjIaIE6xbUwg=
X-Gm-Gg: ASbGncsF/4tq3JFOAasck/KoRExij2QcCgieTn8I3wsyHKsvy7iXXJ3uVKl7wj4cMS6
	jQNZ8RTaAQVlp9R2Ia6KVCsFNMW4EyX/mtOUcCtDR4xt43/Z7zqgssiI1vhi/jCbtstSMJsSQE3
	EvBtLp/adUxHsWEnVUs+qxdEb0GpXbo1MsKiz1lG4tAH5ivbZryNNb97a3jBYTktRn7B2oJpeep
	/GwD5lY0qugwhgCzVkSK/UET0M+aa89HQOcvpY0H1s/1PCSnLvf8RF4nJBtBtgKaS0uVfv6t+3J
	iG85ukigwIMPvXHMPw2FL8CkYpxX2bJU6N7p2U62sdtU6zcf3HTGdPtf8f2Sz35rSJW2z50ZCPK
	ywaAsvduFEBDCQlTwF9l/rCD9kLp1FJRfgmHZC+WZ
X-Google-Smtp-Source: AGHT+IGxjhoxsgVGEZoQ3YemtpUiJRV1bf+P3EhChyczWjkpXHPpDvcvXiPRpgWGAH6vjpJO+8TgQw==
X-Received: by 2002:ac2:4e0d:0:b0:553:2e82:162e with SMTP id 2adb3069b0e04-553685e5a0dmr156612e87.2.1749206827030;
        Fri, 06 Jun 2025 03:47:07 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b33b48sm1379641fa.30.2025.06.06.03.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:47:06 -0700 (PDT)
Message-ID: <2884f55c-6b80-406a-ba21-aaa26297b1bf@linaro.org>
Date: Fri, 6 Jun 2025 13:46:59 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] media: dt-bindings: Add qcom,msm8939-camss
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-3-32c277d8f9bf@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250602-camss-8x39-vbif-v4-3-32c277d8f9bf@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
>   1 file changed, 254 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..59bf16888a8235495a2080e512ce179583bcd25d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> @@ -0,0 +1,254 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vincent Knecht <vincent.knecht@mailoo.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8939-camss
> +
> +  reg:
> +    maxItems: 11
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csi_clk_mux
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe0_vbif

Please sort the list alphanumerically, accorting to the ASCII character set
the underscore symbol precedes lower case letters.

> +
> +  clocks:
> +    maxItems: 24
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: csi0
> +      - const: csi0_ahb
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1
> +      - const: csi1_ahb
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2
> +      - const: csi2_ahb
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csi_vfe0
> +      - const: ispif_ahb
> +      - const: top_ahb
> +      - const: vfe0
> +      - const: vfe_ahb
> +      - const: vfe_axi

Same comment as above.

> +
> +  interrupts:
> +    maxItems: 7
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: ispif
> +      - const: vfe0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch
> +          Controller.
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.

Please specify the wanted voltage level in the description, due to
the example below I would expect it's 2.8V.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-1]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
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
> +  - iommus
> +  - power-domains
> +  - vdda-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +
> +    isp@1b08000 {
> +        compatible = "qcom,msm8939-camss";
> +
> +        reg = <0x01b08000 0x100>,
> +              <0x01b08400 0x100>,
> +              <0x01b08800 0x100>,
> +              <0x01b0ac00 0x200>,
> +              <0x01b00030 0x4>,
> +              <0x01b0b000 0x200>,
> +              <0x01b00038 0x4>,
> +              <0x01b00020 0x10>,
> +              <0x01b0a000 0x500>,
> +              <0x01b10000 0x1000>,
> +              <0x01b40000 0x200>;
> +
> +        reg-names = "csid0",
> +                    "csid1",
> +                    "csid2",
> +                    "csiphy0",
> +                    "csiphy0_clk_mux",
> +                    "csiphy1",
> +                    "csiphy1_clk_mux",
> +                    "csi_clk_mux",
> +                    "ispif",
> +                    "vfe0",
> +                    "vfe0_vbif";
> +
> +        clocks = <&gcc GCC_CAMSS_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_VFE_AXI_CLK>;
> +
> +        clock-names = "ahb",
> +                      "csi0",
> +                      "csi0_ahb",
> +                      "csi0_phy",
> +                      "csi0_pix",
> +                      "csi0_rdi",
> +                      "csi1",
> +                      "csi1_ahb",
> +                      "csi1_phy",
> +                      "csi1_pix",
> +                      "csi1_rdi",
> +                      "csi2",
> +                      "csi2_ahb",
> +                      "csi2_phy",
> +                      "csi2_pix",
> +                      "csi2_rdi",
> +                      "csiphy0_timer",
> +                      "csiphy1_timer",
> +                      "csi_vfe0",
> +                      "ispif_ahb",
> +                      "top_ahb",
> +                      "vfe0",
> +                      "vfe_ahb",
> +                      "vfe_axi";
> +
> +        interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +
> +        interrupt-names = "csid0",
> +                          "csid1",
> +                          "csid2",
> +                          "csiphy0",
> +                          "csiphy1",
> +                          "ispif",
> +                          "vfe0";
> +
> +        iommus = <&apps_iommu 3>;
> +
> +        power-domains = <&gcc VFE_GDSC>;
> +
> +        vdda-supply = <&reg_2v8>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy1_ep: endpoint {

There should be an empty line between the end of the list of properties
and the beginning of the list of children device tree nodes.

> +                    clock-lanes = <1>;

Please remove 'clock-lanes' propoerty from here.

> +                    data-lanes = <0 2>;
> +                    remote-endpoint = <&sensor_ep>;
> +                };
> +            };
> +        };
> +    };
> 

--
Best wishes,
Vladimir
