Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA6DC43219
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF67120720
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jan 2021 19:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406829AbhALT2L (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406820AbhALT2L (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jan 2021 14:28:11 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7740DC0617A9
        for <phone-devel@vger.kernel.org>; Tue, 12 Jan 2021 11:26:50 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EE4AC3EB8B;
        Tue, 12 Jan 2021 20:26:48 +0100 (CET)
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
Subject: [PATCH v2 7/7] drm/msm/dpu: Remove unused call in wait_for_commit_done
Date:   Tue, 12 Jan 2021 20:26:32 +0100
Message-Id: <20210112192632.502897-8-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The call to dpu_encoder_phys_cmd_prepare_for_kickoff is useless as
it's unused because the serialize_wait4pp variable is never set to
true by .. anything, literally: remove the call.
While at it, also reduce indentation by inverting the check for
dpu_encoder_phys_cmd_is_master.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 665eb1d4cb8a..b2be39b9144e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -685,20 +685,15 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 static int dpu_encoder_phys_cmd_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
-	int rc = 0;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
 	/* only required for master controller */
-	if (dpu_encoder_phys_cmd_is_master(phys_enc))
-		rc = _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
-
-	/* required for both controllers */
-	if (!rc && cmd_enc->serialize_wait4pp)
-		dpu_encoder_phys_cmd_prepare_for_kickoff(phys_enc);
+	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
+		return 0;
 
-	return rc;
+	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 }
 
 static int dpu_encoder_phys_cmd_wait_for_vblank(
-- 
2.29.2

