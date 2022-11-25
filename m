Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF29C46467
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 22:32:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiKYWc6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 17:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiKYWcn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 17:32:43 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DA35987F
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 14:32:25 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id z4so6610351ljq.6
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hbzo+NbmLokJWoaf53jWJ1PlLdMPH3z8QwlWnFJHboQ=;
        b=qAMiBcBCA6ZC2vDgjzxeetijB5hgzgtmDp0EGZw9Y1f/3QPX+lOTup0cSIgTpzai4P
         xBgkbnT3DdXeZI75ps9S5WhMhYC+KFcv//WX7CiE+x6uHjNuytH/BPAkDT4ppEoVFpWa
         LHRH4BEPiorU0h6wA2lRjpOX81VwtG+0tXiJ48i5qZ6+F724HY3qx4cQyYLAUagqP6jK
         XRgp/gDUY3iYmCKRpn0LEzVaxTQIteUJFImFZ2C5uWLHuW1y5oSdfoHqaOyZPHn9WDjT
         4iNTz7jlBV9wLFKHnOdZguv9dga58PIaZcui/rJ+KuUbwdmiLHnZyctmGZleFAOjw/Iz
         /ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hbzo+NbmLokJWoaf53jWJ1PlLdMPH3z8QwlWnFJHboQ=;
        b=fwZFo9B+l69YG8QtsrhgGi+NMgbRjLqRJbNoYmBYiOzdDPI3KWljnfo3WeBJ4cov5R
         UAkAHt7XGpuypzyYAN7CyQgjjX9qAeo5/sOb6glZSUiDr6HjdmaMWW7pGmv8caphv3/u
         H2XSG1hcrlxuvCEwK2JzWG3K5EOV7FUcNVuq+pLKOT/8s6LmdtTwlDus6+e9GOaNJLD0
         ZGb0mqL+9XCJC+XuIK2qNDVOxD+83cJeLP6KSVAjW9r17wxclxPVP5PnvKDue7JtkYMl
         OnJGHpqr4wwKGqlaemJH/+e+SN61im7JfdgKtV1KDCsCB2Wmx7qNVKdR3Ka5zJhJygli
         Qkpg==
X-Gm-Message-State: ANoB5pnFqB1WOUW5A2Xrx1NODh/ccQalZNwGQmPEnRDswlvECsaCJPJ2
        Kma9Sk3lPYyP68y8wYz77O4VgQ==
X-Google-Smtp-Source: AA0mqf4nALAFRo+i9Lt2nEWIV3o/WiUXRn7SPSrmkJSeSX79ggmnK5QrKHcoydhJaIcIZ/mSOufVnQ==
X-Received: by 2002:a05:651c:10af:b0:277:3046:3d1c with SMTP id k15-20020a05651c10af00b0027730463d1cmr12443609ljn.422.1669415543990;
        Fri, 25 Nov 2022 14:32:23 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id f7-20020a05651201c700b004b4e9580b1asm676582lfp.66.2022.11.25.14.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 14:32:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Lionel Debieve <lionel.debieve@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: crypto: Let STM32 define Ux500 CRYP
Date:   Fri, 25 Nov 2022 23:32:14 +0100
Message-Id: <20221125223217.2409659-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125223217.2409659-1-linus.walleij@linaro.org>
References: <20221125223217.2409659-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds device tree bindings for the Ux500 CRYP block
as a compatible in the STM32 CRYP bindings.

The Ux500 CRYP binding has been used for ages in the kernel
device tree for Ux500 but was never documented, so fill in
the gap by making it a sibling of the STM32 CRYP block,
which is what it is.

The relationship to the existing STM32 CRYP block is pretty
obvious when looking at the register map, and I have written
patches to reuse the STM32 CRYP driver on the Ux500.

The two properties added are DMA channels and power domain.
Power domains are a generic SoC feature and the STM32 variant
also has DMA channels.

Cc: devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop the second (new) example.
---
 .../bindings/crypto/st,stm32-cryp.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
index ed23bf94a8e0..6759c5bf3e57 100644
--- a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
+++ b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
@@ -6,12 +6,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STM32 CRYP bindings
 
+description: The STM32 CRYP block is built on the CRYP block found in
+  the STn8820 SoC introduced in 2007, and subsequently used in the U8500
+  SoC in 2010.
+
 maintainers:
   - Lionel Debieve <lionel.debieve@foss.st.com>
 
 properties:
   compatible:
     enum:
+      - st,stn8820-cryp
+      - stericsson,ux500-cryp
       - st,stm32f756-cryp
       - st,stm32mp1-cryp
 
@@ -27,6 +33,19 @@ properties:
   resets:
     maxItems: 1
 
+  dmas:
+    items:
+      - description: mem2cryp DMA channel
+      - description: cryp2mem DMA channel
+
+  dma-names:
+    items:
+      - const: mem2cryp
+      - const: cryp2mem
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.38.1

