Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9149347513
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627965; cv=none; b=Rn1eCi0jLNDUl92Ff65ZbvKJtHbw7y2MKHy3NNL369hvNdBavvrGYlw8x7m5I16K3lseCLh5dTxt0LBGGM4BIWdEowiwTBffANs9o8fGBHoY9aSppoJpwKFdpPCUG5eXaGAHyTgrdWxLYXJkjJXHJoROupexR3hjUFPCUVhtl48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627965; c=relaxed/simple;
	bh=OuRa4QGyn4gLjseaQdBVxKJCgJKE3/e1JsoCMaIDUuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=poPeOWPJc3wgkhdeesIjJab/w69XSGZqIlbZ2/seXnR4+nUhGKzOpzrILspOKqbZOyT7q10VOLhvOM5gIKsX5dG/5Hc1pxxHk0vW1on6EO7gVhQl9ipDRsKx9867Ug/7ZNP3mOtfSY8/HEmAf0pCgMtG02Egm3+FpXcW8qNUczw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sb4qxkjN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sb4qxkjN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66b2f6e983bso1202879a12.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627961; x=1775232761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9/UsdaZM+2GPQHD2Sp+JdEWIFi7VFbfkHHFK1k1sLU=;
        b=sb4qxkjNc170tlKR9dz1DGN4NDlqJEGNcjTQvF2YwCfZLW+BRzigf+tKw5s/dlAxx4
         72DcZZxuIa07wA2worvi/VCbizzqsUS559CLGKTi8KyxWtMKXO4EzkN16uJ9iW2VWGrh
         EEXzrp9xSHBTQix4peJfnF8VNhxWf/vepwSgpQIYXWc962eMAZaWwjj2XbRgWsLnoTbn
         VVv24E/lJEN1b6UT+fg+59oRe6VwMQ+DSZzOz58BLhKqbm5Vqz8An6HalPYHxtzEuZy1
         sVR1jGc3dJkKWZV7qBZKZU7F/WJ9ebQYa54ofHwj0JGF585+n6bigEdGhwsVoQVocaPN
         8AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627961; x=1775232761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9/UsdaZM+2GPQHD2Sp+JdEWIFi7VFbfkHHFK1k1sLU=;
        b=RRfYjKLX6qAor5fPwmoCYqTnup9GQhZK4Aq1Gq+dglYCRasgBkLb6RWe+RLBTJdAIE
         icWYHHg/DL/3j/sTD+WpJCdj1sE1DCeybMXsWZp47D+ftEFzKELgnq2zy6Lcr+i0bLvz
         /rl6PjhINh7GF4h2Ks3ZGdtRQRSQsWqwcP+ttPWGEIkfNGHlDQWB/Rke8/nNA+EY5j/0
         Xqx/mYj19EEnSFs2jYeLAFSZGvm7Vm+o4SdLDnxrMIDBAoppLsqiEWKqqgziwY8YSByM
         AYY5c6pon1zyoMB+YJHNia47BwKdvyTs4H8/WKuMUg3g+FJAWFyr1Lan+wL6Vi6y4Xtp
         Yjog==
X-Forwarded-Encrypted: i=1; AJvYcCUiXedyaLF9ed9Gm5HrlO1fzo+Ry4R9jfJ5+dnXm9pCOQH0naF9y38izzENYVVnodIUhRgFZdN/e5SFmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDdnPQSPEdaCPBsCPhOf+27A1VWWUNWpnw7iExfSf/eL8M6foM
	fyT74IeCX+y8ZiwhnX0E6/gYWHYCxczrqVTqt7eX5AkBWkLcFKpZuouOHot07sS4TKQ=
X-Gm-Gg: ATEYQzyu0pPhCGLpqDnU/j+vzYdt6EUa2wrBSgVQ2WwwZVleOFiWRu0ft04P7Vakm28
	0sjbiVqQOaKREU5WUnXrDFFUqiZUFMg6xnQyaFxOxt/WITEo1Jt/uQWk79MGe5EfYcabJ4bT/7c
	8nDObpHch17k8rtJr9sVnu+sjBNoxlhVQZ6JIk9qBfzIr/C19N0lfCi/QQBStZUHn89MVq7MqdA
	dppEopDoYNj63wq+jQ802d7PFYYJ5VckJOG2fHoRi5EBrTiPzGVd7WgrYWgYp+aSc+mv13o+eMU
	/UrWjQLL1dGmegBqbS/Y6rVD3y3puMVbjQ0V2aE+B5LC6yrFz6A7vCeNBD8mI922hUGreAvpbwX
	2eBya9qzljhy17V1k6nda9tPZ6Wg/JvsOLhbVj+3ttXBZl5aXkSa2IRX08QuPN44KnkL+01ENYN
	Lzxe0l3BnAuVFqlqcpFVxw4on94So4tB4E2iUOQ2nLtusFrnpFIAwQy3OaIbtCcwuI6++2m1vC0
	4XA/A==
X-Received: by 2002:a17:907:c297:b0:b97:e32f:7ee8 with SMTP id a640c23a62f3a-b9b507b10camr227429066b.37.1774627960722;
        Fri, 27 Mar 2026 09:12:40 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:28 +0100
Subject: [PATCH v2 9/9] arm64: dts: qcom: milos: Add display (MDSS)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-9-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=6556;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OuRa4QGyn4gLjseaQdBVxKJCgJKE3/e1JsoCMaIDUuc=;
 b=kR8CwCxCbJ0lmNsaT1AKtyANCK1Dy7nFNBHhR/iQxUTagFiNkuNe0HM/iqXYzgP119NX+5Pg5
 nsQ9392nUdgB3Ej/8+a3FjWzWzgNrxqEVHzTCBdhImqGnQTC8YKoLNc
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add device nodes for display: MDSS, DPU, DSI and DSI PHY.

DisplayPort is not added for now.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 211 +++++++++++++++++++++++++++++++++++-
 1 file changed, 209 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 67f8ef4d524a..c1be2f43dbb8 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,milos-camcc.h>
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
@@ -1860,6 +1861,212 @@ camcc: clock-controller@adb0000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,milos-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			iommus = <&apps_smmu 0x1c00 0x2>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,milos-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupts-extended = <&mdss 0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-342000000 {
+						opp-hz = /bits/ 64 <342000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-402000000 {
+						opp-hz = /bits/ 64 <402000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-535000000 {
+						opp-hz = /bits/ 64 <535000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom_l1>;
+					};
+
+					opp-630000000 {
+						opp-hz = /bits/ 64 <630000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,milos-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x1000>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae95000 {
+				compatible = "qcom,milos-dsi-phy-4nm";
+				reg = <0x0 0x0ae95000 0x0 0x200>,
+				      <0x0 0x0ae95200 0x0 0x300>,
+				      <0x0 0x0ae95500 0x0 0x400>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,milos-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;
@@ -1868,8 +2075,8 @@ dispcc: clock-controller@af00000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>, /* dsi0_phy_pll_out_byteclk */
-				 <0>, /* dsi0_phy_pll_out_dsiclk */
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>, /* dp0_phy_pll_link_clk */
 				 <0>; /* dp0_phy_pll_vco_div_clk */
 

-- 
2.53.0

