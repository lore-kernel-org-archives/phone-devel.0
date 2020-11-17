Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA06DC5519F
	for <phone-devel@archiver.kernel.org>; Tue, 17 Nov 2020 12:18:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5280C2222B
	for <phone-devel@archiver.kernel.org>; Tue, 17 Nov 2020 12:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/OvA6+h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgKQMSQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 17 Nov 2020 07:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbgKQMSQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 17 Nov 2020 07:18:16 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B40C0617A6
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2020 04:18:14 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id o24so23989519ljj.6
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2020 04:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAZbZSxcI71M0LVfy83Qq3cXSi4UOJMbtQEtUu1ICRM=;
        b=a/OvA6+hoEi29hwk3HyX2fSLzesinExvg2iQ/BKLYFn4Cu9I6THdyqY0Ctr9qRvf/y
         2zEgpAhH53lMWZj5qslla8oHnNtbyAo2PLjBUqD/i2FaYOuVKbxinK0QLZYcDE61B/We
         1ek/ZP4VdUeCGS8CurzeWoL/v537JFTM4psogQPCy2VqvwPs7fpyXvL2IEv8y/NHUB9J
         t9+j0T3DtBxAyMO6b6appok9bYGDKBvY2QDelSJZLljnoDbHXQMccheQ2/FtruogT61l
         U66XS/NgyfcnxJ4jFPqi/3vYDzqVJFdnFU8WOLxxYm5/CF+m4WjGr3gIcut+YfD3qId8
         7dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAZbZSxcI71M0LVfy83Qq3cXSi4UOJMbtQEtUu1ICRM=;
        b=ZWA9WKu699nma+CYSLFaUciRG7stx3W5fphRvMKVhiM6QdE4Si811VBUoDstrqGPXx
         kQBZWmjjPSOJek6MDssXA0ER1KK1mCZsPfZ6Rnyjok4WqLXVrA0frAnx7CgufRX6YznI
         x8bfvgaQ/f3CrajJZtljNA3vwTOdAJIIx8p/mojoDMAHxcE2x5M6lR9v1AUXuh0u8+Lo
         5uQypJswFE7duuIXGTROP77hsyZ8ompICxtoQyk96DXpTCzuVZYod3dCytuY1U2prV3q
         rp7vMY3syjJyusTmxMBfTdhv0fLjxO6jX6uHOWz+3upasoSjdSZ0UTU1X2TtruysGm5P
         ebaA==
X-Gm-Message-State: AOAM5308c+hAiNUgvSlLCoiRNCoTlQz+6A2Uz6h1ulY687iHNq8VGM2m
        rzK3ZuJJZXmhmA1jFyOg00vnOQ==
X-Google-Smtp-Source: ABdhPJxRxEsHezDfXhkW96+Ceg8hXglyWHbt6vtZbE7gWeXB7oGP5dKwUhJEvWJIykb5KDEv1iOPDQ==
X-Received: by 2002:a2e:a312:: with SMTP id l18mr1787582lje.231.1605615492979;
        Tue, 17 Nov 2020 04:18:12 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id f25sm3116380lfc.234.2020.11.17.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 04:18:12 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org
Cc:     Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: [PATCH v2] iio: accel: yamaha-yas: Add DT bindings
Date:   Tue, 17 Nov 2020 13:18:10 +0100
Message-Id: <20201117121810.830743-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds device tree bindings for the Yamaha YAS5xx
magnetometers/compass sensors.

Cc: devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add Yamaha to the vendor list, I was surprised to find
  they were not yet listed.

I am still working on the actual driver for the magnetometer
but why not send out the DT bindings for review, the
hardware variants are easy to describe. This makes it possibe
for people to include these magnetometers in device
trees.
---
 .../bindings/iio/magnetometer/yamaha,yas.yaml | 80 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas.yaml

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas.yaml b/Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas.yaml
new file mode 100644
index 000000000000..6fc4cfe4a417
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/yamaha,yas.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/magnetometer/yamaha,yas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Yamaha YAS5xx magnetometer sensors
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  The Yamaha YAS5xx magnetometers is a line of 3-axis magnetometers
+  first introduced by Yamaha in 2006 with the YAS529. Over the years
+  this magnetometer has been minatyrized and appeared in a number of
+  different variants.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - yamaha,yas529
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
+    description: The YAS5xx sensors has a RSTN pin used to reset
+      the logic inside the sensor. This GPIO line should connect
+      to that pin and be marked as GPIO_ACTIVE_LOW.
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt for INT pin for variants that support
+      interrupt generation. This polarity, whether the interrupt
+      is active on the rising or the falling edge, is configurable
+      in the hardware.
+
+  vdd-supply:
+    description: An optional regulator providing core power supply
+      on the VDD pin, typically 1.8 V or 3.0 V.
+
+  iovdd-supply:
+    description: An optional regulator providing I/O power supply
+      for the I2C interface on the IOVDD pin, typically 1.8 V.
+      This is not present on all variants of the component, some
+      have only the VDD voltage.
+
+  mount-matrix:
+    description: An optional 3x3 mounting rotation matrix.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        magnetometer@2e {
+          compatible = "yamaha,yas530";
+          reg = <0x2e>;
+          vdd-supply = <&ldo1_reg>;
+          iovdd-supply = <&ldo2_reg>;
+          reset-gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
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

