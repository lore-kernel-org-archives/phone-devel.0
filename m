Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E395C07E9B
	for <phone-devel@archiver.kernel.org>; Wed,  7 Jul 2021 00:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ECC661CAD
	for <phone-devel@archiver.kernel.org>; Wed,  7 Jul 2021 00:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhGGAEg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 6 Jul 2021 20:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhGGAEg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 6 Jul 2021 20:04:36 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B62C06175F
        for <phone-devel@vger.kernel.org>; Tue,  6 Jul 2021 17:01:55 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q18so820261lfc.7
        for <phone-devel@vger.kernel.org>; Tue, 06 Jul 2021 17:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+2C+teTGCJK8yJZ9efPk4JGWnvCtf2zVRZGGI6cSxE=;
        b=NOMSTAnaF9gqs41hfYRE6pUDvoPnUyD/38UK0zd42+QLTWnx6cgikgJADkgDMqXJkg
         F92z/I/8TOSVrjotDpec20BsTjgobu0A1UgY6gJ97STPtbj3TCasXVLrWAg6c+XpiVeX
         +FuWRuSlHh1KQKo1990WF62tQCP/y/1YKB+hKPwCHAD1U52Nh2lRkoJ/ub06WfVTqieO
         PiU0qW73MJKwuqXjV4cNiO418tQm3/5VuXLveZqK5BG2PydInHi3Y/4GFzX1FPOE+tN2
         +fgJSn/3ER4T8lx6xUgOwv3M1VJ98LQcg7ndiZ3DmESxNgnN5Le7PtancJ0kI7ByV9/c
         4V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f+2C+teTGCJK8yJZ9efPk4JGWnvCtf2zVRZGGI6cSxE=;
        b=m0Hpss7LQEi+Hs6H17ssJF3CuaEqF42xXml3tourNhzSp+ANGbHeT55kKtbFC05pyu
         1hQnBQsQasqmLQvHjZBSxrwInjU+p7Xrrr4HG8HvzsmjrGB6HGO4QNTM/yHJlfTD2hv6
         yWKOAu1liMaY3S0SVUChC9ZVL/N2KBq/fJILn/54pxcyyAAkuXPMT0NHrTKoUsHVXfxO
         cOh9fnEx1mZpMZjREFAn6jEYe+VRmfk678w2SASSb3LjARZZVOVay4Tsi+zjDqLKVtUr
         oexqvFX6ml1AZOH7YQCdNZ4MUm4hNYjFQeW3AzyVe7mZp//P3LNlFrIoWlr9RM0+RCiB
         JnRQ==
X-Gm-Message-State: AOAM531eMSu54V5t4eptV15ZWLQ/W7rz+eQCPvZYe6VG1cjIirA2vt8i
        P8JPkUFZmLvEnwbdOijpjFrFoQ==
X-Google-Smtp-Source: ABdhPJxEeAAsoB+UbOixfFRGwf6jEnUQaMFXXqR6rHgCRcJ1knKM6cdrzykQRbyLmMDc1rqEt4UE0w==
X-Received: by 2002:a19:4c09:: with SMTP id z9mr16577167lfa.450.1625616114160;
        Tue, 06 Jul 2021 17:01:54 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c9sm1802856ljr.104.2021.07.06.17.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 17:01:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org
Subject: [PATCH] Input: mms114 - support MMS134S
Date:   Wed,  7 Jul 2021 01:59:51 +0200
Message-Id: <20210706235951.189289-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The MMS134S like the MMS136 has an event size of 6 bytes.

After this patch, the touchscreen on the Samsung SGH-I407
works fine with PostmarketOS.

Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/mms114.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 0efd1a1bb192..9fa3b0e421be 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -54,6 +54,7 @@
 
 enum mms_type {
 	TYPE_MMS114	= 114,
+	TYPE_MMS134S	= 134,
 	TYPE_MMS136	= 136,
 	TYPE_MMS152	= 152,
 	TYPE_MMS345L	= 345,
@@ -212,7 +213,7 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
 		goto out;
 
 	/* MMS136 has slightly different event size */
-	if (data->type == TYPE_MMS136)
+	if (data->type == TYPE_MMS134S || data->type == TYPE_MMS136)
 		touch_size = packet_size / MMS136_EVENT_SIZE;
 	else
 		touch_size = packet_size / MMS114_EVENT_SIZE;
@@ -281,6 +282,7 @@ static int mms114_get_version(struct mms114_data *data)
 		break;
 
 	case TYPE_MMS114:
+	case TYPE_MMS134S:
 	case TYPE_MMS136:
 		error = __mms114_read_reg(data, MMS114_TSP_REV, 6, buf);
 		if (error)
@@ -304,8 +306,9 @@ static int mms114_setup_regs(struct mms114_data *data)
 	if (error < 0)
 		return error;
 
-	/* Only MMS114 and MMS136 have configuration and power on registers */
-	if (data->type != TYPE_MMS114 && data->type != TYPE_MMS136)
+	/* MMS114, MMS134S and MMS136 have configuration and power on registers */
+	if (data->type != TYPE_MMS114 && data->type != TYPE_MMS134S &&
+	    data->type != TYPE_MMS136)
 		return 0;
 
 	error = mms114_set_active(data, true);
@@ -487,7 +490,8 @@ static int mms114_probe(struct i2c_client *client,
 				     0, data->props.max_y, 0, 0);
 	}
 
-	if (data->type == TYPE_MMS114 || data->type == TYPE_MMS136) {
+	if (data->type == TYPE_MMS114 || data->type == TYPE_MMS134S ||
+	    data->type == TYPE_MMS136) {
 		/*
 		 * The firmware handles movement and pressure fuzz, so
 		 * don't duplicate that in software.
@@ -611,6 +615,9 @@ static const struct of_device_id mms114_dt_match[] = {
 	{
 		.compatible = "melfas,mms114",
 		.data = (void *)TYPE_MMS114,
+	}, {
+		.compatible = "melfas,mms134s",
+		.data = (void *)TYPE_MMS134S,
 	}, {
 		.compatible = "melfas,mms136",
 		.data = (void *)TYPE_MMS136,
-- 
2.31.1

