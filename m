Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374487;
	b=l9jSrwcpFzLuZJoZRYl0gOWsfhFVYrOjwWBua5gQiiSPl+udOr6p7GTGBTjRQCQUmbps
	 6ZGSv8tYguWbauXYcpIZl61UjNRLy2NMHa6IuKMQ3uhOiNtiTtvH5a2yS7PKTURuBQ5Ok
	 bzx9RInbUmk3nGwwVD5+if+088clQPaS88e8eodOLlBhHgx01KfVMJjbV5ctqC4vN9Czn
	 qsbfF6Rs77NLa2BJG9UuHKhXf/gpZXjRkeIvPKqYhcOqkRmifLXXZSEoD1i/Ny5FCfpyK
	 2yHSc6+Iwhg9h0G/Ks/1SE+gtOYSJA+qiaVadAcZPGWdvXowYN3V7gYH9mwx7D/ll7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374487;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h2raBvYdQ48AsxZCjroQm9zDYUeGtLkleX9lQ4x15Xg=;
	b=ZTr6YaxjHvCfEi+GQ9CwgKquXyrgliFVdeKsIaXSjrnMf8WoMbV+5kGqmMXObobFOEIf
	 lUDYXUO1cqgXhE9GFGB3lGQ1cfGkkFsSKf3CjBeide/03KbWL1pdhu1sqE+G53oRskrwN
	 OCFTBhXdY54Og6qUkpMv1wMJkaUBlkOIQ09DPfigJQMi0pMDBapx20SjseFzvHNelEI6S
	 7ZPdYPKSDkmKcTy4Fq6piD0ZKcyjVVaAa4LWBOi3bPaOSnFQHQ7zsp7AKUzEfnoFmjM63
	 GA+oK+GKE18rU7cQZbA+CbM+BHHDgr2E8KKwNjTJcHGoCulpXVJDMVuD+lbJmeFoS4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqPhEWXy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E87606A689;
	Sun, 22 Nov 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SqPhEWXy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374486;
	b=Aj8LZsgULfSxnsX+fwDCw/IGQsOgOMCg/U/kEO6txYcLQKVW1Bqv2H/7rExvt4Ez8Tvt
	 czvAYD6PZ6HZRqw/Co/lfFO1YFXxvNsRpYNUcpA8+6NtLsnOI3aWxB+RFcSsOJ20Rzidg
	 0zCTMFQdY3DrQLH1CMYM37i8mKDmt12tJmlSwvPkTaCBjwl/BPUg9UJduGiyBFPFc4ZL9
	 0q3K6eaWs+YFjeOCwpbUGdTzx0SUjRwC+7xVeISSGrioF5v/+px9aVwHapzj9w+FXpPM4
	 psW+6qufMLZ+lEg7lfKqZ3N5XbE2IIrWD4Dq1jUTrfFtXRUJsQXrR7AAoZwJo+Q3xkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374486;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h2raBvYdQ48AsxZCjroQm9zDYUeGtLkleX9lQ4x15Xg=;
	b=kSuzLrq5ebikMKJcVRuhlq2a/8GAeUx0UThTPaEMJ/8ALUg195mTQvhgtLW5GtnPMzvf
	 C1UANkTO1Rd2hNlL6KDX5YzoL5t8ictqKbQYfuw6+D3tZiH/ViEGav2kQBoPWbqsOq8OD
	 8a2zGL7TYzV6RSFtBAFDNTKo3i3PDyTQoqjv3th3jCzNjZtSEmW87rY/hNc+nds6IzwSZ
	 vEJwVlyx7LB+Yz23wceztfI7ZVUUM9O/S0g1e7rndshFbLlitQzhE/Chml2tz2Q0Ns4pk
	 PDg46Uf67DIaW4zDcsNLA4qBTDryc3ZedRxiHCFeijkmcePlG7DiybkmuXRwVlDRFOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF14A1F000D8;
	Sun, 22 Nov 2026 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374486;
	bh=h2raBvYdQ48AsxZCjroQm9zDYUeGtLkleX9lQ4x15Xg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SqPhEWXy7Ww+IrOB5Y5ACAcpsBVEqqGXzjPj0aPqCZL6QyOXlLr0vHmj0Vkfe/5Lt
	 3vwJcjv/I91z4q8gmWlbUBJJVXXRCLiJ+4Nu21QEtELfAm3zBMQ0JKDWp6LFvjnz5p
	 fFMxiASH01ZSSC6pJfsrrLyAF0N3MYyiwQK3bGspcli+eAFdako8MUKccCpvmndvsb
	 q81ijEuDhoUVzgwHirDttax14jiaZX52V2r8gthBP5IuaIoiiw9aFY2TGCWL4YRw7z
	 2XxJPBIToCtOzBBe1A5BMKnRNIGzMp9HypyxPnumU9ByA1pEGvrdsBOagQNn2FFQoK
	 gAMhX123KsXsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8ED84C1B9;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:53 +0530
Subject: [PATCH v4 08/11] arm64: dts: qcom: kaanapali: Add the second DSI
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
Message-Id: <20261123-molokai-soc-v4-8-851e5a9f4878@yahoo.com>
References: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
In-Reply-To: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Joonhoe Kim <26rote@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=3474;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=pTh/EB4SqPU0O0r9Pn7Rom33QD9a9sJdUKXPCVM9uk8=;
 b=xdbKslzcMAmFzxi7gFzqCLRmh6BkVUMWICd8pTPk6+6SjpeyMnGJZyFCNNKf3u8G5+zKGJjEb
 nKFLwC2d5KpCJSshU2ImTAijx6N1nh8CddcY/btzTGnxlXkaeMLCV0P
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
Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
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


