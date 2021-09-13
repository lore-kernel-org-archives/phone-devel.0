Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05485C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E78BF619F5
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243976AbhIMOAv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Sep 2021 10:00:51 -0400
Received: from comms.puri.sm ([159.203.221.185]:39648 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244972AbhIMN6q (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Sep 2021 09:58:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id CDE28E129B;
        Mon, 13 Sep 2021 06:57:30 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9wLE7PqtdbCI; Mon, 13 Sep 2021 06:57:30 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        kernel@puri.sm,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Eric Kuzmenko <eric.kuzmenko@puri.sm>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 2/6] arm64: dts: imx8mq-librem5: Fix led_r and led_g pinctrl assignments
Date:   Mon, 13 Sep 2021 15:57:02 +0200
Message-Id: <20210913135706.309685-3-martin.kepplinger@puri.sm>
In-Reply-To: <20210913135706.309685-1-martin.kepplinger@puri.sm>
References: <20210913135706.309685-1-martin.kepplinger@puri.sm>
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
index cb0147fe7c26..ba26c6ee98a0 100644
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

