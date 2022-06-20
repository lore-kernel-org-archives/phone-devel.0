Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF38AC43334
	for <phone-devel@archiver.kernel.org>; Mon, 20 Jun 2022 17:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241847AbiFTR4c (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244665AbiFTRz5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 20 Jun 2022 13:55:57 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EB01D31C
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:55:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id g26so1229966ejb.5
        for <phone-devel@vger.kernel.org>; Mon, 20 Jun 2022 10:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:from:to:cc
         :subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4RQgLxnfXTiQ2Y4EACm6q+JEz+JOMZDeTY+s/8ELsQU=;
        b=bht06xcoOQ9CeFRNGBmF1AhdncQaaWAckJwTvNSZkRdCkBHicqxY0gbwvc8ENs58vb
         iDVyg5jYQTmi2D+Idqk554u5MH0J5jayTS1UP9f/N5mmu2ExZkFZsgBuT7f06+fT15q0
         6qwdh6eoEcp9zs1FHzA6ZsZ7eTIb9ukzHXTtXDSSOVSz0HqhLhx96Pgk16RcHFgTta0y
         HQJ+E5OAvabRCTuKYimuOBRcJc7qbuqaCpBIYoh5Artx09qTWRf27gWqoIgAQEEc39R0
         ncoNNa2W5Guzt/J3wZnh5PzMDYBRNwCZiHDSsH/0BYQ42h5iE8ErA/r9gmeTO9/+gT4v
         pY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RQgLxnfXTiQ2Y4EACm6q+JEz+JOMZDeTY+s/8ELsQU=;
        b=qgD2mQlldpHUyw9NkK+wIRCWq6n+FzoSZy1fGlOpHoYKA1rUgo7u//mROlwSkUcmuK
         DRR8eIWp5ASB1QF/7RxXcfd9u5By/qSPEaCOBjXOXXazeQD5S1FENLFWTSG03iHVilXo
         rQkRZcmPpZon6ncjT2bJazqlf4eRP7KqTRu7Lv268N9TlGCCgtyI6BbTDkj077pRZpcn
         /Bztx9arMpmn4jek2Jqd/YJjAcR5aQFsx3ZaasrkhyVhgst/M9QDrwK8JiwYOSoYOmPq
         22TIR+tpjv4XcCLuPXR4mY6SnQfM+hEVKspKEbLAsbnzihTEmqN/CAqv9zx1Hr9AvdY8
         kVuw==
X-Gm-Message-State: AJIora/jgNgSsbxGPNamixAiZkbHCtn3gRlfEpcH0KAP//fGMmVDWY8a
        hgnNfgfbTq5KjoyT1NOeuQoMf7kWSLiBhA==
X-Google-Smtp-Source: AGRyM1vqvBVXfk6GlnIBR0eyeFV7R5x2CreiJYt9YutKQBxKsx2sEZpG6zxzFSoEEQefXYWSytYGlA==
X-Received: by 2002:a17:906:73d2:b0:712:2fed:3473 with SMTP id n18-20020a17090673d200b007122fed3473mr20960191ejl.361.1655747755199;
        Mon, 20 Jun 2022 10:55:55 -0700 (PDT)
Received: from [192.168.0.211] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o27-20020a170906359b00b0070a5ba0669dsm6264053ejb.218.2022.06.20.10.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 10:55:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: convert to dtschema
Date:   Mon, 20 Jun 2022 19:50:31 +0200
Message-Id: <20220620175033.130468-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Convert the Skyworks Solutions, Inc. AAT1290 Current Regulator bindings
to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/leds-aat1290.txt | 77 ---------------
 .../bindings/leds/skyworks,aat1290.yaml       | 95 +++++++++++++++++++
 2 files changed, 95 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-aat1290.txt
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-aat1290.txt b/Documentation/devicetree/bindings/leds/leds-aat1290.txt
deleted file mode 100644
index 62ed17ec075b..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-aat1290.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-* Skyworks Solutions, Inc. AAT1290 Current Regulator for Flash LEDs
-
-The device is controlled through two pins: FL_EN and EN_SET. The pins when,
-asserted high, enable flash strobe and movie mode (max 1/2 of flash current)
-respectively. In order to add a capability of selecting the strobe signal source
-(e.g. CPU or camera sensor) there is an additional switch required, independent
-of the flash chip. The switch is controlled with pin control.
-
-Required properties:
-
-- compatible : Must be "skyworks,aat1290".
-- flen-gpios : Must be device tree identifier of the flash device FL_EN pin.
-- enset-gpios : Must be device tree identifier of the flash device EN_SET pin.
-
-Optional properties:
-- pinctrl-names : Must contain entries: "default", "host", "isp". Entries
-		"default" and "host" must refer to the same pin configuration
-		node, which sets the host as a strobe signal provider. Entry
-		"isp" must refer to the pin configuration node, which sets the
-		ISP as a strobe signal provider.
-
-A discrete LED element connected to the device must be represented by a child
-node - see Documentation/devicetree/bindings/leds/common.txt.
-
-Required properties of the LED child node:
-- led-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
-- flash-max-microamp : see Documentation/devicetree/bindings/leds/common.txt
-                       Maximum flash LED supply current can be calculated using
-                       following formula: I = 1A * 162kohm / Rset.
-- flash-max-timeout-us : see Documentation/devicetree/bindings/leds/common.txt
-                         Maximum flash timeout can be calculated using following
-                         formula: T = 8.82 * 10^9 * Ct.
-
-Optional properties of the LED child node:
-- function : see Documentation/devicetree/bindings/leds/common.txt
-- color : see Documentation/devicetree/bindings/leds/common.txt
-- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-
-Example (by Ct = 220nF, Rset = 160kohm and exynos4412-trats2 board with
-a switch that allows for routing strobe signal either from the host or from
-the camera sensor):
-
-#include "exynos4412.dtsi"
-#include <dt-bindings/leds/common.h>
-
-led-controller {
-	compatible = "skyworks,aat1290";
-	flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
-	enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
-
-	pinctrl-names = "default", "host", "isp";
-	pinctrl-0 = <&camera_flash_host>;
-	pinctrl-1 = <&camera_flash_host>;
-	pinctrl-2 = <&camera_flash_isp>;
-
-	camera_flash: led {
-		function = LED_FUNCTION_FLASH;
-		color = <LED_COLOR_ID_WHITE>;
-		led-max-microamp = <520833>;
-		flash-max-microamp = <1012500>;
-		flash-max-timeout-us = <1940000>;
-	};
-};
-
-&pinctrl_0 {
-	camera_flash_host: camera-flash-host {
-		samsung,pins = "gpj1-0";
-		samsung,pin-function = <1>;
-		samsung,pin-val = <0>;
-	};
-
-	camera_flash_isp: camera-flash-isp {
-		samsung,pins = "gpj1-0";
-		samsung,pin-function = <1>;
-		samsung,pin-val = <1>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
new file mode 100644
index 000000000000..a6aaa92dbccd
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat1290.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Skyworks Solutions, Inc. AAT1290 Current Regulator for Flash LEDs
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  The device is controlled through two pins:: FL_EN and EN_SET. The pins when,
+  asserted high, enable flash strobe and movie mode (max 1/2 of flash current)
+  respectively. In order to add a capability of selecting the strobe signal
+  source (e.g. CPU or camera sensor) there is an additional switch required,
+  independent of the flash chip. The switch is controlled with pin control.
+
+properties:
+  compatible:
+    const: skyworks,aat1290
+
+  enset-gpios:
+    maxItems: 1
+    description: EN_SET pin
+
+  flen-gpios:
+    maxItems: 1
+    description: FL_EN pin
+
+  led:
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      led-max-microamp: true
+
+      flash-max-microamp:
+        description: |
+          Maximum flash LED supply current can be calculated using following
+          formula:: I = 1A * 162 kOhm / Rset.
+
+      flash-max-timeout-us:
+        description: |
+          Maximum flash timeout can be calculated using following formula::
+            T = 8.82 * 10^9 * Ct.
+
+    required:
+      - flash-max-microamp
+      - flash-max-timeout-us
+      - led-max-microamp
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: host
+      - const: isp
+
+  pinctrl-0: true
+  pinctrl-1: true
+  pinctrl-2: true
+
+required:
+  - compatible
+  - enset-gpios
+  - flen-gpios
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    // Ct = 220 nF, Rset = 160 kOhm
+    led-controller {
+        compatible = "skyworks,aat1290";
+        flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
+        enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+        pinctrl-names = "default", "host", "isp";
+        pinctrl-0 = <&camera_flash_host>;
+        pinctrl-1 = <&camera_flash_host>;
+        pinctrl-2 = <&camera_flash_isp>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            led-max-microamp = <520833>;
+            flash-max-microamp = <1012500>;
+            flash-max-timeout-us = <1940000>;
+        };
+    };
-- 
2.34.1

