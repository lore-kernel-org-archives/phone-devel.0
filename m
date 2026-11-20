Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160045;
	b=Vn33Fh5HXp8JEJHvYzdsTpThnGqxskMJ6+kuwvgeYpRN7kQjS8V0aOt5SsQmlI0CEIce
	 0tUOKgNNO6Cjh30rr0wby0hETVWC2RlYSdyY4xrtnyB6LHqoFbkqhWemMrnuj1CFlwjR/
	 6B1CQC4eu4qnaqWuldcVkf8cwkVY71iAeOfHhSykB6UCc4R6NUAxCQNvflWnVpbfM5d2Z
	 1ILUG7a04mBW6JWNfZHF8LBLRchMSTIDMqwgTSeJbaCd2Xtmn/U3rwtzfppWEGMxygBgf
	 w4hJaIh4BPQ11V62csVywVeENm122+QVafYbHl4mPp5F5tJoNItylQAvl6qv3WfDMSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
	b=zlEioYCzOMNQCn24c4plyB5y4a/13TF+h1KfBOSQKjqqI41ywminv514YcZ+gjsb+pys
	 BFrMARWTRqaAAti0JM8NscbIiV15X0Sf+7snIYC6ZytvI9b6/1Y0FKT0crNaa1c1vScoK
	 NJ/smas5Q2J+yoZNQo3BRCcL8Qtr2gKnBmGRTm/Gz1x/stx2F1UEClTWQ8p4WUSRe5oYp
	 tFmg3jP+VH3vVLak7u5bQpn5HvoASJhpTHm9xa5ITbzfrfKVJ+aD+U8Kc9HHAjg9XbSBc
	 Ab22oYdxMspjvHhm7WuoYa6kkux7xs3zKm5cz0e09fjoail3akxwYZTfJcWSI30ixyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC860A2613
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10BC860A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGKPN5sg
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso2881995e9.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160043; x=1795764843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=UGKPN5sgnx/JqyrT4bunkDQklLznRnCu7ogj28UGxAtEc6KwzYIx1NZItncO3oCsy2
         WQwOTT4lqZnhEGkFTU2b0VsycWz3M8JsTUfgictNO4H7nhfo8Xa8SB5nE/4hoihOR+HV
         Iz93718IqHJWyQt97zdXQoV9pzVcMYIhwQCzOi/Q6u4n0TpTFiyCGzRrt53wHObDgLxF
         Xi3kUPiCfr4xbBx74tg/LQCT3qU9C9Tw0Ab5AOU4Xtu69qLTbTC3wJPvAMxWuXfC8r4o
         pAz8JNmmJFL1alSsFqn0U8j113YfwK3WZqXD7BRmX4YDkKQTGUWqTicnH/hJfPsct1Jw
         DWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160043; x=1795764843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dsLmXofWh30s/RrFp/am5k44VgINvU+/ItmDuae2D4c=;
        b=x50IkMU9REpCaLQpfziqvd9mmN00k0pBoVoG9760CNCakSmA1LyvY5Cs7RuUTvNLU8
         Lve+ixLwNuyaAbOupFz7Xl/V/T1UXlegxmegWe/ylSABy1qnr10yK8jFgSTDF7+QQhgq
         E4XK9FNmBH+2x4u+Ug9wkqMa7PVDMnhDMdpgAZrqp/fEu++/5138qASnWxDt33zKwx14
         hfn+pZDkiSWTXdswrddP5YQb2C/tahwDnOqkySo1vt9EkfdNHNmXRrErY0+7LZW4FhP4
         8XDMiI2HT4ZY8pBRlTix8ffztoeL4HDATT10silTJqdq/2ZL1s50Rcz1SHWSmR9lJNV1
         9n5g==
X-Forwarded-Encrypted: i=1; AL+hErGbabUqdpjfqKmNkPZj+npq3AAiV4NNsNsLcUxdSZsA0qd38P2/iuAfAh554rnv4vkt8zSo9/xcoG5/1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dyp2cV7TFRg9ATQ2vob/77Ly8YisJ20PqeEszHxUJB57FioTj
	e+j3jNaz4gH8qvQfGfVoazcl6cHEDs+/gUMkoTUc/EO1yTCZUn9oWD7a
X-Gm-Gg: AYBFou3CvyxADAJeu13C1g8kjmpi8/cUDikDPWtTUpr2JkTtkZM5EnwZ763lpuFtSFL
	jVZNIRwZRnWlsFd5JYz+lKugPPjHDY5Q0jt10bOuU4e6keT+DQZ5UuFg2d0pBz/EVfplpZhAJ2l
	E9RdfMvvjwWPRx0o2j4idPmbB78USseLKYeCq/4SC62kMU2mMfBoHuHPtNg9gfk3E0cXa4qh5av
	UbcutCGS/NtLTMbwUCEfx7rpaSo449zOzaIwisG/Moth/biMDtQ4j0m7xEu2RQMbV8PUm5rDbOS
	REXD1ESnd1MZGPyits3I2mcheZOFtZQidu+a1Y701GyrMKgDKSMsV3R5DNAuZ1/8U/w3bcWjLKl
	OSpfy1+yHP8gl+zVEpeEhTvZ/rab2E18W81ZEV2KSDrAGPe4YKUWPC+vFyXpV8uv/eiGslegDq5
	cFt8GRgnIS3ahNYN+63Ft75LoB1wZjX6t2lMGJDBIrCD7YYwgR6LbcRFg1zJIb+Mlb/m+nZfsHI
	4FQXh7uT1BgFqBhqSjp2Wt4s4zDP+PvivZQSMUWoiPS1E3+1Lp+T5YOu2QvP95EQVK5Qm4C0zgb
	Exq7q0hyxbu+9bk0f9JduUfd4DiaimQCAjfWjLf95OlwbLRHYLaCln8orhGFk80XIRyLHFCnwyM
	=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr44144925e9.26.1795160043279;
        Thu, 19 Nov 2026 23:34:03 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:02 -0800 (PST)
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
Subject: [PATCH v4 03/10] dt-bindings: display: panel: add LG SW43103
Date: Fri, 20 Nov 2026 08:33:51 +0100
Message-Id: <20261120073358.10267-4-rofikcoga@gmail.com>
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

