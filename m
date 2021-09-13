Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC49C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 14:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96BCC61A09
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 14:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244583AbhIMOBW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Sep 2021 10:01:22 -0400
Received: from comms.puri.sm ([159.203.221.185]:39756 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245421AbhIMN7T (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Sep 2021 09:59:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 1CCC0E125E;
        Mon, 13 Sep 2021 06:57:34 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fjPrl8H4lvkd; Mon, 13 Sep 2021 06:57:33 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        kernel@puri.sm, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 3/6] arm64: dts: imx8mq-librem5: wire up the wifi regulator
Date:   Mon, 13 Sep 2021 15:57:03 +0200
Message-Id: <20210913135706.309685-4-martin.kepplinger@puri.sm>
In-Reply-To: <20210913135706.309685-1-martin.kepplinger@puri.sm>
References: <20210913135706.309685-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Guido Günther <agx@sigxcpu.org>

Connect the wifi power regulator to the corresponding GPIO.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index ba26c6ee98a0..b5562c8f9a3c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -138,9 +138,15 @@ reg_vsys_3v4: regulator-vsys-3v4 {
 
 	reg_wifi_3v3: regulator-wifi-3v3 {
 		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_wifi_pwr>;
 		regulator-name = "3V3_WIFI";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply = <&reg_vdd_3v3>;
+		regulator-always-on;
 	};
 
 	sound {
@@ -638,6 +644,13 @@ MX8MQ_IOMUXC_SD2_RESET_B_USDHC2_RESET_B 0xc1
 		>;
 	};
 
+	pinctrl_wifi_pwr: wifipwrgrp {
+		fsl,pins = <
+			/* WIFI3V3_EN */
+			MX8MQ_IOMUXC_NAND_DATA04_GPIO3_IO10	0x83
+		>;
+	};
+
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			/* nWDOG */
-- 
2.30.2

