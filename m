Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE26C28B2B
	for <phone-devel@archiver.kernel.org>; Tue, 16 Aug 2022 14:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235872AbiHPOED (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Aug 2022 10:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235875AbiHPOD3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Aug 2022 10:03:29 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C2E4E62C
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 07:03:25 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x9so10604853ljj.13
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Fx7EF1XT4Xp0iRpazAxdlKrn3GmL1oB14hrqyzOxgx0=;
        b=jk91keprIpxbGJ83Z9PoWPZqw728sYdnBKcyoa+8qzBh4TadwM7VPvhgw3bakuNyO6
         kSmHiNlHhFRY1OUNOJ5S0D29QfYa4GtNzsv35zbxNXtfEm5QtLBGNqFO/xQOjymr0teM
         ohP24lcFky6lPLifSdQ3ByUDkThlriHbdTNWWl2D2ISs4JBB8+UVhvZhWojbYSrS+1Wt
         g/MrTTKaovcPBDRiqy+xBF0Yr0dwWxjejI3QY1nfh5EF9LimY0AwDLAWQaIO2UojlKSo
         obFiGHfZnivM6kx73z01rdu74RqeS2OdkpyXP5tKX2L3446APthpWFktkRIYOsbheG39
         mG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Fx7EF1XT4Xp0iRpazAxdlKrn3GmL1oB14hrqyzOxgx0=;
        b=IOKQi61TM4pComoz51L+ibs8P/Fc+Tdz/qNExuSDPxT2N8aNDdoZcXKaQXOJFZxiFS
         7q+Kaz5YxibITHHOTX/CWvuSIN0jQd/g10OS1R0kEwswBbl05eDo67EdblDcuDEJLObB
         ttdFieg+tA0GPbmjoYsh7Uerk4cvDsPQB5C70U06in1ZdV8D3igslYOx6FehrhR9+QMi
         q54kUKLj0XD5pJElPI7z5TboLagByQKCPduX/BvEGnA60BrZ6JaFjtAc6mHQp69pAmsM
         qpATF4jwqWmk5e1vlKd+arU1jGyJKglxStkvUFfmh0fSCu7EOwFLzOfRH3zSGLnsphAl
         il9A==
X-Gm-Message-State: ACgBeo2dZeagzGT2vw/vZcvMqZ4VwWmzc+pfbSzuHuUrX6Zpz++qFpYY
        //oEgqF9ioCGVgwrIYmWqYoKeQPH3JIQ/A==
X-Google-Smtp-Source: AA6agR60pm6rWg2Ihzi+l/GeBemmFNHIBKtkiAzbW686tLoNjZBPJVdal40VZJ77QMVVz/FU7Rn5qw==
X-Received: by 2002:a2e:b0c9:0:b0:25e:71e3:8441 with SMTP id g9-20020a2eb0c9000000b0025e71e38441mr6914022ljl.156.1660658604639;
        Tue, 16 Aug 2022 07:03:24 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id r27-20020a2eb61b000000b0025e739cd9a7sm1747902ljn.101.2022.08.16.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 07:03:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 10/16] crypto: ux500/hash: Implement .export and .import
Date:   Tue, 16 Aug 2022 16:00:43 +0200
Message-Id: <20220816140049.102306-11-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816140049.102306-1-linus.walleij@linaro.org>
References: <20220816140049.102306-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The .export and .import callbacks are just implemented as stubs
which makes the tests fail:

 alg: ahash: hmac-sha256-ux500 export() failed with err -38 on
   test vector 0, cfg="import/export"
 ------------[ cut here ]------------
 WARNING: CPU: 1 PID: 92 at crypto/testmgr.c:5777
   alg_test.part.0+0x160/0x3ec
 alg: self-tests for hmac-sha256-ux500 (hmac(sha256)) failed (rc=-38)

The driver already has code for saving and restoring the hardware
state, which is now unused. Pass the tests by simply implementing the
callbacks properly, extending the state with the length, index
and buffer from the ongoing request context.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebased on v6.0-rc1
ChangeLog v1->v2:
- No changes
---
 drivers/crypto/ux500/hash/hash_alg.h  |   5 +
 drivers/crypto/ux500/hash/hash_core.c | 227 +++++++++++++-------------
 2 files changed, 114 insertions(+), 118 deletions(-)

