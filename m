Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34376C77B7F
	for <phone-devel@archiver.kernel.org>; Thu, 11 May 2023 14:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjEKON3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 11 May 2023 10:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237802AbjEKON0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 11 May 2023 10:13:26 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271F55BA6;
        Thu, 11 May 2023 07:12:36 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QHDNg08npz9sbY;
        Thu, 11 May 2023 16:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1683814323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNzwKONia1evLN1QC2vRkbgu3RwkxcMWK2mRFNmiqkc=;
        b=0R1IkmfTtjAXvzhnxT6uWWUGAQ8226GDi5Ej/uL8kAhPBhdvZh+Gnk9pDcL9v4LfLG7hVW
        cCAEyk54g0Iy8uv0ueo3YLKu+1V7+7ioMbxpN1s3fUxKH2OPMF4GmS8/ladZVHYNTCC1Tp
        RDai893sH8EM4ZIkBqL71rqcR7Bm8K3yNQoR1tRh0OCIBJapGb7Oc0clSAJ88YrqNmQxeQ
        XP4xWVJA8lnF7VFYVq8yaCKNPGQ5PMkszfF8FaCYpQmSS2VzXcZUYrd3KASsReg24ABYHc
        iEDVhn8z9Joj50fap0GG4enynhpnCS049ClijCGwg0vCgIiQxDFzUuPstyh/5A==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dan.carpenter@linaro.org, Dylan Van Assche <me@dylanvanassche.be>,
        Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v4 2/2] misc: fastrpc: use coherent pool for untranslated Compute Banks
Date:   Thu, 11 May 2023 16:11:46 +0200
Message-Id: <20230511141146.30465-3-me@dylanvanassche.be>
In-Reply-To: <20230511141146.30465-1-me@dylanvanassche.be>
References: <20230511141146.30465-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Use fastrpc_remote_heap_alloc to allocate from the FastRPC device
instead of the Compute Bank when the session ID is 0. This ensures
that the allocation is inside the coherent DMA pool which is already
accessible to the DSP. This is necessary to support FastRPC devices
which do not have dedicated Compute Banks such as the SLPI on the SDM845.
The latter uses an allocated CMA region instead of FastRPC Compute Banks.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/misc/fastrpc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 1ced553ae959..3d47d3d13b5d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -939,7 +939,10 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
 
 	ctx->msg_sz = pkt_size;
 
-	err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
+	if (ctx->fl->sctx->sid)
+		err = fastrpc_buf_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
+	else
+		err = fastrpc_remote_heap_alloc(ctx->fl, dev, pkt_size, &ctx->buf);
 	if (err)
 		return err;
 
-- 
2.40.1

