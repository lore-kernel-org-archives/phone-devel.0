Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBC9C4320E
	for <phone-devel@archiver.kernel.org>; Sun, 29 Aug 2021 20:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00CAC60F46
	for <phone-devel@archiver.kernel.org>; Sun, 29 Aug 2021 20:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbhH2Uba (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Aug 2021 16:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbhH2Ub2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Aug 2021 16:31:28 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FFBBC061575
        for <phone-devel@vger.kernel.org>; Sun, 29 Aug 2021 13:30:36 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 24E6A1F969;
        Sun, 29 Aug 2021 22:30:32 +0200 (CEST)
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] Use "ref" clocks from firmware for DSI PLL VCO parent
Date:   Sun, 29 Aug 2021 22:30:24 +0200
Message-Id: <20210829203027.276143-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

All DSI PHY/PLL drivers were referencing their VCO parent clock by a
global name, most of which don't exist or have been renamed.  These
clock drivers seem to function fine without that except the 14nm driver
for the sdm6xx [1].

At the same time all DTs provide a "ref" clock as per the requirements
of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
that clock to use without relying on a global clock name, so that all
dependencies are explicitly defined in DT (the firmware) in the end.

[1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Marijn Suijten (3):
  arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference
  drm/msm/dsi: Use "ref" fw clock instead of global name for VCO parent
  clk: qcom: gcc-sdm660: Remove transient global "xo" clock

 arch/arm/boot/dts/qcom-apq8064.dtsi             |  4 ++--
 drivers/clk/qcom/gcc-sdm660.c                   | 14 --------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  4 +++-
 7 files changed, 17 insertions(+), 21 deletions(-)

-- 
2.33.0

