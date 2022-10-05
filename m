Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E105DC4332F
	for <phone-devel@archiver.kernel.org>; Wed,  5 Oct 2022 18:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbiJESRP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 5 Oct 2022 14:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiJESRO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 5 Oct 2022 14:17:14 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE4F4DB53
        for <phone-devel@vger.kernel.org>; Wed,  5 Oct 2022 11:17:11 -0700 (PDT)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CC8EB3F5B8;
        Wed,  5 Oct 2022 20:17:08 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm: Fix math issues in MSM DSC implementation
Date:   Wed,  5 Oct 2022 20:16:50 +0200
Message-Id: <20221005181657.784375-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Various removals of complex yet unnecessary math, fixing all uses of
drm_dsc_config::bits_per_pixel to deal with the fact that this field
includes four fractional bits, and finally making sure that
range_bpg_offset contains values 6-bits wide to prevent overflows in
drm_dsc_pps_payload_pack().

Altogether this series is responsible for solving _all_ Display Stream
Compression issues and artifacts on the Sony Tama (sdm845) Akatsuki
smartphone (2880x1440p).

Changes since v1:

- Propagate r-b's, except (obviously) in patches that were (heavily)
  modified;
- Remove accidental debug code in dsi_cmd_dma_add;
- Move Range BPG Offset masking out of DCS PPS packing, back into the
  DSI driver when it is assigned to drm_dsc_config (this series is now
  strictly focusing on drm/msm again);
- Replace modulo-check resulting in conditional increment with
  DIV_ROUND_UP;
- Remove repeated calculation of slice_chunk_size;
- Use u16 instead of int when handling bits_per_pixel;
- Use DRM_DEV_ERROR instead of pr_err in DSI code;
- Also remove redundant target_bpp_x16 variable.

v1: https://lore.kernel.org/linux-arm-msm/20221001190807.358691-1-marijn.suijten@somainline.org/T/#u

Marijn Suijten (7):
  drm/msm/dsi: Remove useless math in DSC calculations
  drm/msm/dsi: Remove repeated calculation of slice_per_intf
  drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on
    modulo
  drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
  drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
  drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional
    bits
  drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent
    bits

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 11 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c         | 56 ++++++++++------------
 2 files changed, 28 insertions(+), 39 deletions(-)

--
2.38.0

