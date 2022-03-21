Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA85C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 21 Mar 2022 13:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237963AbiCUNfk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Mar 2022 09:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347915AbiCUNfT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:19 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01663C4B7
        for <phone-devel@vger.kernel.org>; Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r23so17911742edb.0
        for <phone-devel@vger.kernel.org>; Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DsNby0a3KqzAfOnj6mSyZetKsm2cbFk7h9HIg7MUGdQ=;
        b=mVyqs6hGGEUzEFy32H/xYVc8XbIFlcX8m1ZC85sLopiDTeC1gHZcaYWZ1t9zaF9xhJ
         EYsabs6hRni0eEKMdAghJhsH5U/tcQt0EiS5EP4KZ3mRazXyLtVGD12H72iJ7mYDRQbN
         ORKFueJmChRJ5gjIlmvlPOvD4pVJq+PanCARu1rT8lQ00x+5dK3bfhHgP/vkmiURe5HT
         DOA0f9njkv3mDnFZUcDzZFW7Wl0UMIduQZmfJkKsip8jeIdDg5sq2WRbbvITTvKO+bIq
         AFN60dplhhuEVHC7vWPgmddrusV9fLlJEVQJETly7aK5vwYDy8tuXeSV18QY1Fc6qrrT
         VTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DsNby0a3KqzAfOnj6mSyZetKsm2cbFk7h9HIg7MUGdQ=;
        b=Ys5QNEJEKfDLPX4ZyeaH2muC3bCuT53sIa82KumpzNCOba0ixFlEFybYC1OeLrtIUK
         QqiXXhzByiNp14doxBV/0d50KNx94MdT8uAUjjVYTsM48ZDyY/6jK5HC75WGKKcCHC0T
         G5i/2sfU3+pgZK1lxwAU+FMyAJ1IJG981Efd9KxRT0DyBAc7HDBjQhD6A8sTyIF7RXJR
         EtdN7PvZGcCg6gZ22giSBxzDvluqP1SHrNxL9yTHdlhXI5i1caydskQYtl6ANIEVWhaq
         kIylCXPnj30Bbzg1pSqtQUhgOFDaozZ+wBDHDg/Buku0e9kGTmZsrSxFVgVB//UdKIa7
         CfXw==
X-Gm-Message-State: AOAM531oEt2q4gvYXfX64dEaOY3qpoJC8n8Ee/eDkjJC23gOhbvPOiBj
        f0vKAn9MiioYWTV0/5dzLAbXmA==
X-Google-Smtp-Source: ABdhPJwbmbOxiUJERj4MHNXeag+kdgbSCHJBfY82vjDCL38uvezqoHUBcVMRYz+Bz08iOVCcqVzlsg==
X-Received: by 2002:a05:6402:51c7:b0:419:2bd7:efa4 with SMTP id r7-20020a05640251c700b004192bd7efa4mr8919920edd.135.1647869632531;
        Mon, 21 Mar 2022 06:33:52 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:52 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] phy: qcom-qmp: Add SM6350 UFS PHY support
Date:   Mon, 21 Mar 2022 14:33:15 +0100
Message-Id: <20220321133318.99406-4-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The SM6350 UFS PHY is compatible with the one from SDM845. Add a
compatible for that.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- nothing

 drivers/phy/qualcomm/phy-qcom-qmp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index b144ae1f729a..1628275265b5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -6007,6 +6007,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm6115-qmp-ufs-phy",
 		.data = &sm6115_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm6350-qmp-ufs-phy",
+		.data = &sdm845_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-ufs-phy",
 		.data = &sm8150_ufsphy_cfg,
-- 
2.35.1

