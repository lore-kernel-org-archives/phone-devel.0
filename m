Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729F5C43334
	for <phone-devel@archiver.kernel.org>; Thu, 21 Jul 2022 16:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbiGUQcR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 21 Jul 2022 12:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiGUQcQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 21 Jul 2022 12:32:16 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D4989A5C
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 09:32:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a9so3588796lfk.11
        for <phone-devel@vger.kernel.org>; Thu, 21 Jul 2022 09:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+oK+pOh8MGs7bFdJqgWR+kgnOKb6pAhLXHsdjc9P39M=;
        b=jeV22coreGgshD+gkAquxb7fsVo72DB+o/dKajf74blBq9YB1jI8G2Y2ZB46jiDhlh
         OgKUwryyrOPuim6TUIMc1PaoRQm3dZ6VD3Zz3BekL80J9HFLZy9pGf2V9yMM1M2wV0Mm
         kQ5/WBt8kFGAyKSjg99cd9dytVdNLTTbl9SFYJpWmUifgVJ60aocAV0zJYWNwA/+YBlt
         NSK8G8hafDTjjC7VYw+bMzLf8C5Na5B0BnXQ23Gw140mJN5gCLCBGHARM/zpaBL6mxeJ
         kuJkDnJ5QaYXGSqGRirp4uHlRtnbvqh8/f+FAqWyEQUAZx62bM/9OdyLltpBWfSz1LxU
         V3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+oK+pOh8MGs7bFdJqgWR+kgnOKb6pAhLXHsdjc9P39M=;
        b=t3CmM3k0dihoN5ofF2cedhx6b/Uam7xth2HBV/JXcEDWmy1xY1aYWNiXIm3p5tTf/+
         1bM7bgEZMQ8Lfc8YND29QP05T9/S0RRuLU0RD4CjzdQVdEkgp5lG24gYrpfcvKgCCQtG
         Mn3TNNDgKO+vleMw3ZFNeimLvCGXAlV9rtU7z57rwChxvcOT7jQetaRjK7+6seU+ONni
         UvlxWIVf/0Y9oZ3kpVwHuxDDHWTPTEqzHNrR7n6mqkt3Kud3nLc4yrHxd5e6w5MW7+jZ
         js0k/O884NRsHc4ekyej1or2YghgqRBYAfo+BPeE4DRooTBCREtWaehbdEso1pAvun5C
         KYuQ==
X-Gm-Message-State: AJIora/eFQuJ9ICoyRfOErsgTk7xEOrxib1o5Bw6Gj5voOd0DXJr027M
        ASJol53QbTPEXZ/XvDv236I5m28V9h+t+Q==
X-Google-Smtp-Source: AGRyM1tnVCiYtipecpPF2+nlfxAx4GIakxxmeBxEAhUT2vxG/jCChsvmPA2jWxbrvW3SMCP0Uf4Ahw==
X-Received: by 2002:a05:6512:2611:b0:478:da8f:e2d8 with SMTP id bt17-20020a056512261100b00478da8fe2d8mr21957614lfb.460.1658421132859;
        Thu, 21 Jul 2022 09:32:12 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id b5-20020a056512070500b0047da6e495b1sm536580lfs.4.2022.07.21.09.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 09:32:12 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [PATCH] dt-bindings: crypto: Add ST-Ericsson Ux500 CRYP
Date:   Thu, 21 Jul 2022 18:30:10 +0200
Message-Id: <20220721163010.1060062-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds device tree bindings for the Ux500 CRYP block.

This has been used for ages in the kernel device tree for
Ux500 but was never documented, so fill in the gap.

Cc: devicetree@vger.kernel.org
Cc: Lionel Debieve <lionel.debieve@foss.st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
The relationship to the existing STM32 CRYP block is pretty
obvious when looking at the register map. If preferred, I
can just extend the STM32 bindings with these extra
(generic) properties and compatibles as well.
---
 .../crypto/stericsson,ux500-cryp.yaml         | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/stericsson,ux500-cryp.yaml

diff --git a/Documentation/devicetree/bindings/crypto/stericsson,ux500-cryp.yaml b/Documentation/devicetree/bindings/crypto/stericsson,ux500-cryp.yaml
new file mode 100644
index 000000000000..9653776007a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/crypto/stericsson,ux500-cryp.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/crypto/stericsson,ux500-cryp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics and ST-Ericsson Ux500 CRYP bindings
+
+description: The Ux500 CRYP block is identical to the one found in
+  STn8820 introduced in 2007. It seems to also be a related ancestor to the
+  STM32 CRYP block.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - st,stn8820-cryp
+      - stericsson,ux500-cryp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/stericsson,db8500-prcc-reset.h>
+    #include <dt-bindings/arm/ux500_pm_domains.h>
+    cryp@a03cb000 {
+      compatible = "stericsson,ux500-cryp";
+      reg = <0xa03cb000 0x1000>;
+      interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&prcc_pclk 6 2>;
+      power-domains = <&pm_domains DOMAIN_VAPE>;
+    };
-- 
2.36.1

