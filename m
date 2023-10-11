Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1382DCDB46A
	for <phone-devel@archiver.kernel.org>; Wed, 11 Oct 2023 16:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjJKQvC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJKQvA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Oct 2023 12:51:00 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2F498
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 09:50:58 -0700 (PDT)
Received: from [192.168.178.23] (k10064.upc-k.chello.nl [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 1A495CD2DE;
        Wed, 11 Oct 2023 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1697043057; bh=4GlqhnwSoaVCgskZeWkPIYoAERkqBHFpwH+J17IutXI=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=NoEk1pG9LUWrZLyXusSNF69ObrZeRYafTrM1mzzZmUDG8IcID88CcqoPbdvJbF0fb
         mZVtNdPyV+bo+cp+TFT5ShzTdt2rbkSqj2Gn4fzDUQd8d5IfY6sCOKPuRJAkNB4q2d
         6uJUKYthhtbQFp+iKWSIS1Ub/7rP0bzZNgWpZoKc=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Wed, 11 Oct 2023 18:50:46 +0200
Subject: [PATCH 3/3] ARM: dts: qcom: Add support for HTC One Mini 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-htc-memul-v1-3-97c3910f80a9@z3ntu.xyz>
References: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
In-Reply-To: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8613; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=4GlqhnwSoaVCgskZeWkPIYoAERkqBHFpwH+J17IutXI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlJtJvD91f1BMPBjlcLPSSTh0+Dzh9S35WZrt2/
 b8Lmi6XyUqJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZSbSbwAKCRBy2EO4nU3X
 VhL3D/9WubtzvW9GSQ3/0r+Y/eMJiiYdE6Sz9VtL3F1fP/PlSuJzZa8S3gOC3NgvTsCrL9Gftfs
 q4pfbQmDabIhAygc9Y3gp3I1Y9aInMi4MIkOGJl0FPIZt2FOd5JL8PxdEahwq86/JZWJN4OoDeG
 qwL/+GVgV7Lan/8xjoGBvtnWS5+UDygzLj7y4RhvlVgVWEPefCse9AZav+0jI8Xsxv+iCDO0N2V
 eB3+VgPfSbHhmrUjdcytTxb+wPpw0nTT4gizb7FsbxJ633AhpPmmSgrluSeXOdilX5JnmJ3ZZng
 XLa6a7P/SEQNd0mia1MOeey/cnPbU9LJcSvOt+V3ZiW8nRBxjPd4FnyanW8H1aqzDgp1Pvmlh81
 ijw3QOanCncd00or5WzJycoI/noGp6dE6qOaYxVSL8KjhgNHpOufMBNyioR5wjzOggxanYWXYvG
 qfi9KxwTSlb3ODJHemEE4nrrKxCxLclmOptUShJfT5rBshJiCgV7Q94UsO7ej4rwLkhjGFfzBvu
 6mpN4SU1454r1PslWv2YgtF61pVl6jCXcsUejWG1dipI0HPr6DU9N8reGOKgf0+zcd4XmJD6jjF
 0HFRoyVA8NNMNapZRUGyUUaj6044rZiHnEBkQJ/s9qXYqgupfnCWKg9eAkMJNqYHglXmZHeutQW
 P9+IS+oNqnE0H1Q==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add support for this smartphone based on the MSM8926 SoC, codenamed
"memul".

Supported functionality:
* Power & volume buttons
* ADSP
* Magnetometer
* Accelerometer
* Touchscreen
* Vibrator
* Internal storage
* SD card
* Charger
* USB

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts | 337 ++++++++++++++++++++++
 2 files changed, 338 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index a3d293e40820..0cb272f4fa45 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8916-samsung-e7.dtb \
 	qcom-msm8916-samsung-grandmax.dtb \
 	qcom-msm8916-samsung-serranove.dtb \
+	qcom-msm8926-htc-memul.dtb \
 	qcom-msm8926-microsoft-superman-lte.dtb \
 	qcom-msm8926-microsoft-tesla.dtb \
 	qcom-msm8960-cdp.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
new file mode 100644
index 000000000000..b848f0cce3b4
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Luca Weiss <luca@z3ntu.xyz>
+ */
+
+/dts-v1/;
+
+#include "qcom-msm8226.dtsi"
+#include "qcom-pm8226.dtsi"
+
+/delete-node/ &adsp_region;
+/delete-node/ &smem_region;
+
+/ {
+	model = "HTC One Mini 2";
+	compatible = "htc,memul", "qcom,msm8926", "qcom,msm8226";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power";
+			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <15>;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		unknown@5b00000 {
+			reg = <0x05b00000 0x200000>;
+			no-map;
+		};
+
+		unknown@7a00000 {
+			reg = <0x07a00000 0x100000>;
+			no-map;
+		};
+
+		mpss_region: mpss@8000000 {
+			reg = <0x08000000 0x4f00000>;
+			no-map;
+		};
+
+		unknown@cf00000 {
+			reg = <0x0cf00000 0x200000>;
+			no-map;
+		};
+
+		mba_region: mba@d100000 {
+			reg = <0x0d100000 0x3a000>;
+			no-map;
+		};
+
+		wcnss_region: wcnss@d200000 {
+			reg = <0x0d200000 0x650000>;
+			no-map;
+		};
+
+		adsp_region: adsp@dc00000 {
+			reg = <0x0dc00000 0x1400000>;
+			no-map;
+		};
+
+		venus_region: venus@f500000 {
+			reg = <0x0f500000 0x500000>;
+			no-map;
+		};
+
+		smem_region: smem@fa00000 {
+			reg = <0x0fa00000 0x100000>;
+			no-map;
+		};
+
+		unknown@fc00000 {
+			reg = <0x0fc00000 0xa00000>;
+			no-map;
+		};
+	};
+};
+
+&adsp {
+	status = "okay";
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	magnetometer@d {
+		compatible = "asahi-kasei,ak8963";
+		reg = <0x0d>;
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_RISING>;
+		vdd-supply = <&pm8226_l19>;
+		vid-supply = <&pm8226_l28>;
+	};
+
+	accelerometer@18 {
+		compatible = "bosch,bma250e";
+		reg = <0x18>;
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
+		vdd-supply = <&pm8226_l19>;
+		vddio-supply = <&pm8226_l28>;
+	};
+};
+
+&blsp1_i2c4 {
+	status = "okay";
+
+	/* TFA9887 @ 34 */
+	/* TFA9887 @ 35 */
+};
+
+&blsp1_i2c5 {
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+
+		interrupts-extended = <&tlmm 17 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8226_l19>;
+
+		syna,startup-delay-ms = <160>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&blsp1_i2c6 {
+	status = "okay";
+
+	/* NCP6924 Camera Regulators @ 10 */
+	/* PN544 NFC @ 28 */
+	/* TPS61310 Flash/Torch @ 33 */
+};
+
+&pm8226_vib {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8226-regulators";
+
+		pm8226_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+		pm8226_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2200000>;
+		};
+		pm8226_s5: s5 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
+		pm8226_l1: l1 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+		pm8226_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8226_l3: l3 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1337500>;
+		};
+		pm8226_l4: l4 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8226_l5: l5 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		pm8226_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+		pm8226_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l9: l9 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+		pm8226_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		pm8226_l14: l14 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+		};
+		pm8226_l15: l15 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+		pm8226_l16: l16 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3350000>;
+		};
+		pm8226_l17: l17 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l18: l18 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l19: l19 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+		pm8226_l20: l20 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+		pm8226_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+		pm8226_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3000000>;
+		};
+		pm8226_l24: l24 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1350000>;
+		};
+		pm8226_l25: l25 {
+			regulator-min-microvolt = <1775000>;
+			regulator-max-microvolt = <2125000>;
+		};
+		pm8226_l26: l26 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+		pm8226_l27: l27 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+		pm8226_l28: l28 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_lvs1: lvs1 {};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8226_l17>;
+	vqmmc-supply = <&pm8226_l6>;
+
+	bus-width = <8>;
+	non-removable;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8226_l18>;
+	vqmmc-supply = <&pm8226_l21>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&smbb {
+	qcom,fast-charge-safe-current = <1750000>;
+	qcom,fast-charge-current-limit = <1750000>;
+	qcom,fast-charge-safe-voltage = <4360000>;
+	qcom,fast-charge-high-threshold-voltage = <4350000>;
+	qcom,auto-recharge-threshold-voltage = <4300000>;
+	qcom,minimum-input-voltage = <4300000>;
+};
+
+&usb {
+	extcon = <&smbb>;
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&smbb>;
+	v1p8-supply = <&pm8226_l10>;
+	v3p3-supply = <&pm8226_l20>;
+};

-- 
2.42.0

