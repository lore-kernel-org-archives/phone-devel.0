Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC251F8AC5;
	Tue, 11 Aug 2026 03:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419138; cv=none; b=LDjGRJTO+xknDy62OAKUbHH/GXbDk34RAjalO9Z609kNo5bOzNSBg/9ZDg7xHmpgJxCEl72GfqPxgDMV+HalvGVeSfl31tKD9etFEHVgHg9q3ojRMzK4wvZlt8dGwrn1dIfQjpu2w9NP16EiBPgGh1jLEeKdlr/SpsncqLtCaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419138; c=relaxed/simple;
	bh=wWPDqbtE9IjjVOj38eLfwO5U/9DHuOFyX+RgCqVoio0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdQDdBZCmNYLb2yv3hZhceExOh4bZHMpBFw99Y9AhjTWC6NeglprBljwq3Kx+QI31g0fXAY1+KJptoy+xJ9Z0RpSmCdXEjmNeySMdoVel13wtz0c7YotGHQy/6D0ZrAbon9GZIbI60IfhYZ9o2Yd6UGAlrMCVFrmXq3RpnA3Co8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAeG1LB0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAeG1LB0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7208EC2BCF7;
	Tue, 11 Aug 2026 03:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786419138;
	bh=wWPDqbtE9IjjVOj38eLfwO5U/9DHuOFyX+RgCqVoio0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MAeG1LB0qJ/M1qIUQh8unWjfJ4qsvvQ+hwXud3mG/3HhD6TmdxH0VGT4ndS70b+b5
	 gN4D7cL9CzOJLhIEzjIQpWE3q73xgUOeFBolm0dyPitCqrMxUXZHkp7W6sw+5tZFwQ
	 P6PHIAQjKpIHhJF60ZvzopmckOQXgw5p0KaPciyjIgu7ysBldCpOgkyiMeYPWX0hCo
	 1c7d4XGyZw3ORuW3zdnNjdSxpw8H6QKZpC2YjcDOOil+Ay0vedMrR9yrnm94gQJYqD
	 mfCRJGEDNpm9iq1afDgYwtIH83xsBVHOfP+/Q7S/W1lqmg175py83Q1GRf4UWf5EMn
	 bhwNEGArrgOAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB11C5AD7B;
	Tue, 11 Aug 2026 03:32:18 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 10 Aug 2026 23:31:36 -0400
Subject: [PATCH v3 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-ps5169-bup-v3-1-a2178b2834d7@proton.me>
References: <20260810-ps5169-bup-v3-0-a2178b2834d7@proton.me>
In-Reply-To: <20260810-ps5169-bup-v3-0-a2178b2834d7@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786419136; l=5639;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=B7m2pd9kvS3C97uNpoakZ1NLas4KObjMwrJoNHsnny0=;
 b=FKics0VG7D5waIfkoZq7BAaT5p2wgj9xNLNUoAhKjG0iODlve8k8kxrLfQM8qQvsl+4eZDYzr
 DLFs4rZYygYAy0fBwCcWU+drPLn866kNNX6Ac9bNS6BRFURijPeS+3H
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Add bindings for the Parade PS5169 and PS5170 USB Type-C linear redrivers.
Unline PS5170, PS5169 doesn't have an integrated AUX switch and only
performs AUX channel monitoring.
Future-proof the binding by adding PS5170 as well.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 .../devicetree/bindings/usb/parade,ps5169.yaml     | 193 +++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
new file mode 100644
index 000000000000..fe202e481c8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/parade,ps5169.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS5169 USB Type-C linear redriver
+
+maintainers:
+  - Esteban Urrutia <esteuwu@proton.me>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: parade,ps5170
+          - const: parade,ps5169
+      - const: parade,ps5169
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: 1.8V power supply
+
+  reset-gpios:
+    maxItems: 1
+
+  orientation-switch: true
+  retimer-switch: true
+
+  parade,dp-eq-db:
+    description:
+      Equalization for DP channels.
+      For example, <6 5> denotes an equalization of 6.5 dB.
+    oneOf:
+      - items:
+          - enum: [ 2, 8, 10 ]
+          - const: 0
+      - items:
+          - enum: [ 5, 6, 7, 8, 9 ]
+          - const: 5
+
+  parade,usb-rx-eq-db:
+    description:
+      Equalization for USB receive channels.
+      For example, <5 2> denotes an equalization of 5.2 dB.
+    oneOf:
+      - items:
+          - enum: [ 5, 11 ]
+          - const: 2
+      - items:
+          - enum: [ 6, 7, 8 ]
+          - const: 0
+      - items:
+          - const: 8
+          - const: 8
+      - items:
+          - const: 9
+          - const: 6
+      - items:
+          - const: 10
+          - const: 4
+
+  parade,usb-tx-eq-db:
+    description:
+      Equalization for USB transmit channels.
+      For example, <6 5> denotes an equalization of 6.5 dB.
+    oneOf:
+      - items:
+          - enum: [ 2, 8, 10 ]
+          - const: 0
+      - items:
+          - enum: [ 5, 6, 7, 8, 9 ]
+          - const: 5
+
+  parade,fine-tune-lfps-swing:
+    type: boolean
+    description:
+      Set a 50 ohm termination for USB receive channels.
+      Usage of this property is design-specific.
+
+  parade,dp-set-gain:
+    type: boolean
+    description:
+      Set a -0.9 dB gain for DP channels.
+
+  parade,usb-rx-set-gain:
+    type: boolean
+    description:
+      Set a -0.9 dB gain for USB receive channels.
+
+  parade,usb-tx-set-gain:
+    type: boolean
+    description:
+      Set a -0.9 dB gain for USB transmit channels.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
+          handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+  - reset-gpios
+  - orientation-switch
+  - retimer-switch
+
+allOf:
+  - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: parade,ps5170
+    then:
+      properties:
+        ports:
+          required:
+            - port@2
+
+    else:
+      properties:
+        ports:
+          properties:
+            # PS5169 only performs AUX channel monitoring and doesn't have an integrated AUX switch
+            port@2: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-retimer@30 {
+            compatible = "parade,ps5169";
+            reg = <0x30>;
+
+            vcc-supply = <&vreg_s10b_1p8>;
+            reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+            orientation-switch;
+            retimer-switch;
+
+            parade,dp-eq-db     = <2 0>; /* 2   dB */
+            parade,usb-rx-eq-db = <5 2>; /* 5.2 dB */
+            parade,usb-tx-eq-db = <2 0>; /* 2   dB */
+
+            parade,fine-tune-lfps-swing;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    usb_con_ss: endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    phy_con_ss: endpoint {
+                        remote-endpoint = <&usb_phy_ss>;
+                    };
+                };
+
+                /* PS5169 doesn't have an integrated AUX switch, so no port@2 */
+            };
+        };
+    };
+...

-- 
2.55.0


