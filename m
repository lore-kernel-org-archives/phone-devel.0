Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107271;
	b=FR2SxjjPS0zo7UbC6mCYpChZX29jXQ+29ublM1Kf5UMYr0GMwhCAOxzPRCDx1TQJBPiF
	 Z0oHz/iRFMk5RN3P+4PjfAQ3h2nh0aBuYrg/AzCEYpfQb7fBig9XyTkx2MAPSRZ3rxNJq
	 1j6kED8qYhszPBAK6gScqWeJY8wnQj3pZxcxaVWdLoKS6JildPeIuid58Yhp/JhWT1ypq
	 vSFRUxqFVA2tqTc77+grQvATDAps9ABRBzxeuNjQAtNM24Xpm5zpIXVWPJumMtyTHn4sa
	 rX1T0SeAtinqcJndB7baSiYMly5gVMDtwtByKzltJYdzLf2rZH4QPnesd/nHOfqOMdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=OMrjev2sNVojmKkoqmxd7BCKMAWYFbPvp6Gmr8p/9teyQTkP+F3U8+InGqM+ryefR4yH
	 UHcmzee9e2vaz5Di6s5d2kBC4/mQQxhRDhbsEcfPUtLP/EKcU+pkgdp0ak02Ls41eomo+
	 ogc7fTbmLCTmljxOFwWk/TJH25+Z6T7hevdmi2nz7C5H689ZcRPpbPwCXES+rS18EfFZY
	 IcFmHJDH0ozWZLSsbyjbXykXzYeEBY3LFX/gVx0BP4vhui5MGOlAJvnhmVh79g6cUVM6s
	 D38vmY+X7wingZTz02OPoQ62+uDoZnRQC5izxBRoasfTO3cbQ3QSCWWrXHWBSJFMPgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BC60A381C
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F5BC60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so18978505e9.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107269; x=1795712069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=R+5DdiOMtL80c9mcJ5/KFHY0ZO+dJukfZdTMC2UzdCESjd8f1Ba/Hc3GxX3xNxmVsL
         ZVbM7daQY/whHTYRSQ44gXKI/K8p7wFjj5fzydgXq9FHdiDNMf7UHIaSB1XvXWGhnv/m
         Yc4iPjIVuZr6a8fd6I3YnVVNGO2oJBhwb6XMEX0OO5H8Bw0x0bNj6qmEmnoPXB14KLag
         DUP+9XNzj+038+vk+FXla4L5LSkEkaMl22I0svP6z6myJoGAFCVFnkZmhZGFacxMxRUO
         cucQKdZtIa4k1xngqIh6GWtKQcDtwwoxmzOtybDXsTvU/2S1bsaJNw20j4Wh0K7gRLSn
         zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107269; x=1795712069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=o4SEfbr7/62W9Bm8Xlu7rj7qHI3rgExiO+0KG83TPec/u4eBJWcs/qScrBwTHadryI
         KsNcvucHvnL3WHG4Nr+KUjH4AfYgruE+DjYkiLSgUultq5o7Kyoj1BdJjpLtOV/TfoDb
         YyuHGM2EG/p77j4CjFT8Thf+NvrcS6FyBaqbfgolS3Gs4d7xt0HgNB5M4Mz0I40tyjjX
         BCOkSzb0dfH1C7ZGvn3asWlE7lY2R7Dy76AOoql7nBhPdTZaZBIaPF+FhW1GrL96GEk4
         LIiSYHQ4gnxoFZ9dvT7igyfWfH76hDJ6j/9yWflG6XZXCLG6BfurNPaBvkxCAQJWsxkt
         b1mQ==
X-Forwarded-Encrypted: i=1; AL+hErHC1Vzp4bJiFJEVp2AgTSnsWeDbAo7MIMNLkThq60SVzZQLZTeDC6myMTTS6ivPi6XZHx0310vsWQxCxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9znu+lCwrwbY5aqcYxJ6eW7+VQwayV9tNrKV0s/6cOC//pMCeH
	MdUYDo/wQ+3SECtR0PD+KH63jjGLtIMC8rRDHy4z/MsgarCxcL6eKv3F
X-Gm-Gg: AYBFou1RVovod19zZR+n39mFT1zb9ohAQpNrTKPZluXDJaazlPGp3atFRBsaa2d5RYy
	dC7MJiXmkpPd0cvd0andfANubA10e3I/scD/OYkfZPIPz1B6nPpNI6AGzQJEZJGs2wH5nurpbWv
	J3bosZBDjbxoJQIpMfjmZHrFu4dlZ+Q6UP1S2zCYN0JxfeLX21AaeXGejVq4UQGI3LHqyDslR5R
	RU/RuwmgEQiL0fuv7uHb2xbfl+FxEfxnlawqWW4fGCVqr7y64kk4cARhtPw87proRJhx+j1Qffk
	V4wPwhJr5QRD8O9jkd/KleDQOXYr7nSyW6ydjRzpLCBvHgIAxKaKk545oxHbAXVkgLiBoYfgsSt
	3XLCAUR4dSvCTIzH9sCIG2w/MeKqtxKdidS0bkHlxg2undHQAAWOF499apD8KKMeei79x0yT8xG
	zxnt3GHes5/iOJN/0zdb6/cbVyZuIygXsbnZfA2O3wanD2ULDTG5LuJzoXWAU9epEWPEJeG4gKr
	ihnvnrNYK7RpHx+aW0jAc3W+FphGiyfOF6JZJRO9+MaMqBJh0FL/YPsYrT7z4C+RM+HH15iew4E
	PcOkanyZCuL8KHscT7AOQsKSGct4P8WBpAlYYjl0T1lYKY+fvCMDm71wxpibrOnAOFH3tnVxEgM
	=
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr1542285e9.11.1795107268658;
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Thu, 19 Nov 2026 17:54:15 +0100
Message-Id: <20261119165420.24466-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

