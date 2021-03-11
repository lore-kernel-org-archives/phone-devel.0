Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D66DC4332E
	for <phone-devel@archiver.kernel.org>; Thu, 11 Mar 2021 12:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB9FB64FEB
	for <phone-devel@archiver.kernel.org>; Thu, 11 Mar 2021 12:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbhCKMDw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 11 Mar 2021 07:03:52 -0500
Received: from comms.puri.sm ([159.203.221.185]:39000 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232870AbhCKMDY (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 11 Mar 2021 07:03:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 82B2FE0DC0;
        Thu, 11 Mar 2021 04:03:24 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2Na-PJynUT3A; Thu, 11 Mar 2021 04:03:23 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, krzk@kernel.org
Cc:     kernel@puri.sm, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH 2/3] arm64: dts: imx8mq-librem5-r3: Mark buck3 as always on
Date:   Thu, 11 Mar 2021 13:02:58 +0100
Message-Id: <20210311120259.3310499-3-martin.kepplinger@puri.sm>
In-Reply-To: <20210311120259.3310499-1-martin.kepplinger@puri.sm>
References: <20210311120259.3310499-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Commit 66d3f246d79f ("arm64: dts: librem5: Don't mark buck3 as always on")
removed always-on marking from GPU regulator, which is great for power
saving - however it introduces additional i2c0 traffic which can be deadly
for devices from the Dogwood batch.

To workaround the i2c0 shutdown issue on Dogwood, this commit marks
buck3 as always-on again - but only for Dogwood (r3).

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
index 0d38327043f8..cd3c3edd48fa 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dts
@@ -28,6 +28,10 @@ &bq25895 {
 	ti,termination-current = <144000>;  /* uA */
 };
 
+&buck3_reg {
+	regulator-always-on;
+};
+
 &proximity {
 	proximity-near-level = <25>;
 };
-- 
2.30.1

