Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C7BC47088
	for <phone-devel@archiver.kernel.org>; Sat,  3 Dec 2022 09:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLCJP3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 3 Dec 2022 04:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiLCJP2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 3 Dec 2022 04:15:28 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C32959FC8
        for <phone-devel@vger.kernel.org>; Sat,  3 Dec 2022 01:15:27 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j4so10993639lfk.0
        for <phone-devel@vger.kernel.org>; Sat, 03 Dec 2022 01:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zufFwP7/DkjBWKjq80SuEipUEPZxE2AAKa9AEeewJQQ=;
        b=lkLTgeXkDyJTJUCtKxUW7LL9rAkZQYQ579FKCCEONchRdTuWuUQ0+1sE0uV8vfYLx6
         DcaU6BgjCT5NLSyEh9s8UuJ4O3CTOMtVuqB4W+l7E+g+X2ZKUHbMRUToNhs6JFl+d3su
         2YmDFMVvMwzBRVC9gsklSO2eYgphdpj3yf4O/Qe/CtbVDu/PZ4DR9sfFMBnzv0eCKwPd
         X53XVqBTYQA5RwlLataQpSZLDDDJKl72Fg5bNNAG0/II8DZrzjk+nOtQCwhubYwyM3ZY
         aoAxN5y7pvDgvdjcMlxEpXj9hGfxObdI5W62SZFb+QkCBS+OiK74mAwwrBiZCwLLRyTy
         b2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zufFwP7/DkjBWKjq80SuEipUEPZxE2AAKa9AEeewJQQ=;
        b=1emzOMZvZMc4Mkwn0KqLbaDnJMxSoEktxWQXVXjzseHoWmCiYWFgBbXSEDxwMy0hTy
         aZF/yaXXxgV+IoMgQCSrHjiEWzdtE+TG+d+i54iIkttx5mWFEXBdVQzggEkrUnYrpoUL
         9wm2TKK4fq56MtHqOGYJj5VUNRtjdJmz7NDcTumBAHv1wNQCxODLz4SX6k8rv4trfW4l
         HabET/yB/SYB32BJ1WJzgynfiRcMY7IzcppG2I5eiscrPjeHWYUAYtkZpCypyHlwpyIA
         Zjug1zs5YGCf1nylxjgX7fEpTKFz0qA27R55yr88QILrIM1Vq6QTSpq+KImn78gHQomG
         wcww==
X-Gm-Message-State: ANoB5pk06kK1hrVKyXYmtzT/Ae1POnzYHGK6lIxSWZscJ7rO/InI6sJX
        QqyiwVWM3hKuhIPOOjd+A4KxWg==
X-Google-Smtp-Source: AA0mqf4PYCrX4EYmV2MZKCuj7dvyzgiUxvkGN/P2u2gCkfMnf/Ax3KB1SAJ+j+lzCKZYG4G+iTnFzg==
X-Received: by 2002:ac2:5e9e:0:b0:4b4:b07c:b953 with SMTP id b30-20020ac25e9e000000b004b4b07cb953mr17226674lfq.565.1670058925804;
        Sat, 03 Dec 2022 01:15:25 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v4-20020a2ea604000000b0026dce0a5ca9sm800132ljp.70.2022.12.03.01.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 01:15:25 -0800 (PST)
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
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: crypto: Let STM32 define Ux500 CRYP
Date:   Sat,  3 Dec 2022 10:15:15 +0100
Message-Id: <20221203091518.3235950-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221203091518.3235950-1-linus.walleij@linaro.org>
References: <20221203091518.3235950-1-linus.walleij@linaro.org>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collect Krzysztof's ACK.
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

