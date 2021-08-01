Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2368FC4320A
	for <phone-devel@archiver.kernel.org>; Sun,  1 Aug 2021 23:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED131610A1
	for <phone-devel@archiver.kernel.org>; Sun,  1 Aug 2021 23:36:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbhHAXgd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Aug 2021 19:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbhHAXgd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Aug 2021 19:36:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE6DC0613D5
        for <phone-devel@vger.kernel.org>; Sun,  1 Aug 2021 16:36:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h14so30365471lfv.7
        for <phone-devel@vger.kernel.org>; Sun, 01 Aug 2021 16:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PxcJOqB8Emh6ZApElP9NMXBd63qsedgSttCi8Cf0T80=;
        b=Se6UJmfLcRDfGRP3SogtDS4EIg91kXvfDa7/RdppJbj/Tc6XdOua5eJ+rFPY+eGkeB
         fgmLAH/LK53xi2vmWxRqRNUPkM+zEhoyy2pmTBBN0783Oz6EnAwcvLQ57sjaR59tu7wP
         gpv7MYXLt66jtsTzfz55/aEkRi7AjoHzllPr77Sf6+zCRavj5ZR+velJOrTpwOzkRkiY
         yBQZjd7uvNCJvi2lk/hU5d/bPoKWJH6W1gyeHAI0T/3GjNBtjGUHdSTFBEhtErB1Tbxu
         fCJoPN+ZPR//UR77+FWx+Ay4XU3aZmg7DOgTor1dnaEjNpEiWk9sdeTydy67dINrojjy
         6QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PxcJOqB8Emh6ZApElP9NMXBd63qsedgSttCi8Cf0T80=;
        b=NlzBPgGJCXPEbko1MQKYeUtxm3hALLCzDa1KSoPUNMCmBlgCapRfOl8u3+RwFL7/KR
         BHb+6BvAWt+RN19Yjqi5lUe8mMeD5TK5i30TtlZOXsvshDomnP1ofljumVf4nxI1LMGI
         wSj91nA7P1R3Z3EI2kvZagm5OkJteG/cvAQb+oQ7YIda9B+Oj47w5gIMKSs7ttIR8PVE
         8erVmtUWR5p6cgeCr/zvTM079AD9gIdksGIvT/jurm+c/Rhi/UPKpGWa+Zn4dexEeiY9
         2bIgt3HHef2sHs6B+s3N7ZrpCYak/e29qbhoBTwP8KHsEpG4yRkpBkYlXFqs9t/JkatE
         RXdg==
X-Gm-Message-State: AOAM530x9i6mF7jHmJlgrSIZqd9rInaBYS3gLVSI669Hz558wGxo0CF2
        FqCkIpweaVLFeWUDJGqlygRTqA==
X-Google-Smtp-Source: ABdhPJzh/W0yR0ZDPqhUPiUDeChrr7DD/h5mGQ22zxO0jhjdMj8WPliDuhXioyA5pYtwYARwRyatYQ==
X-Received: by 2002:a05:6512:b12:: with SMTP id w18mr10854406lfu.266.1627860982011;
        Sun, 01 Aug 2021 16:36:22 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y17sm791046lfh.246.2021.08.01.16.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 16:36:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
Date:   Mon,  2 Aug 2021 01:33:14 +0200
Message-Id: <20210801233314.3150754-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801233314.3150754-1-linus.walleij@linaro.org>
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

There was an "unknown" firmware variant turning up in the wild
causing problems in the clock driver. Add this missing variant
and clarify that varian 11 and 15 are Samsung variants, as this
is now very well known from released products.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Clock maintainers: could you please ACK this so Lee can take
this into the MFD tree? The chances of merge collisions are
zero, this code changes very seldom.
---
 drivers/clk/ux500/u8500_of_clk.c | 3 ++-
 drivers/mfd/db8500-prcmu.c       | 6 ++++--
 include/linux/mfd/dbx500-prcmu.h | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index 0aedd42fad52..528c5bb397cc 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -99,10 +99,11 @@ static void u8500_clk_init(struct device_node *np)
 	if (fw_version != NULL) {
 		switch (fw_version->project) {
 		case PRCMU_FW_PROJECT_U8500_C2:
-		case PRCMU_FW_PROJECT_U8500_MBL:
+		case PRCMU_FW_PROJECT_U8500_SSG1:
 		case PRCMU_FW_PROJECT_U8520:
 		case PRCMU_FW_PROJECT_U8420:
 		case PRCMU_FW_PROJECT_U8420_SYSCLK:
+		case PRCMU_FW_PROJECT_U8500_SSG2:
 			sgaclk_parent = "soc0_pll";
 			break;
 		default:
diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index dea4e4e8bed5..ca1145f1a11a 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -2565,14 +2565,16 @@ static char *fw_project_name(u32 project)
 		return "U8500 C4";
 	case PRCMU_FW_PROJECT_U9500_MBL:
 		return "U9500 MBL";
-	case PRCMU_FW_PROJECT_U8500_MBL:
-		return "U8500 MBL";
+	case PRCMU_FW_PROJECT_U8500_SSG1:
+		return "U8500 Samsung 1";
 	case PRCMU_FW_PROJECT_U8500_MBL2:
 		return "U8500 MBL2";
 	case PRCMU_FW_PROJECT_U8520:
 		return "U8520 MBL";
 	case PRCMU_FW_PROJECT_U8420:
 		return "U8420";
+	case PRCMU_FW_PROJECT_U8500_SSG2:
+		return "U8500 Samsung 2";
 	case PRCMU_FW_PROJECT_U8420_SYSCLK:
 		return "U8420-sysclk";
 	case PRCMU_FW_PROJECT_U9540:
diff --git a/include/linux/mfd/dbx500-prcmu.h b/include/linux/mfd/dbx500-prcmu.h
index e6ee2ec35de9..cbf9d7619493 100644
--- a/include/linux/mfd/dbx500-prcmu.h
+++ b/include/linux/mfd/dbx500-prcmu.h
@@ -186,10 +186,11 @@ enum ddr_pwrst {
 #define PRCMU_FW_PROJECT_U8500_C3	8
 #define PRCMU_FW_PROJECT_U8500_C4	9
 #define PRCMU_FW_PROJECT_U9500_MBL	10
-#define PRCMU_FW_PROJECT_U8500_MBL	11 /* Customer specific */
+#define PRCMU_FW_PROJECT_U8500_SSG1	11 /* Samsung specific */
 #define PRCMU_FW_PROJECT_U8500_MBL2	12 /* Customer specific */
 #define PRCMU_FW_PROJECT_U8520		13
 #define PRCMU_FW_PROJECT_U8420		14
+#define PRCMU_FW_PROJECT_U8500_SSG2	15 /* Samsung specific */
 #define PRCMU_FW_PROJECT_U8420_SYSCLK	17
 #define PRCMU_FW_PROJECT_A9420		20
 /* [32..63] 9540 and derivatives */
-- 
2.31.1

