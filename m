Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174869;
	b=t1Wc9G4PiU1tsGnjSDQXW5qM5fLx9ye7vDQwsxfu8GBxvb82fZ/u+2XCeewgjHrxhy8F
	 Woapp1K69jeGiHlJJmDvY3MHJBCztT4+K/rl78bqkHOl9sP6doGpWO6QwQmlOJtHn9mRg
	 fIpRHgIjcpUk3VN4y+RkyXIG/Smjw7ImJOu91PnIooC8yvKt5ZAjio+so6C9g0C5GvXf8
	 qq6Dpw9TnyXPMoAV5SiXGKVC7PF4IsJmV5BTeK+KjiUxDRnGHBNPVdyDEqMAtiEH7l9Gw
	 +LrkKI9Epjq0gLZcbX6Y8fEfZ3nXR1syuS1IVOWczMe92xWE+C6KJOkeeAaK/rfbFyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
	b=v8oFYb9Xntgn8VUcxwpOSzLaOGAnrqZY0H583WUNmj89Pyrp30wKydY1jYKYokbtoN/Z
	 +TK96Yahx4QGCPCdewdB9i/Ho+zrxH4mXv/Zk2Ztk/hQ0yFm6VcDMVLYUzOz0FHBs5AQO
	 EMMMayf+wvW8kbZylSiJeu5Hznd79elQs0tucUm291wujEWG56F24rBs1LBz6H6CgMHTA
	 0J6gvluYCQs51Gn+29QjRbM16k8lE86jh9Uo7iKIhLQNCFGkhnlgtopvd8vPjrtJECoFW
	 WS+sJXayWvys0kGdll9sXJUNey0vvRL6St8VgbsH7P9PYZivJI5JGC3sf9v8GPD5evg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isPgHmkH;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF1606A331
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 11:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AF1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isPgHmkH
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso7956715e9.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795174866; x=1795779666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
        b=isPgHmkHV9iIYt+n7ShKmBawSwEeRIaHOEnivt4vsy8h1bDt1sj4FlWf3hTPlSsP05
         vdaul1NIZAYpm1OXH1yBtHJx6n+2R5iNAa+VgFgqspJcCGIYeY9dNg78FCUBMUgen6xi
         oAK5f0EnOVnuEZ08WHKLwBFf8X2+nry8/3Hg53LsjgKV8ZXoMidErWSS5AY9torwZdCF
         DUkn4mTHKRKTBwpmAFqLusqW4m0GNIqft/7jzBdlYRln8O+d6ze/dqOcwpypU/O7oKBT
         LZnBRAimH5ChiPKK7BLnIe0heEKK8Og0SoWRcKroAGjFYva1y7as1weBDcCfOBK0XBhi
         6sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174866; x=1795779666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N+qZJp3IOLR8W+jXWOKTm3fVJRlvPeQHbpUSJTeUQL8=;
        b=Pv7A+t6AUKQ9Hk0Bdkb38gPKe6vVGFMgpCW/hTH7+eo5GVt8BeETkLYExAjvpCgsGB
         r651op6HY3tLE1GShC4UEr5CEmrvp6qmATdXT8sa/HM4/Qp54hV3jRc6BpbAAP0nwfKr
         BVFni5gAQyncBpVlV99VpMo22OC4gByyGtp41JIhtH9/1ZxN6y76gHv8ZeKim0b2buM+
         ZicyPYXp9oyhKSpyR90PokD4bcnjbBeIbF+UzR9orFnzBzY+MU3cif+yD8DGM7r3wA2L
         q0X+WUDx9lnprCXdfSwmsMPbTf3NbOeWutOF3jhnqPWOW2MW2T07UOYNkKU/Cw3/JRdb
         ed4A==
X-Forwarded-Encrypted: i=1; AL+hErEkt2h1EQLrBkiqZMzeW+PYjBcFDIKHitTHm/1Q4ZXvMXZhUI7ncfXEkRKOzcRTopPvje2lI/JQA4Dj2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z82K7tFcCkdAmhwyccnDCVt39whaSubcfKtGlB0NYblZG70Cr4d
	oAn4QJymqBnhHhQrefVD0qa41HG7Lc4gji+/CvZdAZTAtTNnuZDvRrPx
