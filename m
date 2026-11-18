Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003642;
	b=C+6KlrX+Jq01c4frddVotosx9yrMz7Yo4ViAgJujb5SNyn3sQQBaj4irWtzWqRtEIble
	 EIDw82XUWkhGG2yO2I32YP5zFVCh5BkQPaU1QT6euFEkpUoCp0XEyP0NL00jIFSzk8uFf
	 FXWXHjI3+JsvmMmPtotjUOc7lQp7A/i31/0UIaC5DigoVSeRgTGqzrGQfkTsB2pPWmOxy
	 KpiQ/mv+XWRNuvtBBMwnxU/qxr/Su/s7JRFbvu+tHOSrKSBbATRScR+jrroEAXR7lAesC
	 5HPQ+Gl9RjO6RdSQ0lR2ZdKJTF64H25cTwOEUg7/8xRdcYOfx4wMpU3GaqWc6p4ovyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=1d3NVNk9P3Unseqtx73LLrB9B/PkpEjyOW5vuvovN4akoIYJcZhr82wNk/nHofhJ3pKW
	 v4CEScQFmN6IFFgcTJxFHUrRh+tO3OAL87zPXnGolpHrtV8HgVkDKiUTklYuhWPQ38uEP
	 8nKZSpmpPMZfLd226bDTeWAYtqAJouumE/YC0yHSVVisbFgjgSO/7/5OUyxz/WIpuzVB/
	 /lUsru42kxH4ga+7cqWYz1vfX3lLvo8Bh8BF3cFaKS2Qd4GTT3YlC7VaY5VEEASfhWO7N
	 gtbam7YJudddzdkwMT3I+Mn5EsOHrZofbAD3luRWPPl/mXjXER5mGB4Qwh9IQnf0O8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtmHmyg1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928F60A262E
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 12:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4928F60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JtmHmyg1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso6515945e9.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003640; x=1795608440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=JtmHmyg14Boyp9v535ErgQNT94x0DC7zP8DBwjHhodcFpFL40uBudkYtO7GookjHB5
         fgnu6n4vz9ahUXfO+yd6vWaZOCGSUscbc3nUv9FdtZUwyuYxWdKLRCQdnu4ckUGOFqVt
         lXY+L5N/SBAixdwwbzCxXUKFZ29ZTul7rCZmAsSNkvLD4jnvZFigWaGrObwsqmFQ6BgS
         RgJg62kfIcR4INg4bpKLb91vrF2OWFVyxwS4MkSRBtd/Lgp7XOZGGdTXEAvvONXmfRED
         AZgL6Jf4oBFJVq/DbYWVHrZ0uwqZ4UQqgO59l7J+925SACoeOnJNZUn7oSxlIstPoG+O
         jiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003640; x=1795608440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=PLD78i/7bkBXWLkWpkRaG+lRui81Dw+YPA6J8jOuWhHLZnb+rKFMJUPX/PfbJrdPU6
         dR30986H58lyNM3HI0nPGxZo70cGtzwAt8dyv/2Pip9NYbVHShW1+lVJDGTAP0SVOju9
         5Cz8Qeo8QYalrjc+bFjfiFTB8h4gQenGhI5qfqob9ItHiYFNBmAwxSZlhrvEC4ON0M4P
         Kurctx29lGpHux7G7dAJQUzTwOtA1vlPyImyCUMxkl8df0zWgYZaLHxgh8VW2qu4qeVm
         oC18QRg3/iGlS/AmCSPSTNpxDRXziu5/oXSXpFhA+7hT4j+LZ2jK2SvY5sCEc5MZQrst
         t4ww==
X-Forwarded-Encrypted: i=1; AL+hErHWhhcfcdwOEF93uN1f/GCQwM35KhJURn6qstIR+bEsmAUEn/VdgubCYLAst1IIJvAKI2lxntq8iZLWGw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9I1zF49iVFIggkCZ/BuHcyxnash30OU1+fIfCKnGZ4M9RWoJBD
	W6bfloPrpBtJIVKzQ4JEpWeveCxuD+XqvmhITCbqMoopQQ//CXoqRuWK
X-Gm-Gg: AYBFou2wNbDhgYmb/rFLb5x/D7EMk4s5UG3O2jgXd2fuEvPs49KU1gPz8Udj5/iFNG9
	ShA9fZ9jeOkWPmmuYxosvPSyAXs/XarfYfMohYMZEbye2rZ8M8PSKMd3+JHSdFTuBJrabCqIK6Q
	Peap7EzfZYYYE3vwmiGU7/0tz4jJI2k/Q/vbIRsMQ5Tn6Lop5a0FrV8bvxmiTZM5h7EXZYCOsUT
	s/jvoaYFvuxpCeGNyH1zm3JDdJTaNZkj9Cj9FTduFKkcE4KvVZfkjcVAl52QIH0Wr4HP9nI3maK
	Ot5nnN4gtt9D51jE0n/k8eWGgojeJ+XvKKP1whMgwM/N3F7URft6ANoYD+2r1iqZXfCE7kzC5yu
	W10HyYlQHxbvIvw8FV9CFI/vhJwMmhwlmCK2sjS1mYRaua5HauR+V3G8qSzA7k8PIDprdWwx5ky
	+6R8DdQ4MvQlV4CnF+VP1P8qVzLsZ3ZASmBsLbuHTFGUeNjGRAnrVvGGH4IFQIP760u5lmtGHm0
	/yhA6ekNlsbNac4NbYtnzuNERyruiAH2ACD0rZTFDa/ZeVQc51HbfAvo0/uI4OLorcKKTW28pyu
	+2P7k76Lec9ziP33QVmW+MYVqQGNn5SCZSI9Fq72c4vz8OvIxqtFVmg2Vs1YE60+3qv9wPyeHqb
	gxmpmCGt9xykjoDTLZ028wg==
X-Received: by 2002:a05:600c:354b:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb7da4805fmr42799545e9.31.1795003639681;
        Wed, 18 Nov 2026 04:07:19 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:19 -0800 (PST)
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
Subject: [PATCH v2 03/10] dt-bindings: display: panel: add LG SW43103
Date: Wed, 18 Nov 2026 13:07:07 +0100
Message-Id: <20261118120714.31505-4-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 69 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..7f44ac6672bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG / BOE SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - lg,sw43103
+      - boe,sw43103
+
+  reg:
+    maxItems: 1
+
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+  enable-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43103";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p8>;
+            vpnl-supply = <&vreg_l11c_3p0>;
+
+            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 80c1bfb66f8cc..594863936fb5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,11 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW43103 PANEL DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
+
 LG V60 THINQ 5G (TIMELM) SUPPORT
 M:	Abdur Rofik <rofikcoga@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
-- 
2.39.5

