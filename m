Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176A3C4338F
	for <phone-devel@archiver.kernel.org>; Sun,  1 Aug 2021 23:39:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC36260527
	for <phone-devel@archiver.kernel.org>; Sun,  1 Aug 2021 23:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhHAXjj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Aug 2021 19:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhHAXjj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Aug 2021 19:39:39 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72527C06175F
        for <phone-devel@vger.kernel.org>; Sun,  1 Aug 2021 16:39:29 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b21so21547340ljo.13
        for <phone-devel@vger.kernel.org>; Sun, 01 Aug 2021 16:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iUh8cXI6uOTIdcu1NxR0ITaTMaVL7+6HMSOjxLfYI8=;
        b=P4PgaBXQEyFzUP+OKh7PPXb65Oid6wQwdm4V5tzTPg5+bm5LqKwvElc8lSRg6Kw/0N
         N56irtha13nFPWea0J7v4mKpi+Mp7wU6mSimjugEkYkEDMaBvdtBx1dVo1Fn9soWk1Q7
         kqPqqY5YRPU14DR/92g9RUtihMfqPhKPkh0GVxD/TA7wDoqqAx10KJe1V/JNWZ5x9n8w
         wUUaecNA6D+22rhQ92LJMOYqieK1AfbMOFXWhEty/9ievt3NZ7kRTZ6uiLtAUuHeAQBb
         vggpsWFGPZGcguveBFziuGSe7dziJKFwA6yx7r/2TIocycT3soU/5RUcDCY4pWzejkiQ
         JBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0iUh8cXI6uOTIdcu1NxR0ITaTMaVL7+6HMSOjxLfYI8=;
        b=N70nW2q14JALckv0mbklpcfy87O6MXYIBB5Hi922zL73hwAQBj3GjhZ8z5K2L8ldYZ
         cCJlMSDM7yY/8rNL4yKsmFXgFxh1eKtb64XlmRVKaNgsqWObc3dhJzpz8LcL+M6ebgMb
         ey/UXGW62B61NOc6Vuv+bql741iC+jAyvK57lrpEBUHtgO/I8/nXEdjENK5dvwUhmA/i
         n01HTg22OlSYxW5HdgWmIpoCnl0vpw6iSWa/9/CitENVYc7Wz+0YC2axx8TxayQD0Ty8
         I2RIenyRLEi65FnXvbR0cyT2xMls04n+ia6HWxfsmsl4DzVtdNk8WVZB4WQEghdn03WM
         tRTA==
X-Gm-Message-State: AOAM5302Z7Bv8rLxt9oKzT/8bbliqk4XfSiUBnZ1pA78fDZ2kXS0lbPO
        6xJIkkxnuC/dQxS1CMtKeKrjuxdAK2ODzg==
X-Google-Smtp-Source: ABdhPJzEcdPV8Yp7qV+ASf50FYWGJONQc2Xupe6Usr6LiqWqv/UKoUKkbgfP0Hc/Ai83un8wTtXI2w==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr9555975ljc.157.1627861167805;
        Sun, 01 Aug 2021 16:39:27 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id d8sm709387ljg.86.2021.08.01.16.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 16:39:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: ux500: Adjust operating points to reality
Date:   Mon,  2 Aug 2021 01:37:22 +0200
Message-Id: <20210801233722.3151047-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The operating points should correspond to the actual frequencies
supported for the CPU. Other patches have fixed so these are
rounded and reported properly, this fixes the device trees to
match.

The Codina variant has a lower frequency than other devices so
indicate this in the device tree.

Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-db8500.dtsi              |  7 +++----
 arch/arm/boot/dts/ste-db8520.dtsi              |  7 +++----
 arch/arm/boot/dts/ste-db9500.dtsi              |  9 ++++-----
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts | 12 ++++++++++++
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/ste-db8500.dtsi b/arch/arm/boot/dts/ste-db8500.dtsi
index 344d29853bf7..b5b8ba9be55e 100644
--- a/arch/arm/boot/dts/ste-db8500.dtsi
+++ b/arch/arm/boot/dts/ste-db8500.dtsi
@@ -5,11 +5,10 @@
 / {
 	cpus {
 		cpu@300 {
-			/* cpufreq controls */
 			operating-points = <998400 0
-					    800000 0
-					    400000 0
-					    200000 0>;
+					    798720 0
+					    399360 0
+					    199680 0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-db8520.dtsi b/arch/arm/boot/dts/ste-db8520.dtsi
index 287804e9e183..0c277a6d1914 100644
--- a/arch/arm/boot/dts/ste-db8520.dtsi
+++ b/arch/arm/boot/dts/ste-db8520.dtsi
@@ -5,11 +5,10 @@
 / {
 	cpus {
 		cpu@300 {
-			/* cpufreq controls */
 			operating-points = <1152000 0
-					    800000 0
-					    400000 0
-					    200000 0>;
+					    798720 0
+					    399360 0
+					    199680 0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-db9500.dtsi b/arch/arm/boot/dts/ste-db9500.dtsi
index 0afff703191c..4273d36e881d 100644
--- a/arch/arm/boot/dts/ste-db9500.dtsi
+++ b/arch/arm/boot/dts/ste-db9500.dtsi
@@ -5,11 +5,10 @@
 / {
 	cpus {
 		cpu@300 {
-			/* cpufreq controls */
-			operating-points = <1152000 0
-					    800000 0
-					    400000 0
-					    200000 0>;
+			operating-points = <998400 0
+					    798720 0
+					    399360 0
+					    199680 0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
index ba7986988e87..952606e607ed 100644
--- a/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/ste-ux500-samsung-codina.dts
@@ -27,6 +27,18 @@ / {
 	model = "Samsung Galaxy Ace 2 (GT-I8160)";
 	compatible = "samsung,codina", "st-ericsson,u8500";
 
+	cpus {
+		cpu@300 {
+			/*
+			 * This has a frequency cap at ~800 MHz in the firmware.
+			 * (Changing this number here will not overclock it.)
+			 */
+			operating-points = <798720 0
+					    399360 0
+					    199680 0>;
+		};
+	};
+
 	chosen {
 		stdout-path = &serial2;
 	};
-- 
2.31.1

