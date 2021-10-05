Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE88C433FE
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 13:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54CE6604D1
	for <phone-devel@archiver.kernel.org>; Tue,  5 Oct 2021 13:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbhJENxS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 5 Oct 2021 09:53:18 -0400
Received: from comms.puri.sm ([159.203.221.185]:43824 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235206AbhJENvZ (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Tue, 5 Oct 2021 09:51:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id EE382E124B;
        Tue,  5 Oct 2021 06:49:34 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id e2GZD-2R4H98; Tue,  5 Oct 2021 06:49:34 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        Angus Ainslie <angus@akkea.ca>
Subject: [PATCH v2 4/7] arm64: dts: imx8mq-librem5: delay the startup of the SDIO
Date:   Tue,  5 Oct 2021 15:48:59 +0200
Message-Id: <20211005134902.2138731-5-martin.kepplinger@puri.sm>
In-Reply-To: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
References: <20211005134902.2138731-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Angus Ainslie <angus@akkea.ca>

The redpine wifi card takes some time to wake up. Wait for it.

Signed-off-by: Angus Ainslie <angus@akkea.ca>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 9a309b1d0a90..7a09312f31c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1212,6 +1212,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
 	bus-width = <4>;
 	vmmc-supply = <&reg_wifi_3v3>;
+	post-power-on-delay-ms = <1000>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	cap-sdio-irq;
-- 
2.30.2

