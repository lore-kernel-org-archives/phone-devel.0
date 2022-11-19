Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6AEC433FE
	for <phone-devel@archiver.kernel.org>; Sat, 19 Nov 2022 22:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiKSWMu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 19 Nov 2022 17:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233670AbiKSWMr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 19 Nov 2022 17:12:47 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BAE15806
        for <phone-devel@vger.kernel.org>; Sat, 19 Nov 2022 14:12:45 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a15so10769441ljb.7
        for <phone-devel@vger.kernel.org>; Sat, 19 Nov 2022 14:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6tOdl7lLMrGsoirqvPF2uW725As/rKREcjaierrzFI=;
        b=gy+fIIoQtreLur6QNdhaANwlk4LdqXEHpTInkGdyiRHyzZuqDk6I3RDiutS5j+iVnW
         k/jP7VIfm+3BuH7ypsLisaf+GqxP6lG0HlRfZYYX4O8EvJyx446a4agsRi0xg05BLch4
         XZFpodb3xBWI7HuTATMrHYuwMtaXYL+K3zFZCFVcHkPaLup9pGpjil5CXP1N2mXL6wYc
         FpvX36OL8gAz4oKdo83zV09FJWz9xjdu4K6BZNoKXYicSrXmRsVJabcYO/ChAIWwXyIb
         wzBh2CfacKKjAzZ8DJnu9yUQRmhMocCZjlyHDrAQ7rD9eknHo6kiVwicYR6dbZVHupBX
         g39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6tOdl7lLMrGsoirqvPF2uW725As/rKREcjaierrzFI=;
        b=iTycW+rNegqM1d4A2e28ZC2JVYClgPC19nO1ieorS6zyRkCct+3Qt5hR2LnuTIdoGP
         +JN9pb+BkfSOeLkR8ppClIdw5xXWJ7IwftZjN+EMBQpmsVzqq93DWo497g7jGrZN1Lrs
         TY8LHHh32/sq6N8CA8KCFRcpntJkb2Dq7jkDRG6pqaTuyVL+SSy+tK6wjjbIk3Jc3M0u
         O2N0KExnxMVmCw9c4jFnGTncD1k5PNX/0fYKtFvAPgdcF4HF8bBleiTxBU71sUsfI/D4
         K4okVkb4kWVL49k9Pq9W9teSHBC/wOUhqd2RwGtpZhm4he+VmAXeYHBXWhW8L6XgjHs+
         RNWA==
X-Gm-Message-State: ANoB5pn+KAqaG9J16aMPWbwutXy39A/69LBk3e9JtJjurZLI3a0E38Jg
        r9RDG7fZQYD5lmAA8KB6hMDDvg==
X-Google-Smtp-Source: AA0mqf5cQP+at5Rw2wvTndfD4dal7zHZ73k3bYGMJG+Mzug2gqUDYSjQA/zwfgFVX03WSgHhvRsKgQ==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id h12-20020a05651c158c00b0026c090ff8femr4401266ljq.2.1668895963815;
        Sat, 19 Nov 2022 14:12:43 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id u3-20020a05651220c300b00496d3e6b131sm1234254lfr.234.2022.11.19.14.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 14:12:43 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Lionel Debieve <lionel.debieve@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v1 2/4] crypto: stm32 - enable drivers to be used on Ux500
Date:   Sat, 19 Nov 2022 23:12:17 +0100
Message-Id: <20221119221219.1232541-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119221219.1232541-1-linus.walleij@linaro.org>
References: <20221119221219.1232541-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The Ux500 cryp and hash drivers are older versions of the
hardware managed by the stm32 driver.

Instead of trying to improve the Ux500 cryp and hash drivers,
start to switch over to the modern and more well-maintained
STM32 drivers.

Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/crypto/Makefile      | 2 +-
 drivers/crypto/stm32/Kconfig | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index 116de173a66c..fa8bf1be1a8c 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -41,7 +41,7 @@ obj-$(CONFIG_CRYPTO_DEV_S5P) += s5p-sss.o
 obj-$(CONFIG_CRYPTO_DEV_SA2UL) += sa2ul.o
 obj-$(CONFIG_CRYPTO_DEV_SAHARA) += sahara.o
 obj-$(CONFIG_CRYPTO_DEV_SL3516) += gemini/
-obj-$(CONFIG_ARCH_STM32) += stm32/
+obj-y += stm32/
 obj-$(CONFIG_CRYPTO_DEV_TALITOS) += talitos.o
 obj-$(CONFIG_CRYPTO_DEV_UX500) += ux500/
 obj-$(CONFIG_CRYPTO_DEV_VIRTIO) += virtio/
diff --git a/drivers/crypto/stm32/Kconfig b/drivers/crypto/stm32/Kconfig
index 4a4c3284ae1f..4fc581e9e595 100644
--- a/drivers/crypto/stm32/Kconfig
+++ b/drivers/crypto/stm32/Kconfig
@@ -10,7 +10,7 @@ config CRYPTO_DEV_STM32_CRC
 
 config CRYPTO_DEV_STM32_HASH
 	tristate "Support for STM32 hash accelerators"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || ARCH_U8500
 	depends on HAS_DMA
 	select CRYPTO_HASH
 	select CRYPTO_MD5
@@ -23,7 +23,7 @@ config CRYPTO_DEV_STM32_HASH
 
 config CRYPTO_DEV_STM32_CRYP
 	tristate "Support for STM32 cryp accelerators"
-	depends on ARCH_STM32
+	depends on ARCH_STM32 || ARCH_U8500
 	select CRYPTO_HASH
 	select CRYPTO_ENGINE
 	select CRYPTO_LIB_DES
-- 
2.38.1

