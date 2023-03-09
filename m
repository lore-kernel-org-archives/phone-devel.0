Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE804C7618D
	for <phone-devel@archiver.kernel.org>; Thu,  9 Mar 2023 20:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjCIUsf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjCIUsD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Mar 2023 15:48:03 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC3DF75C;
        Thu,  9 Mar 2023 12:48:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 4D85AE9BAB;
        Thu,  9 Mar 2023 12:46:59 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FUwib1rnwnHB; Thu,  9 Mar 2023 12:46:58 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1678394818; bh=lVGIU9lSpOGXhd93/MGHGMlj9wd+t6nKqZmTLFztnWI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jD+ztSxyuGi4t10yRTt9vEYQdNrn16f/GH1C4JIdKvX9+ljFh279UYZqd84HhNv+2
         gih7+qmXVI7m+XJgw1HtQ2Cp7lLbr6uvdrTHd279DZDYqtznjfrL1i8Wyl5BM6vVeo
         /iPFaK7FKmbGWQ3gIskmQTwOlBNoXNx685rMvjfxs215/TaHm+03cnSAIKtYy1sPNS
         S8tONPtaXA1Ka7VllaPvIwb0LEQqHGtD3fBg551+pPoseHxCcMeSDkOmCkKhyNODj/
         GOX3rohyMT7vfNS81j/Ohg4BHXjC+Lpi1agxInjzUraXdQGMn66tu3p3fBWzrAjkic
         t6rDV5zCn+WwA==
To:     robh@kernel.org, krzysztof.kozlowski@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     kernel@puri.sm, linux-imx@nxp.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 09/14] arm64: dts: imx8mq-librem5: Bump usdhc2 frequency to 100MHz
Date:   Thu,  9 Mar 2023 21:46:03 +0100
Message-Id: <20230309204608.237605-10-martin.kepplinger@puri.sm>
In-Reply-To: <20230309204608.237605-1-martin.kepplinger@puri.sm>
References: <20230309204608.237605-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

RS9116 card already limits itself to 50MHz by being a high-speed card,
while AP6275S can work at 100MHz just fine (technically it should work
at 200MHz as well since it's a SDR104 card, but it doesn't appear to be
the case in practice and further research will be needed to find out why).

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 7e470135b86a4..0b4b49fa1392a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1389,7 +1389,7 @@ &usdhc2 {
 	mmc-pwrseq = <&usdhc2_pwrseq>;
 	post-power-on-delay-ms = <1000>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
-	max-frequency = <50000000>;
+	max-frequency = <100000000>;
 	disable-wp;
 	cap-sdio-irq;
 	keep-power-in-suspend;
-- 
2.30.2

