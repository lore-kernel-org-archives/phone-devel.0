Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804786;
	b=YIKZjR0oXEtNP2/f82rIIK4KrayHMesFuEEXfAxniF6iV4+ShjAtrxqpW+NUbRhAphTV
	 f1SFy69tBMrg+Y1CX81KWExpHYQ3c6zB38wGBnBNtTg6U9d35JWdxINViHfE6i/4QMc3y
	 7tjpyfXrUGOPR5f1I0Xv/cvYY/lIUuK641b7MemmDVKqZ2z79s22p793OfyeTqSu7cGfi
	 kLb9mLva8bG4sv9z5n+rP+9XcQ9TW3LSwHFFe6YLowtf7EFb5BPFQE7YN4JFRl1uoUtUj
	 fp4kl5VrXa6x2gexB1pcNMmzemrn4M2k7oinews2CJ5Swy6i6rdkucwgeTII97X6UBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804786;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h2raBvYdQ48AsxZCjroQm9zDYUeGtLkleX9lQ4x15Xg=;
	b=ZlYcwSl5tpSaqlJZaFlqLQHNWs6Fckj3k2dzG6L8IJZOMoYaxXpD+KPxxe7xPzmOaYjF
	 giEt3C95EdOMekUr2m8X6HBjIuk6HLFLkz4AFbKsIglgNVWXi0p85DqOQmZzRkFXbDLRG
	 4gNtg0IFUk2bk4FBs4bnIJgdJPGXpZYVxEXGd1bXvjh6cpgTEZZjnqVM0n/1y4PRgrot1
	 vccKn7BHWEajUQmVl44+SDNN9ImNUot9zi1eOeLNWwaJu5mkuQpAJcfmJxx/XxlBA4TNo
	 qj2r/H68PlhPrkT4Zzcng9wqXcE5B/LZ9ZbdhyIdEA5mcoAJZUJijv3Nxnmf6QfQcUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J6BAZ27N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B0606A331;
	Fri, 27 Nov 2026 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J6BAZ27N
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804785;
	b=u7QksdHS9NWyuIfN/0yGgWrMtDUTZfrW+0G6syzXALjjhFkbdOtaeDYt2EpK9ZotsW37
	 cyesPB0ZP3HAv62ky4QA56XJ/ugqxYg82Kx6EvBCwJn409EiCusynqMDdgEiX/fMAOGFy
	 zmb849FMxqqnwCBnDjbe2mpr2t0M3gWEUvrC153BUGGWbEbhoPs0etrfFunH6NC5saP8K
	 7uwXzy64VuOf4yvYmdCEhZI9Z4YzbfBgvbs0S9z/lREM0RLW+v09olG9LqZdNRThij6Sr
	 qbJdTY14455hpTwn2min6JGK5Jw/ZEcqR30v/JWt8yvSC8VmysKtlsaPKkt8I9J0VdA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804785;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=h2raBvYdQ48AsxZCjroQm9zDYUeGtLkleX9lQ4x15Xg=;
	b=xLElc//qWOVUEDFWEdGxFbVzU67+LDbiceLwsVlwdwIMJ/7PsXzCQuxEg2nKfn/Yknj+
	 UX4c47GOOmXPJglBU203ntkvbT2SD6BfapHqqclAxUxqEjBiuEDAmd7O7Z4TnPr+DhYyf
	 Dhj0r6b4amhOo3r58QV6YwqzexOWvExel8WWvXPSmSUQ8zHcWypKqSZ1StZ1b3xg9ztrI
	 oL5mXtecwB5yUCAwafoHm8f67qxGz8jgs/46IHK/8V63cIrN62HaG1YjFfDldJ3w+q+aB
	 senCgdPaUfvvZumQ6JCHVf3uZTpCH6JnK2IMNwymnFJhAUvbv0ixYCBDJXwFMdsrFCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5313F1F00898;
	Fri, 27 Nov 2026 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804785;
	bh=h2raBvYdQ48AsxZCjroQm9zDYUeGtLkleX9lQ4x15Xg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=J6BAZ27Nss8COVLrd9OlIU/1eoNhF8W7BBR+50eLaV4cuVYzzarBXassH8ePyE91d
	 ee+JiXF/vIrudol6y/yO3PUalxlXZVXY8DAz3/60PyKSALquGbsZlI+2W6qyWZMClI
	 dX/cwhvEitrQXDORKdoxZAcWU/wSOJVi47VNYRlsH8aUYtfkbg3zr7blFVW3cKVAa/
	 IjjfW2Y/AyHySwpyPFCrzxJTySxT/rawixJuFTeOUmbdXkyFyuFUr90TtP4FJu8Z58
	 9BqdLV4GbERjYKsIgCwNRUuR5WjDrHYeXFX2eYa/K1vRFqij0iopgh19jcWHjWSr76
	 hhopHmFUXtcng==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 761164DD47;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:28 +0530
Subject: [PATCH v5 08/11] arm64: dts: qcom: kaanapali: Add the second DSI
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
Message-Id: <20261128-molokai-soc-v5-8-144801dfad7f@yahoo.com>
References: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
In-Reply-To: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=3474;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=pTh/EB4SqPU0O0r9Pn7Rom33QD9a9sJdUKXPCVM9uk8=;
 b=qmsvhi3Co+/SlShkYBZ3JA2SgPXA/aWyXBz+0zu5U5wuhCjhO7wYZInY77oJgf7AUKgFpm1ZL
 e3lh+1qWcwWAsOOyLxXZK3wCNkczfPkFwGNsvIUWz641ZPciPR/UNPT
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


