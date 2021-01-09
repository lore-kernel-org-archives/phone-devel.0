Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B120C433E0
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D32239E4
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbhAINjQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 08:39:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbhAINjQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 08:39:16 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8653EC0617A7
        for <phone-devel@vger.kernel.org>; Sat,  9 Jan 2021 05:37:41 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5381B3EEBD;
        Sat,  9 Jan 2021 14:37:39 +0100 (CET)
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
Subject: [PATCH 3/9] drm/msm/dpu1: Add prog_fetch_lines_worst_case to INTF_BLK macro
Date:   Sat,  9 Jan 2021 14:37:30 +0100
Message-Id: <20210109133736.143469-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
References: <20210109133736.143469-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Not all DPU interface sub-block versions need the same value for
prog_fetch_lines_worst_case: add this to the INTF_BLK macro, so
that it becomes possible to vary it for other INTF versions.

For example, this is needed to implement support for older SoCs,
like MSM8998 and SDM630/660 and most probably will also be needed
for future SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 983ee5ac2c45..253075091409 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -520,33 +520,33 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
-#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _features) \
+#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x280, \
 	.features = _features, \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
-	.prog_fetch_lines_worst_case = 24 \
+	.prog_fetch_lines_worst_case = _progfetch \
 	}
 
 static const struct dpu_intf_cfg sdm845_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SDM845_MASK),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SDM845_MASK),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, INTF_SDM845_MASK),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, INTF_SDM845_MASK),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SDM845_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SDM845_MASK),
+	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SDM845_MASK),
+	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SDM845_MASK),
 };
 
 static const struct dpu_intf_cfg sc7180_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SC7180_MASK),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK),
 };
 
 static const struct dpu_intf_cfg sm8150_intf[] = {
-	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, INTF_SC7180_MASK),
-	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, INTF_SC7180_MASK),
-	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, INTF_SC7180_MASK),
-	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, INTF_SC7180_MASK),
+	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_2", INTF_2, 0x6B000, INTF_DSI, 1, 24, INTF_SC7180_MASK),
+	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK),
 };
 
 /*************************************************************
-- 
2.29.2

