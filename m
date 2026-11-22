Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374530;
	b=DIorYVv4BOggdPM3ygjEvBOilfoTOF/AkzoSjU31l3litnvrdpeRQji+dPBHo28Ji47r
	 CDzGbcvnGyENpIZ7UP5UKXwDqH5dKRLMUAy/5joRV86XwAHDKzFHXeBZB9cA9bUsHLf1R
	 PM/WJYCApZQkAuahX14CG5/eIRdKsUk5vG8aIGXsqr9DFve5IYAqDXOyAEZbjQR7x/Gfw
	 yiFeJp18jJsk9Ywrp9IAhXK8NLqyrEeRsklPKyqdzseDVzcptlJLECEnXrOEgPJ8rqWam
	 5vZYvgY1aQsRehMeOXMbuI4q1geUX1venrMU69RLvdeNbNSd0aRWlBYQEfEzrn+K7ZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374530;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qzvhvI8Ue92h1GQoRtFdSPjSmlHkO8kXwzNrycwy0HM=;
	b=IvNT2LIZ6j+GJtmQq8ST1mo70rWNbxEL2ptG31FCxxA9k2yoq3T3iOn8jbcQSTnE/hI1
	 r1TBuahzXYablOtBzxhoN+VMAv5rqm5vUjoZbGV/2xNvtB22mW7R/5y6ZniJxyWdRPanu
	 anO74FSex+pTvJSMNElU7utuZQKTKHfVVI/z/FbmEDkAGSCCHSPsTbybdf75mWcSpzOAf
	 G0jwdpZotnqmv+ssqJ8WM4g7vu8q+VQWEEsjuxYPJltwyFlGMa3OLaGGvpDuKdEAnjB2F
	 7IxbOUqGYuH5JkXOlifhdd/osDf6F0DLzNQtQ6YRmOLhXJQTNouWIB6hXTUPdeOKn5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YB3aT402;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA17606A32C;
	Sun, 22 Nov 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YB3aT402
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374529;
	b=UrrElkwissnrn8OmYxJcDHETAYhV3SVI3VR4dM5/jDx3gEBALx0P1DQvJtzjjl1N6K5y
	 voG3uhx48EzPvlmF9hqSGXQs2ZUkwQuqay9V/tAoUIuNAKCqT8/1C5Jb4wc6FTlznEDi8
	 k4lyl1YxYxyk8LItx/5goMO9eYc2RCJWcDPLqWwLZzHdU3IW2at6ClpB96I6xGT7cmpop
	 rXLoWo9xt5vYoEh1ly5b+r687Ge1Sj0HeIVnxbHQC7y2+5PmB6lCleocyuR4rZlCrjfYD
	 O/5J1ap8+xSY0oPYITeJFP7vhwYvEW0RC7cvJW7Nt+RuC9M3bmhzteXjiOkwk81apGQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374529;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qzvhvI8Ue92h1GQoRtFdSPjSmlHkO8kXwzNrycwy0HM=;
	b=r+20KGDqfDGxaQjxZuHRSh3+nUj89wrFbX1Bnq76KCoB0dmRh69uXBJTufRWGRIjNa0u
	 TQx61W/KawH+seeEnCUn2mzGqTM7tK0Zn1V63hAqmJ5wuBglof6+efx+LtTUvnE2wRBGR
	 W1hKaZVVAlT/c5VfVyFkAhJupOjNfyKORvrTMJk8GFbvAaRcSmphLYtwYnHAevNtjjHoZ
	 gedVbB9K0x3vQF6+QYh7uUt4XY1YOkiBRsljN+mLiura0Ws3esTh5jgV1FzQ/v5v9CAgv
	 Af+fzfFHt1bnlWEJ+4yqrBXB9sQaoaUgIylS93MCD/IoiD58C6+WZtK5yXLL5EC3zaA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F28801F000D2;
	Sun, 22 Nov 2026 19:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374529;
	bh=qzvhvI8Ue92h1GQoRtFdSPjSmlHkO8kXwzNrycwy0HM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YB3aT4021PI9lbzYYhQbLGG0wmg36fRwSA0s+4aP3ilwdmClCfo7OYgZvIaM5LXay
	 GiR2E7MI1xBjLW4bJ4yUtxaoa8M2QI53fFrKT+KPZM74rN5XiJzMX5bENu+QL+K1ch
	 2YC1C67x6QgUyA9S9ud9TITtdnrWQFLvM7fxBzVUa6clWmpxCw5NMz9/yWqJU1ak63
	 7VK2QsTLlr4RtZvFg5KyCLK0zsR/lAFoCzAaSBBBlN87NMvX3weomQNXAQhMoak/Xh
	 0WZZ5fmKgjpZjN37obZ8hzFI/Db2ut43lgWIqY41HsM+RBwmtis8JtWJRRvI1ueZoQ
	 FRrvLk9VznPbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 865FF4C1AD;
	Sun, 22 Nov 2026 19:08:35 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:38:34 +0530
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Ilitek ILI97680A
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
Message-Id: <20261123-vantage-panel-v4-1-e9c2f15b318d@yahoo.com>
References: <20261123-vantage-panel-v4-0-e9c2f15b318d@yahoo.com>
In-Reply-To: <20261123-vantage-panel-v4-0-e9c2f15b318d@yahoo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374514; l=3174;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=pMd11GttDXvSG05xxXWSNSksH59o1pEDfRkDLQ9rLIE=;
 b=EtpaGS4xB1fRsjqBW5QvvtYu8/TiPR0TPQL/IXS+KxFdicTHw0L+bqryqNI9D/ION1mYOh0/k
 SU9IgTjrNGnC1AhSEVgs5i27/td2VeF5QSQxZaEzf7nGolcU5+EJDyD
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Ilitek ILI97680A based 1264x2780 AMOLED panel by BOE, a
MIPI DSI command mode panel with DSC 1.2 compression found in the
Motorola Signature.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/panel/ilitek,ili97680a.yaml   | 74 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
new file mode 100644
index 000000000000..117b02e7e9a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili97680a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI97680A based AMOLED DSI command mode panel
+
+maintainers:
+  - Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+
+description:
+  AMOLED panels driven by an Ilitek ILI97680A controller over MIPI DSI in
+  command mode with DSC 1.2 compression. The resolution, DSC settings and
+  initialization sequence depend on the panel, so each panel has its own
+  compatible with the controller as fallback.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          # 1264x2780 BOE panel of the Motorola Signature (vantage)
+          - motorola,vantage-boe-ili97680a
+      - const: ilitek,ili97680a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vci-supply: true
+  vdd-supply: true
+  vddio-supply: true
+  port: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vdd-supply
+  - vddio-supply
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
+            compatible = "motorola,vantage-boe-ili97680a", "ilitek,ili97680a";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13b_3p1>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l10b_1p8>;
+
+            reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi1_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c4f4e48774d0..e3d7b88a50e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13040,6 +13040,11 @@ M:	Stanislaw Gruszka <stf_xl@wp.pl>
 S:	Maintained
 F:	drivers/usb/atm/ueagle-atm.c
 
+ILITEK ILI97680A PANEL DRIVER
+M:	Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili97680a.yaml
+
 IMAGIS TOUCHSCREEN DRIVER
 M:	Markuss Broks <markuss.broks@gmail.com>
 S:	Maintained

-- 
2.56.1


