Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB524C7EE26
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 08:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjEGILd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 04:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbjEGILb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 04:11:31 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3437E13869;
        Sun,  7 May 2023 01:11:28 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4QDcZN6LGCz9scZ;
        Sun,  7 May 2023 10:11:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
        s=MBO0001; t=1683447084;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XDem5KbBYqf0yzHTVvfDGPYYkUomJeVEa1QHHvpSfOA=;
        b=uZ/V9DJw4Ek/cxgu5uVrzOpCL7FzQ1EpkjAaiLEXvfo2VxEQAUI7+EPPEtlAmSsGBN0HRG
        2W5LiVB18L9byZhrfU0/PBQLdiHbH+DnQgh3Q/RhGn+eHSgI1ySmv5HGXNN1ytDPVBy9fl
        UYgWhe2cTe96wc69Qhgn8tYU7aLjhQ1Q00wE0nqgW9IPuau/1xTmzNnNY9RVvn2MP2retJ
        jFjadOCfR0LUBo6LlPcQd4k3xJMzfd1x0iCyhNX8HxVizW1QKxNoPxur4jN6D7WN14bNw4
        YSAsL7pBNdrtX8gDUXnvO+9KGXt3korypU1aaD+e34SUTyMgDWLTYnd1p7pwjw==
From:   Dylan Van Assche <me@dylanvanassche.be>
To:     srinivas.kandagatla@linaro.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>,
        Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v3 2/2] misc: fastrpc: use coherent pool for untranslated Compute Banks
Date:   Sun,  7 May 2023 10:08:39 +0200
Message-Id: <20230507080839.37578-3-me@dylanvanassche.be>
In-Reply-To: <20230507080839.37578-1-me@dylanvanassche.be>
References: <20230507080839.37578-1-me@dylanvanassche.be>
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
index 423272bcbbf5..44763a95869b 100644
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

