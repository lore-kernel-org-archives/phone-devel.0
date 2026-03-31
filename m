Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E023EAC98;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946808; cv=none; b=CMT/GvkClBH2iuV8VCx9wMWxmumZ8IU2dBmVIEAbWeYJaPnDCUKXDWeup0a4HFPFjBhHZgmIejehg7k3XUoNG1OMX8IiXGdmAfIYeSF77ypyUon1BtGshzwuQbHBIIw766NuDZC8xdlD1GO1Mr5a5BAdJwT0VNbayr3DrUwhR3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946808; c=relaxed/simple;
	bh=kRnpd67l1fQevBUI2M8t5uQVHldWidR1NGQkoT/YuWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aol3gpeGmNM9obKPwy/XiMX+Z6UFwz8krvc4pD2sxcfP8wi7F3ajI9N9vPh+pGJhmwcG5PkhqxFMVIWWJJ+e+WlOjwx9L0ol1abEunxehxRP7Iew7fzzDDb5XbIx3/em+AotqzBcbvzMohG83x/nMXkSFZbsj0QDAYJASYpwbxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq7Zv7i+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq7Zv7i+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D149C2BCB0;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946808;
	bh=kRnpd67l1fQevBUI2M8t5uQVHldWidR1NGQkoT/YuWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xq7Zv7i+GFIoQC1IbGwj9Dxz2KcJ5+qrEiiolm6feQqYh7dHjAv6ZEKJppgNHjEjy
	 BSS/5Pzd9ugTt1f8g4m32cyDJFAe5u0YTuxAi9DjEv9A3+6qTtvcJFMLzryjs3qyDT
	 bhjbI4mwjxrkbHVbk+Ki+N6nwCSIVHlTsiSfmRo2JuwtJpmiXQ/04KuS4MLlYw/AaZ
	 2/Io+zo2t2j1Azf8ZSAQ7t01w60VncSXZAbxlt2fZoBMbThZzx4sRdaf5gRDT1Xljv
	 CCyhnNzb9z/B9O1hFnLd0n6tVwnN/D1o9ui1rXs0nmBpb1cF1c8DI1ALXNnMbnMkLz
	 ShSH0/fOFugvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D76CFF60EF;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Tue, 31 Mar 2026 11:47:09 +0200
Subject: [PATCH v5 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rimob-new-features-v5-1-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774950461; l=3318;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=qTKlZDaARiUsxyQG1/J2RAJYMe4C+c83+Q7c5M+0Qq0=;
 b=z47T9wZj7OGx26jcPHMl+NYR3Yj8OhZavzyrfDO21NA3J8woJqv3lT8vuVN9C1qzcr+bypqJf
 M0is6QI8PsfB3BjT0LK8J1pGNSHPTmSZX5bRENvVJ3w2DVe9M8+Wbt5
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Document Novatek NT35532-based DSI display panel.
Since it's not possible to identify panel vendor nor id, add a suitable
compatible (matching the device's user, which makes use of this DDIC)
and set "novatek,nt35532" as fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../bindings/display/panel/novatek,nt35532.yaml    | 80 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 85 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
new file mode 100644
index 000000000000..ff6fdad7febf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt35532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT35532-based DSI display panels
+
+maintainers:
+  - Cristian Cozzolino <cristian_ci@protonmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - flipkart,rimob-panel-nt35532-cs
+      - const: novatek,nt35532
+
+  reg:
+    maxItems: 1
+
+  backlight: true
+  reset-gpios: true
+
+  avdd-supply:
+    description: positive boost supply regulator
+
+  avee-supply:
+    description: negative boost supply regulator
+
+  vci-supply:
+    description: regulator that supplies the analog voltage
+
+  vddam-supply:
+    description: power supply for MIPI interface
+
+  vddi-supply:
+    description: regulator that supplies the I/O voltage
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddi-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
+            reg = <0>;
+
+            backlight = <&pmi8950_wled>;
+            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&lab>;
+            avee-supply = <&ibb>;
+            vci-supply = <&pm8953_l17>;
+            vddi-supply = <&pm8953_l6>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ef978bfca514..8617d830b1d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8175,6 +8175,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt35510.c
 
+DRM DRIVER FOR NOVATEK NT35532 PANELS
+M:	Cristian Cozzolino <cristian_ci@protonmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
+
 DRM DRIVER FOR NOVATEK NT35560 PANELS
 M:	Linus Walleij <linusw@kernel.org>
 S:	Maintained

-- 
2.53.0


