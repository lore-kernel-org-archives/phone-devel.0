Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F1DC433FE
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 14:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E46E610CC
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 14:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244978AbhIMOCv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Sep 2021 10:02:51 -0400
Received: from comms.puri.sm ([159.203.221.185]:39904 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343579AbhIMOAq (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Sep 2021 10:00:46 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id BE334E0452;
        Mon, 13 Sep 2021 06:57:42 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wSyVGPd8sgxH; Mon, 13 Sep 2021 06:57:42 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        kernel@puri.sm, Angus Ainslie <angus@akkea.ca>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 6/6] arm64: dts: imx8mq-librem5: Limit the max sdio frequency
Date:   Mon, 13 Sep 2021 15:57:06 +0200
Message-Id: <20210913135706.309685-7-martin.kepplinger@puri.sm>
In-Reply-To: <20210913135706.309685-1-martin.kepplinger@puri.sm>
References: <20210913135706.309685-1-martin.kepplinger@puri.sm>
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
index 65c86fbbd6d1..a7b6ea93fbac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1238,6 +1238,7 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	post-power-on-delay-ms = <1000>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	max-frequency = <50000000>;
 	disable-wp;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-- 
2.30.2

