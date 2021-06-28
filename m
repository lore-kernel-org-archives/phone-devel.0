Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67741C11F64
	for <phone-devel@archiver.kernel.org>; Mon, 28 Jun 2021 23:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 391EE61CF4
	for <phone-devel@archiver.kernel.org>; Mon, 28 Jun 2021 23:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbhF1Xeh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Jun 2021 19:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233000AbhF1Xeg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Jun 2021 19:34:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455A0C061574
        for <phone-devel@vger.kernel.org>; Mon, 28 Jun 2021 16:32:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j4so35765785lfc.8
        for <phone-devel@vger.kernel.org>; Mon, 28 Jun 2021 16:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kLrPJPzrw+zAIGl8nSTJBfgBHgjvUBIJcNiPK6FAFU4=;
        b=NHX7fKB7ANNICrPZXzlYB7ZsgAOViQSz3LOvFyyChxVpsbqNhUgqaZSiqsYxQr+f19
         t8wn1SnHcRDi2icOxqGSOHkRL5dqT2c7OEM8O8Rwxw3pQEJi3OzrHDhCGQRcca+njEbm
         dANMWrs8olk7uqY8Mg4IWFtoltEiOob+xZ/vISc0yVpxy6qOR4pcA4DQA9Hz2mDXDhyW
         iRxB48uaaQM57hLHocnpeZV+unbEysaCUVWHqnRN15zV0U4SwDFKAKucq1WE/eeXR2eW
         PgSDqlpa+JR4QWmOIktG8bXrCTwLLKb5s48vNjDqeFYJz0IXBpuskBDXeEejwz6aXoo8
         8A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kLrPJPzrw+zAIGl8nSTJBfgBHgjvUBIJcNiPK6FAFU4=;
        b=VeWHTxJNGXQnMrJz0nlK39hIHFKqDfsJCyZYH3mLnlkGFB8oAKt6lB4uBuCeFqsmZH
         dc7zcp7NG6qRgS3LA94BlPlX6LAlqM35GdbDAb48taOxNpsRD080Jdl+hwLe96HkRhuv
         ZC58TPqd4eFtvVkfT//zJgXePKNAnSQWxxqVaEa1HUkbakUVs+VxsCXPckFIz1jUed1s
         XecXBQguGO34plZdW43SSa/i9TlXrPqPz8PQhP8Df7bDOPhYm2Ua/YywjE428Rrd2yFk
         0OGKP5d2//EUh6C7AXwqkgvaCatuVrgKO1Zky+CF6bFUF+LvABN/sEjYG8YfaVtKPttp
         qX5w==
X-Gm-Message-State: AOAM533lGv5Dy5YV/b/Jd6ocgHM7cU9UfcGLaT5CXokBev95mJFNpzIq
        9CnzSo5S75+dUiQpJYKmy5MGbA==
X-Google-Smtp-Source: ABdhPJzNNI3cNXc2FD7Uu30ywTezw2qEOpwwEoF2MYQ7nqjyZTqwTS8m0Wz6vWN31N9ypl31hBwFlQ==
X-Received: by 2002:ac2:4e06:: with SMTP id e6mr8373411lfr.449.1624923127533;
        Mon, 28 Jun 2021 16:32:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p40sm1434020lfa.171.2021.06.28.16.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 16:32:07 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        newbyte@disroot.org
Subject: [PATCH] mmc: core: Add a card quirk for broken boot partitions
Date:   Tue, 29 Jun 2021 01:29:55 +0200
Message-Id: <20210628232955.3327484-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Some boot partitions on the Samsung 4GB KLM4G1YE4C "4YMD1R" card appear
broken when accessed randomly. CMD6 to switch back to the main partition
randomly stalls after CMD18 access to the boot partition 1, and the card
never comes back online. The accesses to the boot partitions work several
times before this happens.

I tried using only single blocks with CMD17 on the boot partitions with the
result that it crashed even faster.

The card may survive on older kernels, but this seems to be because recent
kernel partition parsers are accessing the boot partitions more, and we get
more block traffic to the boot partitions during kernel startup.

My only conclusion is that the boot partitions are somehow broken on this
card, and we add a quirk for this.

After applying this patch, the main partition can be accessed and mounted
without problems.

This eMMC card is found in the Samsung GT-S7710 mobile phone.

Cc: phone-devel@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Reported-by: newbyte@disroot.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/core/block.c  | 6 ++++++
 drivers/mmc/core/quirks.h | 7 +++++++
 include/linux/mmc/card.h  | 1 +
 3 files changed, 14 insertions(+)

diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
index 689eb9afeeed..e6cde68cda0e 100644
--- a/drivers/mmc/core/block.c
+++ b/drivers/mmc/core/block.c
@@ -2621,6 +2621,12 @@ static int mmc_blk_alloc_parts(struct mmc_card *card, struct mmc_blk_data *md)
 				card->part[idx].name);
 			if (ret)
 				return ret;
+		} else if((card->part[idx].area_type & MMC_BLK_DATA_AREA_BOOT) &&
+			  (card->quirks & MMC_QUIRK_BROKEN_BOOT_PARTITIONS)) {
+			pr_info("%s: skipping broken boot partition %s\n",
+				mmc_hostname(card->host),
+				card->part[idx].name);
+			continue;
 		} else if (card->part[idx].size) {
 			ret = mmc_blk_alloc_part(card, md,
 				card->part[idx].part_cfg,
diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index d68e6e513a4f..aa4060c10aa9 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -99,6 +99,13 @@ static const struct mmc_fixup __maybe_unused mmc_blk_fixups[] = {
 	MMC_FIXUP("V10016", CID_MANFID_KINGSTON, CID_OEMID_ANY, add_quirk_mmc,
 		  MMC_QUIRK_TRIM_BROKEN),
 
+	/*
+	 * Some Samsung eMMCs have broken boot partitions, accessing them
+	 * randomly will make the device lock up and crash.
+	 */
+	MMC_FIXUP("4YMD1R", CID_MANFID_SAMSUNG, CID_OEMID_ANY, add_quirk_mmc,
+		  MMC_QUIRK_BROKEN_BOOT_PARTITIONS),
+
 	END_FIXUP
 };
 
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index f9ad35dd6012..4006736f59dd 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -259,6 +259,7 @@ struct mmc_card {
 						/* for byte mode */
 #define MMC_QUIRK_NONSTD_SDIO	(1<<2)		/* non-standard SDIO card attached */
 						/* (missing CIA registers) */
+#define MMC_QUIRK_BROKEN_BOOT_PARTITIONS (1<<3)	/* Disable broken boot partitions */
 #define MMC_QUIRK_NONSTD_FUNC_IF (1<<4)		/* SDIO card has nonstd function interfaces */
 #define MMC_QUIRK_DISABLE_CD	(1<<5)		/* disconnect CD/DAT[3] resistor */
 #define MMC_QUIRK_INAND_CMD38	(1<<6)		/* iNAND devices have broken CMD38 */
-- 
2.31.1

