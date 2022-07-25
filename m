Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CDACCA48B
	for <phone-devel@archiver.kernel.org>; Mon, 25 Jul 2022 14:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbiGYOHZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 25 Jul 2022 10:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235049AbiGYOHZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 25 Jul 2022 10:07:25 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE7615802
        for <phone-devel@vger.kernel.org>; Mon, 25 Jul 2022 07:07:23 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t22so11821720lfg.1
        for <phone-devel@vger.kernel.org>; Mon, 25 Jul 2022 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fD8+wIdL2kfiinqMnkslDfHHIOINpTieSbpxOuavPaA=;
        b=xNwZLDP8Gk3vb5BGkbchDjpzJr4kUCFXO4y1amkIvhwNiVNuvAji3+M+NxjfC4eMqo
         C6N2iW1WCQjtyrK17Wr8vkIU6Wok6B29RvVetnYJC5RtJm2H8gSs4TqZANbebKSwXz2U
         MT3AXdhX31RXf3jwuPgmVhocA0xZ12y3iHMqGKGca1uBPRdwMOvt+Vtfqn59BtZDCkIV
         zZUKtKyQCPMVr5ONPHBCNh+xxuCFoZwp9X9eM9jQWxEbd9S3Tj4Ds86xe7eEwmIVzD2u
         xyNOv1sEByae1deKglQVu7rpn9QH34R7Hzy+hy4cncDp2Hg5CzSCXwZRcZe3xDhfehKs
         rtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fD8+wIdL2kfiinqMnkslDfHHIOINpTieSbpxOuavPaA=;
        b=5YCHwTdYfBKYopeHjHifcdgxS4JjZzSx6NxDTgO8SrKtyMrwHnTxgHkZziNnWhSFBb
         bv9PSm6/8x+8EoCXheHtztDtQ/M97dx//Gr93k8MUxfDSr3bel4nXL7hhAsW4q/07/Sk
         vDt018zVCVoVLjcdbZid87wy4Qh4D2pNUD99gy8adrQVZm37ZAnzf/puXWV2p+Cgs9U9
         EP49U39yEgi63y/EcmJtgFOKdkgcWRRqupVfxYNJ9zgO6gpZjyJ16IYCVeqNBtEA7rRA
         VyqbmBWEzd3p7bPIpc3P4GvDnNJ2NhzZ8ryjL457WhNRQnNbK5RHI/SaHgvxAh85lUGV
         MBLQ==
X-Gm-Message-State: AJIora+mS1EkqNiSVUnlGWopXYmwRACWNAqeq2pFY4SPJr4FPWApKpo6
        744/RpRm8pz8ctL7d8cSA7unPw==
X-Google-Smtp-Source: AGRyM1sl2+MNAqlTlw8xq4c3MTz7OiJa6xNYiuQ6wgTFx2GQREdQml0uCLZR8tmP+Tu+QZ7JPTtcxg==
X-Received: by 2002:ac2:456c:0:b0:48a:8c7f:e332 with SMTP id k12-20020ac2456c000000b0048a8c7fe332mr1981147lfm.410.1658758041636;
        Mon, 25 Jul 2022 07:07:21 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o7-20020a05651205c700b0047f7419de4asm901127lfo.180.2022.07.25.07.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 07:07:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 01/15 v2] crypto: ux500/hash: Pass ctx to hash_setconfiguration()
Date:   Mon, 25 Jul 2022 16:04:50 +0200
Message-Id: <20220725140504.2398965-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220725140504.2398965-1-linus.walleij@linaro.org>
References: <20220725140504.2398965-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This function was dereferencing device_data->current_ctx
to get the context. This is not a good idea, the device_data
is serialized with an awkward semaphore construction and
fragile.

Also fix a checkpatch warning about putting compared constants
to the right in an expression.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- No changes
---
 drivers/crypto/ux500/hash/hash_alg.h  |  2 +-
 drivers/crypto/ux500/hash/hash_core.c | 15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/ux500/hash/hash_alg.h b/drivers/crypto/ux500/hash/hash_alg.h
index 7c9bcc15125f..26e8b7949d7c 100644
--- a/drivers/crypto/ux500/hash/hash_alg.h
+++ b/drivers/crypto/ux500/hash/hash_alg.h
@@ -380,7 +380,7 @@ struct hash_device_data {
 int hash_check_hw(struct hash_device_data *device_data);
 
 int hash_setconfiguration(struct hash_device_data *device_data,
-		struct hash_config *config);
+			  struct hash_ctx *ctx);
 
 void hash_begin(struct hash_device_data *device_data, struct hash_ctx *ctx);
 
diff --git a/drivers/crypto/ux500/hash/hash_core.c b/drivers/crypto/ux500/hash/hash_core.c
index 265ef3e96fdd..dfdf3e35d94f 100644
--- a/drivers/crypto/ux500/hash/hash_core.c
+++ b/drivers/crypto/ux500/hash/hash_core.c
@@ -473,7 +473,7 @@ static int init_hash_hw(struct hash_device_data *device_data,
 {
 	int ret = 0;
 
-	ret = hash_setconfiguration(device_data, &ctx->config);
+	ret = hash_setconfiguration(device_data, ctx);
 	if (ret) {
 		dev_err(device_data->dev, "%s: hash_setconfiguration() failed!\n",
 			__func__);
@@ -672,11 +672,12 @@ static void hash_incrementlength(struct hash_req_ctx *ctx, u32 incr)
  * hash_setconfiguration - Sets the required configuration for the hash
  *                         hardware.
  * @device_data:	Structure for the hash device.
- * @config:		Pointer to a configuration structure.
+ * @ctx:		Current context
  */
 int hash_setconfiguration(struct hash_device_data *device_data,
-			  struct hash_config *config)
+			  struct hash_ctx *ctx)
 {
+	struct hash_config *config = &ctx->config;
 	int ret = 0;
 
 	if (config->algorithm != HASH_ALGO_SHA1 &&
@@ -711,12 +712,12 @@ int hash_setconfiguration(struct hash_device_data *device_data,
 	 * MODE bit. This bit selects between HASH or HMAC mode for the
 	 * selected algorithm. 0b0 = HASH and 0b1 = HMAC.
 	 */
-	if (HASH_OPER_MODE_HASH == config->oper_mode)
+	if (config->oper_mode == HASH_OPER_MODE_HASH) {
 		HASH_CLEAR_BITS(&device_data->base->cr,
 				HASH_CR_MODE_MASK);
-	else if (HASH_OPER_MODE_HMAC == config->oper_mode) {
+	} else if (config->oper_mode == HASH_OPER_MODE_HMAC) {
 		HASH_SET_BITS(&device_data->base->cr, HASH_CR_MODE_MASK);
-		if (device_data->current_ctx->keylen > HASH_BLOCK_SIZE) {
+		if (ctx->keylen > HASH_BLOCK_SIZE) {
 			/* Truncate key to blocksize */
 			dev_dbg(device_data->dev, "%s: LKEY set\n", __func__);
 			HASH_SET_BITS(&device_data->base->cr,
@@ -878,7 +879,7 @@ static int hash_dma_final(struct ahash_request *req)
 			goto out;
 		}
 	} else {
-		ret = hash_setconfiguration(device_data, &ctx->config);
+		ret = hash_setconfiguration(device_data, ctx);
 		if (ret) {
 			dev_err(device_data->dev,
 				"%s: hash_setconfiguration() failed!\n",
-- 
2.36.1

