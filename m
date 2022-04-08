Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457E6C433F5
	for <phone-devel@archiver.kernel.org>; Fri,  8 Apr 2022 11:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbiDHLzm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 8 Apr 2022 07:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235207AbiDHLzl (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 8 Apr 2022 07:55:41 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3346FA09
        for <phone-devel@vger.kernel.org>; Fri,  8 Apr 2022 04:53:36 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id c42so9768971edf.3
        for <phone-devel@vger.kernel.org>; Fri, 08 Apr 2022 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OA9i/F0Q7gGy6vw+8jnVyUvqFaSzdMTuMr4fiGshsOc=;
        b=cdT1slNFAvXFtO/Y5oAMec1XE5W9VQ16Hq2VcxUwjVvQcH+F83dVgf+JenniHFRpjt
         y50HrMWV33q+EUZrhjVZfbL4BxfK7nQqCeguIIalPfBBAwl2AgfgfpK7CNSY9/nOJdMx
         vfO2o3rv31YA76DIKZHADIckPsToQORS6+HqWnSuwKA/fnUjQgi/cfvmiYhH/hgesNel
         CIbIWNP+7JsqcI0l2UkWO/aIbADVFl8jz04a0KQy45RLJjlOOWloD7787fuRi3HXvbw3
         NTQpl9LKzDiz69gjGDOSvIA7LpVopSXEGz4tTBLiDkxmkG06Mq4lNw4nCWMkzy/XuVJ/
         B6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OA9i/F0Q7gGy6vw+8jnVyUvqFaSzdMTuMr4fiGshsOc=;
        b=YL49f4pkn7Ky+Dilc68Iy1T29QwVc1sjDen+o1m36SDi/LqOduWFVVJTA72d1tLe5z
         ACnHgRmX7FQchF5g32xlMSyvmDz3GPfh1fgzHqsRAEua/9eVxcq41G6UDEAgTIDohbgU
         FpxqYWNGzrQJ5yrQbCgbTQcNcJfpKyEjSsTYfP3o6o6g/+1o8Vt+4IfzUCdrFsEzSJuG
         kpe63aggNSb6LJXBKud0n2tJSUSqW5Sa+Gf6V9IbghmvrsExhcJsnn80mxlNVXaunYla
         MB7UMMKNb1sZx5OMr4yocJ0b22PUyEDwTz+iMDU/4tyia5GaZXHvMQyjvq6in2u2VlCJ
         xKTA==
X-Gm-Message-State: AOAM531ZUNDk4IZh+V3RRFJDPdeMMq1iZ3kQbkwp944NJO/V0MBOeoRR
        yjQfL7oYn9ySf3T5InLRKIie/w==
X-Google-Smtp-Source: ABdhPJxadi9ASalxmUdAyobBgUBlVo0Duu8xhPyv+ELTnJjcIfzBRWcwHvQuE6G+lfW3km7c5/E0Cw==
X-Received: by 2002:a05:6402:2809:b0:41d:124e:4292 with SMTP id h9-20020a056402280900b0041d124e4292mr6103371ede.263.1649418815208;
        Fri, 08 Apr 2022 04:53:35 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id r29-20020a50c01d000000b00415fb0dc793sm10470899edb.47.2022.04.08.04.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 04:53:34 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-input@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: input: Add bindings for Awinic AW8695 haptics
Date:   Fri,  8 Apr 2022 13:53:08 +0200
Message-Id: <20220408115311.237039-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a document describing the bindings for the AW8695 LRA Haptic Driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/input/awinic,aw8695-haptics.yaml | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/awinic,aw8695-haptics.yaml

diff --git a/Documentation/devicetree/bindings/input/awinic,aw8695-haptics.yaml b/Documentation/devicetree/bindings/input/awinic,aw8695-haptics.yaml
new file mode 100644
index 000000000000..9f573daaba0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/awinic,aw8695-haptics.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/awinic,aw8695-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW8695 LRA Haptic Driver
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+properties:
+  compatible:
+    const: awinic,aw8695
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: GPIO connected to INTN pin (edge falling)
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to RSTN pin (active high)
+
+  awinic,f0-preset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Default value for the f0 of LRA
+
+  awinic,f0-coefficient:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Coefficient between actual f0 and the value in the registers
+
+  awinic,f0-calibration-percent:
+    maxItems: 1
+    description: Limit of f0 deviation from awinic,f0-preset
+
+  awinic,drive-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Level of drive waveform in normal driving
+
+  awinic,f0-detection-play-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Drive waveform play times in the first period in the f0 detection
+
+  awinic,f0-detection-wait-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Waveform wait times in the f0 detection
+
+  awinic,f0-detection-repeat:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Repeat times in the f0 detection
+
+  awinic,f0-detection-trace:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Drive waveform play times in the second period and later in the f0 detection
+
+  awinic,boost-debug:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 3
+    maxItems: 3
+    description: Values for BSTDBG1-3 registers
+
+  awinic,tset:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Value for TSET register
+
+  awinic,r-spare:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: Value for R_SPARE register
+
+  awinic,bemf-upper-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Back EMF (electromotive force) upper threshold
+
+  awinic,bemf-lower-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Back EMF (electromotive force) lower threshold
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - awinic,f0-preset
+  - awinic,f0-coefficient
+  - awinic,f0-calibration-percent
+  - awinic,drive-level
+  - awinic,f0-detection-play-time
+  - awinic,f0-detection-wait-time
+  - awinic,f0-detection-repeat
+  - awinic,f0-detection-trace
+  - awinic,boost-debug
+  - awinic,tset
+  - awinic,r-spare
+  - awinic,bemf-upper-threshold
+  - awinic,bemf-lower-threshold
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@5a {
+            compatible = "awinic,aw8695";
+            reg = <0x5a>;
+            interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&tlmm 90 GPIO_ACTIVE_HIGH>;
+
+            awinic,f0-preset = <2350>;
+            awinic,f0-coefficient = <260>;
+            awinic,f0-calibration-percent = <7>;
+            awinic,drive-level = <125>;
+
+            awinic,f0-detection-play-time = <5>;
+            awinic,f0-detection-wait-time = <3>;
+            awinic,f0-detection-repeat = <2>;
+            awinic,f0-detection-trace = <15>;
+
+            awinic,boost-debug = /bits/ 8 <0x30 0xeb 0xd4>;
+            awinic,tset = /bits/ 8 <0x12>;
+            awinic,r-spare = /bits/ 8 <0x68>;
+
+            awinic,bemf-upper-threshold = <4104>;
+            awinic,bemf-lower-threshold = <1016>;
+        };
+    };
-- 
2.35.1

