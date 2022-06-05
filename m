Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C82AC43334
	for <phone-devel@archiver.kernel.org>; Sun,  5 Jun 2022 07:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbiFEHyC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 5 Jun 2022 03:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244537AbiFEHyB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 5 Jun 2022 03:54:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E351563AA
        for <phone-devel@vger.kernel.org>; Sun,  5 Jun 2022 00:53:58 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a2so18917899lfc.2
        for <phone-devel@vger.kernel.org>; Sun, 05 Jun 2022 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xO+O9ZfsoZV6arP3yMrBDPTYUfpqfjUlpuOIkVjXz5g=;
        b=qsXXK4fSkiYwkWT9kU0G/gDQPh3HN2hc+pUySRcHLlunIzasM/XXzBa70gJCF+b10w
         ohyZsx50ywy1FQSkNTWoXq5hTYoy3iByTa3GtZDLg4xNJIzf6IXlo/VG8jIYmBNrrEaO
         yT9ZAcZtrTjob2qLsctpe35G4x7pLobj2HkUEGDZfQdMdPtvxm/9OH0SBbRNzyS4041n
         y37bOXNhTki9xYxAfqG5U8jhzfyY4JsZ3z3Y9z7zIenvo0nnLH27BEujiqVdfCS5rQMW
         wS/U6vZiBhxH2DNHKzac8wHfLz7KgkNrmhXr4wS7rMaCls7kExLV/ftEYr6KEJxYDb1C
         cdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xO+O9ZfsoZV6arP3yMrBDPTYUfpqfjUlpuOIkVjXz5g=;
        b=X2Tfe+QA6Bk6Mbq4JntgZrMBb3kTx5lodm2S+OpN/Qvu3UZcQjOVoaqc99idJw+xbW
         wHDWYmxRcBOTp6lqWs6fGY+ebPmKojvcraqqckjY2MBf1grUTWQ2lMlnnFGBYtyypWmB
         UiTDBJl7ZadKr5srCeCCKnECnTBhQ0Mr/0QPW2paHp3lfPYjyBmeTS10zt4fg4uoa/gf
         +6vP+tCuVeO+yuE09N5+Mt/6mK3qZHrcKbGlg9odHyw7xmLA7GWyL/zXzdqA2PH8sRNi
         rmACC3CCZOT3qRYN7rj30aHJNPQXu7xDMvTNAXWRnvskiRTgvL3cLQy/YxYgCOGRi6Al
         SQeA==
X-Gm-Message-State: AOAM531psUnpb2tUAx6uiiDCN/ECLVFPP8UIDCycx8eHjgC70vvsLGZ3
        aJ3K5sZ8FOsaoCL5L4Lm+e+nNQ==
X-Google-Smtp-Source: ABdhPJwg5U3gmd4LRPq/OUdmwfWrqsA4tu0mkR56yHLHiUZcWyVlkTPOVYD0L8rC1mTzqso8Gvs2qA==
X-Received: by 2002:a05:6512:b93:b0:479:1d41:c960 with SMTP id b19-20020a0565120b9300b004791d41c960mr6289046lfv.78.1654415637243;
        Sun, 05 Jun 2022 00:53:57 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id d1-20020ac244c1000000b00478f782d045sm2386801lfm.174.2022.06.05.00.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 00:53:56 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Hansson <newbyte@disroot.org>
Subject: [PATCH] ARM: dts: ux500: Fix up the Janice NFC chip
Date:   Sun,  5 Jun 2022 09:51:53 +0200
Message-Id: <20220605075153.112359-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The NFC chip in Janice is a PNX544 not PNX547 and it is on
I2C address 0x2b. Fix it up. This is only mounted in Janice
models designated GT-I9070P.

Cc: Stefan Hansson <newbyte@disroot.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
index b0a5b36593cc..d097d5701894 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
@@ -378,9 +378,13 @@ i2c-gpio-3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		nfc@30 {
-			compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
-			reg = <0x30>;
+		/* This is only mounted on the GT-I9070P */
+		nfc@2b { /* 0x30? */
+			/* NXP NFC circuit PN544 C1 marked NXP 44501  */
+			compatible = "nxp,pn544-i2c";
+			/* IF0, IF1 high, gives I2C address 0x2B */
+			reg = <0x2b>;
+			clock-frequency = <400000>;
 			/* NFC IRQ on GPIO32 */
 			interrupt-parent = <&gpio1>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
@@ -389,7 +393,7 @@ nfc@30 {
 			/* GPIO88 */
 			enable-gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
 			pinctrl-names = "default";
-			pinctrl-0 = <&pn547_janice_default>;
+			pinctrl-0 = <&pn544_janice_default>;
 		};
 	};
 
@@ -964,7 +968,7 @@ janice_cfg1 {
 		};
 	};
 	nfc {
-		pn547_janice_default: pn547_janice {
+		pn544_janice_default: pn544_janice {
 			/* Interrupt line */
 			janice_cfg1 {
 				pins = "GPIO32_V2";
-- 
2.36.1

