Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAB0C433EF
	for <phone-devel@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240220AbiCRSlj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Mar 2022 14:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235415AbiCRSlj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Mar 2022 14:41:39 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FEF1C9B4C
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:40:20 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id bn33so12393021ljb.6
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVqxXsnsA1LY8cZh5HtidQZ6OjQlcer9+l/ndoFCZzY=;
        b=0GPHb7LYcRvV0cYr619kgGkNXh29aZ1bBS0X1XqBJg22GVMGqMop/Fmcw2gghkOpLI
         TH/jF2MknNS+B7o+jM3fb31Yo/4amEjdUwNBwk6EwZxK4vP7a85oGidUknXa3fJrTk/N
         oSOlY4bYnplz7A11froxUMvRPhprEFwnN3F86raLG/Weq+cgRvZfTyCQprFm+rBApJCz
         SlbdZjwh7/y2bn2qlGW8+B4BdIvsZpj9qMtGugd4vQ1RIxIU7pbFhElFAe7r2OwNadgc
         VN+gIgADqpI2L5zSE+49UxIRfq50gAMqTWWITfBLv0MnFZjfMgFAcnn4mgbqSeSVgY2+
         Heug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zVqxXsnsA1LY8cZh5HtidQZ6OjQlcer9+l/ndoFCZzY=;
        b=aS9m9/0wK1Q/UJ4ZBMXo5NiwoAugNlRF3a2NTRyCEnZdi8fq4vlKxnYLUZ0BxPc3CC
         5AA8s1XKVd0DIT/afFy10rjIxXGDUT9ln1kVLaCFjbQwN9BJhyJePeMoQFSLCmuw4BGv
         JHRssoCrOg4dYx7potQGuCZkhdeyM16agmYLZPFkHMVafOACQtzNMgmToy43kjepTHap
         Lrdm2oos4XupIAghcsTDofDmpbqbvCbSQppxPYT+bHTkQamLgtIaQyTPRemkn84qIXWw
         /Qz8odSrxASKyexCP/w4Mxg3iYtIumIu6944tHHWRGI5YCGV+1FlHvX7v+7rFvwYsZtf
         Sc2A==
X-Gm-Message-State: AOAM532jFDPKB2uUyr97JLFFH9acR5oyw2GXALbWuSawyuD7cAALs8s0
        9U5vQKry7BsgETwWRMznl+Y48AMJbCxAvA==
X-Google-Smtp-Source: ABdhPJywc4UWZRd2+eQ+ys6dqt33WizzTPKOjPNdHSD5dskGiUT2AQqDpKCVX60LsFEPTMhbHNqHyg==
X-Received: by 2002:a05:6402:5173:b0:415:f1e2:8d53 with SMTP id d19-20020a056402517300b00415f1e28d53mr10822200ede.95.1647628225727;
        Fri, 18 Mar 2022 11:30:25 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:25 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Avri Altman <avri.altman@wdc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/6] UFS support on SM6350 & FP4
Date:   Fri, 18 Mar 2022 19:29:58 +0100
Message-Id: <20220318183004.858707-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series adds support for UFS on SM6350 which is used for internal
storage.

Luca Weiss (6):
  scsi: ufs: dt-bindings: Add SM6350 compatible string
  dt-bindings: phy: qcom,qmp: Add SM6350 UFS PHY bindings
  phy: qcom-qmp: Add SM6350 UFS PHY support
  pinctrl: qcom: sm6350: fix order of UFS & SDC pins
  arm64: dts: qcom: sm6350: Add UFS nodes
  arm64: dts: qcom: sm7225-fairphone-fp4: Enable UFS

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |  1 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 79 +++++++++++++++++++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 18 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.c           |  3 +
 drivers/pinctrl/qcom/pinctrl-sm6350.c         | 16 ++--
 6 files changed, 110 insertions(+), 8 deletions(-)

-- 
2.35.1

