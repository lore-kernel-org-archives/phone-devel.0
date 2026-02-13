Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3B1360744
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988510; cv=none; b=vCeXBYdA8x1+IFFX9Zh2TJ99iCNiEaUN5QNHQWlI1/CI1Vy4fUKo31DDwnBplXGLvLYXOIOtLedPk65zUA80BtgdLVOrIo9EYFr2/gWRMyTdmzgDgKpn9az9IITXeMHU6BQjiNK19BgwNsUO9Sb406OkqGGaEhtinqLmgvFaKZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988510; c=relaxed/simple;
	bh=ydhmJSCIZaIH22AlYiY5zbtcSZF7dLVsHrUi82mpK0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPpZmvX177T0+6GIO6eKZG0J23INimJy/6d+oo5Aor3rsL4EBZXGbK0Lctww0aEt37SsAc7ae5tqBpGja1HVuvcipasVMz757N0hKSW6r9lKWO2/4L271fHH+mzj6fZY1KM4OqBoLpfhPXc/HlEgvYhaPddCrnNALWXDbW7MZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=dFmNtiI7; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="dFmNtiI7"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65a36c8bcabso1620860a12.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 05:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770988507; x=1771593307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T+zUpq9H0nLacgX2lpZL7d91Dtqet9InTc/kLd9coE=;
        b=dFmNtiI7ELvJWH3nxqo6J7ffBEmbuOsti2NC4DVN3qNsAOCaNEy8dWKXFGObdOml84
         gIYXP9z7zl+EUoSZM1w/QtX4hpYH2PDafshDf4ssMK/hEOyFEdRt1zsmBlSwm/7VUx0j
         YdC543vXGg3qGBkXuseEuzFsg4BlWigaIfC0Oe0BqypCncyMLupWzN+5Vfa2Uz6yLKGf
         9DgEj+/uEb7ytAc2C0bS9W085tjpgOvOs2vmxlvKyU/WS+b9BTcEyf7sLjsQKZE3ttBE
         0vgaLIoDgc8xjiy1FPOo8DCLcNUEkTZnnVj8aQJXp0XBbupPusVLguwSTdn9Jk13/CU/
         OuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988507; x=1771593307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3T+zUpq9H0nLacgX2lpZL7d91Dtqet9InTc/kLd9coE=;
        b=xDvO1ymeYbQD4XffqY/dk6yqjQLj4SoodhB96h/gVck8DaTk3nmUatIHxQcJeLm8KD
         yopam6w5+/ZUNyQv+87Dp4NrSRP/0xcnAa36wN/aSW6BCQo1+qFsEA7sJD90GtBENXZa
         4CPzGCMFwcvFtYwFyu54WoENkGgpleokFk6dmbWll6E9ffBBDhyP0xMVQxcu2TJlFhNG
         B8MQvFACbqMOVVI2eUv6upG6d5OZwvxE3hf41O/nBwTPDeU/iBvBmt3VcI75vrvZY4Ld
         eYhGA0KY+vHXFBBsIJtND2iFBaJzyFC3C31n2ILnxOwx3k2IHBPH9lMhyMwWXgl/mdaJ
         LCUA==
X-Forwarded-Encrypted: i=1; AJvYcCWcwKHHH9Nol1uA31y17CzFkzAKEHp5x3tZMFrbqVn8LDzRrkA/1kt/cRCRV2fuRRcTsEZwQxQnF4wD3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyw9MEKUg6lJsQbmW93JrRSFwCQqxtqDVu1iILcrTUU3DBTj8T
	6wRbhOtYO9jR9n+tlPhsj+3sG1i9ApC6bnziIAgtG5kUxlkMygVdrEZgU1EXgY031iI=
