Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227D13148AA
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119711; cv=none; b=VRURO2z2INP5pcPWqdgfE5quWJCcETUY+8SJDVV1mXm//7d439n2gZnfvk3PHKgT8fjCwbqeL8Kt282ZKBySYmTvZCNc493cx1kLeMjk6ECW+x6qwJvP9LLoY7TCQ4JT1idSg5mUd+VYkB3D++KosfrQJkS4YCe2+jBEwZCoU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119711; c=relaxed/simple;
	bh=gBE90KsqO9udgNoh6l0H/vdAFeTWNHHho9oSVUGbcHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Flk7dMXkP/+9lbZR9NK2G3L5tRI3/hggFUl7uy1+wC/hemPzTa2DbXMQ337Aq28oCkoqA3iy8puWjU6coDq/fLTHN6v8ZVRmxARfz5uMT+C6awCUVjGnLGoKYzRK4TipSn9lSNSDdiolwEEbx1Qw5vGm9rbZ/7Yf6EEbwxrwt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vs+Pe7vH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vs+Pe7vH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7291af7190so277043566b.3
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 03:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763119707; x=1763724507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPUQMKIKyKxDkLtmJMOUx+SilXCbirqpjhWROcwrmGE=;
        b=vs+Pe7vH0M9/x0UGBHmhBhh+FTUKSyqquLrPyz+sgOVVLXKLsZrF6ofG0VoCRjyBEQ
         pz+jDk9WCLefBWrqI/FdowZm6JUCA7jN9HS9d3YA58rCSvO5rb8TXCICAgK86pxBwnTU
         5fSZSWmwSZFAS8VD/UZgVWOF7Pk/1ehDU0IAdIMaAddgpfTiA+fNypLRRsNfs31q/zPx
         8sEfvd7qU+h+fw84KgH18h0W2mF/AM3C63tPKxudoKqYhZx2oC1A86s2xPRV9IxP+793
         6XcCS5B5WJeP5jDPnRKr3aPvsu0mtjMfIaLJjEqzGWlW8gCXclHPEnGo2hSXndngZkon
         qWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763119707; x=1763724507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPUQMKIKyKxDkLtmJMOUx+SilXCbirqpjhWROcwrmGE=;
        b=m5uFMd3wt+jHFNbzDbbWHVJH3iisSOObYc2EjHQ25l7selZFRFeWf7DTvrnVkUV92f
         YkCe76CD18YezWs+9jko2ecJB4EkmomDLGhM6nxbRSUtaLG1tKsPRtGQ2R9llE6Tckrk
         5FUo3w5FxNcpFgYL2YJTAcDolR6FOCJHyOGUCv3LnVKCdX815Gdi9cFxGv+67TNv2PiS
         PpLbETeOobKCvwaEpdPBZztmVXH7Zu711MWbF4vtklx6AXGRwYvZDVpKi8ne/kWNIubY
         GI4AgaUHB02F6DGpNr5+z16yp7HsbEG1peRS7ONlf48Hym9D8Pb+Ie931L3edBeef5hd
         Y/MA==
X-Forwarded-Encrypted: i=1; AJvYcCW+cEProz5oONda7o13OA3a5QYTZVOCmMKEqXEOnFucb7261/qGFLCCKBtwqBukNNyskKQJxgsnh2OBJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fZdxGgLMphDUFuwK3V2heg6ovJb6ojK5wX0VhQBj6irWrkve
	3M0XOSmNvrm+RAJN5hUawlHfzIGDzbTLqZpcXm/4UCxtXjIG1xe4eSjUc4cgORAksKw=
X-Gm-Gg: ASbGnctImXJK/wHacs3QhanZr3DBSgc9YE5sYtkU0LO8bC6lwU5pZDA/uCOtaZKpVsm
	DrxxvX+M3eCMQdI4Ru4uiKmJiHVk106uXcqmxu3cpz0Zz7o3saC+KDBznA8mtXBUqNG7yISlKZK
	R4oPuU8Axb8nWRf0tu1S32fl1hDAhIUSZl30NAyGCC4D/IJ2wNDjLhLmJVpbsAUyM7Y5R6mWIGo
	xoVMsiKpesB8NB6mSTpQAEZwnAVdcKKxcuhIOK+Y0xTg6U9iIvkE8IKlfFVQlQ1uFLK0Pj0v8Sj
	Wo+H0YBfijUxqE3eXQ6NMeMHUwc9hTKUlYkDzLUXEM5sRz0f4QUWdv0dMUnZPBYvxv1MDzQsTe5
	Wau64TBM57g057VPO5VdlosWgZoYRxiNsDz/3+8r5VnHwbCsHikpASE7XmNa0M/AUxq1D4IR24c
	Jm3sZX/Y44wxNmNfJ7tAjKrk0+fFFCmwwgk0mke10qKt9w5RzkfN5oRfu1IUy6BvlPRZBaOBUDV
	F+/ndJKkguR8YlT5yJFxwfhzqo7O8aWDg==
X-Google-Smtp-Source: AGHT+IE/EVaUqt23NrvTc5V0byQdZaCOTc4rXLpeXcTxXLfRVGEB/MSyz6hoYU/euAVU4iGXT2hOFQ==
X-Received: by 2002:a17:907:874a:b0:b73:6f8c:612a with SMTP id a640c23a62f3a-b736f8c6f46mr133980566b.11.1763119707351;
        Fri, 14 Nov 2025 03:28:27 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm366887766b.70.2025.11.14.03.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:28:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 12:15:26 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-camss-v2-3-d1ff67da33b6@fairphone.com>
References: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
In-Reply-To: <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763119703; l=5442;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gBE90KsqO9udgNoh6l0H/vdAFeTWNHHho9oSVUGbcHc=;
 b=AJ630KJiKHC1BSFLaowd3ets2Hsi//75qdZ8WAuOm/5ywvMWlmInbediTUrngihF4s4Baovbg
 WCieRm4Oc8YB0M2AfeiFzp7cbhD5TZi2dHTIP0g5zO4iJwPA3aMaiWH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 165 +++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index ca6f65e8e267..2784b4541771 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2123,6 +2123,171 @@ cci1_i2c0: i2c-bus@0 {
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
+			      <0x0 0x0acc4000 0x0 0x4000>;
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
+				    "vfe_lite";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMERA_AXI_CLK>,
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
+				 <&camcc CAMCC_SLOW_AHB_CLK_SRC>,
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
+				 <&camcc CAMCC_IFE_LITE_CSID_CLK>;
+			clock-names = "cam_ahb_clk",
+				      "cam_axi",
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
+				      "slow_ahb_src",
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
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 717 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 718 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
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
+					  "vfe_lite";
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
+				 <&apps_smmu 0x880 0x0>;
+
+			power-domains = <&camcc TITAN_TOP_GDSC>,
+					<&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>;
+			power-domain-names = "top",
+					     "ife0",
+					     "ife1",
+					     "ife2";
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
2.51.2