diff --git a/drivers/crypto/ux500/hash/hash_alg.h b/drivers/crypto/ux500/hash/hash_alg.h
index 5aa86c4855f5..05f0b0221a13 100644
--- a/drivers/crypto/ux500/hash/hash_alg.h
+++ b/drivers/crypto/ux500/hash/hash_alg.h
@@ -226,6 +226,11 @@ struct hash_state {
 	u32		csr[52];
 	u32		csfull;
 	u32		csdatain;
+	u32		buffer[HASH_BLOCK_SIZE / sizeof(u32)];
+	struct uint64	length;
+	u8		index;
+	bool		dma_mode;
+	bool		hw_initialized;
 };
 
 /**
diff --git a/drivers/crypto/ux500/hash/hash_core.c b/drivers/crypto/ux500/hash/hash_core.c
index c55f35b366be..c8771839ec8e 100644
--- a/drivers/crypto/ux500/hash/hash_core.c
+++ b/drivers/crypto/ux500/hash/hash_core.c
@@ -964,108 +964,6 @@ int hash_hw_update(struct ahash_request *req)
 	return 0;
 }
 
-/**
- * hash_resume_state - Function that resumes the state of an calculation.
- * @device_data:	Pointer to the device structure.
- * @device_state:	The state to be restored in the hash hardware
- */
-int hash_resume_state(struct hash_device_data *device_data,
-		      const struct hash_state *device_state)
-{
-	u32 temp_cr;
-	s32 count;
-	int hash_mode = HASH_OPER_MODE_HASH;
-
-	if (NULL == device_state) {
-		dev_err(device_data->dev, "%s: HASH_INVALID_PARAMETER!\n",
-			__func__);
-		return -EPERM;
-	}
-
-	/*
-	 * INIT bit. Set this bit to 0b1 to reset the HASH processor core and
-	 * prepare the initialize the HASH accelerator to compute the message
-	 * digest of a new message.
-	 */
-	HASH_INITIALIZE;
-
-	temp_cr = device_state->temp_cr;
-	writel_relaxed(temp_cr & HASH_CR_RESUME_MASK, &device_data->base->cr);
-
-	if (readl(&device_data->base->cr) & HASH_CR_MODE_MASK)
-		hash_mode = HASH_OPER_MODE_HMAC;
-	else
-		hash_mode = HASH_OPER_MODE_HASH;
-
-	for (count = 0; count < HASH_CSR_COUNT; count++) {
-		if ((count >= 36) && (hash_mode == HASH_OPER_MODE_HASH))
-			break;
-
-		writel_relaxed(device_state->csr[count],
-			       &device_data->base->csrx[count]);
-	}
-
-	writel_relaxed(device_state->csfull, &device_data->base->csfull);
-	writel_relaxed(device_state->csdatain, &device_data->base->csdatain);
-
-	writel_relaxed(device_state->str_reg, &device_data->base->str);
-	writel_relaxed(temp_cr, &device_data->base->cr);
-
-	return 0;
-}
-
-/**
- * hash_save_state - Function that saves the state of hardware.
- * @device_data:	Pointer to the device structure.
- * @device_state:	The strucure where the hardware state should be saved.
- */
-int hash_save_state(struct hash_device_data *device_data,
-		    struct hash_state *device_state)
-{
-	u32 temp_cr;
-	u32 count;
-	int hash_mode = HASH_OPER_MODE_HASH;
-
-	if (NULL == device_state) {
-		dev_err(device_data->dev, "%s: HASH_INVALID_PARAMETER!\n",
-			__func__);
-		return -ENOTSUPP;
-	}
-
-	/* Write dummy value to force digest intermediate calculation. This
-	 * actually makes sure that there isn't any ongoing calculation in the
-	 * hardware.
-	 */
-	while (readl(&device_data->base->str) & HASH_STR_DCAL_MASK)
-		cpu_relax();
-
-	temp_cr = readl_relaxed(&device_data->base->cr);
-
-	device_state->str_reg = readl_relaxed(&device_data->base->str);
-
-	device_state->din_reg = readl_relaxed(&device_data->base->din);
-
-	if (readl(&device_data->base->cr) & HASH_CR_MODE_MASK)
-		hash_mode = HASH_OPER_MODE_HMAC;
-	else
-		hash_mode = HASH_OPER_MODE_HASH;
-
-	for (count = 0; count < HASH_CSR_COUNT; count++) {
-		if ((count >= 36) && (hash_mode == HASH_OPER_MODE_HASH))
-			break;
-
-		device_state->csr[count] =
-			readl_relaxed(&device_data->base->csrx[count]);
-	}
-
-	device_state->csfull = readl_relaxed(&device_data->base->csfull);
-	device_state->csdatain = readl_relaxed(&device_data->base->csdatain);
-
-	device_state->temp_cr = temp_cr;
-
-	return 0;
-}
-
 /**
  * hash_check_hw - This routine checks for peripheral Ids and PCell Ids.
  * @device_data:
@@ -1244,14 +1142,107 @@ static int ahash_sha256_digest(struct ahash_request *req)
 	return ret1 ? ret1 : ret2;
 }
 
-static int ahash_noimport(struct ahash_request *req, const void *in)
+static int ahash_import(struct ahash_request *req, const void *in)
 {
-	return -ENOSYS;
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct hash_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct hash_device_data *device_data = ctx->device;
+	struct hash_req_ctx *req_ctx = ahash_request_ctx(req);
+	const struct hash_state *hstate = in;
+	int hash_mode = HASH_OPER_MODE_HASH;
+	u32 cr;
+	s32 count;
+
+	/* Restore software state */
+	req_ctx->length = hstate->length;
+	req_ctx->index = hstate->index;
+	req_ctx->dma_mode = hstate->dma_mode;
+	req_ctx->hw_initialized = hstate->hw_initialized;
+	memcpy(req_ctx->buffer, hstate->buffer, HASH_BLOCK_SIZE);
+
+	/*
+	 * Restore hardware state
+	 * INIT bit. Set this bit to 0b1 to reset the HASH processor core and
+	 * prepare the initialize the HASH accelerator to compute the message
+	 * digest of a new message.
+	 */
+	HASH_INITIALIZE;
+
+	cr = hstate->temp_cr;
+	writel_relaxed(cr & HASH_CR_RESUME_MASK, &device_data->base->cr);
+
+	if (readl(&device_data->base->cr) & HASH_CR_MODE_MASK)
+		hash_mode = HASH_OPER_MODE_HMAC;
+	else
+		hash_mode = HASH_OPER_MODE_HASH;
+
+	for (count = 0; count < HASH_CSR_COUNT; count++) {
+		if ((count >= 36) && (hash_mode == HASH_OPER_MODE_HASH))
+			break;
+		writel_relaxed(hstate->csr[count],
+			       &device_data->base->csrx[count]);
+	}
+
+	writel_relaxed(hstate->csfull, &device_data->base->csfull);
+	writel_relaxed(hstate->csdatain, &device_data->base->csdatain);
+	writel_relaxed(hstate->str_reg, &device_data->base->str);
+	writel_relaxed(cr, &device_data->base->cr);
+
+	return 0;
 }
 
