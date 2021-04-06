Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE7EC43460
	for <phone-devel@archiver.kernel.org>; Tue,  6 Apr 2021 21:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C257613CF
	for <phone-devel@archiver.kernel.org>; Tue,  6 Apr 2021 21:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239469AbhDFVrz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 6 Apr 2021 17:47:55 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:50835 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343747AbhDFVry (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 6 Apr 2021 17:47:54 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A03D63F3F5;
        Tue,  6 Apr 2021 23:47:42 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/msm/mdp5: Disable pingpong autorefresh at tearcheck init
Date:   Tue,  6 Apr 2021 23:47:26 +0200
Message-Id: <20210406214726.131534-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406214726.131534-1-marijn.suijten@somainline.org>
References: <20210406214726.131534-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

If pp autorefresh is up (from bootloader splash), we will surely get
vblank and pp timeouts.  Ensure it is turned off.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index 0bda4257823a..66315b82dd6e 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -59,6 +59,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
 	mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_THRESH(pp_id),
 			MDP5_PP_SYNC_THRESH_START(4) |
 			MDP5_PP_SYNC_THRESH_CONTINUE(4));
+	mdp5_write(mdp5_kms, REG_MDP5_PP_AUTOREFRESH_CONFIG(pp_id), 0x0);
 
 	return 0;
 }
-- 
2.31.1

