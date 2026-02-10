Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381E2F851
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 03:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695229; cv=none; b=rtequHrgn19S110URLDUTOxAG9iD54iQlXM1HH/YQegU72VobHaAV17jzXhV0koXxoCyyFtGc8wEmGCsD1jpl/A1biqNiBrIpgoyHth8ZqleSRv6wywdpNNGQu+uNFOJl0SW+ZXRr+nNuWy9yf0rD5cp2nHA6W3J7iD86LlOC6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695229; c=relaxed/simple;
	bh=6mwOA0dPC+Xr0uI2n1ZFZV+bR933rcuFFj/RWST+Emg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fx6kGQvMuDr/orE+Qwzaokl3JS/IcdjOGpKZzravUNLzjIWf/a3MTaKRh1kKHagQMlsLOHRD/sCSO4Wabe5ducr8vUnscaDXOLNYKf2KZcFNrQxhvA/5fjcxahbP5aumv9UflZG5uh1LYMGOhVtmtzCFE+rpVZ0dY+pl79fL3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eApSJ2dg; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eApSJ2dg"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-505aaab61d9so3351951cf.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 19:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770695227; x=1771300027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=eApSJ2dgJq9fuDP4eoLv1ZuykVRuCGw5CDlqoI0ukR84i++nhmNR70gPo6mwNE9gfM
         w1dflTGHQlaQyfnZ6ncCiVNynQuPU98nWtnMCpYw2zbKuKvp7tqeGZb72v7L28mPCwyw
         aYob3lz4yRWy2Peg30n9zWYe91sv8rwiVDuIFziR3zW1J0rAf8AM6vS5aowVyXgjxnEI
         ggfutCnJT0sMhwqqcRP90enARWeVcCYO8o4iRdNf74esPeZ+HctUid/LxtQPEIkMq3Dp
         LMJulig/FaQY5cQWxizfYg7T6MOEtVZzZGSdLaurtsVs4sIDrjrEpixuw4o1YUpTfsIC
         udfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770695227; x=1771300027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=Hts4ryd0f3jCpBiVKTgnQ/oLYfMIYe/QO9K3zFM82dJ22xeef/K3pKN2CUqDYsKZ0P
         HZC0Uv/UOSqDBls3JZ4wZSOJbRvkXDUZvauRyhpneAQzZFHlxdKdrU4JD34sXDD8yi0v
         Z6saz7vagW1ZvJC+J0olu70WYen2vE2k8tbJMcI+3ZswLkjmNHJVOXFuvAu36NmEGVux
         eakoPE8hplKxcboWwmYuJuh/NZtRR/Hybu3E7tx9uVr6gvpBLjTtfrWE+w9a592M4Yxq
         VtfewwDgSGOyUNZX94dHH6kXXvODJ0t2libunvLtYQj61YqAEKTSLMTjHIVr8sWyr7EK
         Youg==
X-Forwarded-Encrypted: i=1; AJvYcCVEqjxYjOCAsc2Pgt71KbP9ivfcCKVfkKRNgmlB57oGQTMy0pyC+5foWRJ7vpzUJeZDn3FfCMNiW/miDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfItwdCFnC5w5fLkIhnD5z6OA+2cFCYYV2n2+AV1MQJHqUfdm3
	Pnf2/a/b7kBCGb76bPoKSceSe2wABYfVOqHN5OKOMl8pwwin4q2Rka6CTvdsaQ==
X-Gm-Gg: AZuq6aJTmQuZgbxQu5N6P1F0oiOgh0fQo4pJAYw90a/1GfhfsPyZpvZAvbNrsBmMNqF
	PaDHoANbljCZ701EXYCF1T4yC5mhs1ovvh/XJIieXrlFxEP8QRw2reGEZ4mBaa9dA3gZ2UKAb9U
	mj7T1xna3myhD94BrCtwNQYiUssoHPpkoskA/7jJERT3Em2zP+DDFTjMe5bVwY3XJKSodBU+sz9
	HKnk3dPx3v4dl+tFYq6LJEMoJwrOTQlEbF4vJ6PovSuC//Y5bPaU65JVw+1V3WX0mF8wzbkAd2m
	EkxxY+PJWZtY1n6QM2uXrCepfMsKPktoXheo9qXgRTxkfT//+ypczNn5pYkL/CaLCOSm/o43LQL
	sggwO1FMCtQARh4ud9H6qoIWfSPtQhRJWac+gkTwpZvVSX6+MyoyYJkfd+XzfrZ9ls4zH2KSC1t
	nQn9XVx6k0bJHn4+LgeRuvJgDH2DW/5sZ2IVsfYITNbno4v6sVS4/Djq/2VHi9/lQMKI7rqngHv
	x4xnObszZfycgs=
X-Received: by 2002:ac8:7f87:0:b0:505:e7b8:5531 with SMTP id d75a77b69052e-506398d24a1mr168396881cf.14.1770688894933;
        Mon, 09 Feb 2026 18:01:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fca0sm89311366d6.28.2026.02.09.18.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 2/7] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon,  9 Feb 2026 21:02:01 -0500
Message-ID: <20260210020207.10246-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..6050d7e7dcfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    description: Reset GPIO (active low).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 4
+            maxItems: 4
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.53.0

