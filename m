Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240F5C76195
	for <phone-devel@archiver.kernel.org>; Thu,  9 Mar 2023 20:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbjCIUsh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbjCIUsE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Mar 2023 15:48:04 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE83CEC4B;
        Thu,  9 Mar 2023 12:48:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 7EE07E9BDA;
        Thu,  9 Mar 2023 12:47:02 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OXiuXTj4O0Qt; Thu,  9 Mar 2023 12:47:01 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1678394821; bh=vHmsWeyl0kk2Tm1nDNXHTPcJ1b7xdBe80joYV/Ib/Zs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UJ4eOZ2V9C2WmLGKozPHozgoQscGsXK7q0usQIEmlEkW+vfEegnSOaVDY+trBLeKK
         113dUaudetAtjq2ofYkvSMpZQ5eVd1Cfhuyb/XKqza9JBCNnAQxN7IKqr3fSDmbGK0
         UjyB0X7X9jKMvFPiQ8fOpak3g6Ae+JkryT5NVZnHZXJipkGxTzbJmP/wJqGkp4z7za
         tXgpBn1+3q04u2xCgflnN3GLu64BUDpVfFRrT5eO30G0ZLMiYwWO4RhoGfOgJPiLZP
         oQFp4TK/y+4xhKWRqu3empK/kfTao77xv5DSrNn3YuBTKvSaj2FBBwm45nh2Lfgsmu
         7+2JnZ+Hy71aQ==
To:     robh@kernel.org, krzysztof.kozlowski@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     kernel@puri.sm, linux-imx@nxp.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 10/14] arm64: dts: imx8mq-librem5: Adjust proximity sensor's near levels
Date:   Thu,  9 Mar 2023 21:46:04 +0100
Message-Id: <20230309204608.237605-11-martin.kepplinger@puri.sm>
In-Reply-To: <20230309204608.237605-1-martin.kepplinger@puri.sm>
References: <20230309204608.237605-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Based on tests with my left ear (which appears to require lower levels
than the right one), one Birch, one Dogwood and three Evergreens.

It seems that the sensor reacts very weakly to hair, so let's make
the thresholds rather generous to compensate.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts
index 4f69eb32b1c90..2b3d437a642a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dts
@@ -23,5 +23,5 @@ &bq25895 {
 };
 
 &proximity {
-	proximity-near-level = <120>;
+	proximity-near-level = <50>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
index db81ed699de75..7fd0176e4bd30 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtsi
@@ -45,5 +45,5 @@ &magnetometer {
 };
 
 &proximity {
-	proximity-near-level = <25>;
+	proximity-near-level = <10>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
index 1056b7981bdbd..97577c0a77158 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts
@@ -23,5 +23,5 @@ &lcd_panel {
 };
 
 &proximity {
-	proximity-near-level = <10>;
+	proximity-near-level = <5>;
 };
-- 
2.30.2

