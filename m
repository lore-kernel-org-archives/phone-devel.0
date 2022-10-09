Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CA0C433F5
	for <phone-devel@archiver.kernel.org>; Sun,  9 Oct 2022 18:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiJISwJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 9 Oct 2022 14:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbiJISwI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 9 Oct 2022 14:52:08 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D29F2C66D
        for <phone-devel@vger.kernel.org>; Sun,  9 Oct 2022 11:52:07 -0700 (PDT)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 050A41F95B;
        Sun,  9 Oct 2022 20:52:04 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC values
Date:   Sun,  9 Oct 2022 20:51:46 +0200
Message-Id: <20221009185150.461323-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221009184824.457416-1-marijn.suijten@somainline.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

According to the `/* bpc 8 */` comment below only values for a
bits_per_component of 8 are currently hardcoded in place.  This is
further confirmed by downstream sources [1] containing different
constants for other BPC values (and different initial_offset too,
with an extra dependency on bits_per_pixel).  Prevent future mishaps by
explicitly disallowing any other bits_per_component value until the
right parameters are put in place and tested.

[1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/DISPLAY.LA.2.0.r1-08000-WAIPIO.0/msm/sde_dsc_helper.c#L110-139

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 68c39debc22f..7e6b7e506ae8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1774,6 +1774,11 @@ static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 {
 	int i;
 
+	if (dsc->bits_per_component != 8) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
+		return -EOPNOTSUPP;
+	}
+
 	dsc->rc_model_size = 8192;
 	dsc->first_line_bpg_offset = 12;
 	dsc->rc_edge_factor = 6;
-- 
2.38.0

