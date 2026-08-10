Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC03B27D6;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357348; cv=none; b=T3pap1yR1l1fq/9H3pkplgS1Q6shhbNlBJ1r7+vBYhfayIV/ooPGOJsBVBKbaOK32yc1W18IRPKG47jpWGxNV7umOSYkrUGOVTCCG6R+qWuC6eJUeCn7bKxtQHU1JsFgIwCULhLif4/HDpUJayDePNh/CCcnnRqBUsaz1oeqHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357348; c=relaxed/simple;
	bh=xVwPK23/+6oDXZNpMf/gW3JZfBJxlS5Nk1s81uB+XEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMAZz0j4RXjXL/X4kZHhS9AOAz4dz2J8Z/8d5EIviJy8Wfs/GdoOsUN4jmhPDPZmFNRWW8YOt7PlnAml+I6VHuHTHtclD6qrUV35vJgZ+ZU+/JWDmI5GCf/J+HFiIvsvaEjsPJCrQrp7MGr2YNlQaG0nyqX5ybHbfDOvy+Itf0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJ4ORuYz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJ4ORuYz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B5C9C2BD01;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786357348;
	bh=xVwPK23/+6oDXZNpMf/gW3JZfBJxlS5Nk1s81uB+XEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FJ4ORuYzZHB/iSE/4ILjP644wHPb6Zczb3jvL97YZ9oc4xyCUBEiBxxQlW3qk1hD2
	 zCZEBIIaIVQrKPcqk8HCNfjRvcYvMs/1e6W8GVHxMLAySYH8BaK6Vcdm/MDiQCvGRa
	 YqAj7h8QKc3+ywaqD7+anmnyyiT3++tsqfPJy4f0x72/CVY4n6VBsfpXjKJtbQgDge
	 5KeKLBu8AO+P5RkHiezbHQnBxgLKyR+y1iDdhV58vf1EIecgoecjkz+UshV+iysHgx
	 1gMEmjdJpH8diM8I9OIwGv83CMgr7BPf1A/uNPUMGZmvuqbqqPvtrATMdFdl3nk2Z5
	 FTQtwqb6pD7Rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E28EC5B561;
	Mon, 10 Aug 2026 10:22:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Aug 2026 12:22:24 +0200
Subject: [PATCH v4 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dw9714v-v4-2-a227cb1d29bd@ixit.cz>
References: <20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz>
In-Reply-To: <20260810-dw9714v-v4-0-a227cb1d29bd@ixit.cz>
To: Alexander Martinz <amartinz@shiftphones.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GdbUfwJ10fR0lW+Kb3dZndvP8ed4Y2Pebi8vBrKB8vI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeaZibOVmhl6yvr/oiJxQy+/Jbfob7dOqliVZw
 Szw+HfL0oaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanmmYgAKCRBgAj/E00kg
 clKXD/9n9OvigmT5Se6QzJSDxr5cMWVuAQ0eCkgqw4ykgCP+puuvF3ZKpY5kWlKYbo6iKsBv7St
 NNBD6ee0I/D9QL7AFaIgB4uMjHNZuE7fCAqOJkLTzonKTfvqZ9QOSLoi7ahHm1TLHvCetyZ1FlO
 Nc9732sGiYgPoH8RsizwsmQ/yN5cgdUG0vrxHQDJts+AqKNCBSMnKkOm8J1WcHyFaUQ7zx/2MT4
 LwRwpwg4T/e0wzbWSAsaT/Yt6aWM7t2mWvxAVjB1sOuXOyo+00SpFey7ASLE1ifg0RG18G1nB/g
 E8pSRaMccYhOoaKyF8N7kcfYSDAEaJKKK1nbgrTHRyKHjv+Dximbi2RBNeEkqN+msJqsRIB/ZsT
 MfYfJNfLyonq/MXMAYC6Pe9glzMrko3Xqbi3MOAtZCrBsV0xZ1YUO3AIs3Xa7z63M+rABj43TVl
 UAByP4ofkGqF5vOkz5Ib6SC6H/wEk7CfslxnUPzwWXyXtpyaF44LaDb0nok5YHz7a3p6vkiKTim
 WliswUE15tFlZHQ7kf81OXB8FbMnJ9GGraT5XODeZMzU5QHh2GcNv4b0kxW6UdpfZAKUS7+xVvq
 +fOQ2PSXc8mnhU3/3HX+Znd7pxk6eAcEV73hmMNAZ8GxtmknR9fs6IQ9hzjrqvIri7VuFPMmgVL
 Iy/zi/F0QjKuLoQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
actuator node.

Since the actuator sits on the CCI I2C bus, whose 1.8V side is fed by
vreg_lvs1a_1p8 and there is no place to describe that, keep it always-on
for now, until bus-supply exists.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 48 +++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index e31c784eff3de..358ce1930d4e1 100644
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
 
@@ -441,16 +466,32 @@ regulators-2 {
 
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
+	/* main camera actuator */
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
@@ -699,16 +740,23 @@ &slpi_pas {
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


