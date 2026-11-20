Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197876;
	b=vI52grHRjj2ts4oBLPWcPtfzNte25p4Q+ww9AQqdmBIJbT2UwFeTIzIdjexFtTOw3Yj4
	 IstvMmD+qVsCihA5v2XMJDYW5xZgObjp4Sfj7psRTrYekleQS2hpBZ88a5laZ1UrDPPtI
	 FUR2DYjFloWVyT6LOVD8d22en+B2pwMiZbobHAR8zizNdskxITkGI0k3a+YDVSkOXTOvV
	 QTrGIVn8/srBZiaAnMakBa0dtIcHxMid8YA7JbYOIV0Q8xxBKJ+uTlvTxh3l6trpbK4Ni
	 0aEuP1hf4uXTLD4KrK8Pkr6t2gEAAFLZ94tQsiIAZYKWf4G5OmQA5wXd8+NAQk1OEtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197876;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wqrsZBFTEgGy+HYB59OU+78hDrcZgqtGFfMhSqQFz2U=;
	b=zyrDuLZWVtXGPIf5tQmeUNt/2+4AdTESW4gdsHXiMOxgnuYDuveZspTimaonKKKjMRqW
	 81Mb0WqxzEdGazUmGoSeXTgYMv4oW3hdIwHLX17UeLUqg1WNqI3Od7rPu+isdSsU1XnRR
	 sosBxOAztWGH/Gj0Zkg6nT0Q6tI9RQGn/LphdKnccw2zvA6g2Me6aHKoft3iIYu1C04JM
	 7JRJVyLgS1Alya3jm+hyQKRVncIwcEc/7D7YymvJmwobY4C1ix4DAmRKRWLD0OAm4k2oK
	 s5eu3UZ+ZLkiso9k/qq1BGWjc+tPjcJ2H7JT8Axz6g3/mAN+ootrMOJWqxJcy9JZVSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=maHhUrqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC260A2611;
	Fri, 20 Nov 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=maHhUrqL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795197875;
	b=X5l6JMzOo+H7DkCv9/JszlX/kj6EWcXuYEny5fhtmZR3CHIT3F133CsBvR4oVwXk2jWX
	 ZN1t/Z8pw3u5QLkNqCKJTn+uG74K9wjIUOeMqW1/RaD4dnWDfstYxSmjVkXfKBLbLJN6E
	 YNUigEIP2qdSB+XgryUx+/XOBUGhSb3GkcE8na6WMcvKIPQyr0eUHKR2fmoGJXQEVwTu7
	 TMBpH5Zc3vFs84vu/9eKFcj9XZO7rPsTtkj+8dUZI7cnUHw2F2+9XS/cNY7U1uQrYug1C
	 YVVCsbbHklMfQvc/vBx3K5DVnhFuKcjiz4JwDKpbfxqZhvFkqv8TE4QGzoJaW9cpVGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795197875;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wqrsZBFTEgGy+HYB59OU+78hDrcZgqtGFfMhSqQFz2U=;
	b=NKzp6BIMdrHkaJw7tD3kzdAgux2G8PoV0EwRmptIwzVWbaQAoEtKQoe18xDEa4Z72NEe
	 rpTD3FtS2xWvmzsOEuxDIDtD9tPnku2ZC9iWt4gjbqhLu8UEDWeaYPbn6kS9pXhjY7NMC
	 TosU4Xybqa1LaoNUA52zLyNyYFYVlN0tpRP1bfTNJ+EiZ9E2wiRlBZQ1FNIzwtXzZF0II
	 SRCri+Fzkz1vPEnLU+FpCe5p9D/RTQbIGvskWbnOLltky/99zURmOIflWewAupI07oqAZ
	 Ire+PgiK4faeyWya7jhxcDZUxXrA31YoQw++ZsU8345KB/uCbzN6UpXXXUiwqwcvMwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04E851F000EB;
	Fri, 20 Nov 2026 18:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197875;
	bh=wqrsZBFTEgGy+HYB59OU+78hDrcZgqtGFfMhSqQFz2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=maHhUrqL1aD0EYYBtEDDJVBPSr8kniCdY95UbEWTs0wSn2TnZPMPcY2vG3OyYFJsN
	 nLW6tFx3Yk2MIrX6FTCFpGAhZ4PFSzx5Tj5Z1WM7ZgvUW9PYIwZZHwMy82+J0BfZt/
	 NcfpaAgdrsyMSe4fW7bHEptUhxVicxCthgIVJaYF7Gtj3zD6cIoXf/tipUvw1k5kSd
	 cqvbbvCtxBGnGfsfSbJ0q0KaPvLHN82dFpC2YpIybgXcCEWux9uoKGVjs2p9JHUEcJ
	 M4DQkajm1vD19PAqc3yI4jzemELJG+jBuqzZFEMFQeig5itL4zs+h+4/5QoydY+WP9
	 MOIbzUqcJw44A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 89E5E4B8A1;
	Fri, 20 Nov 2026 18:04:18 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Fri, 20 Nov 2026 19:04:18 +0100
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add Samsung S5K3T2 image
 sensor
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
Message-Id: <20261120-upstream-s5k3t2-v6-1-dd345fa4201c@proton.me>
References: <20261120-upstream-s5k3t2-v6-0-dd345fa4201c@proton.me>
In-Reply-To: <20261120-upstream-s5k3t2-v6-0-dd345fa4201c@proton.me>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
 phone-devel@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795197857; l=4123;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=tkShdLWwWiHuVSzgY4OOZGB7fJdUgKDkchfsedpvqsU=;
 b=tB6Lc8ZB3jVFUFqnnSvXr1yuSoWKOTvk9fR48j1QW6l4AV8u1h7mH7rM/Ybwq9dPJSkTlQbWq
 x8vLwRjKte+BwPjX9alefNekgiv/s0AkQXnpOtW83XiuP5x/5m1b9GX
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me
Content-Transfer-Encoding: 7bit

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

