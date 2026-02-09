Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2339C244665
	for <phone-devel@vger.kernel.org>; Mon,  9 Feb 2026 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647037; cv=none; b=HTfBMRFkFrj4cM1QlrTf8Aryg1WXYFpSIs3DDdzDM6IpmQVR0WiQckaoKCmLLqZFhiLXyn8afQ38rNZ7f7Iu7cHDd0NHTcG0yVgAdZ2v6eW+hWsuFy8PMloOz36mUWO+FuyM3xJn6Aog/creD2HCCzKABfoWUJ8wTizSAQCHQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647037; c=relaxed/simple;
	bh=zT7ghM6hNRSAnvMOdpsrrBvdH8nHGRJGNrKkXNiW0lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rmy7Rf6lwZNCggjNMdS18lp/med0COXRE8P7+LFaC0f1lUI/OeQdwfqI8nPFPN6DE+/GQcCsgAaXHudkMQeK0G9J0Llurshz5odKLDDBRcbhvFJdHDZ+7wkHcuPajWGiS4+O7J6T1RFkLJZ+b8Mdd/gbI3MRXHUvNC04PzjIYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEVuPakh; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEVuPakh"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7963b25e0ffso12017077b3.0
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770647036; x=1771251836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rpT//HF8ja4RuclSr7p+NXdCcERtIsyjZBNMoKdEQ4=;
        b=WEVuPakh0TiPnXtAnhmQH+8guK00txy7HX/1LPTC6XYB3cfkPY9qOPCeDlI8yt/4Cf
         QytUrN55dYIf+KCd0rzl0a+rgmC1FQP2gJg9oAoTC5+cZrMz77Zodl1zcX8Oz+tvq/lf
         coYDu6LC2n95tdEFQP2zHt6IRtjA6lPx+8D7q+H0AyE7E1YX+Dzc1UE/A3Kvl7P53QZp
         1aHe1jvyxWd8Ry+EjTa5O3h0uG/HzZkjaL/SbZqv34DxUbtA6rYxW2+CQ2pStSfR2igz
         TYM+TAs02nXEecEnIU1vORf4LX2eoTGs7nB6bp+VvHBRWDS7Cl/U+sk20c8bK7qei13E
         Xv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647036; x=1771251836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rpT//HF8ja4RuclSr7p+NXdCcERtIsyjZBNMoKdEQ4=;
        b=j0ctTgELm3vRjhHysYVFDDGaLm1VRKbcbuEUBn737ZSUik17UbDIOTOv8roMpWPnJ3
         bGRtRNohmEKtgyv9zFR6r6wiLCr1Hz1FaUwuKLpctl5Remf3PVGlpe9O3gkM6xV5vmzg
         IL+kjrwFvYom6HflXqyRMywKs62ebF8hNN9F52oh5SQtafzbAXLYyUEqdjdDJA5bF9oV
         02voQgcviM4X8ZGwbatHy2vcBxFmJSXUfPaYHgxtythhExUiE41Os50x+21jpqn305+e
         dWTaJEem8zZOniO82KBFz6o3XsD2RWFuqD9DOFHwOaiSCQth3i/0uJpPwyMGfVQGdI4K
         tIWw==
X-Forwarded-Encrypted: i=1; AJvYcCU6/LVBkd9iLgU6rbC/mmBH4uHZ5N1aORZG9LfNkixUmEtKBrCzQr6T/zilU6gNjH4W7tZsicglgSeQUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN+gmQdSXWjaIK0EoACJ2fPjxxKE+UkeM3sTgA1HNoxcFlE+PH
	1Xq2KBu5T2S5Ff0seBIwe9Dpp2IwlX71803lwyUCJROxXrdtJYLdHj1e
X-Gm-Gg: AZuq6aIWYEnOvdmiz0e7FYE58/Wr/kZ4ZQwY2YpRnDxZB/p7QSrmoZ8dUrU7V1dVjSd
	ECarMVPYq16NbwE0iWlBN/bhAAP3wOzv/17aNfiiXMuIoonIvRixM5397qYblpBEmW4tN8I6dLg
	oJdE0f2WzfRF67bliip+B3UPkkcN7J+hsX5NreoA9TefGeWuoWL8Nz5bWGvEElSx0zQaXM6NukK
	g0tskzKTJpHyrtSrwYVXgGavInP8rrkPRsDMAsc+0tIiDHX2znuCzErq+JaILAAlBAq2XMZ5r7U
	gLEG5koRF2LoBb8gBbdmG44kn7XOqOnuZ4xhzkwAJwCfISICk4bU3xrnWkhJTXy626J0C/XUODV
	+2twlkZ86oGyq35Kf+kVqNPmIam0mnZmSA3KxudqJxXE4ujkGjpzubhkHLI4f4Xj6uBDziMXXiN
	uUgOL9X9kLrEx6ax78vox3lf/f
X-Received: by 2002:a05:690c:c4fa:b0:796:2bd2:4b23 with SMTP id 00721157ae682-7962bd25c2emr80535017b3.3.1770647036142;
        Mon, 09 Feb 2026 06:23:56 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a0467easm92497947b3.13.2026.02.09.06.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:23:55 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 09 Feb 2026 16:23:41 +0200
Subject: [PATCH v2 1/2] dt-bindings: Add binding document for cm36686
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-cm36686-v2-1-a48126d2b124@gmail.com>
References: <20260209-cm36686-v2-0-a48126d2b124@gmail.com>
In-Reply-To: <20260209-cm36686-v2-0-a48126d2b124@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

Document the Capella cm36686 ambient light and proximity sensor devicetree
bindings.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/iio/light/capella,cm36686.yaml        | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/capella,cm36686.yaml b/Documentation/devicetree/bindings/iio/light/capella,cm36686.yaml
new file mode 100644
index 000000000000..0e54b681e197
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/capella,cm36686.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/light/capella,cm36686.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Capella cm36686 I2C Ambient Light and Proximity sensor
+
+maintainers:
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: capella,cm36672p
+      - items:
+          - const: capella,cm36686
+          - const: capella,cm36672p
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device. Must be 0x60 for both cm36686
+      and cm36672p sensors.
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Regulator that provides power to the sensor.
+
+  vddio-supply:
+    description:
+      Regulator used to power IO and I2C bus.
+
+  vled-supply:
+    description:
+      Regulator used to power proximity LED
+
+  proximity-near-level: true
+
+  capella,proximity-led-current-microamp:
+    description:
+      Current for proximity IR LED
+    enum: [50000, 75000, 100000, 120000, 140000, 160000, 180000, 200000]
+    default: 50000
+
+  capella,glass-factor:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Lux amplification factor to account for packaging - a number by which a
+      lux reading is multiplied.
+    default: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - capella,cm36672p
+    then:
+      properties:
+        capella,glass-factor: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vddio-supply
+  - vled-supply
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      light-sensor@60 {
+        compatible = "capella,cm36686", "capella,cm36672p";
+        reg = <0x60>;
+
+        vdd-supply = <&pm8916_l8>;
+        vddio-supply = <&pm8916_l6>;
+        vled-supply = <&reg_prox_vled>;
+
+        interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+
+        proximity-near-level = <30>;
+
+        capella,glass-factor = <16>;
+        capella,proximity-led-current-microamp = <100000>;
+      };
+    };

-- 
2.53.0

