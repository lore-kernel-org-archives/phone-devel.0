Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195F01DFFD;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480524; cv=none; b=LMlQFGrFoNIas/juhD8NqkA+Rt2yi8TVKhc3DICSRyOanlkDtHvjM1KXvj5YVh41fZ8TaL8gk2j1z8k2r8CpqEXvQ60maP0sBcr0+BaUUGvrM23trsfBhmi3xPYWX0MucE8OwRtxShjo5wFFeUhEB6V6wGcMVJ/0d2s9D5yyAvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480524; c=relaxed/simple;
	bh=xPCCs0oDQb/Wv0TyZL1ZanvwCufpJnCZeuKz37LMyLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WlDCLykfdn9M8eTv/6CavQfEYAyQVE6W+4LXxzJ0nU9jn1WNy9BVG+k8F06Za4EprFoKa/inQlr7Jjyblq3FAYCdxghrrdA+jlxWLZUyjrHE58zAUZRRiRKjMVsMwKfK9oKsejmsC4eicUQrM31Gi5rG9Xt+6MzqtzJlw8Ho31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIPv6yJA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIPv6yJA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 932F8C2BCC7;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784480523;
	bh=xPCCs0oDQb/Wv0TyZL1ZanvwCufpJnCZeuKz37LMyLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pIPv6yJAGbPBTWPFFjWWkB8TL8foOU6FqA6jVQvb3juD/BgAc1ou4OTZUMgyJ8JkP
	 bIZ7uPHJlXlkpdFJ3wPjMx18SqSrJayeB3P4M0uGZlUdGxXwIh6LJ7ujCZ3Dy/5zsZ
	 iWtbNYh7HROl3faeQ+iR8GbEnlJCF1+qx96N96XeiG0VjWDg4+5PbTs/qWRC1F9CsM
	 vgYkmexAMNqofOkE77pgmg1WOs9WFvQzsiGTPm4L7W7l9Zfd7zvO/dFYGFcet+/+wP
	 wkE7hqL1wF1b1jBkmm7Bz4JsxlEBT85BuyvCNeTObXRwgJlBjuHjqykB9MIysL8lFt
	 Iro6HcJRcKPYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B67C4451B;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 19 Jul 2026 19:01:59 +0200
Subject: [PATCH v4 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-pixel3-camera-v4-1-48cab1236852@ixit.cz>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
In-Reply-To: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8315; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=yr0ZNbuLHoE5n9ntrOofvfDU0OGMlm1fEalgA/VORYc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqXQMJeEjrPHZSyhAkG9EojbXjrjgvB98S/P8IO
 v7pGRHAWFGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCal0DCQAKCRBgAj/E00kg
 cu3FD/wKluSVbdUhTK5IhShUZNAGYVpdtomkROtNKaSVdPbxYjOaUkzuiEDGaMHwE3YQVTePDk+
 v+NMj8RPs85lXdXiSjQyoNdM5pzOgBqseL2YBmz5AQ0c7fZlPc7xal3W3m4KjkD3IyZh5LQb27x
 pf7YYRRIc14HJ/zwoihmagINFWZFJdCAh9rGViFIGSp580myUsb5nodH1U7rxdUQfcocjrIRYLc
 f/GAWK7kCC1+32lmRL1Vj90/sBzecu21OcrIu7ZYzFMYxEEs6T5y+6POvowRxnetVf5Qgg4G6R0
 fKsZgJ6GCz0XEAKT2T0K+PP/WbSIywrTrmAtxzWneiNsdVOK5Tr/54kf40wKXntSAVIjunB6zDe
 wydvY+nPqhaSGrQgOYF1ChmGcUUrVMnk6QvuYPQYyKVkbo83BRe1aygDrouGrdNVx9bEWDjxAis
 UKRTYixW46AoG/uCDYf5DT5gxfD+AG8tZo4BHQO264x1pQS4Pc7MAIQaWuQ+jdGfTAD4Jhl/D54
 nnphGUnOp+OE5zYkJHHol5zra+58AEx70vCu9JbnWdTTWmACdXCVMtkKb484g8z59YifhHaTLl4
 bZvQ1ZhQXa+QyDgH10W2OsIonRn/r07ZpQ3Zp0pjuyOOSZPVGZTSjcoHHp7ZruVHfiOnqV/orUp
 wW/lnyTEFnVbwgQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Pixel 3 features two front-facing Sony IMX355 sensors with
different focal lengths (standard and wide-angle).

Both sensors are connected via CSIPHY1 and controlled over CCI I2C1,
using MCLK2 as the clock source. Describe the camera nodes and
associated resources in the device tree.

This enables support for the dual front camera configuration.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 182 ++++++++++++++++++++-
 1 file changed, 181 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 9368fd6b87515..ad6f61b3baa21 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -1,16 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
 /delete-node/ &venus_mem;
@@ -127,16 +128,48 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		regulator-always-on;
 		regulator-boot-on;
 
 		vin-supply = <&vph_pwr>;
 	};
 
