Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190003;
	b=xxipbaT8rQd5qAAGU3Bf7q18MVMc+VdxkIkkqVCj35FhbAg/jq9Vi+pp18JW8Wf+JgwQ
	 uI3GrBRBle9hQN9c9AIfrUta7SBBVbNcmDjqtEYYmv0koc1PZpLcGebWUmIuI3LF8J577
	 5UeGgIdLQ/Z5bPDoHE2CO7+3TkTqxxOzq9Vw9qaioREbqhR0FvyKt6c7ivJCh3fqL6enF
	 Nt00Vk73Mx7m2yzyxH44MKcMlG/t5bqx9/GUi/DmVZsJzujYGaczqkur2L1HK7kNFXdcG
	 cFwr5/ORfXpLMZ1PR2Q98M7OiQlxAyH5Ti7R12XOCytNyBCa+qTo7+7yweLG3eDf1Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190003;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yMWSzz+HgYbOJph14sn/x3zQ0Ez4Ew70r+aZXVFze9U=;
	b=cnKajaXH99X1I6sAVYim7Qt7syZ6t6yvrYQWjYrxa3MSxcRaOcOBAxGLyJPpdyduHsAF
	 r+BtHS6VEvth4szfdkk36m1L2CqvIExHxAFQrfsshgGyI07ik0FMNGiBkBoIZdr33v1GH
	 Fis7hw8gSvxjBDY1AEie47T7q8TM4Qx0cfET/rwqeJfCT9q35FWhSCOmB2SxK9Gg+ISWa
	 HGuGKcN1OUkAAl0Oc0Qs1lqIgzw6x3iXFUmpB5N2Vfeu4mf/QxkGhdmLcV0JZagzNirt6
	 sjGfNQp9MvBYwbfSq9wdC0WPh1RMvCdQAC3ywAKjpHThvNkc3diEO45mzJGFqoC5tBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNZTBTgd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BDB606A330;
	Fri, 20 Nov 2026 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNZTBTgd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190003;
	b=WMy6L4vABRB9SMpB+kXCm1v5SXqCICe1b+2UIria/xPBxG3EKZvsRk+xpXb7smiVFQXs
	 tf/E+DH5FkPhid7U8sxBmD2eMVSZov07F33XtyG981QoFtDjaa7t511Q40kn7iCKR3Wph
	 iGZNBxuzixyi48/xWfxKcl4s+8Wwd3+HE4xYVdcNWcwT1kUNFyWorJbP1T2Xq5RCrjNfw
	 240tB2zn2xw4UawAfcvntS/aFo8nTOTDwJsJdgYnll8tK2sTM3Z75NrFvXMZ6Tg2TSVP3
	 Ry4HuSEEZ5Fbj0jzuyF1BfT+TcLEOjdBREeDC4ZGweeSYz7Yh5RQrh9xRmxIAO1hA+Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190003;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yMWSzz+HgYbOJph14sn/x3zQ0Ez4Ew70r+aZXVFze9U=;
	b=qkqDEU1pZU4qZjwUv9yZ5+qDcLBIP1XwEsF0Sxz/va7rxjBGJW6kDZnHcJmnMvd2NeAj
	 iCjqQMEhBWMxiKJqR5PL7CSNfA6fqyUl3X602OxXsiCla4kS4S9ut0eFZO805v1CK+nHr
	 2DAxxGmjk7uJzIlvUWOzDB5IxD5yOXTtauPGFZ7nEvzYShG3OZpqrVXBKX+VN+M9a7L9H
	 acwXE/hkP5dplRTM1ho/8lUm55iKNx8lO5bWYkXcrIq84l35ZIEwfitXme9Y6vNioC2de
	 mKIL6P4TsI8YErtA7Eu7+Le6byrfiNmsEjQX82fgZ39cZ1nkDL3wD4pcXmXKTkWus8g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 272661F00ADF;
	Fri, 20 Nov 2026 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190003;
	bh=yMWSzz+HgYbOJph14sn/x3zQ0Ez4Ew70r+aZXVFze9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SNZTBTgd0xgaMY7yTaXbBZ+JD6tvoe2E/l64Af8pr6ODRMYXLDHOSWg4mkBuBaQVC
	 OTwoL0F0Fd/8Qtp1PhqFAmf0yNom431JkbM7FFYlcpyTI6B7nMvy8bEC0a3dBYVIXh
	 1UPYwizT/8lV0Med5AN8aE5TP6ZC45gjLsED2ZRvOk/I19W3Q9HExUkDSpger7srGY
	 L/5VBadY9YvJkUneA1+12pw8H+6cXJyylnoNszulvm6dnr4w8g75KWEH/P/Pv2R8VI
	 oKe6PShZi2eO7YabGcxu04CWjRpTqBS0LNl0Z04oA0waJvwUti2UTfmMdXb4GQZRzI
	 dfRFtBTIVFFAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6235549946;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:10 +0530
Subject: [PATCH v3 08/11] arm64: dts: qcom: kaanapali: Add the second DSI
 controller and PHY
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-molokai-soc-v3-8-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=3401;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=iFsYs/9s0sJxlpMmr425F1RnSAWZKOQUHiFZ0c+GAms=;
 b=MGTRqK3GIYYwblPk4QsssioF1xIrl7ULKNLkLcmgYiqcORuYuoZ1RqjCTOJIDVMEWp/4gUfeV
 3n0EGngZ/JRDQSOA4PBG5dgf6k/CgJavGmEAKiiGkPXb1iFNVERB4ol
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Kaanapali has two DSI controllers. Describe DSI1 and its PHY next to
DSI0, connect it to the INTF2 output of the display processor and feed
the PHY's byte and pixel clocks to the display clock controller.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 132577d540bf..0c4b6a8b32b5 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3709,6 +3709,7 @@ port@1 {
 						reg = <1>;
 
 						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
 
@@ -3868,6 +3869,91 @@ mdss_dsi0_phy: phy@9ac1000 {
 
 				status = "disabled";
 			};
+
+			mdss_dsi1: dsi@9ac3000 {
+				compatible = "qcom,kaanapali-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x09ac3000 0x0 0x1000>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 5>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+					 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+					 <&dispcc DISP_CC_ESYNC1_CLK>,
+					 <&dispcc DISP_CC_OSC_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus",
+					      "dsi_pll_pixel",
+					      "dsi_pll_byte",
+					      "esync",
+					      "osc",
+					      "byte_src",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+				phys = <&mdss_dsi1_phy>;
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
+						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi1_phy: phy@9ac4000 {
+				compatible = "qcom,kaanapali-dsi-phy-3nm";
+				reg = <0x0 0x09ac4000 0x0 0x1cc>,
+				      <0x0 0x09ac4200 0x0 0x280>,
+				      <0x0 0x09ac4500 0x0 0x400>;
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
 		};
 
 		dispcc: clock-controller@9ba2000 {
@@ -3887,8 +3973,8 @@ dispcc: clock-controller@9ba2000 {
 				 <0>,
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
-				 <0>,
-				 <0>;
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;

-- 
2.56.1


