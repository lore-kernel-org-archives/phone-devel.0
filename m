Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874A6C433F5
	for <phone-devel@archiver.kernel.org>; Wed, 17 Nov 2021 11:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 598C6610D1
	for <phone-devel@archiver.kernel.org>; Wed, 17 Nov 2021 11:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236664AbhKQLOv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 17 Nov 2021 06:14:51 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:39385 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234184AbhKQLOu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 17 Nov 2021 06:14:50 -0500
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 060EB3F63B;
        Wed, 17 Nov 2021 12:11:49 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/devfreq: Insert missing null check in msm_devfreq_idle
Date:   Wed, 17 Nov 2021 12:11:34 +0100
Message-Id: <20211117111134.315709-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

msm_devfreq_init only initializes the idle_work hrtimer when it succeeds
to create a devfreq instance (devfreq support is optional), yet
msm_devfreq_idle is called unconditionally from retire_submit and queues
work on it.  We're seeing:

    [    2.005265] adreno 1c00000.gpu: [drm:msm_devfreq_init] *ERROR* Couldn't initialize GPU devfreq

Followed by a pagefault in:

    [   16.650316] pc : hrtimer_start_range_ns+0x64/0x360
    [   16.650336] lr : msm_hrtimer_queue_work+0x18/0x2c

Moments later.  Just like msm_devfreq_active, check if the devfreq
instance is not NULL before proceeding.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 8b7473f69cb8..ae3309ff96e4 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -227,6 +227,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;

+	if (!df->devfreq)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_ABS);
 }
--
2.34.0