+	camera_front_avdd: front-cam-avdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_avdd";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_avdd_default_pin>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	camera_front_aux_avdd: front-cam-aux-avdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_aux_avdd";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpios = <&tlmm 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_aux_avdd_default_pin>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	wcn3990-pmu {
 		compatible = "qcom,wcn3990-pmu";
 
 		vddio-supply = <&vreg_s4a_1p8>;
 		vddxo-supply = <&vreg_l7a_1p8>;
 		vddrf-supply = <&vreg_l17a_1p3>;
 		vddch0-supply = <&vreg_l25a_3p3>;
 
@@ -209,16 +242,19 @@ vreg_s5a_2p04: smps5 {
 			regulator-max-microvolt = <2040000>;
 		};
 
 		vreg_s7a_1p025: smps7 {
 			regulator-min-microvolt = <900000>;
 			regulator-max-microvolt = <1028000>;
 		};
 
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
 		vdda_mipi_dsi0_pll:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-boot-on;
 		};
 
@@ -283,16 +319,22 @@ vreg_l20a_2p95: ldo20 {
 		};
 
 		vreg_l21a_2p95: ldo21 {
 			regulator-min-microvolt = <2960000>;
 			regulator-max-microvolt = <2968000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l22a_3p3: ldo22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <2864000>;
+			regulator-boot-on;
+		};
+
 		vreg_l24a_3p075: ldo24 {
 			regulator-min-microvolt = <3088000>;
 			regulator-max-microvolt = <3088000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l25a_3p3: ldo25 {
 			regulator-min-microvolt = <3300000>;
@@ -314,16 +356,21 @@ vreg_l28a_3p0: ldo28 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
 			regulator-boot-on;
 			/*
 			 * We can't properly bring the panel back if it gets turned off
 			 * so keep it's regulators always on for now.
 			 */
 			regulator-always-on;
 		};
+
+		vreg_lvs1_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
 	};
 
 	regulators-1 {
 		compatible = "qcom,pmi8998-rpmh-regulators";
 		qcom,pmic-id = "b";
 
 		vdd-bob-supply = <&vph_pwr>;
 
@@ -346,24 +393,129 @@ regulators-2 {
 
 		vreg_s3c_0p6: smps3 {
 			regulator-min-microvolt = <600000>;
 			regulator-max-microvolt = <600000>;
 		};
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	vdda-csi0-supply = <&vdda_mipi_csi0_0p9>;
+	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
+	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
+
+	/*
+	 * MCLK2 (GPIO15) is shared between both front camera sensors.
+	 * The clock is generated by CAMSS, therefore the pin is
+	 * configured here rather than in individual sensor nodes.
+	 */
+	pinctrl-0 = <&cam_mclk2_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			camss_endpoint1: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_aux_front_endpoint>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			camss_endpoint2: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&cam_front_endpoint>;
+			};
+		};
+	};
+};
+
+&cci0_sleep {
+	/* bus has external pull-up, don't pull down */
+	bias-disable;
+};
+
 &cci {
 	status = "okay";
 };
 
 &cci_i2c1 {
 	/* actuator @0c */
 
-	/* front camera, imx355 @1a */
+	front_cam: camera@10 {
+		compatible = "sony,imx355";
+		reg = <0x10>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&camera_front_avdd>;
+		dvdd-supply = <&vreg_s3a_1p35>;
+		dovdd-supply = <&vreg_lvs1_1p8>;
+
+		pinctrl-0 = <&cam_front_reset_default_pin>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint2>;
+			};
+		};
+	};
+
+	front_aux_cam: camera@1a {
+		compatible = "sony,imx355";
+		reg = <0x1a>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&camera_front_aux_avdd>;
+		dvdd-supply = <&vreg_s3a_1p35>;
+		dovdd-supply = <&vreg_lvs1_1p8>;
+
+		pinctrl-0 = <&cam_front_aux_reset_default_pin>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <0>;
+
+		port {
+			cam_aux_front_endpoint: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_endpoint1>;
+			};
+		};
+	};
 
 	/* eeprom @50, at24 driver says 8K */
 };
 
 &cdsp_pas {
 	firmware-name = "qcom/sdm845/Google/blueline/cdsp.mbn";
 
 	status = "okay";
@@ -485,16 +637,44 @@ nfc_int_default: nfc-int-default-state {
 
 	nfc_enable_default: nfc-enable-default-state {
 		pins = "gpio25", "gpio79";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
 	};
 
+	cam_front_avdd_default_pin: cam-avdd-default-pins {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_front_aux_reset_default_pin: cam-front-aux-reset-default-pins {
+		pins = "gpio9";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_front_aux_avdd_default_pin: cam-avdd-aux-default-pins {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_front_reset_default_pin: cam-front-reset-default-pins {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	touchscreen_reset: ts-reset-state {
 		pins = "gpio99";
 		function = "gpio";
 		drive-strength = <8>;
 		bias-pull-up;
 	};
 
 	touchscreen_pins: ts-pins-gpio-state {

-- 
2.53.0


