Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1490C43217
	for <phone-devel@archiver.kernel.org>; Sat, 11 Sep 2021 13:12:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3CAF611BF
	for <phone-devel@archiver.kernel.org>; Sat, 11 Sep 2021 13:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbhIKNNJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 11 Sep 2021 09:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:36640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235850AbhIKNNG (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Sat, 11 Sep 2021 09:13:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C79D61153;
        Sat, 11 Sep 2021 13:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631365914;
        bh=r9bKAP/Db2Ctbq5jkaSZAU9PRMN3GIB1qKROsvayfJs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MhvjZvD7qxL4tIWK2J52eJ4C+dknw4GBJ1ei43NXWq7i6C9/MBMurdFjN8KU7lXgH
         B4iwbqOvDRPGgQrb+EboVBTAR/uJZqfrsEk0JajICbwByIiup2kPCCcpwFDhoVFeOQ
         KPQb+kQXUo30GLr121B9neM89Z/WDxOUCMuC/JDMqAzXLCAFarLVSh+XJzNDRiuBuB
         NEdhTGjyaus0bsA5dji455quKi9FPjNHZFyxt85G3vBYSX+klQvkSXJUuPUKkR7kfw
         OFGbdDb0K8DMjWRpy0s6BvWqZLTfv/CL8bypAh+qIzIVmPANcwCd5cYMy7V59xQsTb
         LkLXcR2esGZvw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 03/32] mfd: db8500-prcmu: Adjust map to reality
Date:   Sat, 11 Sep 2021 09:11:20 -0400
Message-Id: <20210911131149.284397-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210911131149.284397-1-sashal@kernel.org>
References: <20210911131149.284397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit ec343111c056ec3847800302f6dbc57281f833fa ]

These are the actual frequencies reported by the PLL, so let's
report these. The roundoffs are inappropriate, we should round
to the frequency that the clock will later report.

Drop some whitespace at the same time.

Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mfd/db8500-prcmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu.c b/drivers/mfd/db8500-prcmu.c
index 3bde7fda755f..dea4e4e8bed5 100644
--- a/drivers/mfd/db8500-prcmu.c
+++ b/drivers/mfd/db8500-prcmu.c
@@ -1622,22 +1622,20 @@ static long round_clock_rate(u8 clock, unsigned long rate)
 }
 
 static const unsigned long db8500_armss_freqs[] = {
-	200000000,
-	400000000,
-	800000000,
+	199680000,
+	399360000,
+	798720000,
 	998400000
 };
 
 /* The DB8520 has slightly higher ARMSS max frequency */
 static const unsigned long db8520_armss_freqs[] = {
-	200000000,
-	400000000,
-	800000000,
+	199680000,
+	399360000,
+	798720000,
 	1152000000
 };
 
-
-
 static long round_armss_rate(unsigned long rate)
 {
 	unsigned long freq = 0;
-- 
2.30.2

