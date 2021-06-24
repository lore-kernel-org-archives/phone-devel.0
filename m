Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAF9C48BDF
	for <phone-devel@archiver.kernel.org>; Thu, 24 Jun 2021 09:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 469D4613E8
	for <phone-devel@archiver.kernel.org>; Thu, 24 Jun 2021 09:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhFXJXx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 24 Jun 2021 05:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbhFXJXw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 24 Jun 2021 05:23:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13581C061574
        for <phone-devel@vger.kernel.org>; Thu, 24 Jun 2021 02:21:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u13so9142103lfk.2
        for <phone-devel@vger.kernel.org>; Thu, 24 Jun 2021 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6RIyDcmGqTmknHlsfggfViJDQwxYX2CfokP2z1KvMM=;
        b=xdg/nSsGe432fOe8Ai2SGyHYCrrejbeug7TfMF7qPsZL4SA7s7TeHlfQNT2GL6UdHJ
         lXAHjSO9SpNAX4cxslA5/xON1SRqGwMsyPe2LaT6iwUk5V23Nlj2tP3RWz7/WMt51b9Y
         kkfYlwsb5SqZI3Vl5/AAC8WQctYDWLOItgbrIuIQ/4hnuIRWP0CRXmf1/YZH6fBYtf4G
         TGdRipEGuFbYWTsmAi0zKjYLcCuAsvhd2TmC0FRl9u0h8U8XrITaIilAfxN2L+2Xa5cj
         D0dXhSy0EQDgUcuEig2SOJj1gtY+z4eVmTwq37jaDIHdWXIf/UNndwJieyXlSAdeeAn4
         w4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6RIyDcmGqTmknHlsfggfViJDQwxYX2CfokP2z1KvMM=;
        b=X6LCnRC3SFy2cd1Nip6gWwldRNvLYuD0trESL+6EVYCwFb96YLIzhTfzRtALTMKb+q
         wkW1mY/MXGtNrMT219e71mOLCbScq7Hpes/TuBB20GupodCDDJ1GIYueMHnHwX6dlBCd
         gitPzx23PA/xbOMpah80KYGdmyfd3GC0jpgStSUlyr26xVrd5RJ8C8DOZEVAmQQQhCki
         wV2D76NxPCuYdJdttOdywU3CsEr++VsLUsbJj14CojVJiCrK0C3XFupr3xv9KV5XngG4
         KNTTn2Nylxz3QaBTljXNrDFisNsH2pCBdfZBd3J6DHwsJ5YN69laXY8pSaSaWFXfzGaM
         TRtA==
X-Gm-Message-State: AOAM532xt51tM2xYjmgXQeFlSDZJLRFbpkCkhYcLxPOcquZcLpKIismj
        nJtzvQAOqSRDI3yzcjpAms4O/69ffxIGkw==
X-Google-Smtp-Source: ABdhPJwde+OkqIUgXmior+e7Ngwlr3zOfDsB5zAY5POf+uW7JvZtlsVgQ2bW02vIQguH2W+hgRYl3g==
X-Received: by 2002:a05:6512:20c5:: with SMTP id u5mr3267478lfr.344.1624526490338;
        Thu, 24 Jun 2021 02:21:30 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id a4sm112429lfr.210.2021.06.24.02.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 02:21:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Flag eMMCs as non-SDIO/SD
Date:   Thu, 24 Jun 2021 11:19:27 +0200
Message-Id: <20210624091927.2432809-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

We use the no-sdio and no-sd flags to indicate that these eMMCs
are neither, so that the operating system can skip trying to
identify them as SDIO or SD during boot, which just takes time.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-href.dtsi                | 4 ++++
 arch/arm/boot/dts/ste-snowball.dts             | 2 ++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 2 ++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 2 ++
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 2 ++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 2 ++
 6 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/ste-href.dtsi b/arch/arm/boot/dts/ste-href.dtsi
index 7566b4963ef6..9c37af433400 100644
--- a/arch/arm/boot/dts/ste-href.dtsi
+++ b/arch/arm/boot/dts/ste-href.dtsi
@@ -156,6 +156,8 @@ mmc@80005000 {
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			non-removable;
+			no-sdio;
+			no-sd;
 			vmmc-supply = <&db8500_vsmps2_reg>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc2_a_1_default>;
@@ -171,6 +173,8 @@ mmc@80114000 {
 			bus-width = <8>;
 			cap-mmc-highspeed;
 			non-removable;
+			no-sdio;
+			no-sd;
 			vmmc-supply = <&ab8500_ldo_aux2_reg>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc4_a_1_default>;
diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index 40f1d7c9c1d4..934fc788fe1d 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -267,6 +267,8 @@ mmc@80114000 {
 		        max-frequency = <100000000>;
 			bus-width = <8>;
 			cap-mmc-highspeed;
+			no-sdio;
+			no-sd;
 			vmmc-supply = <&ab8500_ldo_aux2_reg>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc4_a_1_default>;
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
index 251a393f8528..fabc390ccb0c 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-gavini.dts
@@ -378,6 +378,8 @@ mmc@80005000 {
 			non-removable;
 			cap-mmc-highspeed;
 			mmc-ddr-1_8v;
+			no-sdio;
+			no-sd;
 			vmmc-supply = <&ldo_3v3_reg>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc2_a_1_default>;
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
index 40df7c61bf69..ee6379ab688c 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-golden.dts
@@ -145,6 +145,8 @@ mmc@80005000 {
 			non-removable;
 			cap-mmc-highspeed;
 			mmc-ddr-1_8v;
+			no-sdio;
+			no-sd;
 
 			vmmc-supply = <&vmem_3v3>;
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
index 25af066f6f3a..a0e87046f1da 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-janice.dts
@@ -420,6 +420,8 @@ mmc@80005000 {
 			non-removable;
 			cap-mmc-highspeed;
 			mmc-ddr-1_8v;
+			no-sdio;
+			no-sd;
 			vmmc-supply = <&ldo_3v3_reg>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc2_a_1_default>;
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
index 94afd7a0fe1f..264f3e9b5fce 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-skomer.dts
@@ -230,6 +230,8 @@ mmc@80005000 {
 			non-removable;
 			cap-mmc-highspeed;
 			mmc-ddr-1_8v;
+			no-sdio;
+			no-sd;
 			vmmc-supply = <&ldo_3v3_reg>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc2_a_1_default>;
-- 
2.31.1

