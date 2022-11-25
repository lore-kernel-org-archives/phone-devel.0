Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A738C4321E
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 09:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiKYJ25 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 04:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiKYJ2j (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 04:28:39 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9685925EBC
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 01:28:37 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id fy37so8964165ejc.11
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 01:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mpP1Fb3xrzGRgQcSv/nFJciJPCBP7tqCxTn34nBqums=;
        b=M3AG39iyzVs6kp0nC+H6PpKMBHKps2QdCUkARwCOOsrhaQzvV03csXlDQrasZJfxXq
         5++2hBLuysDfDyTuchXNvhK0/xi/Itvpo6NplBuZk7h6f+vuMyT2zIryoZu4RDAjpH9u
         1kG8hhmksgxiGXsd1m8NOYhDz6dv/mVQbu/+mILE1rjce+4lB6agNnAWS4RYUHNpEZZ2
         YfMq7mLnGCP1mG1Z8uAYt5dy87jP+gpppV548B0WAKVeVImMIXjTJC26xRJyrzY5jdC4
         6vw4cdnVVsBX+MO9sczMwjyzNDYHPZFxsHGOZhipN926gnKVQc0Oy/o1+msxlp0ixOLj
         odMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpP1Fb3xrzGRgQcSv/nFJciJPCBP7tqCxTn34nBqums=;
        b=N9VD/eSPb66+v9KBSqJyEM/NwlphvWTRCFCI5zvJujgD2aKZzUQWZtu1YbQxt2Qxpx
         t17qNATvxLHG2MdccNUlzE1zPmHJRgvtSDF00jf1hC5IiB0Pwz51W86LHFUzCI38wsJF
         NZN0PFR/V20uTMeFf8WKmXllleY97tJu37BEw0a+u3HwKDd3niMYuCCt6fXG/JtoUqy7
         CAiN7BGyziYHkjSMjzaQ4YbAjGRy91uXJHzN6oW/p4KFV/8ztRNwPvQ4d7GYx37lwyoT
         7tJoj37VuWNr+n77/LPq9ShtSffqtN6wOdkbXfihXj//HynMoY733hKT6EeysZZoehos
         bkHQ==
X-Gm-Message-State: ANoB5pk+gRdxvHSO8f5Eo+Q+StKfLjOa6j5JdUbYfNaZFn0Vt7/yO3uk
        0PWBoR8GafFXuUZe0gTtJ5wjYQ==
X-Google-Smtp-Source: AA0mqf6hp96XZKNkOkLtlvlp1dyiIjtsY9pIgqXvv7XvMMs9JbLaxGUy326AbqovFjsY5Em9g7F0/Q==
X-Received: by 2002:a17:906:d281:b0:782:7790:f132 with SMTP id ay1-20020a170906d28100b007827790f132mr15514892ejb.649.1669368516112;
        Fri, 25 Nov 2022 01:28:36 -0800 (PST)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q10-20020a170906b28a00b007b47748d22fsm1329315ejz.220.2022.11.25.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 01:28:35 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350 compatible
Date:   Fri, 25 Nov 2022 10:27:47 +0100
Message-Id: <20221125092749.46073-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible describing the combo phy found on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
@Johan Hovold, I've sent this v2 as RFC because there are several things
where I have questions on how it should be done.

In this patch, you can see there's cfg_ahb (&xo_board) and power-domains
is not set. In msm-4.19 &gcc_usb30_prim_gdsc is only used in the
ssusb@a600000 node, or should I also add it to qmpphy?

 .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 6f31693d9868..3e39e3e0504d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -17,16 +17,18 @@ properties:
   compatible:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
+      - qcom,sm6350-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
 
   clocks:
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     items:
       - const: aux
+      - const: cfg_ahb
       - const: ref
       - const: com_aux
       - const: usb3_pipe
@@ -61,7 +63,6 @@ required:
   - reg
   - clocks
   - clock-names
-  - power-domains
   - resets
   - reset-names
   - vdda-phy-supply
-- 
2.38.1

