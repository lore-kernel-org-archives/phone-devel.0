Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31159226CF6
	for <phone-devel@vger.kernel.org>; Sun,  1 Feb 2026 17:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769965688; cv=none; b=oriwvNAcoPoc/cjMWOzst30CZ32AukTBA9LmTuDBkgKSKF2SPl2dmPKLOqT6z8UIz0xJ2JqaJ5XnjK5iKYBJqBWcBTQ4yQViVyEf2AleWglemMi1TLDek/W2MfcIMx17ohAj3X8BZpPInUHXB5dSVOfZQoKVvuTcs8VB0OYe/nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769965688; c=relaxed/simple;
	bh=oZVM0jsRUZFOAD5WZ3E63gXjNmhECNXFhQvLake1fM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qimfApSAgZET3j2Y+S8gulKkDimTzUIV0dUpi0Y6ty/2ZxDe4eKlFmoCT9j0soRcOs8Qz6tSMnhwTp11JHNyfJcnTYstKTMpgUi3IFmmTzaAZWVWj/lHVku+JO+fs2Wqge1ay0/Oywt01sTLOciIOB9NkMsi8b1tVS+/pJVn970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W62HedvX; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W62HedvX"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-432d2670932so3415026f8f.2
        for <phone-devel@vger.kernel.org>; Sun, 01 Feb 2026 09:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769965685; x=1770570485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiP44f+/iNWWPqnIpAiWlM8Sc6MEYUGh+76c97VATbg=;
        b=W62HedvXZHq5oo2iN1BxGFnFHcGm9JNQJVgneXQhHTy6XE/G5HFHXZo4mhi0brhSo9
         N2WS0xx3e8+S3injvEHcDYHMMmZ4hpO7nr3KseH7BTUFgIZ6ON0/YSRzffX+EHDu+39H
         vVNAStUFGPiVRmfNcDFK7sOyYnN9DT/aPPUzNN94YyOpGFQkrSEk6kkPyexqQnmV0zPP
         SV/eMPUHJMvDFomQqkWcwDEE1zIKg+Qm7kmebjLJmq7RAnIWkQ9ilH313pKim6GtVe+x
         tvXcnkW8UxhZdaY3AGdg7UIGkzaVg+GwcmjyT9Poe05XoQITb/6MCQsO5SrI2fZKbt3f
         1+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965685; x=1770570485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiP44f+/iNWWPqnIpAiWlM8Sc6MEYUGh+76c97VATbg=;
        b=swx4CPietDFPpnD8rDzObJlaIDUI0nbsskJDtU8sf40NiBza8g2zNX3Lh1g9xMKVDC
         9xr7b/Gd1y1xctcaH4Wl8mNhemk6evVtNKeXmfM5HSGxBU109jLdsrSj84Epqeds/vs3
         AEjTbHsy4e2eOlkgKjQE+7GnLQ1Y3r4eQ5TLwQVR/DYCJvYWUG2XZfXoiqE9p0SD8vgT
         IH9D2PYvkmEgqJAocsY3Id0n3Lgo14u6Nz+d+iA5nuDFu9zL25KTLCI55+4kcEAdvTig
         /OvmRdvp57MozomuQbWCRgyryipLfBM0mUIm7+hNtFydHLnaK6YCs2o6oMu37PqyYNq1
         C38A==
X-Forwarded-Encrypted: i=1; AJvYcCXL3bF/siFhSearLOYQOD6CgZB8XIgileEA/wF5QnNniSwTIZvzJgm06D/w4Xb6nNw6tvbm9Eu7KWzkHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGubLXsYY0PO6PfRdTom/9JGXdDbk7ur33TwMML7OUwjJcOcl5
	Il12x6R9ri4sPIzyglQRr/Xu1TQ+dFv36pwOSg8U+klnPuZxWDHGSx8A
X-Gm-Gg: AZuq6aLYcXI0j/lp2QbR2VPYAY36t1Pt22Dm88LcKDbQ/YZ/3rU8xTO6A0zsbuuWGF3
	HK7U53xAGHbsOtaywtNu1AoH5joyoV0OLNkApyROSpte0aWunVRK04tBwKl47wfUJc6TOgP5SYT
	f0zgUDLwEnX37fHzCBfp3MuYcqbvuWmX1Tad02+ozpmXsaWThPhp/cmg60R6asNHN3SLta6vk5G
	zG77cU59ok5gLPrnotMT53eO6+atPs1mTyfXa1SL8AW/+jJLdMpCyQ4WLy93YrtDwpqlIrrrA1+
	GbI00spizOBygrsCBCaC0qdsu3V2HuwzDZm95Obrz4MifobF19qzaU4myYvULyFeF77w0k+1VhC
	2pLPlMd5xp/Bq8xdOKlSXH1c/rSwQMGi6gytfQr981dUtWMUyG8Dyu4yp+gLRz7QoVqnv6AN80A
	zPKZBDUDAePZQh5w==
X-Received: by 2002:adf:fa02:0:b0:436:348:9a7f with SMTP id ffacd0b85a97d-43603489b39mr2583532f8f.28.1769965685455;
        Sun, 01 Feb 2026 09:08:05 -0800 (PST)
Received: from [192.168.8.10] ([2a00:f502:260:44d4:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm40615460f8f.19.2026.02.01.09.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 09:08:05 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 01 Feb 2026 19:03:48 +0200
Subject: [PATCH 1/2] dt-bindings: Add binding document for cm36686
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-cm36686-v1-1-4949a2a9ba63@gmail.com>
References: <20260201-cm36686-v1-0-4949a2a9ba63@gmail.com>
In-Reply-To: <20260201-cm36686-v1-0-4949a2a9ba63@gmail.com>
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
 .../bindings/iio/light/capella,cm36686.yaml        | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/capella,cm36686.yaml b/Documentation/devicetree/bindings/iio/light/capella,cm36686.yaml
new file mode 100644
index 000000000000..5f0a585e3d87
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/capella,cm36686.yaml
@@ -0,0 +1,74 @@
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
+    enum:
+      - capella,cm36686
+      - capella,cm36672p
+
+  reg:
+    maxItems: 1
+    description:
+      I2C slave address of the device. Must be 0x60 for both cm36686
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
+  capella,proximity-led-current:
+    description:
+      Current for proximity IR LED (in uA)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [50, 75, 100, 120, 140, 160, 180, 200]
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
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
+        compatible = "capella,cm36686";
+        reg = <0x60>;
+
+        vdd-supply = <&pm8916_l8>;
+        vddio-supply = <&pm8916_l6>;
+        vled-supply = <&reg_prox_vled>;
+
+        interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+
+        proximity-near-level = <30>;
+        capella,proximity-led-current = <100>;
+      };
+    };

-- 
2.52.0

