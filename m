Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72226C64EC4
	for <phone-devel@archiver.kernel.org>; Fri, 10 Mar 2023 11:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjCJLFx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 10 Mar 2023 06:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjCJLFw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 10 Mar 2023 06:05:52 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04B0DB6FD;
        Fri, 10 Mar 2023 03:05:51 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id a7so3350465pfx.10;
        Fri, 10 Mar 2023 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678446351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGDXehSv6v2/D0JVf9XtETXZgmT2wS6LdL23tIL4g10=;
        b=ge7D1BbJ4Alm9bFtz18cnSDZjuLOmJjClVb4OQIEIZvKSELkBpUdP6juxrj5O6os2H
         nAnjjZGuWn4/iw1eb9hBi6I62RapyKOq45rrwmydepWzKiw83ltKiPXl+VRArXzgcl9I
         6HsLXRa+HMrCSFwSI54Uh9O7kuH3nYPC1gJoPrcxZIgQb7f4fkBvNKMbYuBfpOrCeTBi
         MAeQ3eNif4CceQr71Q9JPapootB0ACJ/LeB2rd2IjeRW2Nuc1fB4JrpvinElR+lu2aeX
         WWOFMZvEPF836T0YEcwt7W9wycvOMKgRuDulX5GQbsVzhyj+ANTl6PaSI7l2beWfJIUX
         BnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678446351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGDXehSv6v2/D0JVf9XtETXZgmT2wS6LdL23tIL4g10=;
        b=qDjk7VSEUazz7PbF0/0PI/6Rm4A4C/3SCUT0NFR/AdVHx1vRLKqmdGfibIFVd32qic
         oKdmSZKatdBykE61CHNjSwf3uldKKsprX6Ixyt4uHCvdVWHS5jh/MOgZU/CCCeeDEKB3
         X5oM6XmLsj8IGBnUFhT/x1945a4+xc/hDu2VIlGL/UwRFstf2WT+p3W8ACV+dok7XzBa
         rE/KLyKmzFhPL/dqKiXFM9t5cCMYMdFtMy6jwm4sdLlLInodKxS+2vEq5IqcPm1NFoOE
         xuKdhtXcN/niVXSZIxnd0eGuCNvft85ig540Q9fd5CuzVVSuIR5PvAKBPcNJzLZSN8Ox
         KGWA==
X-Gm-Message-State: AO0yUKXgtzUa+BNx+MdIhj30NZ3I0R/FRXdJJuXaeiatjyyZ2ZeVKY04
        OWCNYIO5JPsdRYw4fncDuazH5Y0jGnA=
X-Google-Smtp-Source: AK7set80h3e9ZU13GZnCB2/z6kk4c+Jx02r0J4nPo1t+JZz1/n6ZHQufX+AkCBRe8Lk+QproaTFffA==
X-Received: by 2002:aa7:940b:0:b0:5a8:b705:4dd3 with SMTP id x11-20020aa7940b000000b005a8b7054dd3mr21395673pfo.13.1678446351208;
        Fri, 10 Mar 2023 03:05:51 -0800 (PST)
Received: from localhost.localdomain (n220246252084.netvigator.com. [220.246.252.84])
        by smtp.gmail.com with ESMTPSA id h12-20020a62b40c000000b005a8b4dcd213sm1170602pfn.78.2023.03.10.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 03:05:50 -0800 (PST)
From:   Jianhua Lu <lujianhua000@gmail.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH] drm/mipi-dsi: Add a mipi_dual_dsi_dcs_write_seq() macro
Date:   Fri, 10 Mar 2023 19:05:42 +0800
Message-Id: <20230310110542.6649-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The panels with two dsi connected (sync dual dsi mode) need to transmit
dcs command to the two dsi host simultaneously, let's add
mipi_dual_dsi_dcs_write_seq() macro for this kind of panels.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..d0f0f75d4d83 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -336,6 +336,21 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 		}                                                          \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
+ * @dsi: array of 2 DSI peripheral devices
+ * @cmd: Command
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dual_dsi_dcs_write_seq(dsi, cmd, seq...)                   \
+	do {                                                             \
+		if (ARRAY_SIZE(dsi) > 2)                                 \
+			return -EINVAL;                                  \
+		int i;                                                   \
+		for (i = 0; i < ARRAY_SIZE(dsi); i++)                    \
+			mipi_dsi_dcs_write_seq(dsi[i], cmd, seq);        \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.39.2

