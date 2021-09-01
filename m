Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C7C432BE
	for <phone-devel@archiver.kernel.org>; Wed,  1 Sep 2021 17:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43DAB60FD7
	for <phone-devel@archiver.kernel.org>; Wed,  1 Sep 2021 17:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344968AbhIARc3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 1 Sep 2021 13:32:29 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:56025 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344611AbhIARc3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 1 Sep 2021 13:32:29 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D9736200D6;
        Wed,  1 Sep 2021 19:31:29 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     thierry.reding@gmail.com
Cc:     sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/2] dt-bindings: display: Add bindings for Novatek NT35950
Date:   Wed,  1 Sep 2021 19:31:27 +0200
Message-Id: <20210901173127.998901-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
References: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The nt35950 IC from Novatek is a Driver IC used to drive MIPI-DSI panels,
with Static RAM for content retention in command mode and also supports
video mode with VESA Frame Buffer Compression or Display Stream Compression
on single, or dual dsi port(s).
This DDIC is also capable of upscaling an input image to the panel's native
resolution, for example it can upscale a 1920x1080 input to 3840x2160 with
either bilinear interpolation or pixel duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../display/panel/novatek,nt35950.yaml        | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
new file mode 100644
index 000000000000..377a05d48a02
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35950.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35950-based display panels
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+
+description: |
+  The nt35950 IC from Novatek is a Driver IC used to drive MIPI-DSI panels,
+  with Static RAM for content retention in command mode and also supports
+  video mode with VESA Frame Buffer Compression or Display Stream Compression
+  on single, or dual dsi port(s).
+  This DDIC is also capable of upscaling an input image to the panel's native
+  resolution, for example it can upscale a 1920x1080 input to 3840x2160 with
+  either bilinear interpolation or pixel duplication.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sharp,ls055d1sx04
+      - const: novatek,nt35950
+    description: This indicates the panel manufacturer of the panel
+      that is in turn using the NT35950 panel driver. The compatible
+      string determines how the NT35950 panel driver shall be configured
+      to work with the indicated panel. The novatek,nt35950 compatible shall
+      always be provided as a fallback.
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line - This should be 8mA, gpio
+      can be configured using mux, pinctrl, pinctrl-names (active high)
+
+  avdd-supply:
+    description: positive boost supply regulator
+  avee-supply:
+    description: negative boost supply regulator
+  dvdd-supply:
+    description: regulator that supplies the digital voltage
+  vddio-supply:
+    description: regulator that supplies the I/O voltage
+
+  backlight: true
+  ports: true
+  reg: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - avdd-supply
+  - avee-supply
+  - dvdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls055d1sx04", "novatek,nt35950";
+            reg = <0>;
+
+            backlight = <&pmi8998_wled>;
+            reset-gpios = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+
+            avdd-supply = <&lab>;
+            avee-supply = <&ibb>;
+            dvdd-supply = <&disp_dvdd_vreg>;
+            vddio-supply = <&vreg_l14a_1p85>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    panel_in1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.32.0

