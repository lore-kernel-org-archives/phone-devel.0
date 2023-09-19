Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41EFCD5BB2
	for <phone-devel@archiver.kernel.org>; Tue, 19 Sep 2023 12:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjISMqV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Sep 2023 08:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjISMqT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 08:46:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21488F4
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 05:46:10 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50300141a64so5244230e87.0
        for <phone-devel@vger.kernel.org>; Tue, 19 Sep 2023 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695127568; x=1695732368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fWFiq2Z3kzEyU88O2c9+i0+0nk8+Hu7Vs+xo2WgRZY=;
        b=0qu5Ts8zT7BUKq+V4tf8qNL+Uamsn0u4PCcd/SdXWT66uBOofC56VEyRBtviIASGBt
         Fri7YsQnAta4i68K5lR9fRr86BuIsSfJjVuz2LD5/l0QM8X8ZXzfvEBXMujWlx1la7cW
         qvFI+xYOAX523nh/J32xpYNYTPdY5PnFU7yIQTDhjfHQ/shfG2rJVuWdVMt/fv+aZzen
         dNqp1ckCWBw8IbGaB+GzaXRAUBVt6a2N/2nVSMMLKaIdVSpjd7HlWynoRZ921MSAH/W9
         AyvWhlToFeX598Mks+iZGC9GadgNcHgQ2HtHEflgKgosd2gCtyU1L6euO/c6TTajnQRi
         eWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695127568; x=1695732368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fWFiq2Z3kzEyU88O2c9+i0+0nk8+Hu7Vs+xo2WgRZY=;
        b=IjTxqeKcpnayLTAuMYIX+NqlFYzHx6zgYse+EqboXt5emKHK14YgUxI8nIaV0aXt0D
         exJDusicIMaTFvibCEEQdH7lnYYnlEcex985nve7P5UHwVZeRYu06I5U86/78AaQWh8y
         tLxqEbVA33ebydkQhHodHoDCAq/zV1muRDLPteiy2Z8gG0GhF5rT5hd09H2fJCM+4FYo
         XOofE525Vbc4QAOiObbeV8RN18nP+Y8ihRbCHLGhYo+X+FfmEb4aUy1oEGWOe8SmZThN
         bXYxiks2ORpRNEyDt6cvrhBtYhQ1HWCvd4NYTw+FBEEObe6OUMZ8OZUuv35Ml+Ww0Pqz
         wwCQ==
X-Gm-Message-State: AOJu0YxISL3I7pLaQXsHvPAFNT1DEXEWZMJ55E6wK9X9Tx+Ljja6Qvcc
        92Qsiyi7E8f+rpBLaYCTndfr2w==
X-Google-Smtp-Source: AGHT+IGZklR6vmwx+I1m2TYBs5iOwsPLRBe+Obf/CId5PwS12y8h+KZFNQQ9tDvt0rDzC8/Y2ewakQ==
X-Received: by 2002:a05:6512:31cd:b0:503:1722:bf3a with SMTP id j13-20020a05651231cd00b005031722bf3amr5986480lfe.1.1695127568502;
        Tue, 19 Sep 2023 05:46:08 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id dn22-20020a05640222f600b00532c1dfe8ecsm635878edb.66.2023.09.19.05.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 05:46:08 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 19 Sep 2023 14:46:00 +0200
Subject: [PATCH v2 6/7] dt-bindings: arm: qcom: Add QCM6490 Fairphone 5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230919-fp5-initial-v2-6-14bb7cedadf5@fairphone.com>
References: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
In-Reply-To: <20230919-fp5-initial-v2-0-14bb7cedadf5@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Fairphone 5 is a smartphone based on the QCM6490 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index adbfaea32343..76934f4772e9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -50,6 +50,7 @@ description: |
         msm8998
         qcs404
         qcm2290
+        qcm6490
         qdu1000
         qrb2210
         qrb4210
@@ -391,6 +392,11 @@ properties:
           - const: qcom,qrb2210
           - const: qcom,qcm2290
 
+      - items:
+          - enum:
+              - fairphone,fp5
+          - const: qcom,qcm6490
+
       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
         items:
           - enum:

-- 
2.42.0

