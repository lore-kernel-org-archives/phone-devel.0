Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C06C7618D
	for <phone-devel@archiver.kernel.org>; Thu,  9 Mar 2023 20:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjCIUr5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjCIUrr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Mar 2023 15:47:47 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B143AFFBEB;
        Thu,  9 Mar 2023 12:47:27 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id D9C8FE9A20;
        Thu,  9 Mar 2023 12:46:49 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pYsXb085EP6r; Thu,  9 Mar 2023 12:46:49 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1678394809; bh=8ae9WzC6o2aQfbxq47hKVQYvaWWmKz7NVcd8S/N/LLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WZjKmjxU1A1iU89EUDNrP7isToZd9NlyqmeDJcSqzmxL5CPztlrFg/s2/rbnLVNNJ
         +ZSAPNSMjym4SBMl1zPM53cIgnAhCQHHI5Dnuqq0IyD8wCA5GVeVBSGZKtWE+24Obg
         +1wqcm4Y3IoqYAIO0rnHZd8TKdedCOjHTBZoUSvGSzEiCepOPG4V5EZWVZK6KEHnI3
         PY+ZM6BN1QoiCVaw7jR/RzxozG3P0FaaO5BOqJlLtudRsv7MHtLPpDqMWqkuE15PVP
         dgxeFbJlAACUP8pkhmW5nJoJnZ97cVC9OQGV2V77wM4TuW3KFtCRtj4h86ls8Lv7Un
         ov5/fqIZn1RCA==
To:     robh@kernel.org, krzysztof.kozlowski@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     kernel@puri.sm, linux-imx@nxp.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 06/14] arm64: dts: imx8mq-librem5: Set charger parameters for each batch
Date:   Thu,  9 Mar 2023 21:46:00 +0100
Message-Id: <20230309204608.237605-7-martin.kepplinger@puri.sm>
In-Reply-To: <20230309204608.237605-1-martin.kepplinger@puri.sm>
References: <20230309204608.237605-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Correctly set regulation-voltage, termination-current and charge-current
for the different librem 5 board revisions.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts  | 10 ++++------
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi |  2 --
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi    |  4 +++-
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts
index 73bd431cbd6a8..4f69eb32b1c90 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts
@@ -12,18 +12,16 @@ / {
 	compatible = "purism,librem5r2", "purism,librem5", "fsl,imx8mq";
 };
 
-&bq25895 {
-	ti,battery-regulation-voltage = <4192000>; /* uV */
-	ti,charge-current = <1600000>; /* uA */
-	ti,termination-current = <66000>;  /* uA */
-};
-
 &accel_gyro {
 	mount-matrix =  "1",  "0",  "0",
 			"0", "-1",  "0",
 			"0",  "0",  "1";
 };
 
+&bq25895 {
+	ti,charge-current = <1600000>; /* uA */
+};
+
 &proximity {
 	proximity-near-level = <120>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
index e4f8b47cce4f5..c1279e96effd7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
@@ -22,9 +22,7 @@ &accel_gyro {
 };
 
 &bq25895 {
-	ti,battery-regulation-voltage = <4200000>; /* uV */
 	ti,charge-current = <1500000>; /* uA */
-	ti,termination-current = <144000>;  /* uA */
 };
 
 &camera_front {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f8698b6995343..509776a63259b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1147,7 +1147,9 @@ bq25895: charger@6a {
 		interrupt-parent = <&gpio3>;
 		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
 		phys = <&usb3_phy0>;
-		ti,precharge-current = <130000>; /* uA */
+		ti,battery-regulation-voltage = <4208000>; /* uV */
+		ti,termination-current = <128000>;  /* uA */
+		ti,precharge-current = <128000>; /* uA */
 		ti,minimum-sys-voltage = <3700000>; /* uV */
 		ti,boost-voltage = <5000000>; /* uV */
 		ti,boost-max-current = <1500000>; /* uA */
-- 
2.30.2

