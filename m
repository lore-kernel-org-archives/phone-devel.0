Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1BCC4320E
	for <phone-devel@archiver.kernel.org>; Wed,  1 Sep 2021 18:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F3B660E98
	for <phone-devel@archiver.kernel.org>; Wed,  1 Sep 2021 18:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346772AbhIASIi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 1 Sep 2021 14:08:38 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:46661 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346710AbhIASIi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 1 Sep 2021 14:08:38 -0400
Date:   Wed, 01 Sep 2021 18:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630519656;
        bh=hpiMhb7xaOG5AAFkGBjxr0I36weG/Yx7rV+awK0m7/Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=hknCXgjmK2oau81RE8Rr2N5Tq9ls7bQi8KUOFK733CyX/8jF2dehPtMq1Yp7WM+Wb
         ge4Wewyu4PCdF73vIltxlkSw2K3XFXSLIxmiEAPqWcl7ChbXf7NIkt2LhNMDdgYP9K
         dBeYNZDCuiJkxtA/+PPqeAXiash3wNlxQqJ7TzdA=
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 2/2] dt-bindings: display: Add binding for LG.Philips SW43101
Message-ID: <20210901180644.248177-3-y.oudjana@protonmail.com>
In-Reply-To: <20210901180644.248177-1-y.oudjana@protonmail.com>
References: <20210901180644.248177-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a device tree binding for LG.Philips SW43101.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../display/panel/lgphilips,sw43101.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphili=
ps,sw43101.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,sw43=
101.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,sw4310=
1.yaml
new file mode 100644
index 000000000000..da049e9f244e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yam=
l
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: BSD-3-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lgphilips,sw43101.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG.Philips SW43101 1080x1920 OLED panel
+
+maintainers:
+  - Yassine Oudjana <y.oudjana@protonmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lgphilips,sw43101
+
+  port: true
+  reg: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        panel@0 {
+            compatible =3D "lgphilips,sw43101";
+            reg =3D <0>;
+
+            reset-gpios =3D <&msmgpio 8 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint =3D <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
--=20
2.33.0


