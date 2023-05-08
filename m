Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7208CC77B75
	for <phone-devel@archiver.kernel.org>; Mon,  8 May 2023 07:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbjEHHJn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 May 2023 03:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbjEHHJ0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 May 2023 03:09:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907612130
        for <phone-devel@vger.kernel.org>; Mon,  8 May 2023 00:09:03 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f00d41df22so27099533e87.1
        for <phone-devel@vger.kernel.org>; Mon, 08 May 2023 00:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683529697; x=1686121697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftyvbCgmWp8H2Qr0+yYXF7ju9jiJ+4pp3cSZzRUkdGQ=;
        b=O2ICGqfQOgrHHsf8HlKKcIEfwGOs64G1rpnfJAS/o7dPnN4ovfsNZUOwz6UJeMzk0e
         ko/oGWa9nEYqyO8uUWzxjFqYLp/uLyCOuubrqU9yEqNfD4Bx+1qzrWNFyYrVul10Ua/D
         Sq3J7DLhRfNo6JepbWGRX7VxV/T2qONb387FoU/M5k3y7440aB5/Br2jhbippkcesgVN
         ym7sEpw0p28gNrR7/S+Mc8XEjt7uy8E+gr2gGONEYtaBvyWBH5s6VyBXJkxdndWFdSBG
         y4/pEpo7NJyEfCQBHcQwz5UIl6jTzzoAooecwdwHf1pRLbO2Oi7TfOXXuMo/uqp/m9Go
         maHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683529697; x=1686121697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftyvbCgmWp8H2Qr0+yYXF7ju9jiJ+4pp3cSZzRUkdGQ=;
        b=gl2pJyXhFKbSbBGlaPmaJcm8chrnfd3X9K/rYGYH1/t9G7mWF7Gl6RNYMVp/TjrPD1
         /ImHtZl09grUm2RvyB1ZpeihwtfXnslWUmGtiLhzLphAVbWqMnzPRJ/XanAhidgkBqAc
         mhi4+XjZfC5nvCGEsK5+dgZZcTepbzzE18c5yuzUCWXCLDz4pDO60IxBp9Co4EnIHq2h
         aqdae+G6Oec93itXkrBKX4+szIAZl8m2AcfUNdB69xjhvZ07iSLI3q0/0KKr838nC6eO
         V0kwS5JnmUCAaWJihhkMSxZLgJnqQc91G9udOLl6iqAC4yB3piTwLN1uOmef7jUKccy7
         VwSA==
X-Gm-Message-State: AC+VfDwtpXUB/F4vtwnruEIc1m4sHdVTQb0zmqCF8OCc6Whlf40TDjRj
        shjkpzdT3nOBG6RlA7AFzzWL+g==
X-Google-Smtp-Source: ACHHUZ7Y0PWTKcGLWzfm2qG+pTVh9dQwDGjaJ31lOuLstjylZKCo5LFMAIanDeiAggqmtWM6/uOhZw==
X-Received: by 2002:a2e:8895:0:b0:295:9906:64e4 with SMTP id k21-20020a2e8895000000b00295990664e4mr2382433lji.2.1683529697410;
        Mon, 08 May 2023 00:08:17 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id w8-20020a2e9bc8000000b002a8b205bb50sm1050219ljj.61.2023.05.08.00.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 00:08:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Fix STMPE device nodes
Date:   Mon,  8 May 2023 09:08:11 +0200
Message-Id: <20230508070811.965762-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The STMPE device nodes need to be augmented to fit with current
naming policies.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-href-stuib.dtsi   |  5 ++---
 arch/arm/boot/dts/ste-nomadik-nhk15.dts | 16 +++++++---------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/ste-href-stuib.dtsi b/arch/arm/boot/dts/ste-href-stuib.dtsi
index e32d0c36feb8..79c2be36acae 100644
--- a/arch/arm/boot/dts/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/ste-href-stuib.dtsi
@@ -30,12 +30,11 @@ button@145 {
 
 	soc {
 		i2c@80004000 {
-			stmpe1601: stmpe1601@40 {
+			stmpe1601: port-expander@40 {
 				compatible = "st,stmpe1601";
 				reg = <0x40>;
 				interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
 				interrupt-parent = <&gpio6>;
-				interrupt-controller;
 				vcc-supply = <&db8500_vsmps2_reg>;
 				vio-supply = <&db8500_vsmps2_reg>;
 				pinctrl-names = "default";
@@ -44,7 +43,7 @@ stmpe1601: stmpe1601@40 {
 				wakeup-source;
 				st,autosleep-timeout = <1024>;
 
-				stmpe_keypad {
+				keyboard-controller {
 					compatible = "st,stmpe-keypad";
 
 					debounce-interval = <64>;
diff --git a/arch/arm/boot/dts/ste-nomadik-nhk15.dts b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
index 4d741adc16cd..1cba130dde8f 100644
--- a/arch/arm/boot/dts/ste-nomadik-nhk15.dts
+++ b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
@@ -99,17 +99,16 @@ lis3lv02dl@1d {
 			pinctrl-names = "default";
 			reg = <0x1d>;
 		};
-		stmpe0: stmpe2401@43 {
+		stmpe0: port-expander@43 {
 			compatible = "st,stmpe2401";
 			reg = <0x43>;
 			reset-gpios = <&gpio2 13 GPIO_ACTIVE_LOW>; // GPIO77
 			interrupts = <12 IRQ_TYPE_EDGE_FALLING>; // GPIO76
 			interrupt-parent = <&gpio2>;
-			interrupt-controller;
 			wakeup-source;
 			pinctrl-names = "default";
 			pinctrl-0 = <&stmpe2401_1_nhk_mode>;
-			stmpe_gpio43: stmpe_gpio {
+			stmpe_gpio43: gpio {
 				compatible = "st,stmpe-gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -118,7 +117,7 @@ stmpe_gpio43: stmpe_gpio {
 				/* Some pins in alternate functions */
 				st,norequest-mask = <0xf0f002>;
 			};
-			stmpe_keypad {
+			keyboard-controller {
 				compatible = "st,stmpe-keypad";
 				debounce-interval = <64>;
 				st,scan-count = <8>;
@@ -140,22 +139,21 @@ stmpe_keypad {
 						0x03020067 // Up
 						0x0303006c>; // Down
 			};
-			stmpe0_pwm: stmpe_pwm {
+			stmpe0_pwm: pwm {
 				compatible = "st,stmpe-pwm";
 				#pwm-cells = <2>;
 			};
 		};
-		stmpe1: stmpe2401@44 {
+		stmpe1: port-expander@44 {
 			compatible = "st,stmpe2401";
 			reg = <0x44>;
 			reset-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>; // GPIO79
 			interrupts = <14 IRQ_TYPE_EDGE_FALLING>; // GPIO78
 			interrupt-parent = <&gpio2>;
-			interrupt-controller;
 			wakeup-source;
 			pinctrl-names = "default";
 			pinctrl-0 = <&stmpe2401_2_nhk_mode>;
-			stmpe_gpio44: stmpe_gpio {
+			stmpe_gpio44: gpio {
 				compatible = "st,stmpe-gpio";
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -165,7 +163,7 @@ stmpe_gpio44: stmpe_gpio {
 				 * This will turn off SATA so that MMC/SD
 				 * can thrive
 				 */
-				mmcsd-gpio {
+				mmcsd-hog {
 					gpio-hog;
 					gpios = <2 0x0>;
 					output-low;
-- 
2.34.1