-static int ahash_noexport(struct ahash_request *req, void *out)
+static int ahash_export(struct ahash_request *req, void *out)
 {
-	return -ENOSYS;
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct hash_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct hash_device_data *device_data = ctx->device;
+	struct hash_req_ctx *req_ctx = ahash_request_ctx(req);
+	struct hash_state *hstate = out;
+	int hash_mode = HASH_OPER_MODE_HASH;
+	u32 cr;
+	u32 count;
+
+	/*
+	 * Save hardware state:
+	 * Write dummy value to force digest intermediate calculation. This
+	 * actually makes sure that there isn't any ongoing calculation in the
+	 * hardware.
+	 */
+	while (readl(&device_data->base->str) & HASH_STR_DCAL_MASK)
+		cpu_relax();
+
+	cr = readl_relaxed(&device_data->base->cr);
+
+	hstate->str_reg = readl_relaxed(&device_data->base->str);
+
+	hstate->din_reg = readl_relaxed(&device_data->base->din);
+
+	if (readl(&device_data->base->cr) & HASH_CR_MODE_MASK)
+		hash_mode = HASH_OPER_MODE_HMAC;
+	else
+		hash_mode = HASH_OPER_MODE_HASH;
+
+	for (count = 0; count < HASH_CSR_COUNT; count++) {
+		if ((count >= 36) && (hash_mode == HASH_OPER_MODE_HASH))
+			break;
+
+		hstate->csr[count] =
+			readl_relaxed(&device_data->base->csrx[count]);
+	}
+
+	hstate->csfull = readl_relaxed(&device_data->base->csfull);
+	hstate->csdatain = readl_relaxed(&device_data->base->csdatain);
+
+	hstate->temp_cr = cr;
+
+	/* Save software state */
+	hstate->length = req_ctx->length;
+	hstate->index = req_ctx->index;
+	hstate->dma_mode = req_ctx->dma_mode;
+	hstate->hw_initialized = req_ctx->hw_initialized;
+	memcpy(hstate->buffer, req_ctx->buffer, HASH_BLOCK_SIZE);
+
+	return 0;
 }
 
 static int hmac_sha1_init(struct ahash_request *req)
