Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83A3C433B4
	for <phone-devel@archiver.kernel.org>; Tue,  6 Apr 2021 21:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E3DF613D3
	for <phone-devel@archiver.kernel.org>; Tue,  6 Apr 2021 21:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243057AbhDFVrt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 6 Apr 2021 17:47:49 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:57659 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239469AbhDFVrt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 6 Apr 2021 17:47:49 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5DEF43F347;
        Tue,  6 Apr 2021 23:47:38 +0200 (CEST)
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
Subject: [PATCH 0/3] drm/msm/mdp5: Emit vsync signal often enough
Date:   Tue,  6 Apr 2021 23:47:23 +0200
Message-Id: <20210406214726.131534-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This set of patches corrects and improves VSync-related register setup
on the MDP5 block.  Values written to the registers were way too high
leading to the MDSS block counting way too many ticks on the vclk before
emitting a vsync interrupt, resulting in significant update issues on
command- and video-mode panels.  With lower values - that match those of
downstream kernels - the panels on Sony devices (Xperia X, XA2 Ultra,
and more) update at an acceptable rate without "pp_done" timeouts.

The Driver-IC in these panels is also able to drive an interrupt line
and a future patchset will enable the use of this "disp-te" GPIO beyond
acquiring it in dsi_host.  This fixes panel framerate the correct way
(instead of running at half the desired framerate), but these patches
are still needed to aid development now and shorten lockup times when
the TE interrupt misbehaves by not arriving at all.

AngeloGioacchino Del Regno (1):
  drm/msm/mdp5: Disable pingpong autorefresh at tearcheck init

Marijn Suijten (2):
  drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the vtotal
  drm/msm/mdp5: Do not multiply vclk line count by 100

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.31.1

