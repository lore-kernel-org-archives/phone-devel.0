Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FEC370D65
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 06:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939110; cv=none; b=Af77UJB+ff5I6ftChjli4cvzGjPgL5VHpu8MXSDHsajzhcIkDwU4yYhvOFimwFhusSFBuioW6OJyTsy+EUcW4XcxaGYrEUvIkvSkAAV1d2kAdaHPhTG+v6Xfh1+maZ6ldUWxnp/l3N5UGgNTclNaJ0DagHSq192vySKfQikCBBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939110; c=relaxed/simple;
	bh=i7TdXiOc/sU9Xnk8w1j9i+poKchlRCaL9xRHrstCJxI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CUItG/C9hvAfi+XmMDfsZ4Euhm4K0ZDjyXQAV/+9VHOwSlUUrRDwwQkUSY11xoqfx9tNbQvK9PCZ+oljpBpllfozXjrThkZregd1gbXI0pt5FEijUcHIdWLHWHcUvMnx3c7WPZKPNK0S1f28bY3DtRyX+7dsp1AXirlW/gljihY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nJi3Y3YH; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nJi3Y3YH"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so2396112a12.2
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 23:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774939105; x=1775543905; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t360oCPEHg6R1OB75vUyd/Z3XZ/tbyc3ZydlU9E8ss8=;
        b=nJi3Y3YH6mdALly1GEkIImGp20qVvRj25598q/8KJ/DVcBogS4UXoZ8EC1NRt1PDqe
         WFo3cjJYWK6w5H1KSX+tYZhjduKAsc6iXxyBPh0+L5yC/aMr/fFGCrNJHoRUV0ZGcNjZ
         m5NDhKF6QDuvZDQX9lHeh5CzHLYlFGdvj7+F4v5jcLtu75RbA8x/54CmwRTdhN5PSsSp
         iVXOQnQEbwQKQ8Pp6SefQiUDhx83+YkbdRnG1jvJnFoVLAjpeMLKK59rv3LmwIUJD+rX
         98GfgDFSz5QMiDk8enC8pc7h1A9HSMv5rk5igpKIsmLaTWruUxWZocQ90e6lEFP6AMf8
         FL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774939105; x=1775543905;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t360oCPEHg6R1OB75vUyd/Z3XZ/tbyc3ZydlU9E8ss8=;
        b=R5Lc/y9QwrnS5cUQVhgRhS2FS+D3Y327HblcIu+rB9InsyrBQ82QW5S7XFNP85TpGz
         pQx/fJ8KpI0foJ0at85SXV6Cp6saflureSTqXNUkbENofr4ogLUV/sYn5OBEYQhBIATG
         XNWI6hQMjPSBv4W+wyND8hvLgznqNERpXyqYw/ZfNMWMId9z8fdAixYRqFDDIGg5dVfy
         7ngi0xi1Dsw5fnbaT3Nj9vAyo+6otteK0hg7tJ080zCSQWrxtr1tmnoLMy9knQPZIrZa
         NZ6tgAaZLQJUCuKAC8kDqSWr8j/XjgjsJ8RwkiKbjR5k4OczLHtWlcXeDfDUI/Gb5ptq
         wnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVwVHhmihFBLz4s3oy8+XVV6+ke/u7Hkaq0snni/DQ0ytU2fmqcLyKbF9Esv2aubjjV7ILCUa+/AcyRKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SZp4uQPuMMmgsRoFQw0cM2bFiSlQJIsVDi7p3mOgGpfPz8bi
	YWz4CUea/+NRX/HhApINY8whZNhNIavBtFyQRDLDO/j6TrgOOFMh8lCHIyoWUFkVbf4=
