Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5200C43142
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 860E42310A
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436697AbhALT2Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436670AbhALT2X (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jan 2021 14:28:23 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461A5C0617A2
        for <phone-devel@vger.kernel.org>; Tue, 12 Jan 2021 11:26:49 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A3D373E8E5;
        Tue, 12 Jan 2021 20:26:47 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 2/7] drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
Date:   Tue, 12 Jan 2021 20:26:27 +0100
Message-Id: <20210112192632.502897-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Not all DPU versions that are supported in this driver are supposed
to have a 8-Levels VIG QoS setting.
Move this flag to SDM845 and SC7180 specific masks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 90393fe9e59c..7a17ebaf635c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -12,14 +12,14 @@
 
 #define VIG_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
-	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_QOS_8LVL) |\
+	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
-- 
2.29.2

