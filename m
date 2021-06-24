Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA2DC49EAB
	for <phone-devel@archiver.kernel.org>; Thu, 24 Jun 2021 22:40:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0C1D613AD
	for <phone-devel@archiver.kernel.org>; Thu, 24 Jun 2021 22:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhFXWmV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 24 Jun 2021 18:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXWmU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 24 Jun 2021 18:42:20 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866FFC061574
        for <phone-devel@vger.kernel.org>; Thu, 24 Jun 2021 15:39:59 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id c16so9884688ljh.0
        for <phone-devel@vger.kernel.org>; Thu, 24 Jun 2021 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DxTs9lTae46Xhf8kLhsZfUlYx/YjM18QvR3O42D40aA=;
        b=f2MwHX5VBcVkGwZgCMni3tNxJmYesEn8BhxwrYdGMgyrT7r5Deuj5ZZt/E2mL7NItH
         BsBXjrjyeF4hHqs12NhMfbbtm2veljzqVXSPAn1qxe7SyyiUhRFNUtZS6OqurxTWviI9
         8DokPhK+KFDp0QjgP6NABbwWKWwtml4P6MgKmPZ+0LwofBDNEksbWp0twSF9q84RPXsh
         UQpdzaSv4W+horsvvmsFruFL//YULoGxA9CE3w/0xbZfff16nzhZBfsR5FouYlK+0Jxu
         hmSNXBFZgS7AwSv+8MPRhQXtGYWsRyF3nQIFU5r/jtGy9Xk3GL/CGZcd0upC9foaO8fn
         wMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DxTs9lTae46Xhf8kLhsZfUlYx/YjM18QvR3O42D40aA=;
        b=e22LUxR0whB2p6EWxt5ZlCFwBPhSuyPQDO1K23uTQ+Wjg4WKKiUXw64x3Qyf029C/v
         AdR0CZ3j7Vo4za6IwoAx16GKRVKx0n4XgWmtm5vCmodSnS80CI68ZPSTvSsNZXBGDvt1
         s76wvDZkxQrKinx0PgLThnt+6+REmOlNPMOmIQezv+CCuASiCEM5oApSCm+HO6ZhozRh
         C1OHDPPpqkuuRF/ypPz8veDLaiFXstgENtg2p8ogMcKWWsCLoK8TAOFgI2QNF1Fv2CkF
         +aNrhnS3uoIqv0TGjmX5Fb5btZddkZ9kE8nVkjo9DI89ucWU3I3jkIoUJQk02xf0rGDR
         C+uA==
X-Gm-Message-State: AOAM531MnLYXnqjGc/2MMlj05oRsDKY5K14ElIAB1IxTo7yTYYFskKEV
        bgAEXTG2hfBA4WuA44iPFMAekw==
X-Google-Smtp-Source: ABdhPJyWfx/EAsg04pU+FiCKFTcKQS4KhRid92ZjAQ4UTsCxFf7Ko+U/IPFNv0fp9GzDmmrNZfPCBg==
X-Received: by 2002:a2e:9e18:: with SMTP id e24mr5757701ljk.336.1624574397916;
        Thu, 24 Jun 2021 15:39:57 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id e12sm341403lfc.84.2021.06.24.15.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 15:39:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH] drm/panel: Add DT bindings for Samsung LMS380KF01
Date:   Fri, 25 Jun 2021 00:37:43 +0200
Message-Id: <20210624223743.2486302-1-linus.walleij@linaro.org>
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
 .../display/panel/samsung,lms380kf01.yaml     | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
new file mode 100644
index 000000000000..138be12fc509
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
@@ -0,0 +1,96 @@
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
+  spi-cpha:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: inherited as a SPI client node. Must be set.
+
+  spi-cpol:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: inherited as a SPI client node. Must be set.
+
+  spi-max-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: inherited as a SPI client node.
+    maximum: 1200000
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - spi-cpha
+  - spi-cpol
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
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
+        reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+        interrupt-parent = <&gpio2>;
+        interrupts = <29 IRQ_TYPE_EDGE_RISING>;
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

