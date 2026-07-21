Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B42036E9;
	Tue, 21 Jul 2026 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637215; cv=none; b=GLutmmjmNdYRHHJ15Oe+r7qWdDQzjVrwplKhLrnvir05fh+lUQgjYnocdv/RmGXBfUIqd+6cxLFRj386yIW5Ulyi2FHaN/cOJ/3CZmSgSrL3P3jCV3xfHnYEgBY/V7PLu+pYkXranzY6hwTETv5CFxSNtryq2yRfAVGejwNaMKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637215; c=relaxed/simple;
	bh=LAbDaQLR2st40ro7lbGdAncos5lXchBrxXdfrV2SeFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dmk/cdbRNnnqiXHwT9QbFfoGOzkNkqSRcDMMCNskzHsuZVu45ogVdm5N+C+/5uBhNWLUgLqjBVeb2aGMuvO+jRBynWiaeU654+mVkKoX7Z78zTNNUfl3mx+TvpwVsek0yTPoAXYhb9P4iwt8gmb6mq0B3jIM0YRm0HQHxdiBLnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWoAGM5k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWoAGM5k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B80D5C2BCC7;
	Tue, 21 Jul 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784637214;
	bh=LAbDaQLR2st40ro7lbGdAncos5lXchBrxXdfrV2SeFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CWoAGM5kAkq63o4JtLQmPkU/0JBH8ArboGnFFwko2CVYne+kf1HT4PjcgU3AFdFFI
	 0wpptpg22CaSiIH2s9/X8lkwqDxXRXQq70WlGLikzuWr8XssQNHvMnCR/hpmNscn90
	 UTplO8xZ0I8MKNfCRyKjMb6boqSL9qXJFq5lNLmZ+jSE2woFRGKVTklnSqUmTVGdHD
	 usoj40wCif/Lj0tKmExZ3qlXTiZVQ7rSITW67VsRymlL+Y8N+tCJwq3F5AmwkupR40
	 haBZ3q2rrKFxfEDOhp9c8ornx57N+mUt4AT5rtoOdM7aXd9qP+bCWtKGeJc+PabQpv
	 pIkQw7UUzG00w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D5EC4451C;
	Tue, 21 Jul 2026 12:33:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Jul 2026 14:33:29 +0200
Subject: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
References: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
In-Reply-To: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7104; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Cu9WKK5ZfAyW+AlqGFMhSHDuJX/u8pYu0v9AtsxTHak=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqX2cdr3BuQfEZRQaeI4X/z7R4enQCD59aP2t7L
 jBLSuTnepuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCal9nHQAKCRBgAj/E00kg
 co2cEACuHBf9u+cPMZcRhPh8q1dR/bJ/ROed9biH+9Ca5G0DfPQ7D3jsWa/oAEW/C79K1zSp7+B
 +u1LTi/5Sc0dSbTM9VpfjJNG0aVTkzxtew/Q1vsv9uCZNdrOsbWnbm7MwL4bFwuNzud3VXeingd
 CYFA+5ovEGccgWKjttqKVImMRvgHqVSs2hCt+ZT7/NxDVaXDRHzMdodVI37aVUo3gqYtosdDO2p
 /bVLa2XukWYZMqbId4B7EtlKufw64LmiptSJ/HuD/7EXOOFnBhoAtEAVfCuQObP8tlGl6R8bK6f
 M+dBIx2QiatPEQsn3edlepdkPsf7H87i4AmyscI8rTIkkj50pkt2ClpRbXDwYe3IBUegzL977lg
 9UEgy4tPwnlNQyj/OTzLF9rchvl7WBnbgsEBmLT3yfG5VaYOwdIMZz5bFmBMmjtsaEAn61qcTTJ
 QE0/zPEcbLzcEf57Txq3zV6h1RmIdHHH/O1c+TrDySbh2g4Iwp+JGcnTo1vQMOIZxUeWJQHh9fr
 Izx4DME9qXeoOWatf0qCb7DZJVBJMmNZ6y0ABMOfz/9irIs1DGZ55ucX6OT2YTWB0IeEjAUilbm
 S83kQyJiz9ziDi8Kf58EyVS8Y5wCmWsJ7aHmSsa1uR4tN8ANO/nvJX1eSeEiIw4WyoW1Bo58uvO
 1p1ohvBnZeYkq4w==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Pixel 3 features two front-facing Sony IMX355 sensors with
different focal lengths (standard and wide-angle).

Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
I2C1, using MCLK2 as the clock source.

This enables support for the dual front camera configuration.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 172 ++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 9368fd6b87515..c8a28133fb38d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -1,16 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
 /delete-node/ &venus_mem;
@@ -108,16 +110,48 @@ gpio-keys {
 		key-vol-up {
 			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 		};
 	};
 
+	camera_front_avdd: regulator-front-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_avdd";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpios = <&tlmm 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_avdd_default>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
+	camera_front_aux_avdd: regulator-front-cam-aux-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "front_cam_aux_avdd";
+
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+
+		gpios = <&tlmm 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_front_aux_avdd_default>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vreg_bob>;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
 
 	vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
@@ -314,16 +348,21 @@ vreg_l28a_3p0: ldo28 {
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
 
@@ -346,24 +385,127 @@ regulators-2 {
 
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
+	/*
+	 * MCLK2 (GPIO15) is shared between both front camera sensors.
+	 * The clock is generated by CAMCC, therefore the pin is
+	 * configured here rather than in individual sensor nodes.
+	 */
+	pinctrl-0 = <&cam_mclk2_default>;
+	pinctrl-1 = <&cam_mclk2_sleep>;
+	pinctrl-names = "default", "sleep";
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
+	/* bus has external pull-up */
+	/delete-property/ bias-pull-down;
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
+		pinctrl-0 = <&cam_front_reset_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
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
+		pinctrl-0 = <&cam_front_aux_reset_default>;
+		pinctrl-names = "default";
+
+		rotation = <270>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
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
@@ -485,16 +627,44 @@ nfc_int_default: nfc-int-default-state {
 
 	nfc_enable_default: nfc-enable-default-state {
 		pins = "gpio25", "gpio79";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
 	};
 
+	cam_front_avdd_default: cam-avdd-default-state {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_front_aux_reset_default: cam-front-aux-reset-default-state {
+		pins = "gpio9";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_front_aux_avdd_default: cam-avdd-aux-default-state {
+		pins = "gpio14";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_front_reset_default: cam-front-reset-default-state {
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