X-Gm-Gg: AYBFou0SngBNCN9RQHfQb6//sq0kHOb6ZnoLu+oPyxvX9xmiD2UUpT1k8mwHlLQ/D9X
	lT/+Ggoq1sfHyDUSnwZ2u8cWTwKTywKYLOXwf3wOY5uEtACzBE/RErVSc0AqSH7OfWoDqQMpT8B
	Ar8hot8Ew/SAeH/qYEpNV9iMA/JwgpLGAHTdKFadwWCyQxf6rogxyEQH2Z1s5YDOX8Y+0nbyAQh
	dFhbkyN3DZlDAR36BDGF6BjLeLHj8jXCOROoKLUQXhKlBer0ApfJ55M6rloJ20WmPvopoa5btv8
	NikRW9wdu0v3X8EvfoOJGTu+Y2kirafYuKyXxLLUxUWUPB2cYVTY9JJJscC/9fnjW6ITFAOqf0+
	C8SRG4POvvFx0tpmOQzL4IPVORBF9cfbBSZpd4DVZOmxF6+YnUcun9nTlfXvoFkyVtxWAvZQxTc
	JaAWGD4334RJGyAX7nuzFWC7kLzmt/6jWxhl0Wr2B1iHZOUaCqRcBmqe6Im4wHMZPzvQ8CBERkD
	yVW5qU4xSIBoWHk2QCuOzSW0jVPtjUDHR0/rAvlGr+8SE/jjOf0pQrSSOuWccJN2mRmrIx6n9hS
	IIiXu7swrfpq8sKsHx0NMLSRbw==
X-Received: by 2002:a05:600c:848a:b0:4bb:6626:5a25 with SMTP id 5b1f17b1804b1-4bb88813462mr53820315e9.20.1795174866206;
        Fri, 20 Nov 2026 03:41:06 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm27419345e9.4.2026.11.20.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:41:05 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Fri, 20 Nov 2026 14:40:59 +0300
Message-ID: <20261120114100.978148-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120114100.978148-1-tadilhusrev@gmail.com>
References: <20261116070212.314228-1-tadilhusrev@gmail.com>
 <20261120114100.978148-1-tadilhusrev@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a DT binding for MIPI-DSI video-mode panels based on the Novatek
NT36525 controller, as fitted on the Samsung Galaxy XCover5 (SM-G525F,
Exynos850). The panel reset (RESX) is active-low, and the panel needs
three separate supplies (vdd/vpos/vneg) plus an optional backlight.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
v3 -> v4: no changes to this binding.

v2 -> v3: no content change. Resent as a fresh, standalone patch
(previously v2 1/2 was a diff on top of v1's own patch instead of a
complete patch against mainline, which Krzysztof Kozlowski correctly
flagged as a git-management mistake on my part; see the cover letter).

v1 -> v2 (addressing Sashiko AI's review of v1,
https://sashiko.dev/#/patchset/20261116070212.314228-1-tadilhusrev@gmail.com?part=1):
- reset-gpios is the physical RESX pin, which is active-low (asserted
  low, released high); describe it as such (GPIO_ACTIVE_LOW in the
  example) instead of GPIO_ACTIVE_HIGH. The matching driver fix is in
  "drm/panel: add Novatek NT36525 panel driver".
- Add vpos-supply and vneg-supply: the driver requests three separate
  regulators ("vdd", "vpos", "vneg"), but the binding only declared
  "vdd-supply".
- Add backlight: true so dtbs_check accepts the backlight property the
  driver already parses via drm_panel_of_backlight(), instead of
  switching additionalProperties to unevaluatedProperties (which would
  also pull in every other panel-common.yaml property, not just this
  one).
- Fold the compatible string into a single, driver-matching value
  (novatek,nt36525-xcover5) instead of samsung,xcover5-nt36525, which
  never matched the driver's of_match_table at all.
---
 .../display/panel/novatek,nt36525.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
new file mode 100644
index 000000000..9158125c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt36525.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT36525 MIPI-DSI panel
+
+maintainers:
+  - Adil Hüsrev Tepe <tadilhusrev@gmail.com>
+
+description:
+  A MIPI-DSI video-mode panel driven by a Novatek NT36525 controller,
+  720x1480. The first compatible string names the specific panel as fitted
+  in a device; the second is the NT36525 controller it is based on. The
+  panel reset (RESX) is active low.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - novatek,nt36525-xcover5
+      - const: novatek,nt36525
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description: panel logic power supply (vdd_ldo28, 1.8V)
+
+  vpos-supply:
+    description: LCD positive bias supply
+
+  vneg-supply:
+    description: LCD negative bias supply
+
+  backlight: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vpos-supply
+  - vneg-supply
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
+            compatible = "novatek,nt36525-xcover5", "novatek,nt36525";
+            reg = <0>;
+            reset-gpios = <&gpa0 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_vdd>;
+            vpos-supply = <&panel_vpos>;
+            vneg-supply = <&panel_vneg>;
+            backlight = <&panel_backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
--
2.53.0
