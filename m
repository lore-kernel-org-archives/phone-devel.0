Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F17CC433F5
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 13:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15A1561502
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 13:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbhJENvd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 5 Oct 2021 09:51:33 -0400
Received: from comms.puri.sm ([159.203.221.185]:43896 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234915AbhJENvd (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Tue, 5 Oct 2021 09:51:33 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id B9FB3E12B2;
        Tue,  5 Oct 2021 06:49:42 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jY0L-Xk4l59g; Tue,  5 Oct 2021 06:49:42 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        Angus Ainslie <angus@akkea.ca>
Subject: [PATCH v2 6/7] arm64: dts: imx8mq-librem5: Limit the max sdio frequency
Date:   Tue,  5 Oct 2021 15:49:01 +0200
Message-Id: <20211005134902.2138731-7-martin.kepplinger@puri.sm>
In-Reply-To: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
References: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Angus Ainslie <angus@akkea.ca>

This is needed for the 1LV Cyress WiFi module to probe correctly.
It also helps improve GNSS sensitivity.

Signed-off-by: Angus Ainslie <angus@akkea.ca>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 396eb4434229..d86486fd659d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1237,6 +1237,7 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	post-power-on-delay-ms = <1000>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	max-frequency = <50000000>;
 	disable-wp;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-- 
2.30.2

