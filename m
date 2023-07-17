Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BF0C001E0
	for <phone-devel@archiver.kernel.org>; Mon, 17 Jul 2023 10:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjGQKBe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Jul 2023 06:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjGQKB0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Jul 2023 06:01:26 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDC210DF
        for <phone-devel@vger.kernel.org>; Mon, 17 Jul 2023 03:01:20 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 54E4D24002E
        for <phone-devel@vger.kernel.org>; Mon, 17 Jul 2023 12:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1689588079; bh=T9HVwP+zel2OrTfBZon8ZQ3bTW0P6nUFFyAK92/ZpSM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
         Content-Transfer-Encoding:From;
        b=bKx9bU8yECOmaTFy5+usgdOCQoq0QRtIFy157sc9djgGgSim5HlmLVDFqEwbPrWc/
         e99o6Esvdw0rN+s/ejw8NtTSlJNlXlr0skhnmwEY/TxkMlea9yq4JU0jamfK/QDX5d
         EtitHzdE0b+4LErWz9TYNCqYsH+Nuq960pLfubmxaI78PAxDWVQA5OE39N8xVBIHlp
         wFdQEWV692HsTtzlsO6emduhvaQyiDgbjnsYjgzzGl1G83aNdVt2fgxmm9ZoQT/5SM
         Jk14TqF+9KY0fByIkWANUg8DxqW48v2+CjHW3AAkGqLxiKxeBs1W3/t5MbMjUrOUBi
         jkM02M92o6WfQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4R4HfN6Hqpz6twY;
        Mon, 17 Jul 2023 12:01:16 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com, kernel@puri.sm,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 4/4] arm64: dts: imx8mq-librem5: Reduce usdhc2's post-power-on-delay-ms to 20ms
Date:   Mon, 17 Jul 2023 10:00:56 +0000
Message-Id: <20230717100056.4047292-5-martink@posteo.de>
In-Reply-To: <20230717100056.4047292-1-martink@posteo.de>
References: <20230717100056.4047292-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

This appears to be enough for both Redpine and SparkLAN cards.
Waiting for too long makes us waste time in resume from system
suspend, so let's keep it as short as possible.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 3f251910b3949..e329c29f3f1c6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1394,7 +1394,7 @@ &usdhc2 {
 	bus-width = <4>;
 	vmmc-supply = <&reg_wifi_3v3>;
 	mmc-pwrseq = <&usdhc2_pwrseq>;
-	post-power-on-delay-ms = <1000>;
+	post-power-on-delay-ms = <20>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	max-frequency = <100000000>;
 	disable-wp;
-- 
2.30.2

