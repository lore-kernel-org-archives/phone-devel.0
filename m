Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D86C433EF
	for <phone-devel@archiver.kernel.org>; Fri,  1 Jul 2022 22:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiGAWzv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 1 Jul 2022 18:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbiGAWzv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 1 Jul 2022 18:55:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205ED71253
        for <phone-devel@vger.kernel.org>; Fri,  1 Jul 2022 15:55:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id k15so6106568lfv.11
        for <phone-devel@vger.kernel.org>; Fri, 01 Jul 2022 15:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RwS9AgxG63JCYrHzX4xNvhVBFt4HUTMhDv6L6o2UGWY=;
        b=uroPVn7hwTv9tBPCun9uFcc9Qs3S8B9HJyLgiT7WudhFd1wealpmEiX8hf3WiSAvs9
         W8dsLRIBgM9IxhNwRWDpf/A7kAOcLkMpYJQUP1aT8u/cJPhubtove5uWuj5zCd58oftz
         o1C3Pp/IawH8R15pxGGSpndpr1aK2U6zc9/zyz/c5pso02WYJab50NK2aJgG9gN9kkUC
         zeVL4BaUIUx0Eld/40Zfw5IswNL0QEfvf9nY5cYKeVQ2SL75sbMnV87+Z0B80wpYDjXB
         kAxkFm8QGeFUf2OXJTx3t9xgEHFwf7HSNvIknEQp47JmF5PEPF6GSMDgGVas+ZlaCuhq
         qShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RwS9AgxG63JCYrHzX4xNvhVBFt4HUTMhDv6L6o2UGWY=;
        b=6xmrTaPH/lTmrmTwQOBplMKsq2b189JVQwnSEnLcMKItO+fnMGrlWFCHFiS9wNgFZ0
         zhpA+OtVu+bRzV93DQiwAc24hZlgrhp1mcJ3vV21aBSWFA8maJpzedezB3azD9Fum8kA
         pMg4oru2635cFIcLMG5ePcJfbcjb5jq+BMfqdedBjknCX578jlX4hGcNFkHT0NneFBrp
         jdBCtxpLRYNSQ1doLF9+p4joVGUuiHz+iMTS+68F7ps7l67P8lCZcZdlD2k0wkd42Z0C
         y6zPQxhB8VBtgpUBPfglZWVEyDLc1rvsNAbwEpw5PEDlJsrs6yXC7Vaupdb8BqrEQAGB
         URoQ==
X-Gm-Message-State: AJIora9QJjaVzGBQE1PLL0S3UsYwZ/6aWWXLmMjk8bz4CMH+Oeg5HY2Z
        NC0dGlgb839c5MQyTP9pqVj06uoaVa2YSw==
X-Google-Smtp-Source: AGRyM1vEA66HbBacv7h2OHAux4g1MTodLY9hOqM7k+XeZqGW3kQAiG5s/qlUrHivQBDg0DhnEgGz/g==
X-Received: by 2002:a05:6512:3ba8:b0:47f:ae21:9d60 with SMTP id g40-20020a0565123ba800b0047fae219d60mr10591356lfv.366.1656716148467;
        Fri, 01 Jul 2022 15:55:48 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e82ca000000b0025c068f123dsm398554ljh.30.2022.07.01.15.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 15:55:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: ux500: Drop unused i2c power domain supply
Date:   Sat,  2 Jul 2022 00:53:39 +0200
Message-Id: <20220701225339.814962-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This regulator supply is replaced by the proper power
domain.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-dbx5x0.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/ste-dbx5x0.dtsi b/arch/arm/boot/dts/ste-dbx5x0.dtsi
index c28b32640254..9afe8301bd47 100644
--- a/arch/arm/boot/dts/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/ste-dbx5x0.dtsi
@@ -661,7 +661,6 @@ i2c0: i2c@80004000 {
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-			v-i2c-supply = <&db8500_vape_reg>;
 
 			clock-frequency = <400000>;
 			clocks = <&prcc_kclk 3 3>, <&prcc_pclk 3 3>;
@@ -679,7 +678,6 @@ i2c1: i2c@80122000 {
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-			v-i2c-supply = <&db8500_vape_reg>;
 
 			clock-frequency = <400000>;
 
@@ -698,7 +696,6 @@ i2c2: i2c@80128000 {
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-			v-i2c-supply = <&db8500_vape_reg>;
 
 			clock-frequency = <400000>;
 
@@ -717,7 +714,6 @@ i2c3: i2c@80110000 {
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-			v-i2c-supply = <&db8500_vape_reg>;
 
 			clock-frequency = <400000>;
 
@@ -736,7 +732,6 @@ i2c4: i2c@8012a000 {
 
 			#address-cells = <1>;
 			#size-cells = <0>;
-			v-i2c-supply = <&db8500_vape_reg>;
 
 			clock-frequency = <400000>;
 
-- 
2.36.1

