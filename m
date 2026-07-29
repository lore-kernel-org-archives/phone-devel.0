Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8BF382F28;
	Wed, 29 Jul 2026 22:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363615; cv=none; b=lcYhypmU30kgxkZ7saqutfEHC9Wz06sFCZWJWBJe8jXpgyhhrpxAzjd2jkSa7noYyTI6g7auVkAoNxFlUOyC+nYghJyPB3fx1ghW2YnzhGTPpuNshi74NegScUxgLcSuelPOfspYCUXfYHfJ8FuAM1vvYwFUASPlcELKwoTni/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363615; c=relaxed/simple;
	bh=WAAMy34Ib/T/d45y6AYP4ThGK4MC/FNG+a6ZiRBFFJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cM25vS4Bhu2xrS16CRvdl3TIrgDb6pi2pZLMwgo44UF1IdbTcPUYgJNeMPBnDKdRLwy93NLP/16c9Kjn7rk+inzKsFCdsJnNwVnIRDkiuXG3fUVSqSsCN4G6dE48EWisk3sCvGHCIdADPvYaBQEWpeG0zw0OQIU73jW2Ko1tzIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNb3cGgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNb3cGgY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52277C2BCFA;
	Wed, 29 Jul 2026 22:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785363615;
	bh=WAAMy34Ib/T/d45y6AYP4ThGK4MC/FNG+a6ZiRBFFJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cNb3cGgYTkq57j/pKU6Vp9DbXdG9OLop+Sq0Akcg7yxEampRY+8rzYLiUaPtmdru8
	 3fe1jbbc7UFfvzd6keYgzEVYXbFEdmqioClNayI4LjeFKgKIFwk2VHadW3Q94oZ33w
	 JSc49pNRXp5bSedUC+ti22YpciBFG/Gf4h1S54mswt+5ndaPI8bKoGeSz39IEpiaLf
	 5n98Z/2ePqW4qiXCYXjJc+g+RgC27m6qttNVvB6oLz3iXwELkY6a9ytK77ZScyi7ef
	 mtHevSaVin0Jfh71tX5kP7XuTFMjTL9o4H/YWYGT0pjV3+EYy2twq0Uyt/VZc43LSV
	 npY+P0rt6+yyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9F2C55162;
	Wed, 29 Jul 2026 22:20:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 30 Jul 2026 00:20:13 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
In-Reply-To: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3122; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=LFlvAIFMvaO4uZKge3f+OdfJsEjSlr1Ckw0bXv7skVk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqanydrLSV/NOdOo8lnh91yVk5CQvJmJuRVQcCg
 tHwt/coAGOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCamp8nQAKCRBgAj/E00kg
 clFaEACrMa3/yjPcffw6GyUPOjbksctjfguPdRYSFPzGqLDGU22QF7MSaGzerq6+ud7fr6tYWl+
 50FyZYdKnVCCMUskXMv9DL972xtG2tygqc22MMtY5EBFszMMq4vj0tHfZhxPYSCfpxM6BKS2r9W
 Hy8o+loVREkqdFvXOoUi9bmZkcKJCS+/JOnTJhXMauAAm74pob6/NA7TXJ2CLrjLoORmnLzEMsI
 N9Y6q6qeXHjEf8FhYkJpqxNsoU/PPHyNYKjNojU4uow3/AL9N+9MrajrMXSDPR2bSbZw30eqVb6
 wjyv/7DYL9X6mQ5PXybSWtprSmhO+0b2qSY2qvInbRxjPeGJIqFA/Kpz3F/tnq+T721fXHRrqu/
 fQPIFBHz9bnZZDrk9+vu//TW3XekU2TRsJrXtsU9ouBRUXBfRboty8Z53PZH8Kb1oYMk93ibTCQ
 xs5Ai22W63ATkO6mtdZY6oVpo3QMcxU6YH8yy5b7CC5f9kJ0TK3uB0vhurjODIfKAU5Vlh/MoXJ
 lQE10TGyANR7xJIiVoXPacHWf2OOxE7z0X+zFoe0C8pN2r37xKrNrL3ylTDW8HLob8bPKDxmmX6
 83fP+y6thRRMTtRogCPGgcP3SnYAd0db/0zP4FFWYb/nQ0dWbUdIarq1Uga+slmMOqY5yIborn0
 2c1Mw7qgqs+FI3A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
actuator node.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 61 +++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index e31c784eff3de..8ac43dff976c0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -81,16 +81,42 @@ ramoops: ramoops@b0000000 {
 	battery: battery {
 		compatible = "simple-battery";
 
 		charge-full-design-microamp-hours = <3850000>;
 		voltage-min-design-microvolt = <3600000>;
 		voltage-max-design-microvolt = <4400000>;
 	};
 
+	/* SGM2036-2.8YUDH4G/TR */
+	cam_bus_2p8: regulator-cam-bus-2p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "cam_bus_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-enable-ramp-delay = <100>;
+
+		gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_bus_avdd_default_state>;
+		pinctrl-1 = <&cam_bus_avdd_sleep_state>;
+		pinctrl-names = "default", "sleep";
+
+		vin-supply = <&vreg_bob>;
+
+		/*
+		 * TODO: This node represent bus supply to the cam i2c module.
+		 * Others DT do in similar fashion, but should be addressed
+		 * by the bus-supply in the future
+		 */
+		regulator-always-on;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
 
 	vreg_s4a_1p8: pm8998-smps4 {
@@ -447,16 +473,36 @@ vreg_s3c_0p6: smps3 {
 };
 
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/cdsp.mbn";
 
 	status = "okay";
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vdda_mipi_csi_1p25>;
+
+	status = "okay";
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	rear_camera_actuator: actuator@c {
+		compatible = "dongwoon,dw9714v", "dongwoon,dw9714a", "dongwoon,dw9714";
+		reg = <0x0c>;
+
+		vcc-supply = <&vreg_lvs1a_1p8>;
+	};
+};
+
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
 			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 			   <GCC_LPASS_Q6_AXI_CLK>,
 			   <GCC_LPASS_SWAY_CLK>;
 };
 
@@ -699,16 +745,31 @@ &slpi_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
 
 	status = "okay";
 };
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	cam_bus_avdd_default_state: cam-bus-avdd-default-state {
+		pins = "gpio8";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_bus_avdd_sleep_state: cam-bus-avdd-sleep-state {
+		pins = "gpio8";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
 		cmd-pins {

-- 
2.53.0


