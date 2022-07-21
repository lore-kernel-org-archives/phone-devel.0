Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE26C433EF
	for <phone-devel@archiver.kernel.org>; Thu, 21 Jul 2022 15:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbiGUPm2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 21 Jul 2022 11:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbiGUPls (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 21 Jul 2022 11:41:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DDA89E98
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 08:38:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id q7so2250623lji.12
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImwIGwpt7cCeVeo6/tB0/NFkI/v/+EzFEZB4ORoW/Y0=;
        b=KC/v5ly6ZyJv8FYlRb/Cllr3uusoyAgKYMKdeFxWgb0E8a2/AK4N0PQpzEOUKwarLp
         ZrB4F34GS+t03G6+510d9SvBHh9Id98R637d+STZxuvjfjzXYdUNWE3Wneb6adm34Yyv
         eVH3MF7kIpuYTbZiY0grf8li8+OqB3mFQ82w4cGYDy3zi/Nttb9/ml3wEzZdMiDD3iDo
         rSi2QNZ2Bb/RMgetrVroTRYrfzwhDafl/Cpbw8dl6283XRzuNNV1RzmJNE347szCYuug
         DTeYuTKXdoIF0qfmAmPzHrFhtqUdGER22TWt1ect+7gsnkRjTzAgY+klc7a5vvzpWYET
         ItjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ImwIGwpt7cCeVeo6/tB0/NFkI/v/+EzFEZB4ORoW/Y0=;
        b=jJY4fbTzPQK2nXGrjZf+yP7EYyKU3rg30n9tYnf+lFmzK815rN/rIZGTMS103NOIsA
         l2pLAUho2ATF4h8e++CuenBm429Uqv8n05aFwO3gIAgsaJOkzNPERkloRxxy5P7D2WSV
         PfxlMlDe3eHe04PUvT9LtjdOJFlG1bVO2i0eNZT9VKSkFTE30NHrQDIxNbCpLPLXCLRQ
         Wt1uoRuspaWYzGJZxytnEqsqNeMc2SEYHvS+QgT+dhqmgSWghd6Dkv4eYin7bpReymvU
         Ih3sr9Tfp0uDaI32B4xGUyq3myOt7Z47XLeg1yvR/KATakfvSKn5g3aSE++3Dxypl7s5
         EggQ==
X-Gm-Message-State: AJIora/t7D3YuZBhbuXUn0kGFt0ilWtoN6x+lQTKHm0BwCXkiveof69s
        FpBNAxuBNlRawjbrx6MwB+w2Jw==
X-Google-Smtp-Source: AGRyM1sFV8ncsSFOG+R/NCiYPt4AHW6Op64p0IkwCvDNKDuB6FCNjd6Y3J8QUvcxe9opyRhEcRQstw==
X-Received: by 2002:a2e:a4ba:0:b0:25d:d8b4:2c60 with SMTP id g26-20020a2ea4ba000000b0025dd8b42c60mr2943654ljm.246.1658417893333;
        Thu, 21 Jul 2022 08:38:13 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e5354000000b0025deb16828esm112457ljd.76.2022.07.21.08.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:38:12 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: DBx500 cryp and hash used power domain
Date:   Thu, 21 Jul 2022 17:36:10 +0200
Message-Id: <20220721153610.1053845-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The cryp and hash blocks of the DBx500 uses the VAPE power domain,
the special regulator is a leftover that is not used anymore.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index c28b32640254..d2a38cb8b487 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -1154,17 +1154,15 @@ cryp@a03cb000 {
 			compatible = "stericsson,ux500-cryp";
 			reg = <0xa03cb000 0x1000>;
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-
-			v-ape-supply = <&db8500_vape_reg>;
 			clocks = <&prcc_pclk 6 1>;
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 
 		hash@a03c2000 {
 			compatible = "stericsson,ux500-hash";
 			reg = <0xa03c2000 0x1000>;
-
-			v-ape-supply = <&db8500_vape_reg>;
 			clocks = <&prcc_pclk 6 2>;
+			power-domains = <&pm_domains DOMAIN_VAPE>;
 		};
 	};
 };
-- 
2.36.1

