Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440506;
	b=sH14yOiuLgFu0vM/ISk7QLCx79LgSIB6mO6GSlegSszyCTpOU3YaEGjY141DhKzKbUB7
	 4d3CDHlQ7s5GkdaBaj7R73zAIKXGxnGV5YRjkb1GyOv+CUNK/4GBuErx33R028QUij5y2
	 6Z7Rip9AXlWyHQ88GAlWTvAvSFMETidRnPjOFSkfCKdbLLjw5i6Tot+Oflo6VNogk+9wM
	 /pULS6dDPe4p6A7tE+wi1i1SUnmQoNDt7LiQzkcFD4mK8eBgS804avNGmOSwwaCrIB6m7
	 JGDWl1eTXNARHzSGTDlbKhhtEjVGXTEc7rD6Edol9KLWsDRn2AgEHaDLycSxsgvbMrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440506;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Iz6QLWric6cq68W3ntH94WwbQE0BNKTALt8WdXsygxk=;
	b=O94uq6DBEbZY3pv9MfJOHIQOP1xhgX5kndxTpEZkNNvo5y+w7AKA7qIfBYNVVVsnhiHI
	 jSrelw3lKyKDXfuwUNeQ89oXXh/tkQENmmmYmxjTsDNHkkqUunh3Xd26QCafOKa9taLUw
	 OhF9QfgB0lGWZfvk/L8adB8+k1CmS7KtTePKgIOnSpzyUYZZlvHwsOwj5tfYDJUETwQWd
	 WXIj5xOK8hdMN+6tNe0SVkO3nBMGSiCbJ6hf5+zRsTFa8dYehtPWWDr0iwi5+edAWHpwE
	 Kzwo+e9viJFQtyoLPo/BtnG/3J5DjMbQGJGYPU/HWFQIeC6gnqy/wPtIBhW9FSom1Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wy6m67s0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D22606A33C;
	Mon, 23 Nov 2026 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wy6m67s0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795440506;
	b=JSEVKBQNWPdSzUDDTcjYr5GAkYvu21lpePWhharRqSsbEDpHjlx6IO5ctWqGfejBNNrC
	 685g8o1psYluAsPOV+aPA0a5IHLyLtY7enmrhnS1txCkQgymrN1XoyT59GfAadrtpHSdV
	 klieKeLA8e6ANvCKY6YwUwh1X7CjX+SqRmgf3KQNk3vgLUf5Kz/bsbgNPEWmY8zDz67xG
	 I5PN/88WTgucW5ERWMx9R4nMbxjObDpaD1+kH1WZ2ihdUWwg5PifgXQqIHgRYkb8JbVcl
	 V7cJ1KITDX85v4w1SIjr9z5kDjkiJCNSmjj1Vbe2heo8YY6FPtS4f2cKufV3MD7rcJQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795440506;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Iz6QLWric6cq68W3ntH94WwbQE0BNKTALt8WdXsygxk=;
	b=XcC2fZV5CXnZkF/+ZNmPEKe69/OvzRj7dVKWvRQ4FSCvtewIlyNX3sDua6VJKISCeFDo
	 8UoYVzIYbqcEYYYKGFDI6jYx6LrYcOXhFwEsf5d6sdBUpaZHB/ofxN0P2dysxGea/0bV3
	 2//T+fc5qzRGJ/NaxoLTI37q2Ip7oXlG40ZL+u0jVrfwmjAxzCaLAOiU8GYXeSRMH0GuL
	 quyVy/CbavpqN9cSUNZZiVQkBQLAY7AAVLKYOCaRRjic73XofAzhlXysOI6KCOKlHnado
	 0u8ze9R+sAYfoEnuXjjKl7niHeZkKE/suMOwT+ym6xmTYxp6PGFviYVswk7BvQMC6nQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65D471F000D1;
	Mon, 23 Nov 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440506;
	bh=Iz6QLWric6cq68W3ntH94WwbQE0BNKTALt8WdXsygxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wy6m67s086zCYP7xnMcOrcKP2gWsHh+THO3IyGu6bW0MI55o5GQAX8iUuCqvWY3yC
	 IYCprsIq60S019svbAqbnnynYLtubAfQ9JFB8nt++HY8vJPpS1jn1sWrufGs96C+Su
	 KK0f3BgRlc3BB0jyW+l9+v8ThWJrar7VfLuz49/DrgC/RqOKcTLkZk0JeKbypkFRcX
	 o5f8koGFck5QeZZtrOU+478gMLBgrKHhJmWTS3sxiFzvT4W3KtVq+jihUI6sQGqyEn
	 l2ZVKFsVVzOyU9XDZwCH0aHOtYS9rWLav5uHG/pStOQjPiFibpRJ8TNt1k+ptj5Ixk
	 bakDyAivHtibw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E327F4C4A1;
	Mon, 23 Nov 2026 13:28:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 14:28:10 +0100
