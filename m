Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC51C1B08C
	for <phone-devel@archiver.kernel.org>; Wed, 14 Jul 2021 22:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46A4360232
	for <phone-devel@archiver.kernel.org>; Wed, 14 Jul 2021 22:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237053AbhGNWzB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Jul 2021 18:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbhGNWzB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Jul 2021 18:55:01 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CDCC06175F
        for <phone-devel@vger.kernel.org>; Wed, 14 Jul 2021 15:52:09 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id b40so5759475ljf.12
        for <phone-devel@vger.kernel.org>; Wed, 14 Jul 2021 15:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vc1795qvLpUqEdDnFv1A73y0n5CUCOk1ko3r9sb3Sx0=;
        b=nxc0PfF+vcpPyOd7wizP6Qq8XgwEGMvP+b0wo88UNeoTCIUvTu4QhMo2t7Yfw5pUdt
         WkLIfeTxJaOuf6Xi9NXmUM2+BPH07qole1NgZngPcaI0qRHcCI95amaJRsh9rk4mivV6
         g8VQ5SHNrOIdqNEB3N9mXsZi3PQwHKm4UO4JeLWRAToht4FNhS8eq7mUIMUkvo23Cciz
         FPyHPl5qLuzw5YW0aKKroNZn6sc+EaHddghvNE/hFcEAk1rLFv0RECf7kKghA44lPE3d
         Ra9KaDIgRFONPbCvBdAVPH4AfVoLvtDqATNPZZ2cNfeODSBeer0EeUjbgN0W4aRqwiYS
         R9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vc1795qvLpUqEdDnFv1A73y0n5CUCOk1ko3r9sb3Sx0=;
        b=DFzgftEuq6PM5Y5wmczeCWoXtpM2D8TyiDqbdzqDDxRYDeEIAK+Bn9YUD09xJ80HE8
         kFOoFUgfkfsHkK8Z7YCoFY2dAfktB+m5Mf5GP7RBM/nhfAAL6CCP9jthI6ku5vcY3S4R
         HeB/KqFknsEouF/cjHcUQJkd9rsd9tF0gbOmf6jtICcXfVsQ9/0Iz8iajIrbGCjjd17e
         BWqvc3lBgBNrKG/m0VKusRbOhFdHf4JzLwABz4p3sXpjBySBRpEM0pqmJbEqpf91UAFd
         dW/jt6oVYWkuz0+TjuSmc5zd90c5gERJFp6bwU7I9931xiI00QpluX43Sps1mC7Dhi3w
         juMw==
X-Gm-Message-State: AOAM530U9m1mjIoK71oyqBDw1a9kqmGZF/XbQWTfx75aa2h6dkUI1TFo
        H4SHI+NtSNhlBoN6oT4+Dy41LA==
X-Google-Smtp-Source: ABdhPJxDXhj2BLMGMjFb1MJmvVrRCVFza7h3BYAxpmGa8zBkaoag7+E02+PhIRS+h7Jp8yaKlFSUcw==
X-Received: by 2002:a2e:80c2:: with SMTP id r2mr173089ljg.164.1626303127507;
        Wed, 14 Jul 2021 15:52:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m4sm205984ljq.96.2021.07.14.15.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 15:52:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2 v4] drm/panel: Add DT bindings for Samsung LMS380KF01
Date:   Thu, 15 Jul 2021 00:50:01 +0200
Message-Id: <20210714225002.1065107-1-linus.walleij@linaro.org>
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
Cc: Noralf Trønnes <noralf@tronnes.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Collect a few Reviewed-by's
- Mention that the node must be an SPI child.
- Indent example by 4 spaces.
- Resend with the driver updates.
ChangeLog v2->v3:
- No changes just resending with the series.
ChangeLog v1->v2:
- Expect SPI bindings to be pulled in for the client and state
  spi-cpha: true etc.
- Make port a required node.
- Update the example to use a proper SPI controller (spi-gpio)
  so we get full validation of the example.
---
 .../display/panel/samsung,lms380kf01.yaml     | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
new file mode 100644
index 000000000000..251f0c7115aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -0,0 +1,99 @@
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
+  The panel must obey the rules for a SPI slave device as specified in
+  spi/spi-controller.yaml
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
+        compatible = "spi-gpio";
+        sck-gpios = <&gpio 0 GPIO_ACTIVE_HIGH>;
+        miso-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+        mosi-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
+        cs-gpios = <&gpio 3 GPIO_ACTIVE_HIGH>;
+        num-chipselects = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "samsung,lms380kf01";
+            spi-max-frequency = <1200000>;
+            spi-cpha;
+            spi-cpol;
+            reg = <0>;
+            vci-supply = <&lcd_3v0_reg>;
+            vccio-supply = <&lcd_1v8_reg>;
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+            interrupt-parent = <&gpio>;
+            interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&display_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.31.1

