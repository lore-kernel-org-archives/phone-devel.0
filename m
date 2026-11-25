Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630375;
	b=DvaTvaUCNc/yIwsbCg1b1d472yIqlzbugyr/P7y95tsCqUXj9MZUcENGC+hskStRJi24
	 V5+kXVC7SxmOz1T2s7xSQSZd+Rllum5QRE+KV8W1Vgko8baAtSif5SftjRU6L5dH9O/ra
	 zS5KKIZOMW8g4ediRSl0BUIsd1O+H3BV7foKF1BQtLgQ7h8pBbWQ/jsN29hzfJjIp+oFn
	 twcRjq1+qcaIHjatVqSqXF2WjG/JU0MuylIqzN7sBYWJt0UlQFhdw+F+Q6yFWPgz5XI5u
	 dMcTGc/jZEmYP376o28ilz3GI87avgVxa0VyF+8OjSxyDCwNn+pPJaL/qnHjRQVHpug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630375;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1kb4MkqJfJ01MWxX0WLE/KCVtYTRmoNOlVQyKbSTlqo=;
	b=LASiMfge3WVdIaFvo1ZfRZne9Dd9EvD7di8/mkiO8vWlRYPhgCZBBetu19o1UzsJ6bsy
	 HS/szCUTSOhNgvjlOzIQlAUX3X2nisbTOT/6URSY8c2WCSrYOWcxQ+mtIcIuSu02IJgZe
	 RLyBkcvcYafjX2acw7MRFiM9xv7ZzR7x5OtAChUkTdIfZf0Z12dO9Nl5fLg7s5UzFiU0w
	 j5j6W5op32C9Syt282VWzz8IZ5UxarcV1QUKSDGN3fYw7OtJpfrOYhejjb7O5Xqwg4Ktb
	 eBkiFZwfYY7SrQguMAh/seI5WgQh7cpIkmA1Qm1dEEvTyqKX8bbVbidqBksY6cgzcPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQsZWzkd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C970606A334;
	Wed, 25 Nov 2026 18:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQsZWzkd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630374;
	b=OCeSVYDy0f85IHjMqbCVMtOwlhxwaeSm9cOqI8fawfl6fO00g4LrS4mJkXss/+RVY7LY
	 DhKgbPBpfwtRpCnBsm1Ij7MlQrMIGbEGQVOAmu/OO25WXatsZITDCaWe6i8UXPhI8kwzS
	 stlww6SjVMM6fXsEziFzyFdgdrW7FWp+UvlWooNSXiKxQOBY7EEdtn9dxTlepQ3nctZ9X
	 IdMSGScDYtstDGlDfIMxIN3C7qZs7LYFYLN/fzl6NKXo2i6CYcLeUyuqJwSBuBoejtiX2
	 csB0hxbKeAW93jgli1xc7WgonrspaCCNuDNFgixRgB0tk6kUMNXw3fLFPXWvzx1Ha3Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630374;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1kb4MkqJfJ01MWxX0WLE/KCVtYTRmoNOlVQyKbSTlqo=;
	b=FHsi31VVhNiXYUTtIVh1QGX1PZQpSf1Eazy1oA5btgpt3zvOiFq60pkU37kSX3vZUfit
	 lJr2I7ICk+Aco038Rk8wR0oXyWtBF0dCRy8Y0KORPu37soIeFfXtidixBMgoLk7yFRi5D
	 iVscqxqwpH9mFWOFLkVeHpRxybwjji64mtaiDpIDlmZViZorQjrCrvI5Wz2EJo3syL/v8
	 n2YacqlCPYEHshRoL3qUoYgTh2JD6LmfQ1Rxs2KnX6ENEcwO4XuJECnVI/mebOGLJVDz7
	 5SteeiTBsXaYxXN34O908omQFTkHrTAmJjTzzCmCG4sMk8LiMT1aZGI69tMhS4stBow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE4981F000C6;
	Wed, 25 Nov 2026 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630374;
	bh=1kb4MkqJfJ01MWxX0WLE/KCVtYTRmoNOlVQyKbSTlqo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JQsZWzkdWXi5dM+i8fWnKduKyihc8sdnsrNHJK44B7oF9XeJ1PkooRY/fx6oxheOd
	 feJbgR+otNQphSbeN+5vdHmL0d932lTNUXEf/PHVN1DMxYhvUI7dj5fiJn3yWE7U3S
	 /GiPREmiIYmR8h/+L+dUnduEqLomJC25jH3P6LjRd+YnebzwXsgoiNBuddcKOtyq49
	 GOpHNoeXHV/OttH+YtLzW3LSQABRXOGTqXYHxVTeul5wFGpaNT7uR4RBMTYa3qv9FX
	 EXNjg3NOm6lUnVQOoYb8Be/ZCXxS5O27dpd1diZ4rpHUOLlqGarwwK1ni7CTh7Ra5m
	 hnLbqRCe3+vHw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 737A74CF69;
	Wed, 25 Nov 2026 18:12:48 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Nov 2026 19:12:45 +0100
