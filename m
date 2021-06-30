Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56072C11F68
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 18:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 362C561156
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 18:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhF3Scs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Jun 2021 14:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233030AbhF3Scs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Jun 2021 14:32:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A749C0617A8
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 11:30:18 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d16so6879113lfn.3
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0zkcKp841s0XqP9/v6DKydNJDudXDrtFk9F38hA3kg=;
        b=iAvhLjlbRgIbfVOrvgRi4yXYup9sGDtgenU4nw6ewl8lfQKpxPbFvmboEJAhl41Qj3
         ICfE97Y7bocbBzwVpez4SbsWKkr+6R3AitZ4IeF3a6D+C6Ldot65Psq+drJ+uN67SFJR
         Hxni+3zVPreqATXYrOh00A8e4xQ5yNEo72u2Kggr/ThPtmoScsM4bXr5l9xeKh0mvWAe
         VACANg7IOjrQzIXP05Zv2El2QN4KCpVPaDfzIWxoBvt7sUYQ7V4e4yUnATbnukxhmfzl
         QXCQuSlyyQUbZ0Su/hBO2zR1lrmcGrphMtr2jTqsSlBHECE1VULFLfxbg1V6k9C2riUw
         DoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0zkcKp841s0XqP9/v6DKydNJDudXDrtFk9F38hA3kg=;
        b=kVK6RGjEh2kYgBq2oP81iUMIgTLS4i8FIn7ayus1f+iUXLwHeUZ13AbZKlMFXZIHQq
         g+g4JLO7v5XkTnuV+7jCjyGMfEPhFim/Od6YL9wWXK8zAbYSHzAnGhoCU1QhCZmaT0Z5
         IpHELejmNfrJgvIVsE6yrsX0ytxV+mt9NBPQb0XJwI2hz0UIpMFwH3tXcYPkGrragpjZ
         pnFF3fbAcYvw0fFtCH0qmY0zB30H3RftKcar7S4yhLrRVA0y5yd+KQ9N7x6DfkBwW9Ze
         EVA/m+qReOWvE3bTaSN/60zE3gdDy75lFJigpxiO5C66ch5xTK+O38/Bhubv2e4pHbsq
         5/VQ==
X-Gm-Message-State: AOAM533mDxA1Z1wIzoGhV9TK5hYNjQ+QgtHqz1luFBcPjlkFIp2hRWPD
        C5WON4E5n6V4t1Fsj7UNSjgcAw==
X-Google-Smtp-Source: ABdhPJyX9dZzrJsmWrEgOlPJEtznkY+F9X3mNV59i3DMz+jgLtHpZHuAM2qCFzPCSvDVK00de1gsAQ==
X-Received: by 2002:a05:6512:1c7:: with SMTP id f7mr28590543lfp.181.1625077815537;
        Wed, 30 Jun 2021 11:30:15 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o142sm1986251lfa.299.2021.06.30.11.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 11:30:15 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH 1/2 v2] drm/panel: Add DT bindings for Samsung LMS380KF01
Date:   Wed, 30 Jun 2021 20:28:03 +0200
Message-Id: <20210630182804.3628410-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds device tree bindings for the Samsung Mobile Displays
LMS380KF01 RGB DPI display panel.

Cc: devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Expect SPI bindings to be pulled in for the client and state
  spi-cpha: true etc.
- Make port a required node.
- Update the example to use a proper SPI controller (spi-gpio)
  so we get full validation of the example.
---
 .../display/panel/samsung,lms380kf01.yaml     | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
new file mode 100644
index 000000000000..ebc33c36c124
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,lms380kf01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung LMS380KF01 display panel
+
+description: The LMS380KF01 is a 480x800 DPI display panel from Samsung Mobile
+  Displays (SMD) utilizing the WideChips WS2401 display controller. It can be
+  used with internal or external backlight control.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,lms380kf01
+
+  reg: true
+
+  interrupts:
+    description: provides an optional ESD (electrostatic discharge)
+      interrupt that signals abnormalities in the display hardware.
+      This can also be raised for other reasons like erroneous
+      configuration.
+    maxItems: 1
+
+  reset-gpios: true
+
+  vci-supply:
+    description: regulator that supplies the VCI analog voltage
+      usually around 3.0 V
+
+  vccio-supply:
+    description: regulator that supplies the VCCIO voltage usually
+      around 1.8 V
+
+  backlight: true
+
+  spi-cpha: true
+
+  spi-cpol: true
+
+  spi-max-frequency:
+    maximum: 1200000
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+  - spi-cpol
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+      compatible = "spi-gpio";
+      sck-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+      miso-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+      mosi-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+      cs-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+      num-chipselects = <1>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "samsung,lms380kf01";
+        spi-max-frequency = <1200000>;
+        spi-cpha;
+        spi-cpol;
+        reg = <0>;
+        vci-supply = <&lcd_3v0_reg>;
+        vccio-supply = <&lcd_1v8_reg>;
+        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+        interrupt-parent = <&gpio>;
+        interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+
+        port {
+          panel_in: endpoint {
+            remote-endpoint = <&display_out>;
+          };
+        };
+      };
+    };
+
+...
-- 
2.31.1

