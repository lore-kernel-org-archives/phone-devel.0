Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4664C433F5
	for <phone-devel@archiver.kernel.org>; Thu,  4 Nov 2021 13:24:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8C7E611EE
	for <phone-devel@archiver.kernel.org>; Thu,  4 Nov 2021 13:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhKDN0s (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 4 Nov 2021 09:26:48 -0400
Received: from comms.puri.sm ([159.203.221.185]:42324 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231340AbhKDN0s (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 4 Nov 2021 09:26:48 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 95ED3DFE44;
        Thu,  4 Nov 2021 06:23:40 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Gsss55MNO2vf; Thu,  4 Nov 2021 06:23:39 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     festevam@gmail.com, shawnguo@kernel.org
Cc:     martin.kepplinger@puri.sm, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        robh@kernel.org
Subject: [PATCH v1 2/4] arm64: dts: imx8mq-librem5: describe power supply for cameras
Date:   Thu,  4 Nov 2021 14:22:11 +0100
Message-Id: <20211104132213.470498-3-martin.kepplinger@puri.sm>
In-Reply-To: <20211104132213.470498-1-martin.kepplinger@puri.sm>
References: <20211104132213.470498-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

CAMERA_PWR_EN controls two different power supplies that cameras will use.
The hardware killswitch controls a third one. Describe that appropriately.

The pinctrl that describes the gpio that is used in 2 places here is added
to the pmic. This is done because pmic is powered early enough to make
sure this will work.

When we would have put the same pinctrl property into the 2 regulator nodes
(instead of the pmic), we'd get:

imx8mq-pinctrl 30330000.pinctrl: pin MX8MQ_IOMUXC_GPIO1_IO00 already requested by regulator-csi-1v8; cannot claim for regulator-vcam-2v8
imx8mq-pinctrl 30330000.pinctrl: pin-10 (regulator-vcam-2v8) status -22
imx8mq-pinctrl 30330000.pinctrl: could not request pin 10 (MX8MQ_IOMUXC_GPIO1_IO00) from group camerapwrgrp  on device 30330000.pinctrl

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 .../boot/dts/freescale/imx8mq-librem5.dtsi    | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 60d47c71499b..5541e1d2ec6f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -62,6 +62,40 @@ reg_aud_1v8: regulator-audio-1v8 {
 		enable-active-high;
 	};
 
+	/*
+	 * the pinctrl for reg_csi_1v8 and reg_vcam_1v8 is added to the PMIC
+	 * since we can't have it twice in the 2 different regulator nodes.
+	 */
+	reg_csi_1v8: regulator-csi-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAMERA_VDDIO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* controlled by the CAMERA_POWER_KEY HKS */
+	reg_vcam_1v2: regulator-vcam-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAMERA_VDDD_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_vdd_1v8>;
+		enable-active-high;
+	};
+
+	reg_vcam_2v8: regulator-vcam-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAMERA_VDDA_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_vdd_3v3>;
+		gpio = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_gnss: regulator-gnss {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -329,6 +363,20 @@ MX8MQ_IOMUXC_SAI5_MCLK_GPIO3_IO25	0x83
 		>;
 	};
 
+	pinctrl_camera_pwr: camerapwrgrp {
+		fsl,pins = <
+			/* CAMERA_PWR_EN_3V3 */
+			MX8MQ_IOMUXC_GPIO1_IO00_GPIO1_IO0	0x83
+		>;
+	};
+
+	pinctrl_csi1: csi1grp {
+		fsl,pins = <
+			/* CSI1_NRST */
+			MX8MQ_IOMUXC_ENET_RXC_GPIO1_IO25	0x83
+		>;
+	};
+
 	pinctrl_charger_in: chargeringrp {
 		fsl,pins = <
 			/* CHRG_INT */
@@ -725,7 +773,7 @@ pmic: pmic@4b {
 		compatible = "rohm,bd71837";
 		reg = <0x4b>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_pmic>;
+		pinctrl-0 = <&pinctrl_pmic>, <&pinctrl_camera_pwr>;
 		clocks = <&pmic_osc>;
 		clock-names = "osc";
 		clock-output-names = "pmic_clk";
-- 
2.30.2

