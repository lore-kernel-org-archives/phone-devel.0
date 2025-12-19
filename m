Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C64022A817
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162493; cv=none; b=ooSxVzVREndIaYV1lk2mByk1CwcDfuNiMwf7Av84IoYopcbRzUBuAfiO2Z1gjBqbkm0TQaVZZYmxc4xy6ANOLNMJFtoOCdTfCy1ncV0f3lvSBgWSRD6+FVASBgQYCZsXf1yhH85vZ0g5eXBbcnz0jR/aUrnkwYgvuF2qhnZiiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162493; c=relaxed/simple;
	bh=ZPY/+FNr1/I/jCjPIrjQ2ntydK3ydgHgE/NHLtUlLqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fFki/FDUpzQwFUhTHZdPL3xhbkyr2BvkCqMXKyYx9X0gHpdYNpyPRjPK/ppyyQUz5IYQrImz/QhVTk0uQ+5CcyFEaBUADkQ40in1qjFgUkoDQGFxIyH3e6EKD6Toju6dQHu8/vqMAGIzK3D1MV5TbxJUrdaWmP2ZZwRUjqi3E1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zZVgpvB/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zZVgpvB/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so451052866b.2
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162483; x=1766767283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUxnJEEvA236F8NBMU+pi14SjYgYMC3mWtbkAiJbgJA=;
        b=zZVgpvB/it2R6xjifk7VjCSX74bp6+kAD+pwx2yAErZetdTNmQyLkWWfO+xV8kKJkd
         tO2xoQ/RGsGp2z1apCtfTPK8mcvai+e5WI8XT1UNrhFoIDDnRbWyp0DDS3oJGPd0pIAy
         agEdxXM7nRGF70uOyD2MaYW4vsoynxdKw/1+l1EOAb9oEqw4Im5HGcefFHiDw7Rx/nwa
         UBUPNaWm9zGCzv/1IqUhJGn/udp1Kl8rYBCrJ3Esof1r5hmgDpwgKIyerihC2n6aUIis
         hGF4KCl2msjqrtgNOBDLmUOA1Kq935OsjO4moualmKpM7UbFZutEFSvSdu69Ann7uScm
         soTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162483; x=1766767283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BUxnJEEvA236F8NBMU+pi14SjYgYMC3mWtbkAiJbgJA=;
        b=S6PG2C9d6OpB4JsFvABUPQocb0AZhQPyMIDlMTpRfEF7V/lrKcVJnDNKv+ykyyuQDh
         68YKQd6RwHUOAF3WAV6/4gx2mxXdKA817RDOkNMsLVDjx687Via785za8HMg0F0eccE8
         AdcH35cpcTCJznEMTP9j9PHEX47TkxaMmH6PMbBSM9fNPC2LZGEezq6NKv9PEi/TVuzw
         r2a/b1UCxUDuE3cjeOpCq9OwxQkX8A7X729uHk/DGY1V4cyCr8J00eG9HwHza2U4bcHi
         j0Qx11O4S4uPGAGcAJ59zcpjo2jU7Vny0GqRlDOArl1zFFE1x0sHYI90TWi9DhaqKQ9y
         URMw==
X-Forwarded-Encrypted: i=1; AJvYcCX+f+qCSRYL2G4JqU0LMjGFm41x6SXPDZ0p84Frw8lGCGS+V/Bhk04yGgwpG5Xut4w7zvv5wn8ngtb9nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymVs5dLQeziViTQOMcyRvX8kQ0ER15hoxc0LpLu0wk5sjcNitV
	eIMeOppfRyGBQrMa8a/w/iiuA/f9lDX5nC79TaaoxuLfhJYV3uAvdZ4Hi6jr+yRYF3M=
X-Gm-Gg: AY/fxX4tEBDe8O+CCAk34H55HHx+AWGWzaGzOoWEdfpAP9vACJxt73ThHZx7LAmXGKS
	ut0ZoQFex/a9ii8uO/fZoUtB5gibiXEAIYIP37i6EDm8MhtblfN2/Qfkl0OyLfYwDMu5ZtOtLtY
	doSzBJ8z2jve2KR6PXnPhB2OY+Ud54mmX+k/fn22Vw5dmL/hOw2FUEze5k1mLH5RQBWMS97scI6
	4TGKQXZrqcwmT3esMOudLSor06p+YvE/dh4IgOscu7G4oPwULUrTHxKB/AqOTvzOCrp9kwlKa7E
	/L3dBOxs5gwzpOIHo33RZ1P++J0wpTkxjn0h9KQDPU9HiZ0v0ciWJO1pM5uNtt7EoED9jErB8uj
	W64DSo2/Rb5kypyS/dkTDBMPzNDQSV2Oxc9yKAqlA15EGfkzH1szM8Ccv6KW6/IbRidwqdp+bmO
	zq3e+0qJgy2IRMSF5CoB09wt/+arV8lkbLuIQjZMSInFBRDQhnvTtZk8TWMdk3XSE6WwsYK/03y
	fxXfz71vAThtY89yQUnpWi3dqR9TVj7xgt3VjTNP4sogg==
X-Google-Smtp-Source: AGHT+IE7/rDvAirOTWuD+BVN5TbR1N6ti7H+jP3ySf2yYQJ6aR8Hobv4GJ5Cw25G9s0WT629tUqWPQ==
X-Received: by 2002:a17:907:6e8d:b0:b7a:1be1:823 with SMTP id a640c23a62f3a-b80371f4980mr307764866b.64.1766162483081;
        Fri, 19 Dec 2025 08:41:23 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:22 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:11 +0100
Subject: [PATCH RFC 5/6] arm64: dts: qcom: milos: Add MDSS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-5-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=6457;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZPY/+FNr1/I/jCjPIrjQ2ntydK3ydgHgE/NHLtUlLqI=;
 b=bTYroNnX9nmEp+PvxNLxIefBtVd4tBPLovBupbfVOdJ8HI0UiqL0WfH/MKEvYwKQ+t8e+eZOC
 EsYuqD5T1+tB1FhWAdiM4maIun2YecmssvG6Cy1ETDN3K03Ie2h0iZ/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 211 +++++++++++++++++++++++++++++++++++-
 1 file changed, 209 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0756cf5fb888..2477f0d97278 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,milos-camcc.h>
 #include <dt-bindings/clock/qcom,milos-dispcc.h>
 #include <dt-bindings/clock/qcom,milos-gcc.h>
@@ -1821,6 +1822,212 @@ camcc: clock-controller@adb0000 {
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
+				      <0x0 0x0aeb0000 0x0 0x2008>;
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
+				reg = <0x0 0x0ae94000 0x0 0x400>;
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
+				      <0x0 0x0ae95200 0x0 0x280>,
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
@@ -1829,8 +2036,8 @@ dispcc: clock-controller@af00000 {
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
2.52.0

