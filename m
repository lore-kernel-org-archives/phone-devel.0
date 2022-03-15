Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C308CC433EF
	for <phone-devel@archiver.kernel.org>; Tue, 15 Mar 2022 23:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344040AbiCOXiz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 15 Mar 2022 19:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239050AbiCOXiz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 15 Mar 2022 19:38:55 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3455B3D7
        for <phone-devel@vger.kernel.org>; Tue, 15 Mar 2022 16:37:39 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 17so1028768lji.1
        for <phone-devel@vger.kernel.org>; Tue, 15 Mar 2022 16:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CVYvPzoQuTQyndX1sO520v6sFtpGIbDv7RumAhcyv2A=;
        b=Hzg2wl7SbKznScvVlXeaddmwXlGOSp7nosJ4XUzteDjw4daQ1l6NST8ZzfTr/T0FYO
         1qTYRdYORB6kQLeToFoT5sBKgF6d5kHOhae5KrOLNCAl7py81vUXDN4qDB04U48UxHa8
         R909eC5MLgENOvgXHycN4gW8kyXAmx5cZNG74mUpprzkhgI07wKRDyZnkgXfd8haY76S
         kZSSkLmB4oJCAJYz5nGIXmImXNErQo9uWg8vas9rReXIrPIPizJV63bw83T1SV0FYWH5
         CrA/Y4IrPIzIdsdUSLic2pb5PonKPp0V0mMQFNgabZA7tTYC8S8Q6TGcRFPf3HQyElCL
         5jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CVYvPzoQuTQyndX1sO520v6sFtpGIbDv7RumAhcyv2A=;
        b=se05bXsM2+O/6IEOdJyv9WkracnvPVrZ2MYrzCCFxYO84Rb9AeoJEPytqgWOdxKWzh
         +lmLsFBC//AfsSu/l3JjiNkefHp98bHYN742aeiAGoyU5rFhpIQPg//jF4bu06NYls/i
         gK5vmsSvrPVtJScO5CiFnOTpqJZoKFS1Hft5sWjz1r8H9OmrA4HUal7wTf/K/yVUr+Q7
         Y6vHJnV7jGACh9dYBRWIP8YVt7vkL34tAi9lQXX05D+sK/vagdkZdzVNks35KYZoUoKI
         XxsgXaWcjZAF8adtvrleOHluP/EzbLHXffJFXwz1QUhMyeZ2/yypocJupVGBGlUXiFvk
         dyAA==
X-Gm-Message-State: AOAM530so5+xVZ8ECqi6vDEZhZ8Y1yIhMW5d6BXO4Gdu3raAQFP83oeB
        0cIPvA7v2QH+wT4TDTPDmM4Svw==
X-Google-Smtp-Source: ABdhPJzTDJkb6i3IKFf4Ji4ubPl1ltJQWL+VjUDM0nLokqlIQHMD6dDKhRdjBZRDKijzr0CcZraT7g==
X-Received: by 2002:a05:651c:11ca:b0:247:f32e:10ba with SMTP id z10-20020a05651c11ca00b00247f32e10bamr19080547ljo.208.1647387457752;
        Tue, 15 Mar 2022 16:37:37 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id w10-20020ac2442a000000b0044835a52a08sm29543lfl.163.2022.03.15.16.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 16:37:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: input: Add bindings for Immersion ISA1200
Date:   Wed, 16 Mar 2022 00:35:27 +0100
Message-Id: <20220315233528.1204930-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315233528.1204930-1-linus.walleij@linaro.org>
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This adds device tree bindings for the Immersion ISA1200
haptic feedback unit.

Cc: phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/input/immersion,isa1200.yaml     | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/immersion,isa1200.yaml

diff --git a/Documentation/devicetree/bindings/input/immersion,isa1200.yaml b/Documentation/devicetree/bindings/input/immersion,isa1200.yaml
new file mode 100644
index 000000000000..e6bbefce74a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/immersion,isa1200.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/immersion,isa1200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Immersion ISA1200 Haptic Feedback Unit
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description:
+  The Immersion ISA1200 is a haptic feedback chip using two motors of
+  LRA or ERM type. It can generate a PWM signal to control the motors from
+  a fixed input clock, or it can amplify and modify an existing PWM
+  input. It is communicating with the host system using I2C.
+
+properties:
+  compatible:
+    description: One compatible per product using this chip. Each product
+      need deliberate custom values for things such as LRA resonance
+      frequency and these are not stored in the device tree, rather we
+      let the operating system look up the appropriate parameters from a
+      table.
+    enum:
+      - immersion,isa1200-janice
+      - immersion,isa1200-gavini
+
+  reg:
+    description: I2C address for the ISA1200
+
+  hen-gpios:
+    description: GPIO line that drives the HEN (Motor Hardware Enable) pin
+      on the chip.
+    maxItems: 1
+
+  len-gpios:
+    description: GPIO line that drives the LEN (LDO Enable) pin on the chip.
+    maxItems: 1
+
+  clocks:
+    description: Clock that drives the chip if using the chip to generate a
+      PWM from a clock. Either clocks or pwms must be defined.
+    maxItems: 1
+
+  pwms:
+    description: PWM that drives the chip if using an external PWM generator.
+      Either pwms or clocks must be defined.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - hen-gpios
+  - len-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      haptic@49 {
+        compatible = "immersion,isa1200-janice";
+        reg = <0x49>;
+        hen-gpios = <&gpio6 2 GPIO_ACTIVE_HIGH>;
+        len-gpios = <&gpio6 3 GPIO_ACTIVE_HIGH>;
+        clocks = <&clkout_clk>;
+      };
+    };
-- 
2.35.1

