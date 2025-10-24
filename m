Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54145316907
	for <phone-devel@vger.kernel.org>; Fri, 24 Oct 2025 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761308670; cv=none; b=JDcodNrSfFR9SFxrCVdds7+2K63rvWj46TRUxUuqlRw/kzZeFDU0o7n0TJVzyhy3Ub6x51s/b/PNAexul46syyqEzgE5U55OtXazAxanb+pUYG3lxVpddUmSS7sy2mXUR6OBdVABI6S4F8dwZkCMD/f6nmcQXHqI+Y+KfnKq9bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761308670; c=relaxed/simple;
	bh=YCcKHt5Q+i5vr1VpwoseB/CGo9oIDe91IzHnX9RhnyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpKpLtpCSk+LayN8UwpHRSQPVlOs+EvLj+o1ih9qMQmpdpJ/yS59DynVhM9W1/aWr1Q4vnkvtlDpON6SKbQGtjaHMneEpwkYKAIVtbLoxY1w3J5eiM+OpwdHIznLxslQzn7zErYON+s1yuqrxWzOI4CObIoOc9hnQd/79XbOQao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CL4BQ0HM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CL4BQ0HM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso391958166b.0
        for <phone-devel@vger.kernel.org>; Fri, 24 Oct 2025 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761308666; x=1761913466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9AAEHu7ZIFhziAmPWb5o0i40/aC308+haxi9rzIUd8=;
        b=CL4BQ0HMLScDwkZ5vz8vLZ1WsBqOMUrkRkBw7n0oAZTxQjU5tC8F/n59EIHT3VBYsD
         N96fqQEF3sOalGpJl7iCkKFgwRnF6VH/2SSh5WZVvZ+a8qjpJpezGzy2gX09f4jCZaJC
         nGq37ZKy3MJsdJmkUR4RY7EHIfGnCQL/qQQU4DvUE+hOhbTKfTjBO9EW0OnQkRpMGkHI
         FSJ/ydxcV1GI3tXh3fCIU00/V8DFqB80XT8ATwDi3IjKNIiuzjME33Iyg7L8NuAFeh2v
         CmZ1/fCZiY9YYjH1mFsUn7rQLr6ZdDwrx2/4eqUWIuupiYcCguBpS5CfSCbs144ruyxG
         qXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761308666; x=1761913466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9AAEHu7ZIFhziAmPWb5o0i40/aC308+haxi9rzIUd8=;
        b=YJLWJLsuyYN1x7X/cGfTQYHc3y2WIXMK9t2BdANBbwTzXN61NB6LDg4W6KL6AU7uB0
         yEApHDHLeRhTXi/nfRYvzJl1/cUDs/ZnRADRe47yfn9NGnbwWvn8eOiI9GyYerfmbmuN
         JPGGNrOB5bL1J0RvDdgK5zEyFY5YrjantrzDp3w3RZgCs+mV2leIpamsDT/KBFd2UvJY
         4uEn7YiJrsl0nqXbIIIfAcE9jwVKubL2cNjlBGK8AHfn7J8i09e9HGaI2d8LAtV7eIK8
         5EbKcBoDRFEiHjJKlOOJ1tTviovEizbmK+b4XTw8jTplt/9wEiDKox329yQLj4Whp4Jz
         7mAA==
X-Forwarded-Encrypted: i=1; AJvYcCV4cOKOQHT+zyYAORhNeOXNpJW8W+S+OQyHjfmVXgZijTnqSWfDU10GoujgOigJ1sOvmQlRoaUyioT4Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfFEziAI6YQ5XgGkw4EpusVAMZCA148SGOhStDUgrKrxWOLlq
	Y4C6vprzShKpKJm3gir6X5I/btNBxyHEeKju/ZPZ7zCevI1DWscv0SYv+89ewjvNauA=
X-Gm-Gg: ASbGnct7NzFBrHyctFfJjq+0beqFJESta9HsaF8BZ6KkFhv24+QGCVexQDlBPtxjXGa
	jwAesABEXMmTkqsft68dOS143ROIct8Wzml5mzD6mia/sCZyqSRYgPyG1Chm/BYJyBRH5Ia44T6
	6TI3VEKvFVoFdXAaOH35q4v2/JprzL9I9erHBF6o9Nh2gTHc6facfmNSnCt8K6xHY/SxvKnniJs
	axY1sRw1yHhiUgKZlbxBBnoN9dvGmSJkIWJvypuir5aKQ7EtwqW4cgDzwTZBukdqwKKcU+XaIS3
	mL0Gxzj1y0d/0UfD6KFLvcfPwnJuOxPYdELIUSMA3Iinz2vRhy/QvixovvF3VH5MTGFZy+wFPBQ
	lC06C9+hmXRPrEMkXBDipXOZK4+Jawl7DkpEsTNWDPMwfWEQpp49T1j8T2q7s9QNehZQpgZVkQs
	F8zs/3iFk6eDOOfRLrzxLkE12ko6seClfBYvUDrdxO8S6CGA==
X-Google-Smtp-Source: AGHT+IFoh+PqcguTafaoOxlUd7DWU7o/NTb77hPfIGoiMy7gcVlSgk8p3jGiRzvROlnHNDpZAeLSww==
X-Received: by 2002:a17:907:6090:b0:b6d:529f:9702 with SMTP id a640c23a62f3a-b6d6bb1a7fbmr299244766b.12.1761308666528;
        Fri, 24 Oct 2025 05:24:26 -0700 (PDT)
Received: from [192.168.178.36] (213162084087.public.t-mobile.at. [213.162.84.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d513199d0sm507233366b.37.2025.10.24.05.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 05:24:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 24 Oct 2025 14:24:01 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sm6350-camss-v1-3-63d626638add@fairphone.com>
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
In-Reply-To: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761308659; l=5462;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YCcKHt5Q+i5vr1VpwoseB/CGo9oIDe91IzHnX9RhnyE=;
 b=dXcvh4M5wvWkrrcqsH0R2Pdoj8eLH+3LEaGO715PxDSHueiGxhrFSnnpq0HO2/rrns9k7tjvG
 CUd7QptGB6PCLct/Sjp5aZLe3ZEZVtnyeUZBGaHHvBq0hbSVPv+YTLV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the CAMSS on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 165 +++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index ca6f65e8e267..ec68a178d016 100644
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
+			interconnect-names = "cam_ahb",
+					     "cam_hf_0_mnoc",
+					     "cam_sf_0_mnoc",
+					     "cam_sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x820 0xc0>,
+				 <&apps_smmu 0x840 0x0>,
+				 <&apps_smmu 0x860 0xc0>,
+				 <&apps_smmu 0x880 0x0>;
+
+			power-domains = <&camcc IFE_0_GDSC>,
+					<&camcc IFE_1_GDSC>,
+					<&camcc IFE_2_GDSC>,
+					<&camcc TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
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
2.51.1

