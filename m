Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14A4C00140
	for <phone-devel@archiver.kernel.org>; Mon, 15 Aug 2022 22:03:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346853AbiHOWDA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 15 Aug 2022 18:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350437AbiHOWCI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 15 Aug 2022 18:02:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC6761DA5
        for <phone-devel@vger.kernel.org>; Mon, 15 Aug 2022 12:36:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e15so11992819lfs.0
        for <phone-devel@vger.kernel.org>; Mon, 15 Aug 2022 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=vj0QtxQl2wYc3pmInel0DHg3Q9mzk0ga503ZMcWAjDo=;
        b=aEk9vcmMD9MwlyziSssdSIhKZn9DISLVEqGyl+WjgwSv/f7eEx5XFEB/Kxz86ihfrV
         jATfhiknP2uLQ9X3g4hLXCSU471tdGusdTzIOG7Y0DlGe/zRR2rAfvM6db++kB1t55nK
         95bV3NCWyA1EUW0J0vRAuGBr4Varl/ucJSfWF9Hp3DP0QVAHaYJmlkQDArKz6RM6Nuen
         rXZy0bJRKwm9hmd9uLAlBNHWl4V6ERnTeYjeX3DbY4xDKXd9aDDs6fMkFwbNazBa7+Zz
         MpcD7+rttA5ezlyAPrGcZT7DqAvD0ElSPtwuJlCiBYoHLFq7Dj8lKF3Xsph6XPX9yiL8
         q1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=vj0QtxQl2wYc3pmInel0DHg3Q9mzk0ga503ZMcWAjDo=;
        b=2o2E5G0CjgzKjW/20+gdlH6xUi4VW34ODMfuCJsuXSG247FZ+RfwDUHsJZ9dJ9MFWl
         anHuTMRP3HyRqF5Y8JdACqmS1q6iPE4op3bamF6ZwqD4PI7+z/UejhCYIjNRdjAsyZV4
         cmjftwQ073dm2gr2JreGtMNJjyPnqQA/SdI5Ts9dYUmspJtt7okI7HoFMFpFudF1iug1
         wU6tORdGslqDDSdyBtkQfE2G7gp5iuHbgdrnc3duqUXw6mMIWZAop/VzYhPVp9BzdOTU
         xgW4HxlmdiCPOQEyUz1ap/LJBNzcFZuqAzu7NAOG6vhoD1VtMHecIcGmtSM/EHp+yx3F
         EWUw==
X-Gm-Message-State: ACgBeo0SWpaOs43PFzKDwB7ws08Ybugd4q3XT8WkHZzGPwp4Rsv7+y9s
        VTQF7NXlRVRe5giKfMdaDNpZ9w==
X-Google-Smtp-Source: AA6agR4H6mvowRYmTIEvQn+SKoDCHeCIX5gz/g+wlgkHZhqIkZKVF/sT7IGjS3iXBSmEk0fjqTGo4Q==
X-Received: by 2002:a05:6512:239f:b0:491:cd95:f67d with SMTP id c31-20020a056512239f00b00491cd95f67dmr3344318lfv.184.1660592205147;
        Mon, 15 Aug 2022 12:36:45 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id h6-20020a2ea486000000b0025e57b40009sm1515179lji.89.2022.08.15.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 12:36:44 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stefan Hansson <newbyte@disroot.org>
Subject: [PATCH] ARM: dts: ux500: Fix up the Janice NFC chip
Date:   Mon, 15 Aug 2022 21:34:40 +0200
Message-Id: <20220815193440.388695-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.1
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
index af645a6ad1aa..f80111b89b8b 100644
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
2.37.1