Subject: [PATCH v11 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
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
Message-Id: <20261123-pixel3-camera-v11-1-d00195d180dc@ixit.cz>
References: <20261123-pixel3-camera-v11-0-d00195d180dc@ixit.cz>
In-Reply-To: <20261123-pixel3-camera-v11-0-d00195d180dc@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7144; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=lAr8RSJX5l4imCi996Kh7aazXm2Dve0A7X4RSXAMayk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBD9sYu/UmjJ+NaBSgnmzBUm7AZphXOvz+6lZH
 MYlUmccVtyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQ/bAAKCRBgAj/E00kg
 cmPyEADCsCMTPeoe/39drsYHSzGQjNjqoK7dLv7oWsAidBS8PucnuGoK0xBNA02k5MHZiAyLu0B
 vnVAqYFCLL8ApziPSJKyDL+zCeV332Esr0V9/ydi5ER8CB8fXdCd6+uVa7DhHMVmairC8J0U5wy
 9Htc/7u6J7ENKqYoZg3MwfPacPebjXbIRVpNVkNANxi4lCv36Agh97oro3AiFAPWn/9CS1DzmA7
 99OucHNkZI2zPvxYUOR6lsQJ+fRY5DyuCcLelPAJ20dVqOnVIR1N7O3flsEsPm299VMC8Ir2Sks
 WlfB2lDlcHLs25u1kQoeOqUsV5Bj+eaSTD+py8l6LvMNPFbd2M4Idil3r+p9Xpd0SNMuoUgweg3
 Q7kVGRrGLZBWa8XNTW1kI0QaOpXca5UrJTOz4QVgI861ziH0THoN4kVJVQF/Wtf089bYRihwsH1
 V7upToW5CERmbNs3825V7LsS2fkZQlDbIwPsBgoPZA2DaVhscUyopGP22piIOQYbYewhGIoVpBO
 yz3o8RFd+i/mAp5Pl+kJIA8tHHhnfhADqxabXDIIrv1QMnNSjtL0HuLn2yjVuQ5aP5JZlc/2hqP
 hLP5sR2ajZ0O4MGpe6SLnu9h+uORRmSCU+xcrr5d6vVJLR6yx4fh88dPaxS78I4QBsxacjIY2KU
 L2oonr4QY4jOWRA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The Pixel 3 features two front-facing Sony IMX355 sensors with
different focal lengths (standard and wide-angle).

Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
I2C1, using MCLK2 as the clock source.

This enables support for the dual front camera configuration.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 172 ++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 3c9656b88b696..1c1cc036dcfe8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -1,16 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interface-devices.h>
+#include <dt-bindings/media/video-interfaces.h>
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
@@ -518,16 +660,44 @@ firmware-pins {
 			pins = "gpio79";
 			function = "gpio";
 			drive-strength = <2>;
 			bias-pull-down;
 		};
 
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
2.55.0


