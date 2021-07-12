Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26523C07E9C
	for <phone-devel@archiver.kernel.org>; Mon, 12 Jul 2021 09:05:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B2B661026
	for <phone-devel@archiver.kernel.org>; Mon, 12 Jul 2021 09:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351750AbhGLJIH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 12 Jul 2021 05:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384702AbhGLJEF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 12 Jul 2021 05:04:05 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B837AC0613AD
        for <phone-devel@vger.kernel.org>; Mon, 12 Jul 2021 01:57:29 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s18so22997302ljg.7
        for <phone-devel@vger.kernel.org>; Mon, 12 Jul 2021 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5d6Z92bis1FTsbZYPUBaQbOfE4flsBCQtpV5+LatB00=;
        b=F5++UXDA11Wfgb719W7skABi9wqJd5dKd6NGsbKXukxIwJt3HCwUHBLkKpZbrnRFpz
         aI5NOo1afGJpKUq4YqUw1GVRNH3/WfVnUOglu6ZjyGNyx35q3duyNCoOXrCidh2xm4/a
         tamfZJ0yjlnGXTPc1402jLQ9h3RdG6Fam53w7+sdTpHfeCGlzBXcvdIKW1l+nNMzzaJg
         DOWeoEgDf5eTd+S/7en3nV5gy0dsRY+xfXHLceOmY0qbCNwVRPClkj8pJkXQzERgEIPJ
         rcjO+p+HyNEp9kf9l588CCjogcPJYwvHp/ASdxyT/J5oawl9oGgVEKpvhdYFi47e21Rz
         u4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5d6Z92bis1FTsbZYPUBaQbOfE4flsBCQtpV5+LatB00=;
        b=DOgxFwjqfX88gfji1qzbGFJs9UKvWlUnhf3O0shO4zI7+chFEgD+QbrVgrT+EzyTiG
         Bob2u+w2SJCngIJa8/XkvRq97lR77+KRd5QEZFgYP0YCljxyNZ1ZSL/YajtxZGuQnZ4S
         g0LWEtZlDfUhNghzIkSG9u8VoFwzkKtcnHvFS47BI3IBUWhW0p27G0fhMRyrX9wtyqPu
         5jD/FJ8FG5sAQBF+0HN5hJwyiRvWCbSVg8W49lAFUfz9TtSurpxg3Obvd8xddJeLxLW5
         Ed21N0/KAsQxZqh0TkJ2KClysdD5UB78/OuKVBtnrHez0ZBV+GXIeGJtnteA1k1wdLSI
         lLww==
X-Gm-Message-State: AOAM532TITuUezN4lA6V87ZskheTka2XfZH2WTckeC25hHfylNimLci8
        O+hgxUAiCFLf5liv6RVAwiSnkA==
X-Google-Smtp-Source: ABdhPJxMQj3C87xonZdq4c5RPX0otxjo9WVQPCpypadAZeTCOpCRcvDW3cHhNiw8pRLDSPwQqatDYg==
X-Received: by 2002:a2e:968a:: with SMTP id q10mr37860599lji.407.1626080247484;
        Mon, 12 Jul 2021 01:57:27 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id e28sm683401lfb.58.2021.07.12.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 01:57:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, newbyte@disroot.org
Subject: [PATCH] ARM: configs: Update u8500_defconfig
Date:   Mon, 12 Jul 2021 10:55:22 +0200
Message-Id: <20210712085522.672482-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The platform lost the framebuffer due to a commit solving a
circular dependency in v5.14-rc1, so add it back in by explicitly
selecting the framebuffer.

The U8500 has also gained a few systems using touchscreens from
Cypress, Melfas and Zinitix so add these at the same time as
we're updating the defconfig anyway.

Cc: phone-devel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: newbyte@disroot.org
Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC folks, please apply this for configs for v5.14 current.
---
 arch/arm/configs/u8500_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index dbb1ef601762..3b30913d7d8d 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -61,6 +61,10 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
 CONFIG_TOUCHSCREEN_BU21013=y
 CONFIG_TOUCHSCREEN_CY8CTMA140=y
+CONFIG_TOUCHSCREEN_CYTTSP_CORE=y
+CONFIG_TOUCHSCREEN_CYTTSP_SPI=y
+CONFIG_TOUCHSCREEN_MMS114=y
+CONFIG_TOUCHSCREEN_ZINITIX=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_AB8500_PONKEY=y
 CONFIG_INPUT_GPIO_VIBRA=y
@@ -100,6 +104,7 @@ CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
 CONFIG_DRM_PANEL_SONY_ACX424AKP=y
 CONFIG_DRM_LIMA=y
 CONFIG_DRM_MCDE=y
+CONFIG_FB=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_KTD253=y
 CONFIG_BACKLIGHT_GPIO=y
-- 
2.31.1

