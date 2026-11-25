Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577295;
	b=e/N47zfRDBMOxrcimc0YjYqhN9IWZ7neCUxU5HVhx/rc9F9gr2ckAeMseCY9h410L3sX
	 BomgIpjzb21DNBw9du1Rdwguz2NPIhL3q80MgAFEZX3Z2Z02T3HuTpvluu3z+xQTeB8x7
	 tP3wgtgAgDrkDqa+7Wnw1riexjvTClGKniICA+ERSmkjNg/+SLEz7JyvX+9QarXjrj17U
	 oWdmEzWWNLVgg9VBFIEqI9I6uZQuSBLIT+OQ68/qFEVBHVhOXFmYiSPHjsuqG10Bk9Y0c
	 ICg8BgnGGlQt5Q6SqPkL4NqcsbjNSrnbJ6ASSN1eA7I+/1PYMcorHGWIwHjNsOOC90g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
	b=yN0G4oWjwn1M4ecGDigf/s3jUUdlycsV98Y0x96xq6NB4HqlzEjsnSzQKafQeOFc+DoN
	 ua6n8v0Q4ICeimbNBJkAgQfVmScmTG44KQLtwhcY+98C10nYZQkOdNoPoB07OEb5pZ8T9
	 hvlNtBeBZH/QxMOgI3WTpmtkwSiZa8DPwEXyJA09sAZFxhoqq7YmZByc118crQYOzDLZ9
	 /XHsRdEdpQSOlOlB0b5s4lhzS1XWjChHdzWbP6J3Zrwivx7ZNC4DiC4EpTsqzpDkvW/90
	 J5y8cfofRUdMHSqCUdhem75CBU5ReBS/UoTbeUwMCAu/vhrUJrTKHy/9XaO2FBBZu/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372760A2600
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D372760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2986609f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577293; x=1796182093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=Pva+qH5LwkfRhY/HwbuWQ54KdZoI9qwiM2ANNoQjop+Al1lt+Gs2GjJHLVhyECm8Z1
         2CChIklgFlF83RjXCGNzKTVjFdbIyeakGRqfM7vpIyAAloWFT6JAbfBg9/toCxKyOlJd
         xe0Y9nRMliTY7LRnF7+Xl+8iFb1uRZCZFwR3KGlkBm34l64abBXecw4P5+rjfmTV2VXH
         S8WeMlhR7JMXkJYiJrNVOx6dvwMRwMhrxKlkUGvXrWB8DEsZczOtWRAzorpvWKnS3P0v
         aEtnkYsRgeclvDywKMKzvJBSAM0phfesoeu8/WVlmJsi2EO9R+BLhgV4C0eCkJJdYtuJ
         YWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577293; x=1796182093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=Rtx4wJk9KOhuh1Vimd2EAcHo6Aq2PIKqlIaHjDmMzqEwt4iF+UDldDCxKA2o6MNE8u
         FTm+Xqb57eYYqesl4mZtohnA9qPnVxyun2kAkxZzUbrtRKCj+1KaI9l7b3OwSMUFgbjh
         S/4CWi1yQEulG2NAt8mpIOmaRS2yD/8a9grfw4P+jysGUPS2I/Rog1pywFAyi4eXAn2+
         ZYWnbQioHdcCMgquoFXEaQB9JvcE0X2zC80x8HyTUgfDDttDjFGcOnj4Xn+KFE3B6/25
         u0Rmh6czTPibkXo/YAOXN31QHXY+RSSO7iVO46in4KSnnNkPvNCfHTiUcjX4hdk9psIY
         a40g==
X-Forwarded-Encrypted: i=1; AL+hErF5nVLebRR8kB31qkz8r+BsWCTsF/XfgJBl+h5yDDR3v2zMSK9oLYOuuBJDrCgCJBWbKkQ2NwC+ofbUAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JZaqbJLNZTRQavAbOpT4xINakz1XJYmKsS2SkcFaPZNaTIPxt
	Y3IltHNK7GH/9Yo00wWhw0gkc9FtFxzODXlQKcKql+VaHP8ayw3RcJTb
X-Gm-Gg: AZFdTZdeLdK1rvqqBaoZihV5LZmbp53EbArcAqeD7LBqvEUk8EJCuRfCjV0Xm8GiuQ3
	UBIUmGu2xyI7kK2Y95vaAC60r+E0iqpSwwdi7cJGfa8TMfpw6CXzDxqGf32feZQx5z/urp0ZbPu
	V9c4VLHKUk936JeoHKwazrnWHgWyOxhw0z/tjVZjXtlDsbzT2+28C0+CvxeDEMWr/JvdAM9501b
	8K93WYAl9qqoTZvIwdySK/zvoRWO0fc1xRQQpT3McNxpfMnd+howkf/gLPeQfaofcezpBwk13Np
	woQvUDnWYurRU7pEidvpqJ91APuEmBv+RCi1O5t3I0PbUaC5aQ3+hQdzAA/WX7vzKBkSTzjPP48
	wINVc4I9SFG5j7ttMlSPo7NmYWi4+o18aybV9rHk5BPH08HpBKWZlxIPbCJQKapsq+cqgzvI+Kv
	X5Tm6KGMBpDBBbYQcE2zhrydgwnyIq1hY+HQf7CtUUsjxXiQJVk5aOqSJALqfwveMCNMpry2e2T
	3jYlpHxEE6xhTf/o3DCS3L29quQlyjdf7dHgNYK+nKkN6qkBdfUhB7BzMmU+qOp8PvGxSbiSaIt
	E33AS2F1NY93S5TlQctPKcP2M3MsrkXHCMJ/b4q4poxm2gZjv+zToiQnK7wyyryfEIvKBD3rAGj
	ayWdtLfT7wUiH6s9LoElDfvtNPDNVBLU=
X-Received: by 2002:a05:6000:2913:b0:4a8:7115:fa08 with SMTP id ffacd0b85a97d-4abb0f3c202mr33671845f8f.13.1795577293140;
        Tue, 24 Nov 2026 19:28:13 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:12 -0800 (PST)
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
Subject: [PATCH v6 4/6] dt-bindings: input: touchscreen: add LG SW42902
Date: Wed, 25 Nov 2026 04:28:00 +0100
Message-Id: <20261125032802.8460-5-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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

Document the LG SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..e8ef2d325635d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The LG SW42902 is an I2C capacitive touchscreen controller used on the
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
index 6a41a0690d9f0..8c88429e647ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,12 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 LG SW43103 PANEL DRIVER
 M:	Abdur Rofik <rofikcoga@gmail.com>
 S:	Maintained
-- 
2.39.5

