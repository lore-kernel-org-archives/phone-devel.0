Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5E6C00528
	for <phone-devel@archiver.kernel.org>; Mon, 17 Jul 2023 10:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjGQKB2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Jul 2023 06:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjGQKBX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Jul 2023 06:01:23 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4E31A3
        for <phone-devel@vger.kernel.org>; Mon, 17 Jul 2023 03:01:15 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 2CDF1240103
        for <phone-devel@vger.kernel.org>; Mon, 17 Jul 2023 12:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1689588074; bh=3F+1udF6cjNhT/0WRGByrpnsyaf45dnt9+MaMVwaEgU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
         Content-Transfer-Encoding:From;
        b=EPbIRGWh8+pcM9nIU0hdQibPwJWDcnFebDji0XcHvARZcd0LAJQTIkB4O3oU+yvGp
         KL7JurYfBWQSZcExrK2GhAzfuDYVReF3c2m+yARXpP2OIRIQ4iALqGpwvb/eTUQKxb
         aFspqAD3b/QAhDu9bLAS+tg/DY+4Tgzd0sVn+/WvNBOMDXPuFWvsXMBd7re5QgDJY1
         /9DMp+gu7deYGVlbScFYPC6brBXN8O1mQbk0tKdtcAKPO+0Pm+73OPFQGgfR5+lcr+
         skwnSUJ+9/pN8ss1eYR7QCVvfe2fRo//WtGph+fzJxp/xcgIZi36l3xQw4OwJlMsIf
         RjmpmzEuY049w==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4R4HfJ43KCz6twc;
        Mon, 17 Jul 2023 12:01:12 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com, kernel@puri.sm,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 1/4] arm64: dts: imx8mq-librem5: set audio-1v8 always-on
Date:   Mon, 17 Jul 2023 10:00:53 +0000
Message-Id: <20230717100056.4047292-2-martink@posteo.de>
In-Reply-To: <20230717100056.4047292-1-martink@posteo.de>
References: <20230717100056.4047292-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Martin Kepplinger <martin.kepplinger@puri.sm>

Unfortunately the codec can't be switched off on it's own. It would ground
the whole bus it's connected to (because of it's built-in diodes to VDD on
i2c pins), making all the other devices on the same bus inaccessible:

[    0.237154] lm3692x 2-0036: Cannot read/clear faults: -11
[    0.242628] lm3692x 2-0036: Fail writing initialization values
[    0.286462] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517

Work around this hardware limitation by keeping audio-1v8 enabled.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 38732579d13e9..ab47bdc35cebd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -91,6 +91,7 @@ reg_aud_1v8: regulator-audio-1v8 {
 		regulator-max-microvolt = <1800000>;
 		gpio = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		regulator-always-on;
 	};
 
 	reg_mic_2v4: regulator-mic-2v4 {
-- 
2.30.2

