Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AACC64E8A
	for <phone-devel@archiver.kernel.org>; Sun, 29 Nov 2020 21:55:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 171072078D
	for <phone-devel@archiver.kernel.org>; Sun, 29 Nov 2020 21:55:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8NUZbje"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgK2VzO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Nov 2020 16:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbgK2VzL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Nov 2020 16:55:11 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2018FC0613D3
        for <phone-devel@vger.kernel.org>; Sun, 29 Nov 2020 13:54:31 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id l11so17067394lfg.0
        for <phone-devel@vger.kernel.org>; Sun, 29 Nov 2020 13:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22v+25uLTpzoU6j998AK5X4aT/wXdw1+Ijxp1BLCpE8=;
        b=A8NUZbjezyMvrsQv/uqg7rzmqp2cVN8OcJVFDHRBvPy2ys5HPVB8vr/QAg/4hBjY9F
         /l7h0ctiklIIVnMNzgKhHjZoO4DItwuY9tjQBWsURDkfLzoyzw0BWbTuyKnxN+svZGZq
         iXaY8M5BNPXdb6uoQ0NX8Pf+a5I/TbUpVelpVs7t2tIjl8+v5lfZKigHISQBCnj+Y6HT
         cIhdSSkODDq+rOqvNQqY28XVNo1pPfFZghIU9ba5V4k+TN3pcqCQtA3FJ5UG+zGy658p
         6wu/OHAgRpkUSR6GH+28HZy9mWNlNaj+2dlWeHp2ctLsKb4Dnk2GhlmA8lqY+7jCHmCC
         xH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22v+25uLTpzoU6j998AK5X4aT/wXdw1+Ijxp1BLCpE8=;
        b=IYPAJkLJYnGh9MAynPnXiBnVSDuPldCO9jJcKLMbETHAkYcHcz8RBUVbAmPIOw5pEM
         AKW7gOjVhIVJ/6HLw0wMf072H70Ec+LVkU/Kk4/mRrNDTa5bSUTdrnsotBCiF1J9s1cT
         +A3vBMM3wyhsEuSyTwcnIOMG4CgAu+zpEdLPUPtCdmuwE6GUty2GhO6kk3wI8ObMCNu4
         yfwac9sCG7/CVEmkpytPPuMP3ofsXNLVMC6m+qToTyfraIhigotdjT3rQ4dFqGY0pQ49
         YIf4mVLHFKegbDeqU1FvgqxU/NDc/oDzIs46wLXABfsIPEc0/9mxnJJKNkNJTfmMpuRB
         qN1g==
X-Gm-Message-State: AOAM530b2sj8VYq1uG5MTAnbPCIPh2QxUpOGmMnXPb6OWwxku2iM2mb9
        0nfFxz57n+1GC2CzhHobYxkvKw==
X-Google-Smtp-Source: ABdhPJzudox51pF9Kzryw57vD8MLgv9T2fSKBN+wQO7xB3e4M6fY/+wCDEuulZhtw7he1t/AwYoJcQ==
X-Received: by 2002:a19:8a46:: with SMTP id m67mr7791662lfd.515.1606686869439;
        Sun, 29 Nov 2020 13:54:29 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id b18sm2268654ljp.124.2020.11.29.13.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 13:54:28 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: [PATCH 1/2 v4] iio: accel: yamaha-yas530: Add DT bindings
Date:   Sun, 29 Nov 2020 22:54:20 +0100
Message-Id: <20201129215421.1177990-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds device tree bindings for the Yamaha YAS530
family of magnetometers/compass sensors.

Cc: devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Rename the bindings and file yas530 after the first
  introduced component in the family.
- Simplify conditional logic using the if: not: YAML
  constructions.
- Use the possibility to set a property to false to just
  remvove reset GPIOs and interrupts from variants that
  do not have them.
ChangeLog v2->v3:
- Restrict to cover the YAS53x variants, it turns out that
  YAS529 is a very different component from the others so
  keep that for a separate document when/if needed.
- Rename the file and binding yamaha,53x.yaml
- Use - if: clauses to restrict some properties.
- Fix some spelling mistakes.
- Restrict the nodename to be "magnetometer@[0-9a-f]"
ChangeLog v1->v2:
- Add Yamaha to the vendor list, I was surprised to find
  they were not yet listed.
---
 .../iio/magnetometer/yamaha,yas530.yaml       | 112 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 2 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml b/Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml
new file mode 100644
index 000000000000..4b0ef1ef5445
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas530.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/yamaha,yas530.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Yamaha YAS530 family of magnetometer sensors
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  The Yamaha YAS530 magnetometers is a line of 3-axis magnetometers
+  first introduced by Yamaha in 2009 with the YAS530. They are successors
+  of Yamaha's first magnetometer YAS529. Over the years this magnetometer
+  has been miniaturized and appeared in a number of different variants.
+
+properties:
+  $nodename:
+    pattern: '^magnetometer@[0-9a-f]+$'
+
+  compatible:
+    items:
+      - enum:
+          - yamaha,yas530
+          - yamaha,yas532
+          - yamaha,yas533
+          - yamaha,yas535
+          - yamaha,yas536
+          - yamaha,yas537
+          - yamaha,yas539
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: The YAS530 sensor has a RSTN pin used to reset
+      the logic inside the sensor. This GPIO line should connect
+      to that pin and be marked as GPIO_ACTIVE_LOW.
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt for INT pin for interrupt generation.
+      The polarity, whether the interrupt is active on the rising
+      or the falling edge, is software-configurable in the hardware.
+
+  vdd-supply:
+    description: An optional regulator providing core power supply
+      on the VDD pin, typically 1.8 V or 3.0 V.
+
+  iovdd-supply:
+    description: An optional regulator providing I/O power supply
+      for the I2C interface on the IOVDD pin, typically 1.8 V.
+
+  mount-matrix:
+    description: An optional 3x3 mounting rotation matrix.
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            items:
+              const: yamaha,yas530
+    then:
+      properties:
+        reset-gpios: false
+
+  - if:
+      properties:
+        compatible:
+          items:
+            const: yamaha,yas539
+    then:
+      properties:
+        interrupts: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c-0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@2e {
+          compatible = "yamaha,yas530";
+          reg = <0x2e>;
+          vdd-supply = <&ldo1_reg>;
+          iovdd-supply = <&ldo2_reg>;
+          reset-gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
+          interrupts = <&gpio6 13 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
+
+    i2c-1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@2e {
+          compatible = "yamaha,yas539";
+          reg = <0x2e>;
+          vdd-supply = <&ldo1_reg>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..0340674c72bd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1210,6 +1210,8 @@ patternProperties:
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
     description: Xylon
+  "^yamaha,.*":
+    description: Yamaha Corporation
   "^ylm,.*":
     description: Shenzhen Yangliming Electronic Technology Co., Ltd.
   "^yna,.*":
-- 
2.26.2

