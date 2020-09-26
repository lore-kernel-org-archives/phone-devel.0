Return-Path: <SRS0=mJHj=DD=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D7EC47420
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 12:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3CF922204
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 12:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCm0rhLw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbgIZMwD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 26 Sep 2020 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729391AbgIZMwB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 26 Sep 2020 08:52:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 969FBC0613D5;
        Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s12so6820252wrw.11;
        Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ScwFgjf4CVFLL0QbktoshjK86UH6jL1pgVGi1tkj42M=;
        b=FCm0rhLweV4v32CvpTVH22mVrlTllzq3je8W8VDTa7EwNOCixcG+mM6SoFBejJ4VnP
         6jIINolttCNWgAhQxEvNE5kMtet6duC+LkCoOhgyN8XtXQjcQ1qhurpJHEgulFtln4XD
         /JQ5GMSFBIeUxS28yJLRp3qzyjALaujMXWJW8oO8vyI1NKEmCjY6YbJ9Wfv1sYUdSdA1
         MxFieGfCBIaWcXwAdHQnO1a88HlaA5qol3fTTOm3eCTyZfAIRPuVX/nFYiYfvEQ1TvbZ
         +CJyFxzVk7/jiR/5p16X2SVQQImY8+I3Pp0EdojZTsZKTgwgpEtCSw8EodOmNyJuwh99
         qdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ScwFgjf4CVFLL0QbktoshjK86UH6jL1pgVGi1tkj42M=;
        b=gTVTnMc8RY4CyCD+z3y5qs1ExbVnw6ZvC59KK+yj0JyjSKYQ6rHpSiS549YnJsIKHB
         VtaIb+0UxbZ3TbWiVmjMCOPDKo3YbqXHJyThvIppkQtQ81TnYPYgZezug+CEGykKiXnQ
         PReUZp/b0FblMkLAGpouuABoIirObIi6ZCk7W3IGDmSZo39ZiXCMId0RFfpHcE/yCeik
         T947Hfuz7D0nw0dUWFs+s7UapKJ6tBXiTD1r/Sg8TF7YYyjcN9Abmt6rAznSL5YZ2NFv
         YtrQnK1MnZt5nXtbN7JEfUeb0Z4ukUQe59uIWg/xhksqnEBYVwupkIj9TXqzg3txIZqo
         g4Jw==
X-Gm-Message-State: AOAM5304qu25aoTsfYJlXStpPRrKs2M1w+zZqIjUq5ut0JpcNfR5IFVK
        YIgko7u2ulSxBrVcGvstJws=
X-Google-Smtp-Source: ABdhPJwRsAcaiieSYbXlX01tJPbMNfAAj8VCdZihppRjta/A7uJCVk3jfoMBRnSfNtoMf7RIQuNDWg==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr9908215wrp.351.1601124719194;
        Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:58 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
Date:   Sat, 26 Sep 2020 14:51:44 +0200
Message-Id: <20200926125146.12859-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

The upstream API for some reason uses logbase2 instead of
just passing the argument as-is, whereas downstream CAF
kernel does the latter.

Hence, a mistake has been made when porting:
4 is the value that's supposed to be passed, but
log2(4) = 2. Changing the value to 16 (= 2^4) fixes
the issue.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 00df5de3c8e3..b2670af638a3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -789,7 +789,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 	/* VPC */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(14), ADRENO_PROTECT_RW(0xE68, 8));
-	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 4));
+	gpu_write(gpu, REG_A5XX_CP_PROTECT(15), ADRENO_PROTECT_RW(0xE70, 16));
 
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
-- 
2.28.0

