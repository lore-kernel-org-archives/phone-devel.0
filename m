Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107268;
	b=h7d4ewfdgRXqPpsyBcvQBlIYxgfhFngTmgl4MCMCUvwFnCGq2FQcNunKCJOgninuXEwm
	 +qU4+/wkkOSq/zbpqkKhVvgdym8LhTM/zzJFjiLMnf9Rus7LE2HtGDgcvfoIyVl6blMvh
	 8ty0DK/0Pd2XKILmFQb/DyPCpcjBko84YpC3Otdt/+2v31MeGYcwjpcax+SBFvfdck9+I
	 EF+p4RKyFtFNvySDf7+XgI+4Wb5F0YKW1C3mi5bsuISTR22GEIzFPRAivdHvTZ2tnKtH8
	 KpoGX3xvPB3yWIaB57YEhnkDrfDC3q3Ki8NDWpXCHZyDjzLwx4j3bIb7kzQVK2UopIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=Vo86zOVpAOsb5/Z/T/wnQivs030w5KJ3wf0osLPaKWya7ucXaLleoLx5qEgdrcbxDTuo
	 FHnANuEXttmzKzsMk6SJ+73+SgHML37IAh7k0Kq3npRBSCDYdmlpo0L+/OioPihn/Cns1
	 Z1/q4SH7oldTu50zWQWUyTNQBkxPWnnDSi8kACkuAFgAeSET6BP+FuSXFPPgXtY+I8D6f
	 sT63QJpNVsA8ocQSEvzYbsKMpQiNhxR8TP3BfAujwN3ooH+dIEw43lAm31khrSCUR6Ve2
	 CdMTXDTLCAFGC/+tpRlVKsdl/QTiUxqmCsLMXKvftQrn32X4TgIxBWQv8dYGRupIlpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dz+ZDg7C;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7E460A262A
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B7E460A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dz+ZDg7C
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so35958095e9.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107266; x=1795712066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dz+ZDg7CRoUAxyICkSfyyt6wC/1KPGEqzo6Ii0+kewGp5nMjcEcYBTNjCXpxudpTjY
         R4Qf56JeUTKBjp3XPtzj6l2GLqtNky/bHv7lF4XyrVUfn2EDEw4PkRz1Wtz+WWAfXIGd
         phBHsiu1U4d31BS9e+pAE7DvsO3BPO99HGwRYogLtlgIXsrtq4bH0obS6t1dfhAshXtA
         Wn63K/4tBHKKWFrLr16DbwIK8iWjU5FTus85uzB71BynMtTtDDjV5H6lnuNIo7erzuNc
         /IaAJGbfIsArR69wiB+2BSjF6AiYqNd/gUBzgfhOR5HATERekqG90JczQSH9Oh/nn60/
         fbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107266; x=1795712066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=OfuioVtFE/Wo1d2lm8gzpxfHH7r1pQy6EWUssVK2CTNY73Z0eMaBfkcZcKnNYNedeb
         kAZgRVn2abAPoOBj+xsUdX2djORPL1+ixfX8uoSJfdpa5LgPfYXeV8HXnrCX/yN3c2pt
         NrfNVpw4Ge7cFd779RY+zWwqb/wGVDOXjx3qrgfQyfoto64Bif/ZSFSv0iEctlLE8ixv
         TqvaBWNxh5Vg4yf9cAQy2nbDps7PJ1XdSkQxKNOGnhtzGFIX8Ml6C6LoxD2ZHV2p6nG6
         ZoilLH8YMWLHvCpfLn6gUAojkx7a5/KTnkUj/0+16D1Fi4paiPLVCyI+nK5nOMevhjVW
         /o+w==
X-Forwarded-Encrypted: i=1; AL+hErGaG2fKmCsoQaBBz+pLCpkQTBchc1ivbsX7iy6Hg88Q8BXKfa39QDytBy+kpdTbwru5g05vm8YWZAug8g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MHa2Brm20vw1Ulds7NIzT0d9yLDfjVQXB9Z8agWA5vEKnrJYt
	L8pTuEUrNDrQI0eAWvXyDNcDxXQAaz03k621MLjLLQH3ShWZoH6qmv/Y
X-Gm-Gg: AYBFou1UhCCTQceWG1SoHKrxOlQ1OmNHw7uewj6BLTwMfZqy1YbLB7VO0xGKutWz9Yh
	5f5CCrqGf0OC+6EDb+NQ1ZVbqPTZ2WS/a9g7aNynv1snxFTqav8hRi9x8jfNOgDoeYRGsSDM6Hj
	4/kkdSepEt9SpMF1Q6/dvM9/PSSrkEUV7lKogOP/8ttGoutNjl1r38VJBPNJ9l0G/cYIhMgQOVj
	jNg+xPSjepbiM6zA0H9/9FtgtIsWh5b9rNAmLni2XGlkxP1i8U914A7J+rprMkGRq+3ZzM4szqF
	SMrX2wafKBuWYmKJXnJgqsWbHa9rMkfjBmQYRrT0WvVzbeOcKVfk1R+DRujgU6iKdyKFe9z9RLP
	vRTFg2RfB+UDHnSMUHApk24MGVXUIUUNQHjyYSItVLAlyVN4d2IQaUBFFZ+V1VIVUeLLNCn3p80
	0Okyvj2dylaANKg+8BaMczoXyOGN3b9R/w9ss47IXoZIXusuvap70ZxWhYVq60wVCT112A+FoYX
	5NFKDIR3+ExcUEfdESo1TjPT+mR9TrUPjVQUrxVY7lvuB49slIIgV5tWKPxLl4ifVXUcHk5GXT2
	ux9Hm4/gWHzxAxykY3DyAOs9Xko0QsbOFkxgIrJCxyeUIxes3F5IIklaNLpN4/kJKMNOCdIgkK4
	=
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr1875815e9.34.1795107266548;
        Thu, 19 Nov 2026 08:54:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:26 -0800 (PST)
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
Subject: [PATCH v3 03/10] dt-bindings: display: panel: add LG SW43103
Date: Thu, 19 Nov 2026 17:54:13 +0100
Message-Id: <20261119165420.24466-4-rofikcoga@gmail.com>
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

