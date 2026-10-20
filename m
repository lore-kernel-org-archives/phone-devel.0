Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484048;
	b=pqOpQah2cefDA7Lbqiu0WYaP6XFDbtUlWWeEqnclXR6Iu9c1o3NdB5K69K9uhpuVPi/a
	 CyUNZ/TKi9gAg0B5AVd8B+dcd3DHzXeDptRb4brsR5TQ7Ql9lFb3MgP9Ug2Kp+eVs37t4
	 1waPfTAHoGeKdOsU432Vwix1DqsBA27J23uIRW70lohqdgYWVe9jcWwIq0J+aIK7Im33u
	 llb4ery/VTQAwza2N9zK+rhBih6/UgDmfE/2z4FtdYpkccM0D30dvl8AF60BUTJKGaQH2
	 WWj7LWUNWY6+9zLTiil7VN/yAhZpNuGSmgSdT9r7zr1c+ptNY76/1bpJbjBURUMkqcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484048;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2aKFnBqY+ZOSc2qg+3ps+Ris0ORSO71jh1jEIP3HX84=;
	b=NNH+7mwGQYe+kvsAtOsdkdMXVqEClF4oo4h9cHYA66AtI1zVHJAEG7dVUjEZHVoRyc3K
	 /a7ZNkQdj7Z94thjeYQvteDFP0rtlEuQaj2Ws2WIH4NiEUiVbOHbkN/shMYLGY5USxzyK
	 d21HdPtZq4dkKnMAa9dqJiKtUl5JDJjvlZGZnEeic9cDSIscNBmyM4AcsTrTqcCCFjCp4
	 NJKhhb0aMOX8yv749E+tgeqIUtmZM/XZ/PEPC3xmP4TzMY3cAl4Ehtc5S9zvQlubSUOIF
	 SfwLju6E+1/MFqCBim7VKJfu3m5C5I64/IHG0EKdJIQEQOnLTNehyfrV6/f56UgXACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=CDKV0l3f;
	arc=none smtp.remote-ip=95.215.58.126
Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9F606A325
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 08:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B9F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=CDKV0l3f
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j16WdnSx3DNDWkxVUpc7etCn7NUgxL1/ifcQaa0wdeU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484045; v=1; x=1793088845;
 b=CDKV0l3fmEU/l96/1pLYHhymRwcG41/fm1qNBSj7OO9EcukS4s9pO1hvU2ecY7xyxKAkAa4s
 uJ0FtP1Qh3z89Fq5tEa7DZQJwqzhvxjzxjYbNUHhuwGY0A/FVWl5ItnVv1AIiaBDDM1BQWELsjW
 4va5pUT6xM1E/32ATynxnoPyU0qD6b/PGSTRGj8G2Ra37lKc1NyeYQU7/1Fkti2AOGcw8f+tbbs
 GJSkSBdaox1uWobRF2szYO1JTxYD4f3MkLCGsL/kiIyDJyyN+eif4AtXxc63D8FWN0SqYvrAdjg
 pj8UJWYmL73/R4h679jChdG0eo+k6YzsTBd7r41q2lpzQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 13d05c1b65251fa2;
	Tue, 20 Oct 2026 08:14:05 +0000
X-Mizu-Trace-ID: 13d05c1b65251fa2
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: fsa4480: Add an optional audio port/endpoint
Date: Tue, 20 Oct 2026 05:12:53 -0300
Message-ID: <20261020081343.1507986-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020081343.1507986-1-val@packett.cool>
References: <20261020081343.1507986-1-val@packett.cool>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fsa4480 mux is physically connected not only to a Type-C port
controller, but also to an audio codec which has to be notified when
an analog audio accessory has been plugged in.

Describe a second port intended for the codec. Keep it optional to make
sure existing device trees do still validate.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 94 +++++++++++++------
 1 file changed, 66 insertions(+), 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index 89b1fb90aeeb..ee00c7ce0c50 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -9,31 +9,11 @@ title: ON Semiconductor Analog Audio Switch
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-properties:
-  compatible:
-    oneOf:
-      - const: fcs,fsa4480
-      - items:
-          - enum:
-              - ocs,ocp96011
-          - const: fcs,fsa4480
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  vcc-supply:
-    description: power supply (2.7V-5.5V)
-
-  mode-switch: true
-  orientation-switch: true
-
-  port:
+$defs:
+  controller-port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     description:
-      A port node to link the FSA4480 to a TypeC controller for the purpose of
+      A port node to link the FSA4480 to a Type-C controller for the purpose of
       handling altmode muxing and orientation switching.
     unevaluatedProperties: false
 
@@ -69,14 +49,57 @@ properties:
                   - AUX+ connected to SBU2
                   - AUX- connected to SBU1
 
+properties:
+  compatible:
+    oneOf:
+      - const: fcs,fsa4480
+      - items:
+          - enum:
+              - ocs,ocp96011
+          - const: fcs,fsa4480
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vcc-supply:
+    description: power supply (2.7V-5.5V)
+
+  mode-switch: true
+  orientation-switch: true
+
+  port:
+    $ref: "#/$defs/controller-port"
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: "#/$defs/controller-port"
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          A port node to link the FSA4480 to an audio codec for the purpose of
+          handling Audio Accessory Mode muxing and orientation switching.
+
+    required:
+      - port@0
+
 required:
   - compatible
   - reg
-  - port
 
 allOf:
   - $ref: usb-switch.yaml#
-  - $ref: usb-switch-ports.yaml#
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
 
 additionalProperties: false
 
@@ -98,9 +121,24 @@ examples:
             mode-switch;
             orientation-switch;
 
-            port {
-                fsa4480_ept: endpoint {
-                    remote-endpoint = <&typec_controller>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    fsa4480_sbu_mux: endpoint {
+                        remote-endpoint = <&typec_controller>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    fsa4480_audio: endpoint {
+                        remote-endpoint = <&audio_codec>;
+                    };
                 };
             };
         };
-- 
2.55.0

