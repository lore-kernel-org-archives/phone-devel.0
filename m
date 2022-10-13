Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EB8C4332F
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 09:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiJMJOV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 05:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiJMJNp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 05:13:45 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB8116EB71
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 02:13:37 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g27so1684006edf.11
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dzrAn+aBg/5KVcVy/4aX4joCWNIa7ky5mt/LVd7Cts=;
        b=EpOkGGCsgHYv53DtFoFfROkk3L70Tad3Fr98hzdLPuGpB67l/RLNzEBfk6W4b2EshY
         heegHPUgBEw1hcrGaYOATLKXTKvem4g5S6Lb3RMMoJufXUlAxAamcbyAY13lmYodkLeX
         u6SHw0M8I7LxbQAztnvDt2hOo8zLTOKUeT3zGoM3n/MiiwU1TLm72iCfKo3Btj9qeuSr
         SBtQffQhJawJuoSnXkJ1hYdSEIdN4zYqlp7AE4TyZ6Uby+P2Wr9cbdnQTBDBexZGQ/AZ
         Jd7XJ53v38BYyjY0H+QHMPGtwcluNUpf4di0GT/wReLKc0mWX74+PHtfMGqv0efLG7Bo
         t5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dzrAn+aBg/5KVcVy/4aX4joCWNIa7ky5mt/LVd7Cts=;
        b=lN5HI5KCbkza8P+ECtM/W2tSuPyfsKjQF9uOyenzF9gU/i6reJ2DN0FNEvzJaFVNAp
         xrQK1nYTWkvnst2OBm7vcLdyT4ls6cNTKrP9tq0+QQPXSDPZIiuHMV9FgVKtzFSLkrA0
         4fk7gTy9gqPofsHJ15kYRfpaWwAIrNvWu6c35M8Qu6ZRDZnn4a1uB7GSwFfzY79pFtmR
         zU7Qwx8Zh8fwvVDM3lWCSne4tw4PGUCco8YrJyQYiEgQDsoOc+N7+ApoRPrT3Kd3Zlc0
         yGStCIh5IpqjcVJaX9rOEzhIX9pu63xWAZcttvmiJj4HjnIaPmL/SoaKXMEG93W/8x+u
         ps8Q==
X-Gm-Message-State: ACrzQf3dCei4TxvlzOQ/SqZypHpeDxk3jMJofA8nN+OL0sxmM2PT0oBJ
        aFTKm9we0dnFvJPeCedEXkVfwA==
X-Google-Smtp-Source: AMsMyM5p8hsyMuf8fEG6NDPh7dYuTrJBp5jGeer89w4o0UR99iwkf54abNti1vvH5DL5t0oMqY+4Dw==
X-Received: by 2002:a05:6402:5510:b0:459:5ea:9bc0 with SMTP id fi16-20020a056402551000b0045905ea9bc0mr30068091edb.152.1665652416151;
        Thu, 13 Oct 2022 02:13:36 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b0073dd1ac2fc8sm2582725ejc.195.2022.10.13.02.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 02:13:35 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: qcom,pdc: Add missing compatibles
Date:   Thu, 13 Oct 2022 11:12:08 +0200
Message-Id: <20221013091208.356739-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatibles that are already in use in the upstream Linux
kernel to resolve dtbs_check warnings.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b6f56cf5fbe3..94791e261c42 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,11 +28,15 @@ properties:
       - enum:
           - qcom,sc7180-pdc
           - qcom,sc7280-pdc
+          - qcom,sc8280xp-pdc
           - qcom,sdm845-pdc
+          - qcom,sdx55-pdc
+          - qcom,sdx65-pdc
           - qcom,sm6350-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
+          - qcom,sm8450-pdc
       - const: qcom,pdc
 
   reg:
-- 
2.38.0

