Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577290;
	b=vqpZ+lhq93jdHVbQcRjsh+IgiIttiSIQzgEHtU7vbJzrmiyK560Y4zEsRwFEOg9VHCjl
	 nTuV0rJVu/uFh2OdRci0H23NQeVmWRlEWI3+nkIJiCy+xYLS4S/BLyrMsfnCV2uH/yaqn
	 bThr59rtF/GL3OqIM+X0JWMiDDH8rGnIwyj2wIV+THyOKVg98LMJJfF4sEeKbRdPVfpyQ
	 zI/aPIK5DTZjQ8UUqxtwI4jQQfzU+jilp1mzMYZZ9i9pbNpTDJKse473ZnT72DugOqpYd
	 t7u9cbQagw285GijX9GN7n4ueKxXWY/TElzUHeG0txPVUcT+Z5i3maJmBnwpgAdHodA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
	b=2u7dy4bFkyYUysW1ww6hHCBwAYM95+Iquk8yw2ioGAa8qwH04ddrfNB39VUPSKonP1ys
	 nrzOiXd2vBfBLYfiBlZb44JNX39+UYdV6MdZRYx//bBIeoUTqyE/XbJAfn2uw1kNs2K0q
	 4RQ1nzbXdeIBMkQtdnsVk8gDJeU++17qHoSgzkAzBjmCgGKErHtQ0wa7nn256niP1/IH+
	 GCPFXrNXnZCAQrksKsQctcU1D6wNo89CVp29P2YjWZmnQ8Ba5RO+vkQXU2gkeWH5fFTkL
	 E5xEFcEXfSUHYO5214scqnhehcGLfHxEuPgOw7eNNcBv4h5yubZTw49wjrVwHe6YlEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpixMif4;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C07606A32A
	for <phone-devel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C07606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpixMif4
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3364684f8f.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577288; x=1796182088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
        b=RpixMif4Byh/aV3xfOnH6SHw4AKFvidBBjZpuYgB4fwy5TNRO40GwWG0BFFM07jT5w
         bYWsepGfPXvuthLdC9uWBn5YrDcQ+iC56WlyAfSnJP0alv38jE4vCDhVrsWFN6w0di6g
         /mS6l9NTGiuzLyYepRo2qF2ZRzYTP1cQfkHmVTuwUNc/a8RA1XJf13fpxBAZULGT5pmK
         sd54elbf9/FlRGAqyzNODLlXoOwUyvNdaFLI0uSb7zBDJe6vKmS2y8Bk+16k2QDQw+pi
         fQSQZaWvqlZhJvGYid2Yktf6VmeglBzrW3oIAU+Z6tlmsK5AD01z3VXSMe8XQXDrGtGT
         sBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577288; x=1796182088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SOkOs4X+aYTNF/FE843B5YIM2qcfhLHQtKB0HpI+vVI=;
        b=1pS2Rx3/djvblUmI3ge4dTwPQH06Q75UE84tgzoMN68aohcLTJTI5/8uyIdGJZ1beo
         p0nH0yeaA5ty4ct3XG29YR0nNPRI9JyWxUL4S8wCi3hQhyaynUqhqGxEgiWu34gBT6R0
         H3sUVo4Vt+27XRSy2u8N8AAItSzPNPWqxtrf5DZ+m6uuNSRQ1EueZN2aHYIjLBVP5tuc
         bThw9ml6te2ANPRCuRtkFey//zucoOS/ISMfpjYy/1iZDKRNj2o88/LtN6Co8pqwIfcH
         lzDVgk7COfASLJKtSf92MmnDda0C2tG42KyhLiOdgirWVjI9lsEeR1TJOL2dVAzIKOmO
         kX/g==
X-Forwarded-Encrypted: i=1; AL+hErGCbrpArFeNjir2aQEgenU0lubs+q1r8LCB9WNnu1pqLi7FuShSfndP6OC+WD0gfxsFZg6L1ao1yyNQ7Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z895b5fS9b7y1EnQGUAAZKxBVS7UaHPK5pJmY9HMy/dd6Ki31RL
	C+p6DQ+adtL8qfIFEAbrNTi0Dceh1Mx7oCiMw25pRoFQRhzMAZGWvOK6
X-Gm-Gg: AZFdTZcIqsaJkATYyQ82iFgXMy2wLSaJTi5HC5xMr6IbiWlZARQnuPnXdXLdRXUlR13
	DFYI9sJ4GGPCE8geJkPkMyqIFksgzilC8HvAR7LoH5K6/iPY5fmMD9+IoZkFRkFehqxXe/rS+fm
	BRgOxJNnFqFzXDlfwl4AQUFsjhzIdwn5e474Lx0YQEJGt7AfJY9fWLpMjw6OTK0n9OClLH6u1Ce
	8aJ13JK6zGCXTFRt4dXTt2csUsJZxA+LNUE+BjAV/YIdaulso98RC8E7msZt3ozM7+7lmXgmgar
	9M2w1Uyeqthzo3Iq8AjfDHnzblXSW64Ww/ny4tgEz7GBPwmeIsXcCU1oD6EnjbvJE2Vpk+tmkp5
	sYOSPvxrIEyb3dtAtMW/yoLylXDDPiWdOKp1ocdlvmNWiC6hX8VU6dounVVg2Td5ZDY/tVb9Luu
	Y3nFBrlaNyqDKvKHNzcdDgZFYBHylmrmnttXUzEswbKGZKH2gKzC0XCIVtDVq9XKA0FtX+iEtLW
	tSUydjljsTV3ub51va5YeTo3ots296hBFomNv9vbFl45lbJ109hhEPhWXdHZWXE9rSDFrFCAaCR
	VZGvw7PZ8EdXTCCE2V3vQnUYaT7+qwrc/btq67fpWoEYsbZN+AupgV69ceIh2KyU9tsVrwjF0cB
	nOHch1zwM4YTM4sZvCV0ck5BttVl491c=
X-Received: by 2002:a05:6000:60e:b0:49c:fde4:1af5 with SMTP id ffacd0b85a97d-4abb9de7e8bmr30366806f8f.54.1795577288400;
        Tue, 24 Nov 2026 19:28:08 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:08 -0800 (PST)
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
Subject: [PATCH v6 2/6] dt-bindings: display: panel: add LG SW43103
Date: Wed, 25 Nov 2026 04:27:58 +0100
Message-Id: <20261125032802.8460-3-rofikcoga@gmail.com>
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

Document the SW43103 FHD+ AMOLED panel used by the LG V60. The panel
uses DSI command mode with DSC and DCS backlight control.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../bindings/display/panel/lg,sw43103.yaml    | 67 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
new file mode 100644
index 0000000000000..971547c48bd6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43103.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43103.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43103 1080x2460 DSI cmd mode panel
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The SW43103 is a 1080x2460 command-mode AMOLED panel used by LG V60 (timelm).
+  It uses Display Stream Compression (DSC) over a 4-lane MIPI DSI interface.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: lg,sw43103
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
index ccbcdc0799b9f..3386c7dfb9493 100644
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
 LG2160 MEDIA DRIVER
 M:	Michael Krufky <mkrufky@linuxtv.org>
 L:	linux-media@vger.kernel.org
-- 
2.39.5