X-Gm-Gg: ATEYQzyEH0ZBzvLKzuznnYyC8xh9rcVE9MjUvVcvpUbKRvClR4z1/aDt0IvsKWG07RN
	ugx/L3azL032742LUITTREr3oW4ubFwnuVwjY6+1SYDks5Q2zZ6gWnirBlsNvkQWwQjpCgXesiw
	Tyu88EJFuIdm9yZVKeGH1MgTvUu/vQZ//qzFGRMLsgIhqzcGcRZeYat41OOsst1C9oOrASXCXBf
	s4c4qvfP0sVxb3CpSpeYPMMpuou5FjYDTNlvRC8qnwz2g1XIDeRsTLO93EhjU/FdjmEEESsQlMk
	zgslFsPouh3ZfM/0wAkIximsHPgFhUtNXfpH0a5/EWwJYAhiN1VHu3w7wjbBQB4MPPFIEOrDE3P
	EyhME7HElwYMSQBUO8TUay2MpQ22SNPRlqlVPHrqov/d4cCzuo0ldThm0k+TMShtV3MIdtyErDx
	nnCotUw95F9idcyMXphXfkkc9PltPeneRhaevHyiJRmz3fgATYqnlg/mDqO4/OQIt82Xh6ZNlT2
	zgqjJtjBnynVwGVWdf19JvuQz/meNluzqTi
X-Received: by 2002:a05:6402:2115:b0:66a:3390:30c4 with SMTP id 4fb4d7f45d1cf-66b28a5d37emr9157097a12.15.1774939105252;
        Mon, 30 Mar 2026 23:38:25 -0700 (PDT)
