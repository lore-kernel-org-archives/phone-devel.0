Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882263921DD
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316518; cv=none; b=LFcNa2MKGJdzqNwL9LOcuAjzUrr32WJ4V8XpFGREFcFLdXRImAhA6A0MKggyGhUUxjeLATWu3wrBI3YtYEDQzRtzPkRrjT4GjqBBZAWJyIfqJjOTm9UB/Jljbj4uURYOHUjyztpxRTiHM0YYYGZwjJIXIILaexRE+CALJ30V9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316518; c=relaxed/simple;
	bh=uByAyEgww3agiRACJzADzQxPrUayRMLsCPUXIA0Shko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZCVU11mrwhMiqItFbeMrza6AsKIYi4Wd8LhkIP6/H9/e4EpnBjNFVWvwbxuXecLoJTaO4Oc3BODoPcCS+BuW4ksR06JW/PJWnpG6hJRuUGU2m6+QdX3+3b3zc4TA3dAJbk5MVpFwjKBCiX1Kcnmcoe/VhPoyayx6KeKIxo/BVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOKTGBUX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOKTGBUX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439c6fc2910so761066f8f.0
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316515; x=1773921315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVqRQazqZj73V1QdHVCmtLSa+TH69dLCr3cJ3xiZ210=;
        b=mOKTGBUXcLVR/KV9n0oCvlIxcLFCW+76/NOpeZb3EPaZHlynnEBJNEq3K+ar4+B/2h
         XcarNjHzW4gu8Lp8K2CisLfOWqhglPli5UbPzrROLgEStIvWjIigvbjMzjdeyeZmxAYJ
         reGmpLlfISnmoC8Pumrb6vkMht/hXCeCDbNYizXmhgdiLxrwxOspjIuS4z9RfCFr2w08
         i5FElY6d9Glfi7gOYkF3HF7gtGTylIA8R7k3SfuFdXNXqyei64eTI3hwCFwTl+xmz0C/
         vhWgPM4eS+uxHTRee8rXui2BKhAa4AdkCpx1SdRl5SUfQDsXgtKsB4m2xLlnzHCjmsny
         3Bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316515; x=1773921315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vVqRQazqZj73V1QdHVCmtLSa+TH69dLCr3cJ3xiZ210=;
        b=FnZoAjO+XQQY+Q5BJpuVXg/9h1+apcwxQZMHCKZdJCrNlHOwRW+4Hd1t5tWEEKzLhV
         5O5gLYqXOoLR1KqrJpuz5jRFhH2opaSr/Y3yyYsR8Th/xUGZLFWkg5GA8fe0Ukt5okEo
         87bTKJB+GqFVHO9LUAc31X4rV125O0UN0AG3nJCPbxr/eqi1em0QOJ+PhOAwUuyL1vEI
         8oXTqmmDaDlYr+oO6kUUCBevK6nf4ePK8Y2Ihx+HxURTqJcNlsJlEKv6mZh6e2vKsf/4
         0NWgCxYdzKUWWBrutLXrM2O0e6KcxZGP/ot36f7wYEcAGs3WocS+z+5rXbx17bamDeJQ
         bI2w==
X-Forwarded-Encrypted: i=1; AJvYcCU0NPlsSCjRN5MDqrtqxcM3S9UZI8q6kc+ICMlzSLMMN62oFHC0u0vDDFqcnXHAsUtOgKFxyeFpxEwvGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXPT/ZVTfO8ssDSlg7i4qqsxgCukuAsVt/IRfwD+t6sMe+xx9/
	qnHuq3gqpl2/yPCwTAIBJLDOmNNZTgDoebj6Sv93ugBIpUoy1Js8A4rD
X-Gm-Gg: ATEYQzyJvjqBY4+kaWQdDFBs7NLWJMPlO+4sHhpqsdIXjIRYnhTHjuDamVi0BF109qa
	40Fcl9HVjDLxv0clX6mEjDJABD3zSON/FdrmMEzMZdtQUkdq5BZaOpr7nFZrzP/Am3nRf5joF2s
	g2ZrAcLukDQj2lCcBZALol8ezxLBL6ZFqkoA03kLdJYpv0+zqKt/fi6/1p9ynK5vUt+SpzCUA/9
	pfF1tB55U77vmJGIGuYcYm01S7r5fCiimG1D34Qvzl6RXtNmuLWzvc+6GHNxp2oR3BzdldGKnpb
	KY/hFeGnG1oM0b4mT6KYhdPUFgcieaZs6wVpxpBXb+FNuLMY8/tOfAOL/r/SPjVkRkPuPqVZQhK
	/dmFx1vh70Hs527VcffHzuwC1BstZihN7qtt6mdHVR1ww9SWzMnZhz5Abj0razGFJg8En1mlMzq
	yVXR08S2plGuj9LuWnFhU4SWb+ZyGixe6pSsFAiracms3Wm4CYq16jv2db308h5HpsvehQKbpBL
	A==
X-Received: by 2002:a05:6000:2404:b0:439:aa1d:be0d with SMTP id ffacd0b85a97d-439f843c5e0mr11750141f8f.50.1773316514846;
        Thu, 12 Mar 2026 04:55:14 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7058657f8f.31.2026.03.12.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:14 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 12 Mar 2026 13:55:08 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FCO-M1906F9
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-panel-patches-v3-1-6ed8c006d0be@gmail.com>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
In-Reply-To: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773316510; l=2891;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=uByAyEgww3agiRACJzADzQxPrUayRMLsCPUXIA0Shko=;
 b=VQU7g4QQ/Atsa34lKMyddc/HL+xKZzUSD6FVv6UFY6eEteEgcM249RuupxeJgVzwWBq0hOR3G
 ZFbRjiEeqEOAlVsljXTbxBNbbJUlE6cBR9WrBqWuPNJ8LKKBe4Kct86
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Document Samsung S6E8FCO DTS binding used with the M1906F9 6.09" 720x1560
panel found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../display/panel/samsung,s6e8fco-m1906f9.yaml     | 63 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..927d170793dcd49c19ebe353268980710ad4b5b2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco-m1906f9.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8FCO DSI for the Samsung M1906F9 AMOLED Panel
+
+maintainers:
+  - Yedaya Katsman <yedaya.ka@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8fco-m1906f9
+
+  reg:
+    maxItems: 1
+
+  vddi-supply:
+    description: VDDI regulator
+  vci-supply:
+    description: VCI regulator
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vci-supply
+  - port
+  - reset-gpios
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
+            compatible = "samsung,s6e8fco-m1906f9";
+            reg = <0>;
+
+            vddi-supply = <&panel_vddi_1p8>;
+            vci-supply = <&panel_vci_3p0>;
+
+            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636268346979ddc270f8cf0905c722..d7aee8dab903cd42c245fea3cf8971dcd99b2196 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8183,6 +8183,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
+M:	Yedaya Katsman <yedaya.ka@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
+
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
 M:	Casey Connolly <casey.connolly@linaro.org>

-- 
2.53.0

