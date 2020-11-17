Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432F7C63697
	for <phone-devel@archiver.kernel.org>; Tue, 17 Nov 2020 17:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7C682467A
	for <phone-devel@archiver.kernel.org>; Tue, 17 Nov 2020 17:54:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v4RgBe1v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgKQRyV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 17 Nov 2020 12:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728940AbgKQRyV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 17 Nov 2020 12:54:21 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29DEC0613CF
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2020 09:54:20 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y16so25321789ljk.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2020 09:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BYshMtSkbtkvYAVk3VOA8AMxSRgti+Fm93GTg0y55f8=;
        b=v4RgBe1veeJUySmh5ZybKOl11N3U6m7sRQIVjdRArBnhNFJlVMsgu1EJnQa8yKpVJg
         IcTg+ZZcapvyZmu9ij57AFExXebMSUSr5t7G/Ctq22oZMXElERJwnfKlmcACzXT+ygmp
         KlIT+zDKgq3ak2O5OCeBkmM0roZvF78dcO0UgCeyipnuWfodfYjQZx798wytdC8aWbHR
         15YXQWOVyhgmrpQX9zNGWDbgfkz45lZlyMUUemxFfDRNk49B8Z+Up9hvMOz3thu+DCXe
         ScQf43SpJ441ZKJ9S8i5431oLEqvvmGHe633dp6lYw0xOuQldQMLPMxzWTO8P1Ej9X8t
         LQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BYshMtSkbtkvYAVk3VOA8AMxSRgti+Fm93GTg0y55f8=;
        b=B3K+W/kKxqDRmVxGSujjPD1ZrfQgRbt9Y090+4rg1ME2+q9jFwhDnElLiKX4QeEwP2
         zBCC63MADtq9UW49HwvYq+IAH0EvR2gpwwT2JNwS3bBclzGWhwvUBneACKXcAC2IvYDm
         9tqScZTly8hc9m6QMg4JxDrL7g8MVDG0sr2dA9bk03c3wND2J+9mEpqiZmtB2m7JOCjw
         5JT93hqq5FC3QNHkdnTj0wfj1pwMv60KjfAuR7lSx+2oVRtho+anPtiF6v/WYqcHtAx9
         4Q18zVqcuRnpLERsHUpoPC9rJspXd4XAsTp2GGXTa1nKrpRRxV1eGaWkDmdvC7GwKP3S
         Yo6A==
X-Gm-Message-State: AOAM533imE/NjCnVSC6/UZkwmjGeQ2t7CmiU6CTYP3wUH2/tb5mXw74/
        rO3tTByOVk1MsTZe7cJ+JccFRg==
X-Google-Smtp-Source: ABdhPJwYCW4AJAthMTLUnKzYugRaJneBQliHIDA9MTR0dbeDC5p+ci1X6tIWhNL3odHgqrDg5BeDJg==
X-Received: by 2002:a2e:9b8b:: with SMTP id z11mr2254921lji.259.1605635659175;
        Tue, 17 Nov 2020 09:54:19 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id c9sm3237808lfd.98.2020.11.17.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:54:18 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] drm/mcde: Fix RGB/BGR bug
Date:   Tue, 17 Nov 2020 18:54:13 +0100
Message-Id: <20201117175413.869871-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

I was confused when the graphics came out with blue
penguins on the DPI panel.

It turns out that the so-called "packed RGB666" mode
on the DSI formatter is incorrect: this mode is the
actual RGB888 mode, and the mode called RGB888 is
BGR888.

The claims that the MCDE had inverse RGB/BGR buffer
formats was wrong, so correct this and the buggy
register and everything is much more consistent, and
graphics look good on all targets, both DPI and
DSI.

Cc: phone-devel@vger.kernel.org
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c      | 23 +++++++++++------------
 drivers/gpu/drm/mcde/mcde_display_regs.h |  4 ++--
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 14c76d3a8e5a..192e11c88d72 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -250,73 +250,70 @@ static int mcde_configure_extsrc(struct mcde *mcde, enum mcde_extsrc src,
 	val = 0 << MCDE_EXTSRCXCONF_BUF_ID_SHIFT;
 	val |= 1 << MCDE_EXTSRCXCONF_BUF_NB_SHIFT;
 	val |= 0 << MCDE_EXTSRCXCONF_PRI_OVLID_SHIFT;
-	/*
-	 * MCDE has inverse semantics from DRM on RBG/BGR which is why
-	 * all the modes are inversed here.
-	 */
+
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_ABGR8888:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XRGB8888:
 		val |= MCDE_EXTSRCXCONF_BPP_XRGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XBGR8888:
 		val |= MCDE_EXTSRCXCONF_BPP_XRGB8888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_RGB888:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_BGR888:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB888 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_ARGB4444:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB4444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_ABGR4444:
 		val |= MCDE_EXTSRCXCONF_BPP_ARGB4444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XRGB4444:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XBGR4444:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB444 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XRGB1555:
 		val |= MCDE_EXTSRCXCONF_BPP_IRGB1555 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_XBGR1555:
 		val |= MCDE_EXTSRCXCONF_BPP_IRGB1555 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_RGB565:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB565 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
-		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_BGR565:
 		val |= MCDE_EXTSRCXCONF_BPP_RGB565 <<
 			MCDE_EXTSRCXCONF_BPP_SHIFT;
+		val |= MCDE_EXTSRCXCONF_BGR;
 		break;
 	case DRM_FORMAT_YUV422:
 		val |= MCDE_EXTSRCXCONF_BPP_YCBCR422 <<
@@ -810,7 +807,9 @@ static void mcde_configure_dsi_formatter(struct mcde *mcde,
 			MCDE_DSICONF0_PACKING_SHIFT;
 		break;
 	case MIPI_DSI_FMT_RGB666_PACKED:
-		val |= MCDE_DSICONF0_PACKING_RGB666_PACKED <<
+		dev_err(mcde->dev,
+			"we cannot handle the packed RGB666 format\n");
+		val |= MCDE_DSICONF0_PACKING_RGB666 <<
 			MCDE_DSICONF0_PACKING_SHIFT;
 		break;
 	case MIPI_DSI_FMT_RGB565:
diff --git a/drivers/gpu/drm/mcde/mcde_display_regs.h b/drivers/gpu/drm/mcde/mcde_display_regs.h
index ae76da8a2138..2ad78c59d627 100644
--- a/drivers/gpu/drm/mcde/mcde_display_regs.h
+++ b/drivers/gpu/drm/mcde/mcde_display_regs.h
@@ -552,8 +552,8 @@
 #define MCDE_DSICONF0_PACKING_MASK 0x00700000
 #define MCDE_DSICONF0_PACKING_RGB565 0
 #define MCDE_DSICONF0_PACKING_RGB666 1
-#define MCDE_DSICONF0_PACKING_RGB666_PACKED 2
-#define MCDE_DSICONF0_PACKING_RGB888 3
+#define MCDE_DSICONF0_PACKING_RGB888 2
+#define MCDE_DSICONF0_PACKING_BGR888 3
 #define MCDE_DSICONF0_PACKING_HDTV 4
 
 #define MCDE_DSIVID0FRAME 0x00000E04
-- 
2.26.2

