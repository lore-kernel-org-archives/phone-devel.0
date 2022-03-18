Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EF9C433EF
	for <phone-devel@archiver.kernel.org>; Fri, 18 Mar 2022 18:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238197AbiCRSj2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Mar 2022 14:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239341AbiCRSj1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Mar 2022 14:39:27 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B61AFD1F
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:38:08 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h23so12221295wrb.8
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxcaI5PPLcGqvRUtBX2rA37vADL045EnXxAdViDUp7s=;
        b=g7+BklOg6UNgkaO/bdUqX0jYsNzP27+FAasuZEgPJW3QJDk40vorEenEEKDhjKtfny
         UjJVD5LEkSyhU3ZxaPYz5UVYFIE5seVV4wkii0XOOtauOBv4F3FVG61Vj/XM4hyB7ol5
         htp4dEhDw+a5pLzI9CSWsuzrounXfpMiA5vuXCZgXafIUY1xw5GY/aaTPKoM/UHrxfB6
         lZE8GXqP6mTkBovnPexaEe8XAoUVmq+Qdz+LL9jzigJWpx7pz/q9LW8Bxuvaz8cTYXkR
         CHVJO4QIla3DhOKX3P+7+atzyF4N2yv7+JNsuhELKE99Q88vRCIAquqlq1tqFohOctpN
         NGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxcaI5PPLcGqvRUtBX2rA37vADL045EnXxAdViDUp7s=;
        b=NkME2NFHaOh+rsJ+WkDl2qpaWEeUbGneeftlfujPmL0D9HBTNHt0Jl5FloGiF0SX6Y
         OdyYpkm5aMKdNLSPxmf9MbeD669WEV+b46z/P36hbGjH4lR+MmXnOURqlGCA510eC45Z
         Tt2Kn9lh7ihT3mNtAFnHRx5Mg6VKNgfp7iOqKmWz2vlL6/0JUpwKNPm0F6/1p6+aTG+a
         c5Gw8Xf80nrnrNURuPjQv9zyfyu9HYWZ+YXCSy+7woLuIj4oi0RxBknF5SL5jjAWzP1Z
         mp6JUZ3WGYLFgx1gtdZ60fmCfYWG3dc102CK2vSVhIIWumR9GOTLSF56Ac5C1EgvaO0K
         kb2A==
X-Gm-Message-State: AOAM5323ogcyV/CmPzd3YelTr0eiS7Gw2NZbnR8jWKbaKaHuoVGhfnha
        wO/yKvt11upblurnF+5Msha6wi/8ay0OVw==
X-Google-Smtp-Source: ABdhPJyt/aqgd/G4xClL3pIIdid5DVsjFmvlts76WqZtBshuebteGpuiNLrrMsW0WKMaCy4sAj1cfg==
X-Received: by 2002:a05:6402:4311:b0:416:6a08:a9 with SMTP id m17-20020a056402431100b004166a0800a9mr10954842edc.346.1647628228837;
        Fri, 18 Mar 2022 11:30:28 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:28 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] phy: qcom-qmp: Add SM6350 UFS PHY support
Date:   Fri, 18 Mar 2022 19:30:01 +0100
Message-Id: <20220318183004.858707-4-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318183004.858707-1-luca.weiss@fairphone.com>
References: <20220318183004.858707-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The SM6350 UFS PHY is compatible with the one from SDM845. Add a
compatible for that.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
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

