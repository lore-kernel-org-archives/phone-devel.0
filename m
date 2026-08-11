Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F2C2BD11;
	Tue, 11 Aug 2026 05:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786427561; cv=none; b=ngI/1RW+6yRs9DDMY4AC0bFMns4HF23n5lkFIn1BgyHKiU7jXwBF/sRgA0JdE9yDJ+d1BEIJd2HHtWK4XhO+s+RUGkGPZcud+4/1xsg7fgyBzeRXIHP8OA1qX333yzib6McstDsfKmuEuR6zbL2NoMoNNoua3MRm+A9ebHH1d6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786427561; c=relaxed/simple;
	bh=Dt9L8hiA2v10R3JFtof1MMpzP5ZmgCdM5hVqdr3gZvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGZWgbkYTXQizDdrT8nMlZjuEoUlmd/TBfKhUpFI6/qBfiZqQBt+eBmNu94+9j6+d2ORendvRla90FIkWqGqvMI6SDWZ+Z7QCmR/kSYlTp5VFFbYSuFKFsJ32T68lnPrcPpX0WOd6ZwZqsvJXeYJSTyIiLwi0tSWEky+2vhVPJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIaBocpv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIaBocpv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79502C2BCF7;
	Tue, 11 Aug 2026 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786427561;
	bh=Dt9L8hiA2v10R3JFtof1MMpzP5ZmgCdM5hVqdr3gZvU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pIaBocpv5n3f+9Wn4yyrX5t6jXUvanAUzcVk9SLb6y+n5fNy294nYPyVVWtsT9z1M
	 yy4epgj5JLxuS5tYoAyLVPkHqsvdgi38jyrM2zz/z4vYvhW5CyfwI7Nkqz7vV052zl
	 RXRM/blv8wyU5C9Zm4lF7Hb5l/6Jhh3J8ZJfewZpgGFumixd/G748NfxY8yGkjCxw/
	 PxPBIwkZyeiM533H/mzng7y8PKWTY4d/KZJaOh+dQdgv/zkaXZqeIwlCSsE5kfccPF
	 auzky4du924v4hRx/AhmWkvnvEgdo6JNG75QtEbSjjf+Ff9BroR9DLbRDwnR3kD2FE
	 FaBXdGgO6GAxw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FF6C5B569;
	Tue, 11 Aug 2026 05:52:41 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 11 Aug 2026 01:52:33 -0400
Subject: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Novatek
 NT37703
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-nt37703-bup-v1-1-34ad42b064a3@proton.me>
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me>
In-Reply-To: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786427559; l=2389;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=wVUFKmF2iBpqMPBKlh1CrckDAlUx+1CZ7rLZO14pU3o=;
 b=zDgmu5CjSC8v9Ywt8q27e1eyV15gl8TlNQUo7SIpUh/H++AOEjiAbFwAtsanUoFgC9Dgo7eF/
 LhFoc8AV6LnD2W6ej0bo7Lt1rx1opy3lzfKBgRfHeVcNA0+zfm7sWfV
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Add bindings for this display driver IC which is used to drive MIPI DSI
panels.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 .../bindings/display/panel/novatek,nt37703.yaml    | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37703.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37703.yaml
new file mode 100644
index 000000000000..e1aeed5b978e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37703.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37703.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37703 display driver IC based panels
+
+maintainers:
+  - Esteban Urrutia <esteuwu@proton.me>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - motorola,bronco-tianma-v2-nt37703
+      - const: novatek,nt37703
+
+  reg:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply for panel
+
+  elvdd-supply:
+    description: Positive electroluminiscent (EL) power supply for panel
+
+  elvss-supply:
+    description: Negative electroluminiscent (EL) power supply for panel
+
+  vci-supply:
+    description: Analog power supply for DDIC
+
+  vdd-supply:
+    description: Digital power supply for DDIC
+
+  vddi-supply:
+    description: Digital I/O power supply for DDIC
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+allOf:
+  - $ref: panel-common.yaml#
+
+unevaluatedProperties: false
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
+            compatible = "motorola,bronco-tianma-v2-nt37703", "novatek,nt37703";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13c_3p0>;
+            vdd-supply = <&vreg_l1d_1p25>;
+            vddi-supply = <&vreg_l12c_1p8>;
+            reset-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.55.0


