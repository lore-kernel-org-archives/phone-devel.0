Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA158C433F5
	for <phone-devel@archiver.kernel.org>; Fri, 18 Mar 2022 18:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbiCRSlQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Mar 2022 14:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240226AbiCRSlQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Mar 2022 14:41:16 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6225D1C9B54
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:39:56 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id a17so10215145edm.9
        for <phone-devel@vger.kernel.org>; Fri, 18 Mar 2022 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbg2RlFA/4puyAOuKWmpEc0rQD4bbwwHtg4uOvJP+0I=;
        b=CLaL56CILexB1XmewhSYD+RMOauS6TXFrSrM09e8FX6dz3NqqKNQuLoBTJMloetORm
         bdsFhPuyeJBgQwXMcWioPB3uOCRhCKZb15XtU05+uB3I/TOXoWs0CISSxKayf95mroVa
         zaN5A7mGN1VgxSGahkm6Hmy6lrxAOme+8PJ/Bg44Gec/QYLJhyXIkqJWp/aoVAjJBRDd
         iaJvbVkvpG1j0vgmX6D8dbAeG9ARk291ldzH5/YvTUVsXIBVvVMPQIy0XqBLGXbG8oyA
         rlLhDlE7/MTvg8kEayMeztg9JDPF7plFAz3CxDj+7gO6QzrJx2fjQ+NM9TO8eirumasp
         aoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbg2RlFA/4puyAOuKWmpEc0rQD4bbwwHtg4uOvJP+0I=;
        b=WPej7a+qETQP2HSCDIMOqkTb9wbEdfaqy4+SVXXgHgLFltRKSWNJ2ILWIrjVg3inw6
         zzg1RkIkYQXqfLwF9fuR0FYO1MEJqVyf95F+fTyy0JtmTNe90ENDIr4kmBb0550wCP+u
         9Nk24nkUOtjHkir6MFo0dyem0RljTn2/CP1ppV72F8BiYvV6BJgR8XIFMIifLrmn6/+r
         xrLmaakm41Np1mOXY60Gz+IcJioXwRf58G0l1r6Pa3iwMlhpSJKBA5hJH3hxl2mocz9m
         HEyviwZ7eP8w0qtu9YKbd7YQwrMgDh72IcCIskFN/PUWW0Rx0el3cQedM2aC5p0P92Na
         4YBQ==
X-Gm-Message-State: AOAM532/9KNwWoLolbiOyspRsToUE0VSAi/IyXGBRxOxGiIIyEr0AaxW
        /PEmN3wIyH5w1rnro+7HgtsJvCVwsIaRTw==
X-Google-Smtp-Source: ABdhPJy9l9NnPcxCTwrHttfVSh2VeMF/NE86kvBCodu5fsRVccCePBYOvZuaZPfCKvJyw5yFTLlEtQ==
X-Received: by 2002:a17:906:6a02:b0:6d7:cda:2cf7 with SMTP id qw2-20020a1709066a0200b006d70cda2cf7mr9874936ejc.53.1647628227733;
        Fri, 18 Mar 2022 11:30:27 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:27 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: phy: qcom,qmp: Add SM6350 UFS PHY bindings
Date:   Fri, 18 Mar 2022 19:30:00 +0100
Message-Id: <20220318183004.858707-3-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318183004.858707-1-luca.weiss@fairphone.com>
References: <20220318183004.858707-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible string for the UFS PHY found in SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e20d9b087bb8..934aa9101ddd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -39,6 +39,7 @@ properties:
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm6115-qmp-ufs-phy
+      - qcom,sm6350-qmp-ufs-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
-- 
2.35.1

