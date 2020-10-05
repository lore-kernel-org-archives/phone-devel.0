Return-Path: <SRS0=vNnj=DM=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A35AC4727D
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:03:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E700C2078A
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 15:03:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3SS6EgD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgJEPDX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgJEPDW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Oct 2020 11:03:22 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A507C0613CE;
        Mon,  5 Oct 2020 08:03:22 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id n15so4214443wrq.2;
        Mon, 05 Oct 2020 08:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CVI5/n5qoHn8PEOWUi8uLb7zVkV/raPLUgF7pGF6GwI=;
        b=U3SS6EgDW2WHGdm1Pl+kqgQjqk44uWitA3eofVK3Kedkl+iZJXfJ9pRbJG7Hwr17K1
         CGdQSI28XQrEHbfCzI0+CIasQIKdZFOyWy2LvRKkgYDRkQGbhhBnYrW+tq1KLrK9xEt/
         qfymHfNCtT5iFID4yE0CRLA9GIvZxZRaf1JWosV2Wkeadc9OssXpa+ViN7RdYkVGbkM2
         sSLLiUOxnAtFOb+afQnbWfxdEkBBNTkMUKi47bINLhC8MjBlGiM3oXonpmT/snV+mnAj
         C+tt6gjJH2Dr5ZvOzx6226UrS8hmUY4F+nahyJlNz2g/nIYuAvah/mynxq3k72csXUM6
         xG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CVI5/n5qoHn8PEOWUi8uLb7zVkV/raPLUgF7pGF6GwI=;
        b=pD6Uh2orGfQbHpIxdQFRr6Iw21AsQX3+wvWxled/8j34fvluguQDMDmnNOOYkpH3RW
         3ZQHqvZhOiDbhXB6Ci/2OnI8PiGc1Wg4omkuAczWN6Gt5bVzDHLMvvcu367ff/6FdLOJ
         pKbqIarc/lKaGMaO2CB1tlvtQcp1ryedE78+x8t+pfe1/B6ejgUf/55kKudia1DkzGeH
         1UOhG2FucW/KJw0/Sa2CjvokZELWOEl5/GQVHat1w+3MfB1UhhKsvC5ISZJ5fBvFzENY
         hKs8nm9UQ4QMeeQddHrzswy/xd1gJ9Kzfj2OSCR+m/HyWEX7SM7OD2MoCcyps9AZeL/P
         v1lA==
X-Gm-Message-State: AOAM53290iU7S9H/b4r2vuVBqU6JXtmew989mydOnmnB+nwTnYIyMVnc
        tKyvg+0oyyj9oVNogrhCrX8=
X-Google-Smtp-Source: ABdhPJwVt20b2ku/Zz0+qdfaAnE2QAqobTEL5eahB8uLQ0S306Z+utiJQP1MMlNIjEQjOJgmYLihBA==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr19200040wrt.255.1601910201178;
        Mon, 05 Oct 2020 08:03:21 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:20 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] pm8994 / msm8992/4 DT updates
Date:   Mon,  5 Oct 2020 17:03:00 +0200
Message-Id: <20201005150313.149754-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series brings support for:

(These ones depend on the patch [1])

- USB on some (think without fancy USB hw) 8992/4 boards 

- SDHCI2 on msm8992/4

(These ones should be GTG without the patch)

- VADC/temp alarm+thermal zones on pm8994

- RMI4 touchscreen on Lumia 950

- Lumia 950 XL DTS

And converts spmi-gpio on pm8994 to use gpio-ranges.

[1] https://patchwork.kernel.org/patch/11816733/

Konrad Dybcio (11):
  arm64: dts: qcom: pm8994: Add VADC node
  arm64: dts: qcom: pm8994: Add temperature alarm node
  arm64: dts: qcom: pm8994: Add thermal-zones for temp alarm
  arm64: dts: qcom: pm8994: Fix up spmi-gpio node
  arm64: dts: qcom: msm8992: Add support for SDHCI2
  arm64: dts: qcom: msm8994: Add SDHCI2 node
  arm64: dts: qcom: msm8992: Add BLSP_I2C1 support
  arm64: dts: qcom: talkman: Add Synaptics RMI4 touchscreen
  arm64: dts: qcom: msm8994: Add USB support
  arm64: dts: qcom: msm8992: Add USB support
  arm64: dts: qcom: Add support for Microsoft Lumia 950 XL (Cityman)

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8992-msft-lumia-talkman.dts   |  28 ++++
 arch/arm64/boot/dts/qcom/msm8992.dtsi         | 120 ++++++++++++++++++
 .../dts/qcom/msm8994-msft-lumia-cityman.dts   |  73 +++++++++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  90 +++++++++++++
 arch/arm64/boot/dts/qcom/pm8994.dtsi          |  96 ++++++++++----
 6 files changed, 384 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-cityman.dts

-- 
2.28.0

