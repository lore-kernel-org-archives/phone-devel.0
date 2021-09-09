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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EC9C433F5
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 04:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17E8F611BF
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 04:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350450AbhIIEls (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Sep 2021 00:41:48 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:50366 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350305AbhIIElp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Sep 2021 00:41:45 -0400
Date:   Thu, 09 Sep 2021 04:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631162432;
        bh=DEgAtGRzyS7Mb3drXU2SHdsqwxbA8corBcPdlYX6sy8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=SxxM2a5HtOkvy4pfl/W5Quaa2bzGQcydgo9p/RGOaTfCsgZom2SshF2DQ0JiWT3Gn
         qviAlp0H9o7Lc9Rbv8QTE1K+aU/yw7Q5vWQBr1LzkRJjSCDmtGpww8/eVaxJciutmK
         6pFrcwyqB4Xa8e2zyzPIacUXW2HcvDWNGpv2s3NA=
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
Subject: [PATCH v2 2/2] dt-bindings: display: Add binding for LG.Philips SW43101
Message-ID: <20210909043904.12982-3-y.oudjana@protonmail.com>
In-Reply-To: <20210909043904.12982-1-y.oudjana@protonmail.com>
References: <20210909043904.12982-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a device tree binding for LG.Philips SW43101.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
Changes since v1:
 - Add regulator support.
 - Add MAINTAINERS entry.
 - Dual-license DT binding.

 .../display/panel/lgphilips,sw43101.yaml      | 75 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lgphili=
ps,sw43101.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lgphilips,sw43=
101.yaml b/Documentation/devicetree/bindings/display/panel/lgphilips,sw4310=
1.yaml
new file mode 100644
index 000000000000..6f67130bab8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yam=
l
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+  reg: true
+  reset-gpios: true
+
+  vdd-supply:
+    description: Digital power supply
+
+  avdd-supply:
+    description: Analog power supply
+
+  elvdd-supply:
+    description: Positive electroluminescence power supply
+
+  elvss-supply:
+    description: Negative electroluminescence power supply
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - avdd-supply
+  - elvdd-supply
+  - elvss-supply
+  - port
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
+            vdd-supply =3D <&vreg_l14a_1p8>;
+            avdd-supply =3D <&vlin1_7v3>;
+            elvdd-supply =3D <&elvdd>;
+            elvss-supply =3D <&elvss>;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 46431e8ad373..aab9f057e8d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5902,6 +5902,7 @@ F:=09include/uapi/drm/i810_drm.h
 DRM DRIVER FOR LG.PHILIPS SW43101 PANEL
 M:=09Yassine Oudjana <y.oudjana@protonmail.com>
 S:=09Maintained
+F:=09Documentation/devicetree/bindings/display/panel/lgphilips,sw43101.yam=
l
 F:=09drivers/gpu/drm/panel/panel-lgphilips-sw43101.c
=20
 DRM DRIVER FOR LVDS PANELS
--=20
2.33.0


