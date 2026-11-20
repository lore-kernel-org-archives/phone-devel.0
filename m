Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190097;
	b=L5NFRjaUBtMwYVemvReM/+suVcVLP51HgM4FYLPABaGOLaZaIgJn7CiWCRzFzoNIImkT
	 Tq1R+j7K0Z1GYnWViKdemX49QbALt4SsGgWBXND/rQhT/8cJ+MyBruxIir7TBMM1U6SuT
	 1uvdi8Lm2FIk3vqMu9UK0yT727rf2d8vrh61s5m9XkdHwoO81JFfxIGeu1UBC06IeVKOP
	 DeN0SralyTyprbX4DBsuPUbZqDkSriao9EiTug1I3NDBxJunWGBn/H+eXrG8KICeYW5xa
	 GYr5DXe7oFuqW1OGvltlhxDND365Q/F1BtXCRL0OOUBYVqBb7nI6Kr9sHr7Mq4tdttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=BUt3iI73aiUtH8reujxc7zUP4PXz+2xNIODD5U4GPaL0TFUPyCp8GTOmpCfQtiPmxZDN
	 Cihk0FOgH11a0uXMc/+0kjQzNVAEaafzJGbj+lQpSmPeoFbYtyjsOat9LLgeRfMzpwie2
	 BZS+JmbfzIiFvJXX1Tj3SySSJn2YkZ7Nnzj3Aqqg07BAN4KMmA+tp35k29SEBk4rk/nVP
	 25RkhLpqRsmmlseV/6BgkhocY64+WTpxVkogNakCnnCJmSL8LjasMZ4nD2pPaRCenhgLN
	 UWCQHeddzTBSYlYPcwhweAe8lpACRJFFVHKZR9dkMhyYrli5SY03p0aPwKzoS8xIN+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB860A261A
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BB860A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dpaivp5c
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so4464165e9.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190095; x=1795794895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=dpaivp5ck36xhT0mSf3cEhG83JMNpndV/TDWJHrvmuFpnac9HUTpZp3vuYPaad/kOo
         RGhn4lKUpnnVcpFC/yaxfCyQXeRrK979BXupamV4LBS+vKLvlrb2gh8SWEdAy0rpHwKL
         HhorfYU3lt7r4/teZcJ6M9g0lzuHVgrF4jtW73dzFzeHF2tAerfB+OG1PlLOYWMKRgu0
         7Km1MLWMao/4k8glK8Puv0YOdJpzpv4mYxmhlkhmLPyJqN5QDMkPtPizb13BlzsnWgzO
         MPC/kwklGeqDxJnmDreueLfzrZwysMXydWVAwE18acn2eOJSoHSeh0N4i4U/aAwvZJ4O
         Hpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190095; x=1795794895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=qYK1tTyahUHA3bNf330XJ60UfEpS+yUjuXn2IpiLr1cjELv8AqyjHjiP7NOYDwoTGZ
         rDi+ydwVf7f8dJmUvn4Ue/X8/MpoTm0QiPKyU9MGu+QS5DazdL+9Gp0R6O+NkXjR15En
         O8MbxTyt2ZCOQ9ZGxsOkCuSSQaBDlZHyVcPV+XawWlpLoBAYfVVbed1QptNBxCBeWNRh
         fkFsjOeIm2+F5pURBdUGp67oAMiDeINES26wW+K9rrDALRMLYx5xF7UDkMEl0iI3aii1
         bYu/Ls2spDHXd2x+MgmeZUpHNKN/VnnN0tFNVtI8gQXLtjzI8xPKj45BrqkuW6sSxgYE
         UE2w==
X-Forwarded-Encrypted: i=1; AL+hErHKYxF7kSDLGKAWWQOFntYcASFdvlzmk207kTWxG3Oluon9JHklYO4InyVn7HdtB+GRaBpGaqZ2PKtqEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9DBjFHPpVmgEPuqnbxc/9eo06exatkn2JwLqfiaj76hlPgOlHY
	AZqrABOLCoyPxaKYBT/KOfJLSYbWzCRC21f3oD78jinxVbkWmoRYu0MA
X-Gm-Gg: AYBFou1REWnt9aizLgUQ+qrHyJP/L1XwHQfSoLStydWb62CgvAGJSBeqWGgRgiJycpw
	bGNHtXoC+YBG/LC7xvfM8/Qpfa8YISogXi0UlAVuSd99uWzZARWwCpA8oSPW3DKzlPHcjsOKQpQ
	AJkM1wY2OIxegOR9JPNRRayLjPF/uAJtZIn440IrlVGzdq5054pIWmZzVn427ac1CBmiUp8vKJD
	UYpFI9MIFIJvSsDAfukLqWqF8TWPRtsdWhSnJELYKMcw7xdu1OSuasN+4QmbVQj0A7ijJUmDrCI
	hjTIo7YLcc88qwhAHOZNtY6XtTrgEal9KFHPCYGVfosYFlo1h2iNv6RNz20LoF8cCLWhe+bAQu0
	qa5Y1Es7vlJbzxtEPT/glYA3bNeFKNbiwNFUWjF4ddeEk7u1KEde1F6a/HYpY+6r2EzfCLScYiJ
	myx+QvafnUxuzp7ADX//dR3swwjGAxBXgeEF57CiFeL2yQr17UbOtVtWiALOZYSuoOE5xHtrJIh
	lSwwyeX57CfvdyfWfK/+Ifmf/WJS1D4neXRYOOKyGvXcB7H4hy6mWt0YcloZAzXArOjpy0eOGyb
	hvNGOznux1eDNFnaHozyI/dOUvI1AZIHJ2D42ySZ8nIuLLeYrz5liRWlR0XeNBviB9FykPLmJX4
	=
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr89360365e9.23.1795190095071;
        Fri, 20 Nov 2026 07:54:55 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:54 -0800 (PST)
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
Subject: [PATCH v5 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 16:54:42 +0100
Message-Id: <20261120155450.7719-4-rofikcoga@gmail.com>
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

