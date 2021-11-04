Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207EDC433F5
	for <phone-devel@archiver.kernel.org>; Thu,  4 Nov 2021 13:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B20D611EE
	for <phone-devel@archiver.kernel.org>; Thu,  4 Nov 2021 13:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhKDN01 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 4 Nov 2021 09:26:27 -0400
Received: from comms.puri.sm ([159.203.221.185]:42166 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231636AbhKDN0Y (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 4 Nov 2021 09:26:24 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 351C1DF98F;
        Thu,  4 Nov 2021 06:23:46 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ys9NSnR9A4lb; Thu,  4 Nov 2021 06:23:45 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     festevam@gmail.com, shawnguo@kernel.org
Cc:     martin.kepplinger@puri.sm, devicetree@vger.kernel.org,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        robh@kernel.org
Subject: [PATCH v1 4/4] arm64: dts: imx8mq-librem5-r3.dtsi: describe selfie cam XSHUTDOWN pin
Date:   Thu,  4 Nov 2021 14:22:13 +0100
Message-Id: <20211104132213.470498-5-martin.kepplinger@puri.sm>
In-Reply-To: <20211104132213.470498-1-martin.kepplinger@puri.sm>
References: <20211104132213.470498-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The r3 and later revisions of the Librem 5 phone include an additional switch
to control the hi846 XSHUTDOWN pin. Describe it.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
index e872eb4b1cf9..e4f8b47cce4f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
@@ -27,6 +27,19 @@ &bq25895 {
 	ti,termination-current = <144000>;  /* uA */
 };
 
+&camera_front {
+	pinctrl-0 = <&pinctrl_csi1>, <&pinctrl_r3_camera_pwr>;
+	shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+};
+
+&iomuxc {
+	pinctrl_r3_camera_pwr: r3camerapwrgrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_SPDIF_RX_GPIO5_IO4		0x83
+		>;
+	};
+};
+
 &proximity {
 	proximity-near-level = <25>;
 };
-- 
2.30.2