Subject: [PATCH v4 1/9] dt-bindings: display: panel: s6e3ha8: Adjust to
 reflect the DDIC and panel used
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-crosshatch-panel-v4-1-120adc58e737@ixit.cz>
References: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
In-Reply-To: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3098; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=izTTRiBpx1JipD+dbLjNqF77ZbLX4nMkT+eXkb5bPYw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrByUehr4emA3qeY3gQxZgr/wAfiHOTvNYwo+Kc
 YOA1+5sXx2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawclHgAKCRBgAj/E00kg
 cq2ZD/9ZtNuvtR/a/J56Ln883I8IIqwF8RZlVQb30sIuL9c0rKrIfCxazKZ+poIZKG+p041E1lb
 Z6LNCHtUlmYo/Y0v+L0WjDHKAIdcURh7AeP4YoBfIOssgbIu0zbSI5wsv1Hnyx023dsUpavnxYz
 vMv55atqo2FnMDQCMZkfiEV0YEzAaCLG2MDvL23KDP3G6uwp2VBuC9WJbh/AFcE3IVHel8LafRj
 9aK0MrvrD/UMSjffJKLxk/ffmT1w4gyn+43Z4NxkK8IEHaf3/NXhrNo9vvVhQWaHWiavhv1uA5j
 D2m6ivG4wU8asYllkq6NgZtoLrj3mnN7JfOoH1lqdVZBQQDy2vf8qnVc0BtlpDZz82IPz+uoN7r
 tFybrJD4AkuVoDaVg2acPCzvDu+ickmrBgLpZrR1aaSuI7kbDLfPOqsADirmKWIMhWJukIOUPA9
 TTTpaIC5R+fCj4ga+JtUEN+ERsJ7b/Hu8/p6BAwZF9Hy2Kp5UADscWB5qfUqp7y/x7Q3EknRDmk
 BFuyA3tbGSjp+TBJKD3/a4y0bc+PYp3u7aRa6K6R7yurC77bnAPC//UwM/bSt0rvLmE/wtQ0sEp
 zOL9fHs1DS7peLZBsB8vLFHZ/M73x9xIRilsGcUSPDt7EmnDYXLWQZelYLUlORfxRxAnYgwPJ8x
 60gjP/EteLBSagw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

S6E3HA8 is the DDIC, while the panel used on the Samsung Galaxy S9 is
the Samsung AMB577PX01. Introduce a compatible reflecting that using
established practice 'vendor,ddic-panel' format. Adjust the example,
and deprecate the DDIC-only samsung,s6e3ha8 compatible as
the DDIC isn't able to auto-detect the panel attached anyway.

We're going to introduce another panel with different sequence, so keep
calling original panel sequence just by the DDIC name is confusing.
While we're at it, we can cleanly fix reversed GPIO polarity.

Update the polarity to better match newly introduced compatibles with
fixed logic.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3ha8.yaml         | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
index 00ce5a4e1c6be..ca250b1b91712 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -1,28 +1,35 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/display/panel/samsung,s6e3ha8.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Samsung s6e3ha8 AMOLED DSI panel
 
-description: The s6e3ha8 is a 1440x2960 DPI display panel from Samsung Mobile
-  Displays (SMD).
+description: |
+  The s6e3ha8 is a display driver IC used in 1440x2960 AMOLED panels from
+  Samsung Mobile Displays (SMD).
+
+  Known panels:
+    - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
 
 maintainers:
   - Dzmitry Sankouski <dsankouski@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
 
 properties:
   compatible:
-    const: samsung,s6e3ha8
+    oneOf:
+      - const: samsung,s6e3ha8-amb577px01
+      - const: samsung,s6e3ha8
+        deprecated: true
 
   reg:
     maxItems: 1
 
   vdd3-supply:
     description: VDD regulator
 
   vci-supply:
@@ -44,23 +51,23 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "samsung,s6e3ha8";
+            compatible = "samsung,s6e3ha8-amb577px01";
             reg = <0>;
             vci-supply = <&s2dos05_ldo4>;
             vddr-supply = <&s2dos05_buck1>;
             vdd3-supply = <&s2dos05_ldo1>;
             te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
-            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
             pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
             pinctrl-1 = <&sde_dsi_suspend &sde_te_active_sleep>;
             pinctrl-names = "default", "sleep";
 
             port {
                 panel_in: endpoint {
                     remote-endpoint = <&mdss_dsi0_out>;
                 };

-- 
2.55.0


