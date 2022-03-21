Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D628C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 21 Mar 2022 13:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347912AbiCUNfT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Mar 2022 09:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347887AbiCUNfR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1466A3C72D
        for <phone-devel@vger.kernel.org>; Mon, 21 Mar 2022 06:33:52 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z92so16905543ede.13
        for <phone-devel@vger.kernel.org>; Mon, 21 Mar 2022 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZ8HdiTgcVigl0a3UV5zlYJCfBrMwpgPetl89qLpPSQ=;
        b=DlGlkCrtzbxekERuNvjOkzibW+KoiiKsaBjyFta8KwhfwCXES710MnwIsbNk/VoOdj
         Kot/QSNUCXwBiyNS836CFk0qVrUPazQgqKcxfnxbi7dsBkpSmbu63iVUSsguyzeA26oK
         3NfVfJ5IaeByUOnA7GJU/GzD5DHk7SP03TF4CCRrOWJeodI3KnAU8HMtIGrgT3aaGlkC
         5TxxLflrak8WwJe+xR22+ASOI1xPo9OXABrw8WuWc56vOjjAZ88xmsIjaRpDUUwRxedg
         DFtY19B/5zp/Vgpf+LtF1ymNI6Jyks29h3liBSpJfEIW4ibmATo5ev76K4ue4byfuvXW
         +rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZ8HdiTgcVigl0a3UV5zlYJCfBrMwpgPetl89qLpPSQ=;
        b=1gwKsV2o+Z52ygTGW4T8Q+zoqW144N11eLNB8iDeyrgUSJkcePo6lnBqdWaG2hEBe7
         /idmdwr5r/sRF0sEPQTbg7DngCs+MoxW77mJ05SFcm4unL5t1t8Sydpmw3AgPYGT7Feq
         kvcwKh9pDEYgoF573upK3o7XET7v12DEXoCPxJFTH3fR5OoY96Al+EW+HQLt5vGBRh/H
         MGGcUgxy1jCIu4VJv0/f01qxHKIScQhc+ScQtJphQqLYjh3Haur1mTkB5mNwN01Hd4R3
         5DXxkYyDn6vyqKKxSgLICjsnS6v2fikKS4FTV7Vc8f0BuraKhcDSinm+4CU/+HGMjc1E
         csug==
X-Gm-Message-State: AOAM533r4fHDseQ0Ui1Q2+hp3rwIBwjlDi2ne5yTsVcFj9R7eqiPrMbl
        kGM/ZmCzvNcdvmkEtbdG1LTNcA==
X-Google-Smtp-Source: ABdhPJx2zzuXLmvAkDeu7gED1IhSElcio6x5gdV3r+KWk0yff6fDQ6CLsQqc2tkzZkv904iYSqyQbA==
X-Received: by 2002:a50:a449:0:b0:418:d875:1730 with SMTP id v9-20020a50a449000000b00418d8751730mr22877841edb.371.1647869630480;
        Mon, 21 Mar 2022 06:33:50 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:50 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] scsi: ufs: dt-bindings: Add SM6350 compatible string
Date:   Mon, 21 Mar 2022 14:33:13 +0100
Message-Id: <20220321133318.99406-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for the UFS found on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- add second hunk for clock validation

 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 5b3a2157f7e5..dcd32c10205a 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
           - qcom,sdm845-ufshc
+          - qcom,sm6350-ufshc
           - qcom,sm8150-ufshc
           - qcom,sm8250-ufshc
           - qcom,sm8350-ufshc
@@ -125,6 +126,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-ufshc
+              - qcom,sm6350-ufshc
               - qcom,sm8150-ufshc
     then:
       properties:
-- 
2.35.1

