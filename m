Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDE4C433EF
	for <phone-devel@archiver.kernel.org>; Wed,  2 Feb 2022 09:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242406AbiBBJdh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Feb 2022 04:33:37 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:39373 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239992AbiBBJdh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Feb 2022 04:33:37 -0500
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 83FB63F6C1;
        Wed,  2 Feb 2022 10:33:34 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/2] config: android-recommended: Don't explicitly disable CONFIG_AIO
Date:   Wed,  2 Feb 2022 10:33:13 +0100
Message-Id: <20220202093314.107927-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Android nowadays (for a couple years already) requires AIO for at least
its `adb` "Android Debug Bridge" [1].  Without this config option
(`default y`) it simply refuses start, making users unable to connect to
their phone for debugging purposes when using these kernel fragments.

[1]: https://cs.android.com/android/_/android/platform/packages/modules/adb/+/a2cb8de5e68067a5e1d002886d5f3b42d91371e1

Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Stultz <john.stultz@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 kernel/configs/android-recommended.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/configs/android-recommended.config b/kernel/configs/android-recommended.config
index eb0029c9a6a6..22bd76e43aca 100644
--- a/kernel/configs/android-recommended.config
+++ b/kernel/configs/android-recommended.config
@@ -1,5 +1,4 @@
 #  KEEP ALPHABETICALLY SORTED
-# CONFIG_AIO is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_INPUT_MOUSE is not set
 # CONFIG_LEGACY_PTYS is not set
-- 
2.35.1

