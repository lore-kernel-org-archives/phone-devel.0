Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14C9C433F5
	for <phone-devel@archiver.kernel.org>; Sat, 11 Sep 2021 16:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99F6D61213
	for <phone-devel@archiver.kernel.org>; Sat, 11 Sep 2021 16:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhIKQkm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 11 Sep 2021 12:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhIKQkg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 11 Sep 2021 12:40:36 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67482C061756
        for <phone-devel@vger.kernel.org>; Sat, 11 Sep 2021 09:39:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 828391F511;
        Sat, 11 Sep 2021 18:39:21 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, abhinavk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode panels
Date:   Sat, 11 Sep 2021 18:39:19 +0200
Message-Id: <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
checking if the relative CTL is started by waiting for an interrupt
to fire: it is fine to do that, but then sometimes we call this
function while the CTL is up and has never been put down, but that
interrupt gets raised only when the CTL gets a state change from
0 to 1 (disabled to enabled), so we're going to wait for something
that will never happen on its own.

Solving this while avoiding to restart the CTL is actually possible
and can be done by just checking if it is already up and running
when the wait_for_commit_done function is called: in this case, so,
if the CTL was already running, we can say that the commit is done
if the command transmission is complete (in other terms, if the
interface has been flushed).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index aa01698d6b25..aa5d3b3cef15 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -682,6 +682,9 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
+	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
+
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 }
 
-- 
2.32.0

