Return-Path: <SRS0=mJHj=DD=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8695EC47423
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 13:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F262221EA
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 13:02:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEHCAQGs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIZNCb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 26 Sep 2020 09:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZNCa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 26 Sep 2020 09:02:30 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DBCC0613CE;
        Sat, 26 Sep 2020 06:02:30 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so6837782wrw.11;
        Sat, 26 Sep 2020 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gWD386RbrjVWz9wUaxhS4DhH04wCa0t53FVu1zLb3Fw=;
        b=sEHCAQGsKoDwWrmQ6FtIuU2px3BYbknciMgCPQrGLcJdBxfqn6Y3jxVVLZIb8S9DBC
         L4Gvq1IEVaYu4mOdl9l9wwTwcmOFjzIc9c9xsTC54iQasR5dgWWHaWpghzeI+gC43rp6
         NpuJnqbVPRrHUiQq8c/pkpSUDTTiLsZm/FXSK0f2gsuqlastG9SgMOMsrrjOR06MsK+S
         eIwJFkCSzJCUM9uFBqC/COIxjbVZ/ksBGe5UAdhI2NwXoXx73FbvbpIzUUty6obxjHrA
         e9s7hL3MOprksjk0Hy8Mfx1TJ15Sqeo/t+Y0qmtNaMsBTZuk5+Es6AIs/oz+C4c6viGT
         IoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gWD386RbrjVWz9wUaxhS4DhH04wCa0t53FVu1zLb3Fw=;
        b=DeKCOPPVtYG6SPT8F1lY92AGtty+IcCpRrZAjh9vscfoK+gbNjekEguCE+pIYGFjkq
         S7auFh7jQ06m3AdTO63JxBH9u8O00IhqNXcxAOM4EgdCoskjWojysNS1i2OSmzNiAExo
         vmwnnCUcKxeBBNN2Le/6gX0jo8cekQm8sfky3+RyCiP6xiVetnxl1ODctD8BfHmiSeUV
         /NtrIydVkRdwptCH94yAglWGYYXG+rz2Huvkk4/Kw8SalFPq99Rg2czcISf040Q9jFP9
         yXMw8QwLlkCB7h7xH9zoC0Rp+BvhCprk0YK7YDVwu9212x7QAninGHRbKgDj45P8n2Is
         372A==
X-Gm-Message-State: AOAM530LrEG80JQKxgK37w9hV5y8jdTbuZ6foSaPoV0qk6ir2tFd7g9Z
        iLX0w6PyzhqLh/a0WHWtVVs=
X-Google-Smtp-Source: ABdhPJxkYxM4pEeDHZkFNxfWCC49y44fnY3uZl1NSqZkU9fvM9fL3+jOLfTHkSL80ob69JkIb/JgxQ==
X-Received: by 2002:adf:dccd:: with SMTP id x13mr10167307wrm.403.1601125348902;
        Sat, 26 Sep 2020 06:02:28 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id f14sm7137738wrt.53.2020.09.26.06.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:02:28 -0700 (PDT)
From:   kholk11@gmail.com
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, sboyd@kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Qualcomm clock fixes and preparation for SDM660
Date:   Sat, 26 Sep 2020 15:02:21 +0200
Message-Id: <20200926130225.13733-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series includes two fixes for the SDM660 GCC, and a
change in the rcg2 gfx3d ops, which are essential for a later
series that will add the MMCC and GPUCC for this SoC.

The change in rcg2 gfx3d is only about generalizing the functions
in order to reuse them for more than just one MMCC for one SoC and
brings no functional changes on MSM8996. For more informations,
look at the commit description for patch 3/4.

This patch series has been tested against the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

AngeloGioacchino Del Regno (4):
  clk: qcom: gcc-sdm660: Mark MMSS NoC CFG AHB clock as critical
  clk: qcom: gcc-sdm660: Mark GPU CFG AHB clock as critical
  clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers
  clk: qcom: mmcc-msm8996: Migrate gfx3d clock to clk_rcg2_gfx3d

 drivers/clk/qcom/clk-rcg.h      |  9 ++++++
 drivers/clk/qcom/clk-rcg2.c     | 56 +++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sdm660.c   |  7 +++++
 drivers/clk/qcom/mmcc-msm8996.c | 29 ++++++++++-------
 4 files changed, 70 insertions(+), 31 deletions(-)

-- 
2.28.0

