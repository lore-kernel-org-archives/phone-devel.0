Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AF1C433E0
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D89123A1C
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbhAINv4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 08:51:56 -0500
Received: from m-r1.th.seeweb.it ([5.144.164.170]:49199 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbhAINv4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 08:51:56 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0F3A51F4EA;
        Sat,  9 Jan 2021 14:51:14 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 0/5] Clock fixes for DSI 10nm PLL
Date:   Sat,  9 Jan 2021 14:51:07 +0100
Message-Id: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The DSI 10nm PLL driver was apparently ported from downstream, but some
of its "features" were not ported over, for a good reason.
Pity is that the removal of the downstream dependencies broke the clock
calculation logic for this driver and that made it impossible to use any
DSI display on at least MSM8998.

This patch series fixes the calculation issues and also solves some TODOs
that I've found in this driver.

Tested on:
- Sony Xperia XZ Premium (MSM8998) dual-dsi command-mode LCD display
- F(x)Tec Pro1 (MSM8998) single dsi, video-mode OLED display

AngeloGioacchino Del Regno (5):
  drm/msm/dsi_pll_10nm: Fix dividing the same numbers twice
  drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits assignment
  drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation and prescaler
  drm/msm/dsi_pll_10nm: Fix variable usage for pll_lockdet_rate
  drm/msm/dsi_pll_10nm: Convert pr_err prints to DRM_DEV_ERROR

 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 43 ++++++++++------------
 1 file changed, 20 insertions(+), 23 deletions(-)

-- 
2.29.2

