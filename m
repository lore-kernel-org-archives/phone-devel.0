Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AAC246335
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 00:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288057; cv=none; b=mUhkFPhmePH2tOnUEQ3PRhi69trG2KIoaBc22x+W9Q6fMIFibZNBKckOmaJ9/U3j3yrycSPBvstRLIAabuiPUJkhFsLc2OuOQywQqDNYSM0/OhcHJg3cisz9P0qxgsKljqjsrL9vtS69QshL2OUIV1vSTvgXP7noTIHN5LMwakE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288057; c=relaxed/simple;
	bh=6mwOA0dPC+Xr0uI2n1ZFZV+bR933rcuFFj/RWST+Emg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roXCjuJING/60gFkzfcplSno4/Yvda6O6aG8h3boWWZcs+zdK6BA5Zl8ARHDXteoii24Iku9aAiHA8olFo8HQGM2UY4Wa4AzwbvK1+Ciu9h1Fd1WdeAaw/t5OUJfw/sMJbVIhGyUV54ZWZ5Bflxkw0f8/nEo3sFwTpCBvEYmAnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIwcOA0v; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIwcOA0v"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-89549b2f538so95478926d6.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 16:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288055; x=1771892855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=hIwcOA0vhlxdqKGhOGh2qrHQripBYwLSrYHNbf9ZydQbeDCTHsqwN/VRS6emx1evOJ
         xPcjEpp1d/jwxGYXD+RJVdGcN+AZsbEDWq0zSznyZP/ESklh/RANSPyWYcRkGKwrqv6J
         ZvP23HtV1ueDzMcQomoQKCMO5cH5AdzxJNFmfljercWGCSuE5yVbAwreohsK1qXFw7F5
         kdI80tuRVV5xLn/LqVF+k43w9C/R6ZC9uoQgUKBTYMizR0XapMPZqaVTJoxwPn6STrZI
         XmZxRSTbMO8vB8YK4jstkw9e2IQVmaGp1IqFSZfXsbiOa+7Fcedi92TR2S01GzJCX0pl
         rDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288055; x=1771892855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=TQ4QmtDpUYeuraFM9F/c6+pA93bXF5ErmFrv9M3VyIhzflpnX5fgRT6tv+0CwlqBW8
         nFazQVOFSDbu3B63p7wqtsmcjwuu2mifgNJmseJ1Y90pE0S+c9g/j0PC4w9uDGV36oN2
         IzRqaWTZ9qr5LSJfgDcXT802grS2iKjSGKSK4xmuuIWKzFYYK6LAjB84kZs2Jo82H7+v
         GuEkIW4s/6V/b6u3F9DK54lksBSeNUyWqcCdhYqfLEBOxMCdH4zwHwNkkbOXjeQmoOUF
         u2njOxqW/zE3C4bwcm877be7yXXJgbXlsQp3UwNiLEYFj8tL7gbekUXuWS5kv2Ey2xGh
         vJYw==
X-Forwarded-Encrypted: i=1; AJvYcCVw4G0LnNoz0lnK5gcDiLOfjzneNec2cKTK4AtJUMfb/09fkZ0ZPBkJHEHSXYIoSl7GKVG3Uj9HVw73Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMcOhhRqf9ibIeExSbsO8yp3xRbUEwxI8oCX6jC+UHtj0lX73T
	Cfywq+0bnUEjjFnFOyesa2kr3IVs/RrSmfYj1VH7spW82U1xWqCt551s
X-Gm-Gg: AZuq6aI89H+VFYoQDVkPRlc+yCCkVmpn8p461vLfsr3d9r1WoqwWDTE98WXq+/HC1E5
	4GwFj8LhRgpg+09pLVusCJSM3N0AYY4LGGgMyjrkS1RVvAL8kJQzZJjlzBu6ndSX8hY6LExME28
	7b/HfpCVSlvvNjgU7RiNMAycpa2wGtQmMw+KbkQu4i9J7rAF7zSA05+Uvzn2VI2JYvwy8S60ohX
	iv+4jbLesYRYTar/DbghjNpr7JL7naPsJH014j8wu7657xHKTG1dVKKGdAgMb6uTG4wSk4QCRRj
	pbWVrZfpOGnDIDGQisVR/fSnRYmxjFIMumrPKW38R/nWZ2gUUlKfLjCKq9twPti956SdGjSgwFO
	kOcJPTQc6jzMWtGE+prsC1pETJa3OjXq2s2eiJoV6XJXaYbZk9Jr7/E0qyYiZfcMXuWMSUXAj0s
	wabeaiYX+OZQRYcumbJoCmHo5XttkQZw==
X-Received: by 2002:a05:6214:2685:b0:888:4930:797e with SMTP id 6a1803df08f44-897404df84cmr159834696d6.70.1771288055204;
        Mon, 16 Feb 2026 16:27:35 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc7f540sm146907606d6.5.2026.02.16.16.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:34 -0800 (PST)
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
Subject: [PATCH v9 2/7] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon, 16 Feb 2026 19:27:33 -0500
Message-ID: <20260217002738.133534-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
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

