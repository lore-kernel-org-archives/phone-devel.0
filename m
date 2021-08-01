Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE01C4338F
	for <phone-devel@archiver.kernel.org>; Sun,  1 Aug 2021 23:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EECE61042
	for <phone-devel@archiver.kernel.org>; Sun,  1 Aug 2021 23:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhHAXf3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Aug 2021 19:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbhHAXf1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Aug 2021 19:35:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D65C06175F
        for <phone-devel@vger.kernel.org>; Sun,  1 Aug 2021 16:35:17 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p38so15448296lfa.0
        for <phone-devel@vger.kernel.org>; Sun, 01 Aug 2021 16:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6/svOQzqOqPbw3rFdp8t0bc9pHFnD1J8mVJIcesOfQ=;
        b=VCas2Uh5+HYnebJL88dgEEbyIoYQD4EpejdVd6uOPoE+wNtpwysnaz0jLWJNeCyouD
         DiiELqxTO38C4ixKKj8MKqUxW4vKGvdp0L9gkBadf9lIh6nh7f1wjkzDRrXIE7nzwbog
         T7lgSCMjJVo5MO2yuO6DqqnbQYA/hewnEnLF5JJ6EhLE0B2T5BE/QosZVzIaNkpzhxzx
         hqzT8Wa5ShttghIjr8vmgiAy+pylAMUZy7ozbqgl/VLn9MGzxROnhjuIpIr9Llp7KpCz
         ckZWSW3mgTTiu8skWqz0N/y/WjqKseMBiMoL/ZljrbInGQ4vOuul0U+RntiSFgjXVyiw
         hjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C6/svOQzqOqPbw3rFdp8t0bc9pHFnD1J8mVJIcesOfQ=;
        b=T5F67G4t8Sg+QoP8WlzCGAwBavsgDN3X6KOG5fI9B50G5Le8GHcuwrXoJvpH1YqTyU
         aAO7cjIe+xDat75GK3bbufCNK4wWAWtM4ccWDGjo/VCY7Udvs4z5SH3pjNuHAO/yzoQf
         TaAaopKiDwzyQ9kWwurVYkST4/ExrnEMtEaXzV+eZ/eEH7v09D8UtPC6HKbZ/aA6BzSX
         vgvoS+mxpI+G4Wm5RajAFoJlGPDwN4GjSMw2nYDT4rcS8QOiSBBi0DoaBJtvqaQW3Bzd
         D9VLlrt3L5DTOi/nMKJPOIKvZSb4qmOUsyx5xx45EpdPXkby80KB0cES28WrW8Pqgcb6
         Nc1Q==
X-Gm-Message-State: AOAM533TSW36JgahH5N50vsEBHq1bsx1YxQWEpUxg7PGzFrUkAdM6kqk
        PXv2tktABVEI0+8czm4HtYvUiw==
X-Google-Smtp-Source: ABdhPJwgySXbJ/Vio0yQFfA1AHvsua4uhyZFzkFUXMERZvpLJlYElZtc6cTAj7/cs+o6fScvt4nYlA==
X-Received: by 2002:a19:f110:: with SMTP id p16mr10647640lfh.584.1627860916212;
        Sun, 01 Aug 2021 16:35:16 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y17sm791046lfh.246.2021.08.01.16.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 16:35:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org
Subject: [PATCH 1/2] mfd: db8500-prcmu: Adjust map to reality
Date:   Mon,  2 Aug 2021 01:33:13 +0200
Message-Id: <20210801233314.3150754-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

These are the actual frequencies reported by the PLL, so let's
report these. The roundoffs are inappropriate, we should round
to the frequency that the clock will later report.

Drop some whitespace at the same time.

Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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
2.31.1