Received: from localhost (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b7275ff49sm2951107a12.6.2026.03.30.23.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 23:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 08:38:23 +0200
Message-Id: <DHGREFP0IVZS.1HWJHNFTI50KZ@fairphone.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bryan O'Donoghue" <bod@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Todor Tomov" <todor.too@gmail.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
 <fe00906e-fb06-44e3-985b-3d0e95839e43@linaro.org>
In-Reply-To: <fe00906e-fb06-44e3-985b-3d0e95839e43@linaro.org>

On Tue Mar 31, 2026 at 12:57 AM CEST, Vladimir Zapolskiy wrote:
> On 2/16/26 10:54, Luca Weiss wrote:
>> Add bindings for the Camera Subsystem on the SM6350 SoC.
>>=20
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++=
++++++++
>>   1 file changed, 471 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.y=
aml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>> new file mode 100644
>> index 000000000000..96974d90d8c4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
>> @@ -0,0 +1,471 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM6350 Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Luca Weiss <luca.weiss@fairphone.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sm6350-camss
>> +
>> +  reg:
>> +    maxItems: 24
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite
>> +      - const: a5_csr
>> +      - const: a5_qgic
>> +      - const: a5_sierra
>> +      - const: bps
>> +      - const: camnoc
>> +      - const: core_top_csr_tcsr
>> +      - const: cpas_cdm
>> +      - const: cpas_top
>> +      - const: ipe
>> +      - const: jpeg_dma
>> +      - const: jpeg_enc
>> +      - const: lrme
>> +
>> +  clocks:
>> +    maxItems: 39
>> +
>> +  clock-names:
>> +    items:
>> +      - const: cam_axi
>> +      - const: soc_ahb
>> +      - const: camnoc_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: vfe0_axi
>> +      - const: vfe0
>> +      - const: vfe0_cphy_rx
>> +      - const: vfe0_csid
>> +      - const: vfe1_axi
>> +      - const: vfe1
>> +      - const: vfe1_cphy_rx
>> +      - const: vfe1_csid
>> +      - const: vfe2_axi
>> +      - const: vfe2
>> +      - const: vfe2_cphy_rx
>> +      - const: vfe2_csid
>> +      - const: vfe_lite
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: bps
>> +      - const: bps_ahb
>> +      - const: bps_areg
>> +      - const: bps_axi
>> +      - const: icp
>> +      - const: ipe0
>> +      - const: ipe0_ahb
>> +      - const: ipe0_areg
>> +      - const: ipe0_axi
>> +      - const: jpeg
>> +      - const: lrme
>> +
>> +  interrupts:
>> +    maxItems: 18
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite
>> +      - const: a5
>> +      - const: cpas
>> +      - const: cpas_cdm
>> +      - const: jpeg_dma
>> +      - const: jpeg_enc
>> +      - const: lrme
>> +
>> +  interconnects:
>> +    maxItems: 4
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +      - const: sf_mnoc
>> +      - const: sf_icp_mnoc
>> +
>> +  iommus:
>> +    maxItems: 14
>> +
>> +  power-domains:
>> +    maxItems: 6
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>> +      - const: bps
>> +      - const: ipe
>
> I've lost the content, why 'top' is somewhere in the middle?

https://lore.kernel.org/linux-arm-msm/20260214-slick-ringtail-of-innovation=
-d8eecd@quoll/

>
>> +
>> +  vdd-csiphy0-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY0.
>> +
>> +  vdd-csiphy0-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY0.
>> +
>> +  vdd-csiphy1-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY1.
>> +
>> +  vdd-csiphy1-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY1.
>> +
>> +  vdd-csiphy2-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY2.
>> +
>> +  vdd-csiphy2-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY2.
>> +
>> +  vdd-csiphy3-0p9-supply:
>> +    description:
>> +      Phandle to a 0.9V regulator supply to CSIPHY3.
>> +
>> +  vdd-csiphy3-1p25-supply:
>> +    description:
>> +      Phandle to a 1.25V regulator supply to CSIPHY3.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports.
>> +
>> +    patternProperties:
>> +      "^port@[0-3]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +
>> +        description:
>> +          Input port for receiving CSI data from a CSIPHY.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
>> +    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm6350.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    soc {
>> +        #address-cells =3D <2>;
>> +        #size-cells =3D <2>;
>> +
>> +        isp@acb3000 {
>> +            compatible =3D "qcom,sm6350-camss";
>> +
>> +            reg =3D <0x0 0x0acb3000 0x0 0x1000>,
>> +                  <0x0 0x0acba000 0x0 0x1000>,
>> +                  <0x0 0x0acc1000 0x0 0x1000>,
>> +                  <0x0 0x0acc8000 0x0 0x1000>,
>> +                  <0x0 0x0ac65000 0x0 0x1000>,
>> +                  <0x0 0x0ac66000 0x0 0x1000>,
>> +                  <0x0 0x0ac67000 0x0 0x1000>,
>> +                  <0x0 0x0ac68000 0x0 0x1000>,
>> +                  <0x0 0x0acaf000 0x0 0x4000>,
>> +                  <0x0 0x0acb6000 0x0 0x4000>,
>> +                  <0x0 0x0acbd000 0x0 0x4000>,
>> +                  <0x0 0x0acc4000 0x0 0x4000>,
>> +                  <0x0 0x0ac18000 0x0 0x3000>,
>> +                  <0x0 0x0ac00000 0x0 0x6000>,
>> +                  <0x0 0x0ac10000 0x0 0x8000>,
>> +                  <0x0 0x0ac6f000 0x0 0x8000>,
>> +                  <0x0 0x0ac42000 0x0 0x4600>,
>> +                  <0x0 0x01fc0000 0x0 0x40000>,
>> +                  <0x0 0x0ac48000 0x0 0x1000>,
>> +                  <0x0 0x0ac40000 0x0 0x1000>,
>> +                  <0x0 0x0ac87000 0x0 0xa000>,
>> +                  <0x0 0x0ac52000 0x0 0x4000>,
>> +                  <0x0 0x0ac4e000 0x0 0x4000>,
>> +                  <0x0 0x0ac6b000 0x0 0xa00>;
>> +            reg-names =3D "csid0",
>> +                        "csid1",
>> +                        "csid2",
>> +                        "csid_lite",
>> +                        "csiphy0",
>> +                        "csiphy1",
>> +                        "csiphy2",
>> +                        "csiphy3",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe2",
>> +                        "vfe_lite",
>> +                        "a5_csr",
>> +                        "a5_qgic",
>> +                        "a5_sierra",
>> +                        "bps",
>> +                        "camnoc",
>> +                        "core_top_csr_tcsr",
>> +                        "cpas_cdm",
>> +                        "cpas_top",
>> +                        "ipe",
>> +                        "jpeg_dma",
>> +                        "jpeg_enc",
>> +                        "lrme";
>> +
>> +            clocks =3D <&gcc GCC_CAMERA_AXI_CLK>,
>> +                     <&camcc CAMCC_SOC_AHB_CLK>,
>> +                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
>> +                     <&camcc CAMCC_CORE_AHB_CLK>,
>> +                     <&camcc CAMCC_CPAS_AHB_CLK>,
>> +                     <&camcc CAMCC_CSIPHY0_CLK>,
>> +                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_CSIPHY1_CLK>,
>> +                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_CSIPHY2_CLK>,
>> +                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_CSIPHY3_CLK>,
>> +                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
>> +                     <&camcc CAMCC_IFE_0_AXI_CLK>,
>> +                     <&camcc CAMCC_IFE_0_CLK>,
>> +                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_0_CSID_CLK>,
>> +                     <&camcc CAMCC_IFE_1_AXI_CLK>,
>> +                     <&camcc CAMCC_IFE_1_CLK>,
>> +                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_1_CSID_CLK>,
>> +                     <&camcc CAMCC_IFE_2_AXI_CLK>,
>> +                     <&camcc CAMCC_IFE_2_CLK>,
>> +                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_2_CSID_CLK>,
>> +                     <&camcc CAMCC_IFE_LITE_CLK>,
>> +                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAMCC_IFE_LITE_CSID_CLK>,
>> +                     <&camcc CAMCC_BPS_CLK>,
>> +                     <&camcc CAMCC_BPS_AHB_CLK>,
>> +                     <&camcc CAMCC_BPS_AREG_CLK>,
>> +                     <&camcc CAMCC_BPS_AXI_CLK>,
>> +                     <&camcc CAMCC_ICP_CLK>,
>> +                     <&camcc CAMCC_IPE_0_CLK>,
>> +                     <&camcc CAMCC_IPE_0_AHB_CLK>,
>> +                     <&camcc CAMCC_IPE_0_AREG_CLK>,
>> +                     <&camcc CAMCC_IPE_0_AXI_CLK>,
>> +                     <&camcc CAMCC_JPEG_CLK>,
>> +                     <&camcc CAMCC_LRME_CLK>;
>> +            clock-names =3D "cam_axi",
>> +                          "soc_ahb",
>> +                          "camnoc_axi",
>> +                          "core_ahb",
>> +                          "cpas_ahb",
>> +                          "csiphy0",
>> +                          "csiphy0_timer",
>> +                          "csiphy1",
>> +                          "csiphy1_timer",
>> +                          "csiphy2",
>> +                          "csiphy2_timer",
>> +                          "csiphy3",
>> +                          "csiphy3_timer",
>> +                          "vfe0_axi",
>> +                          "vfe0",
>> +                          "vfe0_cphy_rx",
>> +                          "vfe0_csid",
>> +                          "vfe1_axi",
>> +                          "vfe1",
>> +                          "vfe1_cphy_rx",
>> +                          "vfe1_csid",
>> +                          "vfe2_axi",
>> +                          "vfe2",
>> +                          "vfe2_cphy_rx",
>> +                          "vfe2_csid",
>> +                          "vfe_lite",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid",
>> +                          "bps",
>> +                          "bps_ahb",
>> +                          "bps_areg",
>> +                          "bps_axi",
>> +                          "icp",
>> +                          "ipe0",
>> +                          "ipe0_ahb",
>> +                          "ipe0_areg",
>> +                          "ipe0_axi",
>> +                          "jpeg",
>> +                          "lrme";
>> +
>> +            interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names =3D "csid0",
>> +                              "csid1",
>> +                              "csid2",
>> +                              "csid_lite",
>> +                              "csiphy0",
>> +                              "csiphy1",
>> +                              "csiphy2",
>> +                              "csiphy3",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe2",
>> +                              "vfe_lite",
>> +                              "a5",
>> +                              "cpas",
>> +                              "cpas_cdm",
>> +                              "jpeg_dma",
>> +                              "jpeg_enc",
>> +                              "lrme";
>> +
>> +            interconnects =3D <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_AC=
TIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_=
ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_AL=
WAYS
>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAY=
S>,
>> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_AL=
WAYS
>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAY=
S>,
>> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_A=
LWAYS
>> +                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAY=
S>;
>> +            interconnect-names =3D "ahb",
>> +                                 "hf_mnoc",
>> +                                 "sf_mnoc",
>> +                                 "sf_icp_mnoc";
>> +
>> +            iommus =3D <&apps_smmu 0x820 0xc0>,
>> +                     <&apps_smmu 0x840 0x0>,
>> +                     <&apps_smmu 0x860 0xc0>,
>> +                     <&apps_smmu 0x880 0x0>,
>> +                     <&apps_smmu 0xc40 0x20>,
>> +                     <&apps_smmu 0xc60 0x20>,
>> +                     <&apps_smmu 0xc80 0x0>,
>> +                     <&apps_smmu 0xca2 0x0>,
>> +                     <&apps_smmu 0xcc0 0x20>,
>> +                     <&apps_smmu 0xce0 0x20>,
>> +                     <&apps_smmu 0xd00 0x20>,
>> +                     <&apps_smmu 0xd20 0x20>,
>> +                     <&apps_smmu 0xd40 0x20>,
>> +                     <&apps_smmu 0xd60 0x20>;
>> +
>> +            power-domains =3D <&camcc IFE_0_GDSC>,
>> +                            <&camcc IFE_1_GDSC>,
>> +                            <&camcc IFE_2_GDSC>,
>> +                            <&camcc TITAN_TOP_GDSC>,
>> +                            <&camcc BPS_GDSC>,
>> +                            <&camcc IPE_0_GDSC>;
>> +            power-domain-names =3D "ife0",
>> +                                 "ife1",
>> +                                 "ife2",
>> +                                 "top",
>> +                                 "bps",
>> +                                 "ipe";
>> +
>> +            vdd-csiphy0-0p9-supply =3D <&vreg_l18a>;
>> +            vdd-csiphy0-1p25-supply =3D <&vreg_l22a>;
>> +            vdd-csiphy1-0p9-supply =3D <&vreg_l18a>;
>> +            vdd-csiphy1-1p25-supply =3D <&vreg_l22a>;
>> +            vdd-csiphy2-0p9-supply =3D <&vreg_l18a>;
>> +            vdd-csiphy2-1p25-supply =3D <&vreg_l22a>;
>> +            vdd-csiphy3-0p9-supply =3D <&vreg_l18a>;
>> +            vdd-csiphy3-1p25-supply =3D <&vreg_l22a>;
>> +
>> +            ports {
>> +                #address-cells =3D <1>;
>> +                #size-cells =3D <0>;
>> +
>> +                port@0 {
>> +                    reg =3D <0>;
>> +
>> +                    csiphy0_ep: endpoint {
>> +                        data-lanes =3D <0 1 2 3>;
>> +                        bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +                        remote-endpoint =3D <&sensor_ep>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>>=20
>
> Because CAMSS device tree nodes are far from being settled down, one
> more time I can just express my opinion that there is no good enough
> reason to describe all clocks and interconnects prematurely, anyway

Would be nice if the camss maintainers were aligned so that contributors
don't have to deal with mailing list conflicts over these fundamental
things.

It doesn't really make it fun to contribute if you get conflicting
opinions from two people that you should both value the opinion of
because they're maintainer.

> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Thanks!

Regards
Luca
