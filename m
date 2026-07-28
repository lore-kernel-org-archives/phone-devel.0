Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E32282F1B;
	Tue, 28 Jul 2026 01:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201608; cv=none; b=HWTAxEXm9KD50Zokjzz62ZZM3YEzaTBYCVwclI96b3xoIA+whcaafkiuHzeTwNsi0gTDddA5OLTXb2D52CVxE3uaEAw0ETD80HGEswq9DU/BNCY9cj2Dtx2aa54HoBjLYOtUtP6ydmWtMzbHjzZoFUqPtyJCKbCvxNc/wjnyGoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201608; c=relaxed/simple;
	bh=V5Mj8+KXokuuedqJV0YZXgawcmpOl3xxL72RlJ0hmsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXVIfyqn0Bd4P0B6gesxq3XaQsb7owZdBJadQUHdzSzm3U+AL3mtV41ItvrG5kEswMABep4VE5P7svjHAnRF2QEcLSCKVlEG8oWUVoeJfRv4gjgb2d5zcaryHXB7HsLvwzhQYUZM9JPsh5gCFDxYbZPKqbCr3edRBAxHbJbV1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlM5RqTi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlM5RqTi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2440AC2BCF7;
	Tue, 28 Jul 2026 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785201608;
	bh=V5Mj8+KXokuuedqJV0YZXgawcmpOl3xxL72RlJ0hmsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SlM5RqTiErJpwFR0i4TXPD0h/8228k7Rfd+2r5zoG1/VOGC7YDTjzoI1tlpy7wUvy
	 ldASWMumEYvz5cOXxW4hQhJTV9XPD116BnWE1Se2hKeoUXZBnYFcfI1/3r4rP1LqQc
	 yxTWNH10hHaHS1xzEsaE2I255kbKRB8oaK8vtoQoHl3/ByQBMcxs6sNB3cvBR+99Px
	 QfaoBchTjW0Yj0cp6KcYHFiDD1yvA9CvCJpUDVfqyNpoYvwOyg2OlI9kadDJxx+5Bg
	 soMQHmyI6nUohUjGfGYcm9w8u2KZ7ppvlKykkIrO9npnIMlvrPCyzLjxyEAG6mO5OX
	 2HGFe9mKQB7rg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04B9C531D0;
	Tue, 28 Jul 2026 01:20:07 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 27 Jul 2026 21:19:34 -0400
Subject: [PATCH 1/2] dt-bindings: usb: Add Parade PS5169 redriver bindings
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-ps5169-bup-v1-1-c76a8ef3b239@proton.me>
References: <20260727-ps5169-bup-v1-0-c76a8ef3b239@proton.me>
In-Reply-To: <20260727-ps5169-bup-v1-0-c76a8ef3b239@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785201606; l=5782;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=XrA62lSi9Hct6BU2/Wdu52E9fNAtqyvkYTG62kpPHKI=;
 b=8bz18Ihb1Qg5UqyBDz0eoMxkYcAU6/IakynLwaYmoG+feEFhtBR8cpCi1X6t5TF0uJYWzt1XK
 gV1gTymgeVADdWxMtROq/NKUSJBeS9MhjXBoMTePXOp7S0dKzKxzb69
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Add bindings for the Parade PS5169 and PS5170 USB Type-C linear redrivers.
The difference between PS5169 and PS5170 is that PS5170 features an
embedded AUX switch, while PS5169 does not.
Future-proof the binding by adding PS5170 as well.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 .../devicetree/bindings/usb/parade,ps5169.yaml     | 186 +++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
new file mode 100644
index 000000000000..23ca8e6c0491
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
@@ -0,0 +1,186 @@
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
+  parade,dp-eq-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Equalization level for DisplayPort channels which is mapped to decibels.
+    # 0: 2    dB
+    # 1: 5.5  dB
+    # 2: 6.5  dB
+    # 3: 7.5  dB
+    # 4: 8    dB
+    # 5: 8.5  dB
+    # 6: 9.5  dB
+    # 7: 10   dB
+    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+
+  parade,usb-rx-eq-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Equalization level for USB receive channels which is mapped to decibels.
+    # 0: 5.2  dB
+    # 1: 6    dB
+    # 2: 7    dB
+    # 3: 8    dB
+    # 4: 8.8  dB
+    # 5: 9.6  dB
+    # 6: 10.4 dB
+    # 7: 11.2 dB
+    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+
+  parade,usb-tx-eq-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Equalization level for USB transmit channels which is mapped to decibels.
+    # 0: 2    dB
+    # 1: 5.5  dB
+    # 2: 6.5  dB
+    # 3: 7.5  dB
+    # 4: 8    dB
+    # 5: 8.5  dB
+    # 6: 9.5  dB
+    # 7: 10   dB
+    enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+
+  parade,aux-rx-data-reverse:
+    type: boolean
+    description:
+      Please check the driver before specifying this property.
+      Usage of this property is design-specific.
+
+  parade,fine-tune-lfps-swing:
+    type: boolean
+    description:
+      If this property is specified a 50 ohm termination will be set on the USB receive channels.
+      Usage of this property is design-specific.
+
+  parade,dp-set-gain:
+    type: boolean
+    description:
+      If this property is specified a gain of -0.9 dB will be applied on the DisplayPort channels.
+
+  parade,usb-rx-set-gain:
+    type: boolean
+    description:
+      If this property is specified a gain of -0.9 dB will be applied on the USB receive channels.
+
+  parade,usb-tx-set-gain:
+    type: boolean
+    description:
+      If this property is specified a gain of -0.9 dB will be applied on the USB transmit channels.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
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
+          properties:
+            port@2:
+              $ref: /schemas/graph.yaml#/properties/port
+              description:
+                Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
+                handling altmode muxing and orientation switching.
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
+            parade,dp-eq-level = <0>;     /* 2   dB */
+            parade,usb-rx-eq-level = <0>; /* 5.2 dB */
+            parade,usb-tx-eq-level = <0>; /* 2   dB */
+
+            parade,aux-rx-data-reverse;
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
+            };
+        };
+    };
+...

-- 
2.55.0


