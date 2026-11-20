Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160048;
	b=WNv6k8nUGWiPmUC4gt0gLIkjBbceC+oFjA+tGgxpx5gnN1j76tnqzbG7lnC8C3A1ONhR
	 6oZ2shpGFh+D0J2GcPDn50Lz9obXfe9avYPLxTdNdMI/3kSBTF9c++8s3D8mNhLAptz/O
	 IV7kWQEAYp7mc/1OQCAJDiCM51tkl86a7r1XFjAXj/FV3TIIc6vk8hHwLl+80z4J/1gCY
	 xW8KGgl5uzSXerlcEYj4FzLX+HorMKksb+SvH5I6WIVvoidXdz/XW4cIbHzISMJ5BPlDG
	 GQR7GJkw9EN/aULEf8v3OXmGBuU4nwidRybnWYydBJQXFs08kzf2fH464H/h9+socmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=CnoVlRu6Iwg7BYEHItfmL6lRp/0YQG4ekHPnqsgzh0k5R+HdYoBPDWK0N2rfzG6FN5UK
	 t1Qsd05kdL6CCOPPc8NrE8eJMOdMG7b19+cPK5+/q+vUTF4hDYwT0b6IIJ1IarPm+5qQD
	 EGW1S2GF5i0XycifKwR8kCYjVls4QoQBp/kP89kFO2YW2K1OBXPS4wpK9POA0nYJbaeJs
	 jH6lZXktfUIcMvLeD1CGAmB4XXU8lUGUXENLu9ZEO2NMVo3lfrqQz9hNZgbtqV1pQ93nZ
	 VSw1nxUXsuJ66Pdv59IjxCY/Zh5lswmgzaB8pbsLQklCP+E3YjiQfTtjNmN1SA3S4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QomUB9wk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E660A381A
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118E660A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QomUB9wk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so13345005e9.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160045; x=1795764845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=QomUB9wk5UINFnNmRIvHm/ArMbX6n/cgwMpT4/4Nyjr1QDC9P82L5pLn7KFoBaJ2S5
         MRNX+Q93EVcI6f7taqmmyDBlHekO8S7XYnZHlzpW1YjWWrUpQ68XElhy2WriGo0TvS2Q
         eAgH6Mhv2D/Zb+QnbtMnkIwaumlMpk4WiY4xbvX6bd0u/Gzq+Ps+Ntd2CANoqmt+k3UE
         Xl+qpKBEwHT65+WEXab9TmclpX+XkvTgg7i+al4ZPxzRqTlhqsmXHqAPh967SXNpmCo7
         6DfDg4dDd6a5690opLuGnSaxGtRaokNqbSVP093PUcQCdXJrl3k54pKCgW4v+blQZQd6
         vhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160045; x=1795764845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=NZUw8bP91IE1NayMnTAl04dzZ6TUVLIpc1K64OYiDg9HJnNkTrNDTgNw7p/WlOSfWI
         q2QS85O80oe9p2v4XTNHjE6KnK7v+3+0W3ovkuDKHBGYgrIjDbHYpNiqLWgywWNLncFl
         s4YBeX9hHpPaRD2BGkwLBEsUYGjsxTc3v6AvKyVg386qHGoRUsfovrC+TG9wRDcZVR+s
         KaMFjK5bWz/rxMA7gb6LxRz7yp1PdR/VEMP74HaDl8OQsubXzBTJ2dYWADozZ/lh6Xz9
         uq3LjGh7AyTZADrxPf+LGzrPENin8LzdjhRYTkIr4ce5EJ64jWWhP+hUSHnMzQgEfy8w
         cW/A==
X-Forwarded-Encrypted: i=1; AL+hErGAr/0VoSoKVhqpZbfATDwqs/hqOonM0EpY0bx/RhZvAKsL3fSMlJN6EOAzxOfIQptp5X2VzslBevDvgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dhoP+DXHXzTdMjc7PsNxjMM2wqq+B6zWAAn1renrABMTqHr6J
	WattgM3rk7iuqiYIIQ+LxH4m9ow6+a7KAntlgwms5nwtClb1AZj8BJJwB5opEWmjTsc=
X-Gm-Gg: AYBFou3K4N9/EVs+dRj56Uc+1n0y2VdnOQsnqmR4vgQG6BkeWCL051CGauh4vp/ggzu
	Qx6GJG4sLsNbPk+xwp+Mj2/h8XYQD9fuk2NefHsTmRgtPugIKtCbuhylqORrCYCKGi2pcj7gAWm
	atMeqwJ/PLs795XYGjvPqpvxVsGEL5V6UmTbkQnufbaD/KfE2MS3xrTIa4S5Lliyd1QkYJ8Ic1Z
	vJj+OXSNlrhI3DmDP0SD/RAxvd6UOEl0+eDrD4WKuMY8/Uwjh97uTuNfvDvCw2HBl47UKNtZhPd
	6tkkGGPmkdth1xM4OVGt4ceT3L7G1Jz8TvmH24hjoB/lWAqHNBXnZLEsAliWABzpnEuma5XhZgw
	nDNRp0wunxE5UB8WQGR/MbmkaZ7q3nV5l1G2qTxkb4fxC4SjBeQ/k6WdjypB3VZMOvTf78pEqaB
	MUswIOEz6ko3kezgF71ZYamues83apzcbaIdhdsEQUf9Nxt7BYGZwutd1zchTnJdgxwTXosnRGh
	XkJ299IZeBOecaIzoeuFpp4oi3dMNVoiLz9dKVHFZ+3beP8MkdhNt2VZYmIWDc0wIWM9BrwbY0o
	vabvvLZ3i1bqv7eGULVOFcHxbQqEFo16yH48FlvkU3y/h0EpvtbuG3ufKGXMFKhI4Yf6SSyIk5z
	jI2mMkBbRMyx2NCJQEbqp
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr44675865e9.12.1795160045388;
        Thu, 19 Nov 2026 23:34:05 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:05 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 08:33:53 +0100
Message-Id: <20261120073358.10267-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

Document the Silicon Works SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c5ec3bf4e545b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW42902 is an I2C capacitive touchscreen controller used on the
+  LG V60 (timelm).
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low hardware reset
+
+  vcl-supply:
+    description: 3.3 V power supply
+
+  vdd-supply:
+    description: 1.8 V power supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-supply
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "lg,sw42902";
+            reg = <0x48>;
+
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-supply = <&reg_ts_vcl>;
+            vdd-supply = <&reg_ts_vdd>;
+
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 28e4aac18d44a..a29019d984393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

