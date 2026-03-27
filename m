Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC792ED154;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774618218; cv=none; b=T+bUnO6QzYv4+YM3ypwKsjKt0SKFft+6EpkV9aAflFfavXzclVx9Yyq2uJWFBSvAqsLz18Ouj+P1cU0qwtA/eTJSDbbdxtZHrLLtpdGAWccZ42FObP7JZ1YuoDYnnRs+AC3rj9yLew7n/Zx0hqfOc3lrdcl3xsQrlFi25KsS2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774618218; c=relaxed/simple;
	bh=SRh/0Gs2Dcmn5I/5o2RDnwGwhbDd2FofxA8blrGcTVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ussM96cIHk4Edq2Kk/5KFAi6ltHi4XYgCdMeSFk2XcCfe2MNVWiv9c/MEvuL8+pqENIy9Y9R7EPfR29I0mwo3/Y7sO0S2tf+Bwh79jg9rzDadMCgJk7AKpPNAJR+lpbgbNwSc7G9sYTaDGBS+4d+HynbdYvoKI8HDsqTGkrjQN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYKtxtUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYKtxtUc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79E41C2BC9E;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774618218;
	bh=SRh/0Gs2Dcmn5I/5o2RDnwGwhbDd2FofxA8blrGcTVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uYKtxtUci4gDi5dUmy35cgohzYmvUIiRkm82SuZrZrXjHp8qgmMObyjGfCdbf2DG4
	 Uq3WUNSjGJpEIAMvZQwI89viMcX/XtFLK/P+/voEGqsQbEy0V06jHUZBB0KNYf1UgY
	 Aln8HL+REaSG2d5AYeI3uzgr328m3Y91FcK+XeN7b2FyMmAekWaMqxptZAqldXF0R5
	 uPhhmDr2u6psB1aS/aLlibH1wFYSPngg4FoyT5as0wonvJ3tc56nqg1eUbR5ecerMi
	 aUHdQrmu/fFtEc7Db/sT81WwWohVB4njdXsj7HoE098U9CuFecOoElSnB59CAsYtTu
	 cKuqoNt+AC0Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E5510ED674;
	Fri, 27 Mar 2026 13:30:18 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Fri, 27 Mar 2026 15:30:47 +0100
Subject: [PATCH v4 1/6] dt-bindings: display: panel: Add Novatek NT35532
 LCD DSI
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rimob-new-features-v4-1-06edff9c4509@protonmail.com>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
In-Reply-To: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
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
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774621871; l=3245;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=1sKg1wNSp6ORtBthsOcQq4FFVXR7zjxG+6BOteGpZ7Y=;
 b=7CpTe2y+ql7txEfWfJw4k8ayLTDdwVwCONG3xN8gIzxVaGIJt2jayWcfNVL2A91i4+6cgI6wb
 pVvF7Pz81MaD3ETP/WWPVgUfsqWS5Ny9rh5A5x8JUZxKPF1dKhMLWIN
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
index 80b9074e96ae..792ce6ee8616 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8174,6 +8174,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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