The Samsung S5K3T2 is a 20 Mpixel CMOS image sensor. It has four MIPI
D-PHY lanes and an I2C control bus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 .../bindings/media/i2c/samsung,s5k3t2.yaml         | 105 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
new file mode 100644
index 000000000000..74a1aa23249f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k3t2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5K3T2 Image Sensor
+
+description:
+  Samsung S5K3T2 (ISOCELL 3T2) image sensor is a 20MP image sensor.
+  The sensor is controlled over a serial camera control bus protocol,
+  the widest supported output image frame size is 5184x3880 at 15 frames
+  per second, data output format is RAW10 transferred over 4-lane
+  MIPI D-PHY interface.
+
+maintainers:
+  - Armandas Kvietkus <armandas.kvietkus@proton.me>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k3t2
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK supply clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.8 volts.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.05 volts.
+
+  vddio-supply:
+    description: Digital I/O voltage supply, 1.8 volts.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdda-supply
+  - vddd-supply
+  - vddio-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@10 {
+              compatible = "samsung,s5k3t2";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vdda-supply = <&vreg_2p8>;
+              vddd-supply = <&vreg_1p05>;
+              vddio-supply = <&vreg_1p8>;
+
+              port {
+                  endpoint {
+                      data-lanes = <1 2 3 4>;
+                      link-frequencies = /bits/ 64 <448000000>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..1924dbd20b57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24380,6 +24380,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3m5.yaml
 F:	drivers/media/i2c/s5k3m5.c
 
+SAMSUNG S5K3T2 CAMERA DRIVER
+M:	Armandas Kvietkus <armandas.kvietkus@proton.me>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5k3t2.yaml
+
 SAMSUNG S5K5BAF CAMERA DRIVER
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 M:	Andrzej Hajda <andrzej.hajda@intel.com>

-- 
2.56.0


