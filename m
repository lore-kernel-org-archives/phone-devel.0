Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33D8CCA48A
	for <phone-devel@archiver.kernel.org>; Thu, 21 Jul 2022 13:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiGUNof (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 21 Jul 2022 09:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiGUNnX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 21 Jul 2022 09:43:23 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D3684ED4
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 06:43:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z13so1468509ljj.6
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tfNmd4/2AJvSA9Ov5LFupfzA3mhbd15BtcA4LqxtVDQ=;
        b=xCi7mg5zJUJnI3q6au2Agii2IITR+WTcn8cVbMnz22QTZF2te2pfCfUDMYOaHV/mFJ
         QtC9YYygS3cX2o7CaSUds9G8nmOUPy1z6EDVtwxjG9jn0eLVvk/6ktJuucUG883JbL0i
         0rrUK7ETchOEIGl80Jje1lUTGgG96uem2UOVnSqLVoGQDOVJzHeMl6QFfefNVfMvD7Qe
         Sm/tSiQbFy98C90/O0OWlrAZ+DuqaxlK9mdj0P7OyWT42deMm16y79c81mW3g2QBqm0B
         MiRvzgRH5dhnRcq3C6c4te4tOEF1qYs/Bwq+nXIzpDMk6Ys35066eprzLTw7cvJnThMZ
         0+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tfNmd4/2AJvSA9Ov5LFupfzA3mhbd15BtcA4LqxtVDQ=;
        b=PW0S15GAWGqCJS1UOZQmuDNsS5rdAPBryUfj5YJMqWdn2uZ1ame8fdmwLYtrX96Fs6
         63HWUs84+XnmrIFZgSG0Mer92i6qfoBFUei1kAfc8c6y5OCys/51LgA5k8bvCr8D7DDV
         6k+p9coWqbNTirsI+Wq4SDy+NSI5jHqnqX/MuAzaNp8id5CEW/hgZEeWn1ErqJW+UfA1
         X6ZJZzmykFEGMc20MNGmC5WCYMDxK9h61XNXmtEFcAFKk2Janj2FHc992zVhSwZ5N0XT
         IE6ljgyXICYQ4t/vYU9HClWC0YuL+AN74KZdtS7sKuA8uqlgXACQYSwJvYMpPZ6kgn/R
         hJKw==
X-Gm-Message-State: AJIora8X/ktFG664rObM20mmrlrcSsvPIXCfDWCTYsLicEMyRaHl3dwt
        S3sLPAfl9nBL48nHOPjnpWTFBg==
X-Google-Smtp-Source: AGRyM1vT847rpqEEKE3v4I46Q8btuhYW6R5OaM5+2qU2VIPqksarcjcAm36zkTwZkOIf+ZvEnqGo2Q==
X-Received: by 2002:a2e:9857:0:b0:25d:d722:b492 with SMTP id e23-20020a2e9857000000b0025dd722b492mr3331528ljj.218.1658410983222;
        Thu, 21 Jul 2022 06:43:03 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o23-20020ac24e97000000b004867a427026sm458568lfr.40.2022.07.21.06.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:43:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 05/15] crypto: ux500/hash: Drop bit index
Date:   Thu, 21 Jul 2022 15:40:40 +0200
Message-Id: <20220721134050.1047866-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721134050.1047866-1-linus.walleij@linaro.org>
References: <20220721134050.1047866-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This is some leftover code because the field is only referenced
in a debug print and never assigned.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/crypto/ux500/hash/hash_alg.h  | 4 ----
 drivers/crypto/ux500/hash/hash_core.c | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/ux500/hash/hash_alg.h b/drivers/crypto/ux500/hash/hash_alg.h
index 26e8b7949d7c..00730c0090ae 100644
--- a/drivers/crypto/ux500/hash/hash_alg.h
+++ b/drivers/crypto/ux500/hash/hash_alg.h
@@ -217,7 +217,6 @@ struct hash_register {
  * @buffer:	Working buffer for messages going to the hardware.
  * @length:	Length of the part of message hashed so far (floor(N/64) * 64).
  * @index:	Valid number of bytes in buffer (N % 64).
- * @bit_index:	Valid number of bits in buffer (N % 8).
  *
  * This structure is used between context switches, i.e. when ongoing jobs are
  * interupted with new jobs. When this happens we need to store intermediate
@@ -237,7 +236,6 @@ struct hash_state {
 	u32		buffer[HASH_BLOCK_SIZE / sizeof(u32)];
 	struct uint64	length;
 	u8		index;
-	u8		bit_index;
 };
 
 /**
@@ -358,7 +356,6 @@ struct hash_req_ctx {
  * @power_state_lock:	Spinlock for power_state.
  * @regulator:		Pointer to the device's power control.
  * @clk:		Pointer to the device's clock control.
- * @restore_dev_state:	TRUE = saved state, FALSE = no saved state.
  * @dma:		Structure used for dma.
  */
 struct hash_device_data {
@@ -372,7 +369,6 @@ struct hash_device_data {
 	spinlock_t		power_state_lock;
 	struct regulator	*regulator;
 	struct clk		*clk;
-	bool			restore_dev_state;
 	struct hash_state	state; /* Used for saving and resuming state */
 	struct hash_dma		dma;
 };
diff --git a/drivers/crypto/ux500/hash/hash_core.c b/drivers/crypto/ux500/hash/hash_core.c
index e6e3a91ae795..e9962c8a29bd 100644
--- a/drivers/crypto/ux500/hash/hash_core.c
+++ b/drivers/crypto/ux500/hash/hash_core.c
@@ -991,8 +991,8 @@ int hash_hw_update(struct ahash_request *req)
 	}
 
 	req_ctx->state.index = index;
-	dev_dbg(device_data->dev, "%s: indata length=%d, bin=%d\n",
-		__func__, req_ctx->state.index, req_ctx->state.bit_index);
+	dev_dbg(device_data->dev, "%s: indata length=%d\n",
+		__func__, req_ctx->state.index);
 
 	return 0;
 }
-- 
2.36.1