X-Gm-Gg: AZuq6aLe4ZfSLaz7a/sgJlpfIaljQEbBF8FjIoWMaEp3M0aCrcOpPWIcBlBjBJj/8ck
	nmq+quWqwdkWvd8nEmQODAYT8rZMKtpqf/++Mlzf6T9xIeenpDIB49tEef38Qtqj9fx1AJoFZyb
	XXilh970ioYyUR82QzCD6FQ+gjTlZAMz7+gCALQQAgqCJ/YmoNXRm/F4IsIxsAMY3X/QL7Y3re6
	mi2BTgAf4PO5OY9oI0tRlN0hTvlhSCdW3GitVQeX5O3q4oc0sL4bbJ137vmm24eIC9vaXzeMHBK
	x86d8apinYVcBcQ34LjCpnPVJiqGG+Y7BIfH3kh3Iyg4smwsJctRu+z7frvDt6WsNR07SOHPSAI
	PZE6j4uUZVn9GsImQuXAmL/HXmFlRm5lRk2n1P1TYw7aJizR1A3UGNYfrIX+P/qL9sCBXOrPGHt
	UlzOaUVrg9LP5jfrROLom8dI4LVu+a04JmkYlbO1hKdTWg1WWq1xMDFd59FupCkyHJWlZQciJZA
	UzS
X-Received: by 2002:a05:6402:4445:b0:658:bd67:bc16 with SMTP id 4fb4d7f45d1cf-65bace362damr901167a12.20.1770988506996;
        Fri, 13 Feb 2026 05:15:06 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bace3fc4esm674231a12.0.2026.02.13.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:15:06 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 14:15:03 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-sm6350-camss-v3-3-30a845b0b7cc@fairphone.com>
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
In-Reply-To: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770988501; l=7482;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ydhmJSCIZaIH22AlYiY5zbtcSZF7dLVsHrUi82mpK0s=;
 b=RL7EdMIv+OMN80Kmw4Nf5DmJG6mHymFBALfSHtD/yo7ntH77Zgug+cQn//pCyoHG0+hTdPD6A
 /NOlgCzivb2CPcR79dceAklPuPy9H6cjQdigmKIHrCkG22eXg9ip9vQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9b9f9af0da..07887a07644f 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2161,6 +2161,239 @@ cci1_i2c0: i2c-bus@0 {
 			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
 		};
 
