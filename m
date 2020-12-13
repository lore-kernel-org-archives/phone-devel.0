Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79870C433FE
	for <phone-devel@archiver.kernel.org>; Sun, 13 Dec 2020 17:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4973423380
	for <phone-devel@archiver.kernel.org>; Sun, 13 Dec 2020 17:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406409AbgLMRTt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 13 Dec 2020 12:19:49 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:59808 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405293AbgLMRSD (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Sun, 13 Dec 2020 12:18:03 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 2A0E5FB04;
        Sun, 13 Dec 2020 18:17:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cknW5tdcTti8; Sun, 13 Dec 2020 18:17:18 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 59FEF43FE1; Sun, 13 Dec 2020 18:17:14 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Angus Ainslie <angus@akkea.ca>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Li Yang <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mq-librem5-devkit: Drop custom clock settings
Date:   Sun, 13 Dec 2020 18:17:14 +0100
Message-Id: <3ecaf4b895deefafc3fc467e56dcff5d1afe8ac7.1607879709.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607879709.git.agx@sigxcpu.org>
References: <cover.1607879709.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Otherwise the boot hangs early on.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 5fdea6b74ed5..b913a2aee328 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -244,11 +244,6 @@ &A53_3 {
 	cpu-supply = <&buck2_reg>;
 };
 
-&clk {
-	assigned-clocks = <&clk IMX8MQ_AUDIO_PLL1>, <&clk IMX8MQ_AUDIO_PLL2>;
-	assigned-clock-rates = <786432000>, <722534400>;
-};
-
 &dphy {
 	status = "okay";
 };
-- 
2.29.2

