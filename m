Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FCD313E24
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 04:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622803; cv=none; b=qjD4+soTblsJQeopKqMvFNG6pD7ymhMsg5Ri3um+e9wRd2nigXiEpvtFlP+Hj7QCHaBL5irkEGoUzG+xNGBbRDypqvzuca3mBr6klcPelMqTt8zetnOmpn195d9X/flfKHU0a5R8xm5R0Q4qghcw+PkOU3ndWAQOqgBUeDYah0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622803; c=relaxed/simple;
	bh=q6Zcg5OxkKLFI3E5a9irtIExZJ+tzYy2eTeqFd6joyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcmGPU0NK89PJF32RX1dgtM9D/Ds8VzPn+fu5N8clQlleuPHB0Vd3me5ZiUMTW4OvXOg5N0fXS47HYsJalAzJ+W+8y6I3SLw6qQDwtvyD6JAjA6x3g1PTNV3GUuGxTgvdMDaz76zgEFlPdLFqQzhVTbwLERLeS17KZhQKH42pns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFpKNqc5; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFpKNqc5"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c53421cdbfso267984185a.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 20:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622801; x=1769227601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsoz6EWM7qD9/4dVYsGLR4Pmvjatyh5Pk5C2o5rnB9c=;
        b=cFpKNqc5oBsRmw0vkllHTs1mHoWxXD5XF4BGivccm//Ej2uHfkFgU0uFCKDNAMvOEC
         a7Gs2D4tbhU4eZa+kMaVPHb4VH2LDIURrqZCGIRip3t7UVtuaYz103ApufEHqalo0KtS
         P8yWFKayyT/jjhIEtaoj3X0j6NcLUYOW4kXuAs07CrdGqZyu5dmqzGMhW6BcQEH6Wb6h
         oGeZLY/LjtUxRMNC89h0EJnapBXGxLJU/JvUA5rEVwNyc3d6njMy2kxgEFnigezu4bkr
         BSyFfLzYpkZJmABdYXurxF9WmwAod2FyAGuxfka4s+Q1lF0uVONxFIwNj2JwPUTaPQtK
         26yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622801; x=1769227601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nsoz6EWM7qD9/4dVYsGLR4Pmvjatyh5Pk5C2o5rnB9c=;
        b=POxbMowixqELU+7Xtn8IqT98r5cX5/ibJM/97eXstl5K5+kDmoUrCP8BEtXH3ITUqx
         L/jsk5QGK6edlRjSTKjcOtHHPuASEvrrogLXStM+noyOrVhj5Yu6vTTowP1RwndGYTXp
         13ySa6PvQJF+W0sCLJ2/BTFkn9Bnss8R/9H1jI6GymyUF5S6XroXFzKabOP+Uk2rgxWn
         xYahT7ppl3Y4qs8EjZC6CvG+bAVlcgdnm/XsDWj2gPHZ8pPnFexcHjac8mciuOiakPcv
         MICpEByX58J8dMdiFcb/yHL2nPCT6L6eF4kJErbWgnIfi4jVZGNLyB44UDjT6l7xUDVQ
         FY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVp9sY4D5PYn8ORyS4NeBSx5m7vPbH+zaABu+wkLPvpjsJ4GV0PVJzMlcnW9hySOg6R3jc6LGqLnB6hkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXAuwGQfP38+Mmpi3uaV20J5uJ4kxntXwY1mWp4RXElyuA5lo
	ARYny39ryoQoggb9gmBF2k6Z8uI8gSYL7PiX+eM59LqQDS9Khw35fqZz
X-Gm-Gg: AY/fxX4dBUZK6A/LewhXyAWFqUgV+PE6+FtjC1ECIxuUwRk04lLL6/9O5p9G0JxqmCc
	NiKiJ02IYDXwoKZuZVhRumi9P4at6npJy0f27rxmlSJXflbVVohORU0AyHuDXmLnQcnayWKBaZ0
	tUtZeC31Rma8ZLVt14wJHdtsAIpJBz4Fxn0VD+enmcfz2HpKhXdT0MkkkHWudIycVXkKp+kqKyv
	OhRWvjHYvdpCdjImMk3ifnEbRaNuNaPdIXlGe5Rwgw3MFY6OebEqPIa4vKaKd2CQ8Yq0i3sorvz
	kUrXbE8ubjZE0/sjsyap1qsmTenJHtV2iMVOyQHKAK9rdJsOZt7icFX248ERfDRwLzLbKHgGyG/
	7FkINfnfIYXZFAsMpwjjCxIrFQZquKPDgpOSXWcunpjoaNQGuOJV9R3JnFbs1vscWCtFiN/DaEi
	SfV0Kc7dFUgk3S3t2rSxEWPrLgjhXaDcSzkhO0jdr+W7hxTcyxMHNXIlzWDZPiht99imziSFGIn
	EQ=
X-Received: by 2002:a05:620a:470e:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8c6a6789933mr662358485a.59.1768622800896;
        Fri, 16 Jan 2026 20:06:40 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c5adbsm37174806d6.39.2026.01.16.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:40 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 1/5] dt-bindings: media: i2c: Add Sony IMX355
Date: Fri, 16 Jan 2026 23:06:53 -0500
Message-ID: <20260117040657.27043-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
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
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..0a3aa63b7b5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,105 @@
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
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.52.0