+		camss: isp@acb3000 {
+			compatible = "qcom,sm6350-camss";
+
+			reg = <0x0 0x0acb3000 0x0 0x1000>,
+			      <0x0 0x0acba000 0x0 0x1000>,
+			      <0x0 0x0acc1000 0x0 0x1000>,
+			      <0x0 0x0acc8000 0x0 0x1000>,
+			      <0x0 0x0ac65000 0x0 0x1000>,
+			      <0x0 0x0ac66000 0x0 0x1000>,
+			      <0x0 0x0ac67000 0x0 0x1000>,
+			      <0x0 0x0ac68000 0x0 0x1000>,
+			      <0x0 0x0acaf000 0x0 0x4000>,
+			      <0x0 0x0acb6000 0x0 0x4000>,
+			      <0x0 0x0acbd000 0x0 0x4000>,
+			      <0x0 0x0acc4000 0x0 0x4000>,
+			      <0x0 0x0ac18000 0x0 0x3000>,
+			      <0x0 0x0ac00000 0x0 0x6000>,
+			      <0x0 0x0ac10000 0x0 0x8000>,
+			      <0x0 0x0ac6f000 0x0 0x8000>,
+			      <0x0 0x0ac42000 0x0 0x4600>,
+			      <0x0 0x01fc0000 0x0 0x40000>,
+			      <0x0 0x0ac48000 0x0 0x1000>,
+			      <0x0 0x0ac40000 0x0 0x1000>,
+			      <0x0 0x0ac87000 0x0 0xa000>,
+			      <0x0 0x0ac52000 0x0 0x4000>,
+			      <0x0 0x0ac4e000 0x0 0x4000>,
+			      <0x0 0x0ac6b000 0x0 0xa00>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite",
+				    "a5_csr",
+				    "a5_qgic",
+				    "a5_sierra",
+				    "bps",
+				    "camnoc",
+				    "core_top_csr_tcsr",
+				    "cpas_cdm",
+				    "cpas_top",
+				    "ipe",
+				    "jpeg_dma",
+				    "jpeg_enc",
+				    "lrme";
+
+			clocks = <&gcc GCC_CAMERA_AXI_CLK>,
+				 <&camcc CAMCC_SOC_AHB_CLK>,
+				 <&camcc CAMCC_CAMNOC_AXI_CLK>,
+				 <&camcc CAMCC_CORE_AHB_CLK>,
+				 <&camcc CAMCC_CPAS_AHB_CLK>,
+				 <&camcc CAMCC_CSIPHY0_CLK>,
+				 <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY1_CLK>,
+				 <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY2_CLK>,
+				 <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAMCC_CSIPHY3_CLK>,
+				 <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAMCC_IFE_0_AXI_CLK>,
+				 <&camcc CAMCC_IFE_0_CLK>,
+				 <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_0_CSID_CLK>,
+				 <&camcc CAMCC_IFE_1_AXI_CLK>,
+				 <&camcc CAMCC_IFE_1_CLK>,
+				 <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_1_CSID_CLK>,
+				 <&camcc CAMCC_IFE_2_AXI_CLK>,
+				 <&camcc CAMCC_IFE_2_CLK>,
+				 <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_2_CSID_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAMCC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAMCC_BPS_CLK>,
+				 <&camcc CAMCC_BPS_AHB_CLK>,
+				 <&camcc CAMCC_BPS_AREG_CLK>,
+				 <&camcc CAMCC_BPS_AXI_CLK>,
+				 <&camcc CAMCC_ICP_CLK>,
+				 <&camcc CAMCC_IPE_0_CLK>,
+				 <&camcc CAMCC_IPE_0_AHB_CLK>,
+				 <&camcc CAMCC_IPE_0_AREG_CLK>,
+				 <&camcc CAMCC_IPE_0_AXI_CLK>,
+				 <&camcc CAMCC_JPEG_CLK>,
+				 <&camcc CAMCC_LRME_CLK>;
+			clock-names = "cam_axi",
+				      "soc_ahb",
+				      "camnoc_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "vfe0_axi",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe0_csid",
+				      "vfe1_axi",
+				      "vfe1",
+				      "vfe1_cphy_rx",
+				      "vfe1_csid",
+				      "vfe2_axi",
+				      "vfe2",
+				      "vfe2_cphy_rx",
+				      "vfe2_csid",
+				      "vfe_lite",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "bps",
+				      "bps_ahb",
+				      "bps_areg",
+				      "bps_axi",
+				      "icp",
+				      "ipe0",
+				      "ipe0_ahb",
+				      "ipe0_areg",
+				      "ipe0_axi",
+				      "jpeg",
+				      "lrme";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite",
+					  "a5",
+					  "cpas",
+					  "cpas_cdm",
+					  "jpeg_dma",
+					  "jpeg_enc",
+					  "lrme";
+
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x820 0xc0>,
+				 <&apps_smmu 0x840 0x0>,
+				 <&apps_smmu 0x860 0xc0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0xc40 0x20>,
+				 <&apps_smmu 0xc60 0x20>,
+				 <&apps_smmu 0xc80 0x0>,
+				 <&apps_smmu 0xca2 0x0>,
+				 <&apps_smmu 0xcc0 0x20>,
+				 <&apps_smmu 0xce0 0x20>,
+				 <&apps_smmu 0xd00 0x20>,
+				 <&apps_smmu 0xd20 0x20>,
+				 <&apps_smmu 0xd40 0x20>,
+				 <&apps_smmu 0xd60 0x20>;
+
+			power-domains = <&camcc BPS_GDSC>,
+					<&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc IPE_0_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "bps",
+					     "ife0",
+					     "ife1",
+					     "ife2",
+					     "ipe",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sm6350-camcc";
 			reg = <0x0 0x0ad00000 0x0 0x16000>;

-- 
2.53.0

