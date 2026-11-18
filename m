Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019093;
	b=F/INkbxEsHxhDPMkUN3aRPBIcE3U+Q4vbdWizUI22U7L3UofIQhvpAQASuB+Bodfm5c4
	 V8TGtVqEjWok50/N65PZq5wOGvZAPZNuTMxYnmaQAMZXUYX2CYygzdMK1phXYZ8zJboXp
	 n8YANoytRgByM/YyF+GfEXTma5B50ai4wcbnaAOa27e45D3PMWRlACCc1Dm2tct3CF4M/
	 cS7MsYSJHwt/TMtVskGLj7lcEBeQXKg+3b0a9vSUxjhwSslXc4zVxozOL0eO8BzLy/OJe
	 Te+ptss6nkghznqowjj9S2DyxOlRFj8Lhkp48Et/9+tLQAvvwcSTYzKfmyOSzQ4qgXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019093;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FLHmE0yNJa1Jt3TSGOVe+8qhekufs+6/Lxt/MWi4vX4=;
	b=KOgY51L0HZiZ6KIhh2vXgv8sUkX2p/YWTA2GjQret0b0H6uYpedaW8gXj8KF1A/DtBjl
	 SVzgQ90yG3u3rlMxhThOMVMPxeJcv5gWXos89eebqEyKnBvAtOVLq9tV/CqbDab+Piw2L
	 ECZQlyjtwnwHpuRUwA0QhKT7vhRK0VfiP011INWjEJrXCrwPtQTku4Y1Qh4uREqF6t9RS
	 f2mFaCwSz8sP+yL2mE5L+Ks0ICfmJZ8rmHbTXFvNQ8cuF0vgz7aFUuln7CuW3cFIVJYxX
	 5wEKwhvzd/cxdLZkhkMqmUDQBcW7Ne2chVZCnNsjY0wj7lD9lmpam3QCHgaMMVm0UhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LtJ5mu/I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B04606A320;
	Wed, 18 Nov 2026 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LtJ5mu/I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795019092;
	b=DCp54GR7zvsCZlWc9t8ik1qySMsIGSO9UtJBb7VTInxMUU3Gwx+Ls4evb0+18DxFInBQ
	 CgRloqFgL2a6ChmJT0b+aBtSTQFWHnvqZJLd64oPHbfCsYOMeURUImY6x3pGY19nZiVIp
	 wKwYnmLGYRki6F/VIm28m8/hlPxr3J7a0GicEh0ZbnNc0f1x0xP6d1efDrRiZzYOeNs6+
	 MicXKLW36GdBmXxAAxPm2s7PXSSkzB7MUZEz6ngLTkKGsQhhjsEFnTm0vs9nae2q5rpdZ
	 cffCzklRSIy/d2b7+5FR5/ICjjLNM3ljkdAmrvXfu7XG2XbpaAv5CVTKXcozHHs9toA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795019092;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FLHmE0yNJa1Jt3TSGOVe+8qhekufs+6/Lxt/MWi4vX4=;
	b=UeEz/fhg4+oe3OUnMCgTYwLVbixloCRSHVs98y8rrLe/7DupdWNcpn7fLLujaI4kMtpy
	 jB7ZwPbf2Sl+COuOHPbgFU55d/sqdIzIEFgG9EC4BwVGypOmIh+2lhoaEew5Pg9pX5UnR
	 1D9dF1T5/tPU9fpMGOwqIHg2MZRlz4Az2VkwmZTFFcthSOH4uSBQomec+6EQVBMGBnBD7
	 KaGETM0fqrmf1t01H7lnzkmYx9XRDgPuLYZesZbDUGl+H08sX+Atv0wOoqnLxUwRXD6da
	 UfUKc6VvIMLRi4R+g5eqh9xaz3ApsnHWpHfhBjX3IAcAJm9g5AzfmF/0ktMibDDW/uA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 207AC1F000C6;
	Wed, 18 Nov 2026 16:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019092;
	bh=FLHmE0yNJa1Jt3TSGOVe+8qhekufs+6/Lxt/MWi4vX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LtJ5mu/ITXdGcgrDYnbPjz8XEhaKSb3H3NaaYxRntqOVPmEiP48UR5uYvH7Yjkojn
	 XdsQwbg70MUrCnRRbA5WkyKVFB8HcLGJUm4azFeu7M9FoeIPxNS+E2SF9uOX3g2zcu
	 lzMgBXg8QuKohq05qYyz+oKaGjaRmk+QYfBdwuYxvcvz9SZ8oiaA6H/oefsyFEL9wN
	 P6KvzDV0TClTN/M9jHZ5cPotaGlpNeu3F1UUd33fQ6ckVFvbBlv3XwSCJblmZSa7HR
	 4OTeCY/6r521m7fOKUp1vnlduZ2QJtifNIe8oEGHpVfPKEXmi0YgoOnqRkaenQzjAM
	 Fh5+A/aRQEE8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A35B94AE44;
	Wed, 18 Nov 2026 16:24:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 18 Nov 2026 17:23:57 +0100
