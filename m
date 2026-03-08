Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD94271471;
	Sun,  8 Mar 2026 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981577; cv=none; b=bJk7FMuZ6wAL0rOqGoW58DxpfI47P8LeyOGhYVWihfjaOZJNsJ3XY4QXJyn9KNYdjlXqwTIJmxfmQp1LtcplFKJj6groYL9iIzmWBjX6nISWRIq6xl6D47XdKLHY2tF0vJgewLOjA3GOpoxRB5OfUfLIETy5d+EWktEH17suWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981577; c=relaxed/simple;
	bh=h9lR2FOnXE7uoB+tCaLzQ8fel/j8lhzsuvRhfAbAB9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdP8cSBbCicP5LTCDzPLTQGnIz5uWAEYBSxLfldOALLh20I5rpDjAWUXRUYAEf9ETq3SvR8bjWeOnnIa7Dx+mhJs0egU1IQev4JsIeXXZXcZ08t1qdsAOnbEonGfSW8MCZkixTW2h5Gb3s5J4j8X77iGZAlbGKxO+yaV7yghYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k77hhvnE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k77hhvnE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9600C19423;
	Sun,  8 Mar 2026 14:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772981577;
	bh=h9lR2FOnXE7uoB+tCaLzQ8fel/j8lhzsuvRhfAbAB9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k77hhvnEvTSU6lpLA1+SBP5JZknY/DEi5bTfGwnZOEeHg1EJEOfC/pNvbntjxr5ak
	 qYvxejUfCBVEtQMzWIBqrQ+vAVSTh9F2hV+odWI/NpbRLItZ73eWc42CH8EGjpUhsW
	 CRG1VvXdGXy2Ch3IGyiY8WipOPBg1ZHvXk7r4hFHJI+QUUxOpWMatMewN/aG/CO5yx
	 7nuQWbwNkP3hAKND+mbqh7oVmJAhzfcwGvz6etEKUMHSI6Ucg7MjKDgUrnJDy9RGtN
	 HzFg+QjuKYGcrTfu2ifNuMCk012bNoPxC6je0iNACJq7kTR+j3foVNSkUiKxOGsWAv
	 Qr+VH9LHcXGaA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BFBEA8524;
	Sun,  8 Mar 2026 14:52:56 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sun, 08 Mar 2026 16:52:41 +0100
Subject: [PATCH 1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD
 DSI
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rimob-new-features-v1-1-aa2c330572c0@protonmail.com>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
In-Reply-To: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772985180; l=2664;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=CY/PsVM9Vewhtr4VFeBaWeD4SwFUa8brDk4OcdsJP5M=;
 b=SnKXcuSfJ5wjVhp0OwfLf5Z6gv09wYnZZm/lTRzSr02v7j7PV4pf2qRwBopZH4NI/D8uWpyS9
 ZS3EFrraTRNAmIco82D0JH6KAHO4PzJVYEDoNbS2mMdfXTQDSK2uUPw
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Document Novatek NT35532-based DSI display panel.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../bindings/display/panel/novatek,nt35532.yaml    | 66 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
new file mode 100644
index 000000000000..de11cce83b40
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35532.yaml
@@ -0,0 +1,66 @@
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
+    const: novatek,nt35532
+
+  reg:
+    maxItems: 1
+
+  backlight: true
+  reset-gpios: true
+
+  vsn-supply:
+    description: negative voltage supply for analog circuits
+  vsp-supply:
+    description: positive voltage supply for analog circuits
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vsn-supply
+  - vsp-supply
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
+            compatible = "novatek,nt35532";
+            reg = <0>;
+
+            backlight = <&pmi8950_wled>;
+            reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+            vsn-supply = <&ibb>;
+            vsp-supply = <&lab>;
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
index 61bf550fd37c..12243feb0b27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8139,6 +8139,11 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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
2.52.0


