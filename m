Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628622E737C;
	Wed, 29 Jul 2026 06:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305000; cv=none; b=sbGPS3an5ZbzcT7L32bcvKP1DUpOYv/q8I4emeEtIDYoum1kFu6fOC4TEV4SjpEkxgMWAza9u00jPxIr5uDZTfXBQ/Ns7zatKJwgvvAegsTzQrIrVX1UcI+cKD0XjP1Sl8yuICG5morPrjHA80X7qkFLOrhOrQIfMXn4P1f2RV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305000; c=relaxed/simple;
	bh=9ki6HpcVjcFjPaftCYJGeb2GLcn4jwJixZV7IlYRnHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLu59/VTWpR/lbA2QA9FanwMYnGUWPWJ18ZWVUMBSusHSwzTlcYWTx499Am8fRNPvhW63siLnYucCkHwaibPClV4qTPqIEwwSxKI4vblWH0x5wHVweLdH+aqyE5DZFzS5FS6AvdKfFFvhX2lvOmLlj6lOy04EtiL0ODNl0SlZWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+5sY/qE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+5sY/qE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DBF8C2BCFB;
	Wed, 29 Jul 2026 06:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785305000;
	bh=9ki6HpcVjcFjPaftCYJGeb2GLcn4jwJixZV7IlYRnHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g+5sY/qEe0zFrRxPEdNuzAhBr1A5XtvHclTDtSyDysxLUExRgPlMC1hRk8ljvkDud
	 axvGmhYO3N/sHuVLNRidUHneR4lri27/M084k67u1kqNXQfB1nlrWWNmWmWNOBcyhm
	 oichMmzMYhBW7qERirUUqJW8pAtxTougt7w6lpYow//AmibfbgudpMCSxZfSDQsDs3
	 qdhZYLMYcyM5JM43uGhgB8gbPiRWle8lxc1BF1mxLuQG2wssYkis2TJqM9swQw5bGH
	 B4deQrdGmNXpLhb2NihqciLfWhEPK/9pNl6GcDPCRWgKRKL8mM5mdJG8g14s9CRKke
	 pbbKO11855+Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD084C53200;
	Wed, 29 Jul 2026 06:03:19 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 29 Jul 2026 02:03:14 -0400
Subject: [PATCH v2 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ps5169-bup-v2-1-203b0a49881a@proton.me>
References: <20260729-ps5169-bup-v2-0-203b0a49881a@proton.me>
In-Reply-To: <20260729-ps5169-bup-v2-0-203b0a49881a@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785304993; l=5883;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=0S6UXUorUMbLlKLnEsHGa9utbX+f+ELHzb5JHwii9qs=;
 b=tVEWCcPh1m28amUH5krTe0yTg3MnS7Rndp5hFs4WVNuS2TfqE2lcykehSOVO3THllpOMpC29t
 Rgn2o5E4niwCRJw28Yl0CFSoHrsL7wxvtAZazIqWQWbRtOz31tiyj2E
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
 .../devicetree/bindings/usb/parade,ps5169.yaml     | 191 +++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
new file mode 100644
index 000000000000..86ea2351ee1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
@@ -0,0 +1,191 @@
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
+    else:
+      properties:
+        ports:
+          properties:
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