Subject: [PATCH RESEND v6 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
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
Message-Id: <20261118-dw9714v-v6-2-48cfd8ee4c4c@ixit.cz>
References: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
In-Reply-To: <20261118-dw9714v-v6-0-48cfd8ee4c4c@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3473; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=gHZ8gqtaNh8wddZIfEMQhnQ9mvQzrc6d6pxFqY4z7/w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq/dFSDVeoU+ogRKSTSq1LtinQlCi1F7xkyuCGe
 AjJASiz8/6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCav3RUgAKCRBgAj/E00kg
 ctsgD/9YYXMWCMb2+IejH9jtrpNb06tLclp/9Ig5zML1AYZPaXhYP5okBacdzQBNGGoFFDrcANI
 ihhK0n7RVoPlA2g1c8qNXnHBGFD1X/sycxhNpGsMux5Vq/rTJ2rPRwLWf/oN+K3MCS2lCiY2iD5
 9d/MOrKjdBTfdk+HnGfdO0JXLOEWkc6nXsR6HbpqoP7UW2GJ58tBFGSdgixClI6Bzx+E0t6lqh/
 3gvRAlva0huNuVW9yQ12qYht2oZoprgPKPf/OqaqvpEgdAxFUnIRGNPEfx3JhPfY4VqJpvhi1SA
 P2x7AKjn9LMIHmnuLCGciFRm6CeJnXf3Y3cc7KD1e1UrHP0mHUnDbG/i02bZPpfXpFFGZdmGADp
 6d6dEui2w21JK9hSEbEseCdLWfIH/fcADOFBDxRYcjr1PHniW6IKTWfPhW7y7imye5BFz65U3le
 /dPL3x7T48mu+cCr48fhGGzp61skv6BQhcKFjbBT49tBNLCxdKQiqC7ckRwd6SRrMJ8u2D66ugj
 6OJHZ7+cUG3eTqQx0WV5exshwQ8elmUCKNr2dfGoXei4vg6fs7LQ9Zp/gLrJdFAyVbAo0eeq7oc
 iMao9X5r3SlJQCqmEdy0BD/R2U6aedxiRc9JwbL6rE6s+2+z670fSC5R8hYwJxrUFAlndk+DYP1
 GVGt/weotWRz8nw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
actuator node.

Since the actuator sits on the CCI I2C bus, whose 1.8V side is fed by
vreg_lvs1a_1p8 and there is no place to describe that, keep it always-on
for now, until bus-supply exists.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 1b0eaeafbd517..f14fe8e175e96 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -81,16 +81,34 @@ ramoops: ramoops@b0000000 {
 	battery: battery {
 		compatible = "simple-battery";
 
 		charge-full-design-microamp-hours = <3850000>;
 		voltage-min-design-microvolt = <3600000>;
 		voltage-max-design-microvolt = <4400000>;
 	};
 
+	/* SGM2036-2.8YUDH4G/TR */
+	cam_main_af_2p8: regulator-cam-main-af-2p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "cam_main_af_2p8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-enable-ramp-delay = <100>;
+
+		gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_main_af_default_state>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
 
 	vreg_s4a_1p8: pm8998-smps4 {
@@ -403,16 +421,23 @@ vreg_l28a_3p0: ldo28 {
 			regulator-min-microvolt = <2856000>;
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_lvs1a_1p8: lvs1 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
+
+			/*
+			 * Supplies the 1.8V side of the CCI I2C level
+			 * shifter; keep enabled until a generic
+			 * bus-supply property exists.
+			 */
+			regulator-always-on;
 		};
 
 		vreg_lvs2a_1p8: lvs2 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 		};
 	};
 
@@ -441,16 +466,34 @@ regulators-2 {
 
 		vreg_s3c_0p6: smps3 {
 			regulator-min-microvolt = <600000>;
 			regulator-max-microvolt = <600000>;
 		};
 	};
 };
 
+&cci {
+	status = "okay";
+};
+
+&cci_i2c0 {
+	/* sony,imx519 @ 1a */
+
+	/* rear camera actuator */
+	camera-lens@c {
+		compatible = "dongwoon,dw9714v",
+			     "dongwoon,dw9714a",
+			     "dongwoon,dw9714";
+		reg = <0x0c>;
+
+		vcc-supply = <&cam_main_af_2p8>;
+	};
+};
+
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/cdsp.mbn";
 
 	status = "okay";
 };
 
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
@@ -699,16 +742,23 @@ &slpi_pas {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/slpi.mbn";
 
 	status = "okay";
 };
 
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	cam_main_af_default_state: cam-main-af-default-state {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
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
2.55.0