@@ -1361,10 +1352,10 @@ static struct hash_algo_template hash_algs[] = {
 			.update = ahash_update,
 			.final = ahash_final,
 			.digest = ahash_sha1_digest,
-			.export = ahash_noexport,
-			.import = ahash_noimport,
+			.export = ahash_export,
+			.import = ahash_import,
 			.halg.digestsize = SHA1_DIGEST_SIZE,
-			.halg.statesize = sizeof(struct hash_ctx),
+			.halg.statesize = sizeof(struct hash_state),
 			.halg.base = {
 				.cra_name = "sha1",
 				.cra_driver_name = "sha1-ux500",
@@ -1384,10 +1375,10 @@ static struct hash_algo_template hash_algs[] = {
 			.update	= ahash_update,
 			.final = ahash_final,
 			.digest = ahash_sha256_digest,
-			.export = ahash_noexport,
-			.import = ahash_noimport,
+			.export = ahash_export,
+			.import = ahash_import,
 			.halg.digestsize = SHA256_DIGEST_SIZE,
-			.halg.statesize = sizeof(struct hash_ctx),
+			.halg.statesize = sizeof(struct hash_state),
 			.halg.base = {
 				.cra_name = "sha256",
 				.cra_driver_name = "sha256-ux500",
@@ -1408,10 +1399,10 @@ static struct hash_algo_template hash_algs[] = {
 			.final = ahash_final,
 			.digest = hmac_sha1_digest,
 			.setkey = hmac_sha1_setkey,
-			.export = ahash_noexport,
-			.import = ahash_noimport,
+			.export = ahash_export,
+			.import = ahash_import,
 			.halg.digestsize = SHA1_DIGEST_SIZE,
-			.halg.statesize = sizeof(struct hash_ctx),
+			.halg.statesize = sizeof(struct hash_state),
 			.halg.base = {
 				.cra_name = "hmac(sha1)",
 				.cra_driver_name = "hmac-sha1-ux500",
@@ -1432,10 +1423,10 @@ static struct hash_algo_template hash_algs[] = {
 			.final = ahash_final,
 			.digest = hmac_sha256_digest,
 			.setkey = hmac_sha256_setkey,
-			.export = ahash_noexport,
-			.import = ahash_noimport,
+			.export = ahash_export,
+			.import = ahash_import,
 			.halg.digestsize = SHA256_DIGEST_SIZE,
-			.halg.statesize = sizeof(struct hash_ctx),
+			.halg.statesize = sizeof(struct hash_state),
 			.halg.base = {
 				.cra_name = "hmac(sha256)",
 				.cra_driver_name = "hmac-sha256-ux500",
-- 
2.37.2

