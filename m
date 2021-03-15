Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C64C433E0
	for <phone-devel@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7CFA64EB3
	for <phone-devel@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhCOIgN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 15 Mar 2021 04:36:13 -0400
Received: from comms.puri.sm ([159.203.221.185]:45112 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhCOIgM (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 15 Mar 2021 04:36:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id D42BADF8E7;
        Mon, 15 Mar 2021 01:36:11 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HOJzWK7n6DUN; Mon, 15 Mar 2021 01:36:11 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     martin.kepplinger@puri.sm
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, kernel@puri.sm, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, robh@kernel.org, shawnguo@kernel.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2 1/3] arm64: dts: imx8mq-librem5: Hog the correct gpio
Date:   Mon, 15 Mar 2021 09:35:29 +0100
Message-Id: <20210315083531.3743183-2-martin.kepplinger@puri.sm>
In-Reply-To: <20210315083531.3743183-1-martin.kepplinger@puri.sm>
References: <20210311120259.3310499-1-martin.kepplinger@puri.sm>
 <20210315083531.3743183-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Guido Günther <agx@sigxcpu.org>

There was an additional alias in the specifier it hogged line 27
instead of line 1.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 2d248304432b..460ef0d86540 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -286,8 +286,9 @@ &gpio1 {
 
 	pmic-5v-hog {
 		gpio-hog;
-		gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+		gpios = <1 GPIO_ACTIVE_HIGH>;
 		input;
+		lane-mapping = "pmic-5v";
 	};
 };
 
-- 
2.30.1

