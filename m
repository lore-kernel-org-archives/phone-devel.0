Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190099;
	b=3ZZ7Pe2THQkI9BWdUg3PeCZ5BQqtnd//nFF8rAp21d8Tq5MKRnsBgYK1nBitzX3w67ky
	 LerbwiTk7xm/GOFHZY4SvPxIV89jDrFiDOvVitL/ZBKuF9EublVvkb+9l3dYtal4mBY3j
	 UhfFQQH24XNmgA8M/Ha2Xk7kSPlPzmDwyC+YXHN3UgscL5PUsy0AT/pG/ONu2FMmqgK7k
	 9HxRFXV1yh2W8uxHM4feUqR3gSMzvfOTXsfxuT0hZl+Vk2/UABp3Xg+bzGYTKGFUrpmW4
	 uRjZWLbDZqJHXIodUW+jT8iSi8viSaPUICbwDzBtTofmZumAYDNqRRBQrLrz6K3EXHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
	b=hG3EMYn6cueca8SBifCh9jTpUPxOvL5HBBpc2qRmxt8TX0IXM5aHFxAsWhEcFWec8Hbx
	 JDf9M1zp7Kh6aLwyxW2H3wcZZSmeZBdi8nCUPX8pzOp+duak92df/mRrGTLAgB19/agh0
	 +df2Txw6L75QZFqvn5iAHHS8o/b9b3kknIkq4a0HdsDRMq8/vN2EBw5e7CwoR8r0tsCWg
	 rT8K69/r5aRPplTUYc3uxo0quyhcCwU56K44AKjW2NLrm88fEU9IJiTZDT1+ipIRVDXq6
	 W7u0ptDKgp3dHLvTU7IsNoqkDMMVYVxzJVl8kLNIIFbTbGvNLW9cpQH5KaZ07tpz8ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdbGCdi3;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CEA60A2606
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4CEA60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdbGCdi3
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9837805e9.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190097; x=1795794897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=DdbGCdi3zWUq8+Om3PTaMnnbscPxsQqPvPYUOXE1YR9UcMj0bQU3k1pJDBNsDARMdN
         bhlGH/GAk9g1AvdGCKl2wiWH5geedfQVoBi1cln4xYh4ImIpkTMLNDAUosgSqZu0T6w8
         uV7RwptFmWiOV7fsrH/8w01xPoyxORKxccJrUuCwecNgVZE/JzofLweL23oZYcSpSAw3
         aXY+A+e/bLWSip95Y2beej2em8WKB74lKlVAAhKuDy9834DVeCmi6Ssu+wWuzoHK6dRV
         eBo88Zfg6SRLgpr+OIpdxVXGkb4nVynqxJym2fjc7ti3dRQMeBNqS9SA1x7Yp9RjWK6K
         71IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190097; x=1795794897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=yz3t+dNMqkW0tfqc79a33BzyjkYfEzosLAlm1VzzsjcbU0Sa6tU5siGtTwypboW7Ef
         kD35WXzeqypdFWqE3Tsm8PekEN1BmCgHOcO+NhJLke4RefkI6iaY9ZK992E0qkEjaF8D
         oMrQynyTGQ/GLX6LwzrmC+dhf8k/ssS60sOV8/uw1KK2RO4EmW/BpC2wOvl+Et5c0LiP
         9DLW0O4bWxF7yL0076BvX9AjN5y22lD6ZZPiStsR4/zTPlv8Ft0nfa7omIjs9HEl0kHS
         +bVwhOWX5Q4Jk7OTG+NfWzaO6LGtdhRHDe74YAaJk1idsDz3NBkBm+omHY1/mAsqVNHb
         JizQ==
X-Forwarded-Encrypted: i=1; AL+hErEt3zKaXK6gBV4sFz0wUMwJRhjgeQaqnMRo6MV39oyceyCsXzcW1PaDXOyPBTs4wpOtvteVzrj98qc5pA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DoQ3trgs4W01oP4McdtF1Z+kz71cIUmCBMOVSccggz0oS+MTn
	XpYY1Is82VHXN8nGhpuzLTYNAPwLDWQXVeMhlz83wn1QS0+EGzkladuU
X-Gm-Gg: AYBFou2MpvhTKPD2j4LfUxomXwvyfla8aaw7/Hj0xdVxvO7gMKXIrmp4kYZztEi5tD1
	/o7DM7DVkoWW7L78hIUpazptRgWCFa3r4LJmQ6Uc6B00FB+dEeVvZanphDUb53xQ9CH6iO4dYXc
	GlT+7lVk248rxT6GNMCRd+QQ99hwc+QYe3I3POD+AnrXiXdog/rI7PgyfRJjy4ZcOcbfW85oYKs
	NL7X2+GEZ7MuGbwE24YTTAV0Y6NeO7vxf0W5hpMM4d7MDs1omM2GGc+t8XyMDxoo1vlV2l2X1zl
	dbX0wFTrUp4lkneaGafFxV30HQrCzs86QcvmHnco359A+BhiIaWtNw4LwhJtbYDwAfdfog85xvM
	bBa8dMd7Ltxhoac+qQ/A5N2h+5EcMAg7hVLTvKl+AsTtGrImfP4MH8dGgn8so1bmv2qTkP2Ahau
	QK76B12glcn2vBIdQh0mdFFUTevH+FzCSRZf/BLYfpTgGzVZMJhkpSGc9MefR1LLr+6X++Tv/Ew
	nn1Vbpiq64n2Ipwh59M5z0QgGg0vzQEekAh1A5NnLHgHorWUHW/0YRBmiuDigjasKHh027xTf0N
	vBqP+k4JGl3hncv02g5f9IF7B4F8y3Hms0fQoJhUrWbEUcIDUPkqyG9djrFzoGdXCQazkIxigcQ
	=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr86535245e9.30.1795190097249;
        Fri, 20 Nov 2026 07:54:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:56 -0800 (PST)
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
Subject: [PATCH v5 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 16:54:44 +0100
Message-Id: <20261120155450.7719-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..2d6d9b1500faf
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
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
+            interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
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

