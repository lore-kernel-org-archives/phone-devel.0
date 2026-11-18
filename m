Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003643;
	b=31C3UEOIxGHjGn+8zuODdwuKATAgcLHxV5k+SCFVrX5GHGyWca2vewp7rw8M8r4eTQAz
	 gXp7c5jtD4qG0m1pYkPX5K+nv2XTapVtCrMf7xnOMZnyu8l91+ABLcgj+TujiExUCNQ60
	 uHqnABVwpBFiZHkdZVpMhKwPQwQOd60BR9EEseD5zg63ZgprifxVMqt4gwSJjfKOLjUP+
	 7J6nF7bwiIHzja7dJfRoEsbGHYnuM7ql+DE8umEP7Cqqkr5E8y+g1u2EAUvBW1zo2C6id
	 LNvcQWULxtbSzxkuY+547/aTpjNIyjfdQwcckATAz3N37HzUxiKhKKFFL1gaCzIul9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=wfnMd6psFOzeK00UrGQYHgx7qAO46R3kW+/JHAfL4fW2ijjRnJqAgMn9tSYTr8ZL7G4q
	 JCklrIvTxNuRoceUn43GbDtbKoJ2yij3f3wUIkhHnNOm5kkMPJjE8FuBElXw4u3JG9yZS
	 QCA2xQ9WMlYaCfe+yYqRckgWzxb0Kh6eUVYGkHdCOXbr32BU5xGxz2dWAZC0PVXnZDR9h
	 Kdlc11BJPQIIIvwKx7+LiuUgRUZbyCgUCdyyNZHD/9KabJemNLHmcE5OTEb43pnZ6jItq
	 Evv8yeJQ2kevIdgV9ZaRXbPVjjr1NLg1kI3zAmQccFkfSHmHcpE6byDc6WS1m3Cf4IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15460A3812
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C15460A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso709063f8f.3
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003642; x=1795608442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=V3BerShjEcnO6pe46yCvBfsF74qmcI5GXv6i5t2GXlYnum36x79Gj44I4wU+QwRo98
         G31Ub/yYW3mQOO7WABbSJOLZszoXUT+NI7FoVgT0Qdt3ukQWC9WbBYmhcmNjnLnHkTyG
         3kV3336CjyZZdZ+S/1EUWo7anKHT4hqcaxtwJTnrYToIb/suWExTnoaPjWOQ1tQqzILm
         o0NLa767nkp1DqgMu102X4ZZ+YyfcLEZ4QAAvT0TndB3jh02IY4IOtFhPGcHtf/Xj2+q
         dsQXY+OeOTuT+Mz9xF0Hbnko+PpTAr/UeetYn4Vt3fjLBSZ132sCBsWIRST0vkJioAW2
         R7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003642; x=1795608442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=Ni3IL4Ezmsz8cXJvOpe6y9wPqohS20tKr04TEfVw+6HAJc+KF9nKJhEnDFcM0uP+XV
         Est3kXABzYd9KqCQO5bUSLhkoCyQ9pzniOZ0jkN5FxW+PJN19dl+FGOukalKI+P5y2u/
         DX/a3ZZ3+RyVNa4wR1Ev2bfkYAB6R9DoMs+Gw0BrbHP4hdZ1Wtwd1n7JytxLy8WU1yqr
         GmHuG0uPk1HRn5S53fiSNulFzMLcNoBag5QKKDGMTkCMEhPOIV3tpDQinUCLmp/9tRKL
         Tu0/bN3Zyht5is5xV05/fNnVHueBJYyDF82/Vm4dS0m9GB1WXDLqoESRZZ5FhzFt7ZN0
         61Og==
X-Forwarded-Encrypted: i=1; AL+hErFM1k/imgrlP3ksMIz9+eBZ7nAtUt46RSl1hAc5u2IpTU0ZwWQXrldFAGTVPyRRAUpmcsEKtvh0/5Db6w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+rYK23xxb/1BwHpmRDv+sDS1sfDuaSVYr41VWimq8gXYJwWj5i
	rZYinUSUZDIXAj2Kk13o8SU/s549ll89Ke/iBGqLRiorAun+FdODTWdQgDx1R3azcDrjvuUw
X-Gm-Gg: AZFdTZcbg1hkeUXoYbDeDwFQpgHxh4VOaouxAa4m8JZW48lyF5lMrbWvzJ+2EsbJ9VI
	2zYlDERHuoRz8//d5W4zwFsJaF29BlxvGTuNkVwllrTh+V2y43jPAizPsh0iikz7W5Au0Ilh/XT
	cWgZ351znaA9SDN78/ANKJeQSnaz6f69ceMXzGGNlVVwUdNsYoCw43pQz5+qxnh8IgPiXSdEqyJ
	Tl3tC0gRcJUOlBn85ffK1Q9/VRpmtESN5zmcGsqjx1yBfw2mCMABDopcjcGaBTYc1XMFf5Fz1T3
	dfezGVkSQtFYmb2+5JYP1i135gpnkclY3hgx5ScnecsdGaz+I1xyStan0N6RUHwj3hJuxl2S+LN
	uVrOAZxgvbNxWSuv4vUjY+Z+2CPdLGeElRqc6pthLwO1RPeJI/WLy4SDu1sm6FuuE6uAv95q/em
	nN3QiLj+Ay71IrpZxH5/xvOWdsG7aUuZNDcM7lCBKLqlq4f0gGNJOVfPYe4IifQYvPLsIHdF4C9
	Qy1WHAD8BpRuM1jGMotgX2C9dM7Ey3pZM+JxDJ7+Jz9GfktBAjRClWAXb5tbyzByQq95ucUJbcL
	x18GTElCUwbko9EmSqIVKV0i5vKpzlLN/W1KB6YbzQHPhBCoKlzZHJG3n75iL+1ii9pbtHJRCYM
	=
X-Received: by 2002:a05:6000:46c7:b0:49c:192f:cf1e with SMTP id ffacd0b85a97d-4a63b13855amr3763095f8f.32.1795003641960;
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
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
Subject: [PATCH v2 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Wed, 18 Nov 2026 13:07:09 +0100
Message-Id: <20261118120714.31505-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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

