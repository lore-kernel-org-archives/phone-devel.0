Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E7CC433E0
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1AA623A1C
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbhAINww (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 08:52:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbhAINww (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 08:52:52 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FE9C0617A7;
        Sat,  9 Jan 2021 05:51:16 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 249841F56E;
        Sat,  9 Jan 2021 14:51:15 +0100 (CET)
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
Subject: [PATCH 4/5] drm/msm/dsi_pll_10nm: Fix variable usage for pll_lockdet_rate
Date:   Sat,  9 Jan 2021 14:51:11 +0100
Message-Id: <20210109135112.147759-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
directly, but the same value was also being specified in the
dsi_pll_regs struct pll_lockdet_rate variable: let's use it!

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
index 5be562dfbf06..df3e4584dfd7 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
@@ -302,7 +302,8 @@ static void dsi_pll_commit(struct dsi_pll_10nm *pll)
 		  reg->frac_div_start_mid);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1,
 		  reg->frac_div_start_high);
-	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1, 0x40);
+	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCKDET_RATE_1,
+		  reg->pll_lockdet_rate);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_PLL_LOCK_DELAY, 0x06);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_CMODE, 0x10);
 	pll_write(base + REG_DSI_10nm_PHY_PLL_CLOCK_INVERTERS,
-- 
2.29.2

