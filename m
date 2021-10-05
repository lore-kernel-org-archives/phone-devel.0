Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989CCC433F5
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 13:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8085461502
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 13:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234669AbhJENvT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 5 Oct 2021 09:51:19 -0400
Received: from comms.puri.sm ([159.203.221.185]:43740 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234546AbhJENvT (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Tue, 5 Oct 2021 09:51:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 95CF8E124B;
        Tue,  5 Oct 2021 06:49:28 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QH1TiBDdR-Ld; Tue,  5 Oct 2021 06:49:28 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Eric Kuzmenko <eric.kuzmenko@puri.sm>
Subject: [PATCH v2 2/7] arm64: dts: imx8mq-librem5: Fix led_r and led_g pinctrl assignments
Date:   Tue,  5 Oct 2021 15:48:57 +0200
Message-Id: <20211005134902.2138731-3-martin.kepplinger@puri.sm>
In-Reply-To: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
References: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Fix wrong pinctrl assignments.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Suggested-by: Eric Kuzmenko <eric.kuzmenko@puri.sm>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 0609b591ec5a..95bbaa108805 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1056,13 +1056,13 @@ &pwm2 {
 
 &pwm3 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_led_g>;
+	pinctrl-0 = <&pinctrl_led_r>;
 	status = "okay";
 };
 
 &pwm4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_led_r>;
+	pinctrl-0 = <&pinctrl_led_g>;
 	status = "okay";
 };
 
-- 
2.30.2

