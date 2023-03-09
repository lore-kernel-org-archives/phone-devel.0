Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABDEC74A5B
	for <phone-devel@archiver.kernel.org>; Thu,  9 Mar 2023 20:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCIUsY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjCIUrr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Mar 2023 15:47:47 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12F4FFBE9;
        Thu,  9 Mar 2023 12:47:27 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 9D76AE9A1F;
        Thu,  9 Mar 2023 12:46:46 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id rWUwUyYcajOu; Thu,  9 Mar 2023 12:46:46 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1678394805; bh=dJJ+nn2vsU1mmA2UOr8UyD470EUzf8JlUI5IdZnaFSk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FyvuT+wUh1J3jNZqsaBKH0/aAMb077EpTmox6yrTLcNSgKvwh9xJ5BnclSIsrX1qE
         l6CBjywUqWaItmPIUJjdWhJXoIlAOG4+0x0UhiFLa9iSmEzEjVIdMWK+JKYjRtEkDb
         sxfydkADr5Xx8VqDnw3jSo7vL9CxpkR5ZXzpb7AO9hHQkOkUoj0S4hjQpzbuZnfyug
         wt97FgA/S7OqAJNTzHZ5Qotclz6jvt7bUUz3ZKs2n5nBumKywM9IHRDr7aeQonkYR0
         n1a44Yy4njiHluegxFgyJ5unZc0rw/26wMTGb7/l+ue8BR5yURqcgCNBpPE/Zn4lCv
         dtomMjPyf7IJg==
To:     robh@kernel.org, krzysztof.kozlowski@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     kernel@puri.sm, linux-imx@nxp.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 05/14] arm64: dts: imx8mq-librem5: add brightness levels to led-backlight
Date:   Thu,  9 Mar 2023 21:45:59 +0100
Message-Id: <20230309204608.237605-6-martin.kepplinger@puri.sm>
In-Reply-To: <20230309204608.237605-1-martin.kepplinger@puri.sm>
References: <20230309204608.237605-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add brightness-levels and default-brightness-level properties to
the librem5 board description that have been used for a long time.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 9f374da5c18aa..f8698b6995343 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -20,6 +20,8 @@ / {
 	backlight_dsi: backlight-dsi {
 		compatible = "led-backlight";
 		leds = <&led_backlight>;
+		brightness-levels = <255>;
+		default-brightness-level = <190>;
 	};
 
 	pmic_osc: clock-pmic {
-- 
2.30.2

