Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948B437D11A
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716602; cv=none; b=NAYFUtnJwpxnHZU6eI/JHFE8zoAReDtX8md3CgCuLvPntnFQ+AM77kwHnfZEkZZQzxCMaFB0W/gN/tFUqZG5/G21KlksDuAQiq/7QIIx9d47XuR1QnDZysUCdigGNHjPYQKs//RHgtktkt9iUMSkB2KuooRgxaQQgd4RjHoh9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716602; c=relaxed/simple;
	bh=0M4sE/hfoJQ3CKEy3NN7fLe6+z2efpSPXuBLPdijfOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujpXVSJU1kTu7jYuUuV5GZRklNemuZqG875hyh1rbk/iUYQfEx5VilACIMrraYqCNbWPsewyFyQ3GIyq6QVIDH1rqVNuGfFbT7LGPGP1Te9XU2KRCNerxA9/7rEOtUbaWAjViiDYIN1QlZcPWDAxl6gxbiypACHKT27RoL6zcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wunI3ilQ; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wunI3ilQ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so575906a12.3
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789716596; x=1790321396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2L0ZhsQmTrZuxVtkeygootsPfgjhBA7S6bYd0vwJVs=;
        b=wunI3ilQ+BjPIe+/1nmGaG/AAdHlCJk+pxGcQj1xeOgt0b5TYyKQRPNMaz8r5FCtFm
         GUdofwtEAMm8iC4vzTG2R2e5MdKtwA5fBWiJ6sCAsw1FsfGL2K+G9D3QizuLt2meUc3h
         cgydjonDfOiX/T4GJyUrUU/DCseC3Ljp0qcRjiSQWe6wpsqy7GOecjyYi4S6v/FmRG1d
         fdJy4GYLLGP0OzbtcxNjdApwXv8YiFStj0h8nTV501Gi0PyK6ehtD/e6SvisSBw9ZDHR
         NU+jUwOVklpO7sOG4/UMIlfIjsCqidTnGfVCmU0exgrsKdCIiI9OeuTv5VfgjtFNUaTw
         woZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716596; x=1790321396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2L0ZhsQmTrZuxVtkeygootsPfgjhBA7S6bYd0vwJVs=;
        b=KLV6kHidZBK1s+0kFcMmghwnr61losX8FwlfWccjwfv/QY+TZ13kgHf2c0sJtroHd9
         OoJKWdRH8m4NsGNGK0E6kCC6DQqBn6rWBgnqfeXU2jlqrP6p9qxt1e6/btUshBqz32B3
         FkskxM+ZioPmKKoz3701TwVHQX2nmO2cqd8rYOUQUv79/x25QuEjLQhKrTvTC/XKSHTS
         rdiwGmclqLvACu9ssmUVw6Xahs22k3CluhK9QWi69r/a8tfOw0ule2PVv3l07rTJ/Vs2
         q+vssELykvj7Y6cW4zgl0W52mdx6DXPwzb7xU7Yr5dtq1zSMVryu5mltKJw5UwGhHcOn
         jjNA==
X-Forwarded-Encrypted: i=1; AKwUvBzNgvSpJlsTrL4BJbSyv1ctoPSVu9gCKLylyDFX9OoG3FJRqBvN4hSdt5+n0+zQLLLwZdlevrvYnMJNVg==@vger.kernel.org
X-Gm-Message-State: AFuF++njXB7NUmMjUNdqAc/Gv5fiYhMKqcl1MxPkgsgonSvy7L/PhGMr
	oAAilaXwga0FJLTdA8lxEnxRcK8UpmHkpIPGIsl/9Zs2u/fYf220+v2Ex1WirPTtMwI=
X-Gm-Gg: AYBFou3sYDhLJXBktl8lw0yltP0DaAIm/rMoHnVQFtQOQZ9yYcTBAyldlDGuibLLUnW
	jVVfCRf/owUg/klTDBdzp/GN6ZqsY6xVIfUSzMkRcluLT9G0F7rm32egyjBN3fV7V0YpkAMS/rV
	bdm5U2FStxBZpNfFNFUZipHNcHWcXQAXc/hGlry+r18u4wk51hGvA4JyKHylkVC28r6gbrJHR1H
	e55tijMPSaJjkp97cGSItBnoepFw4RGJnFLesPGcPKESEOOslK9KtquwsEJx0QzeP/17amqXJM/
	VgTH2kQvJvKPu1Z1qNmosEfOnDZw7mDCbOok6aJVuEGALuKllOwxlYKQ/izjx2LlQr2OmFVKKjT
	uoBz+xZmC1Vl3BBBA4qCGYrBRg/srkO9YNYJHMZU3B1qsoqybrlpRWhlbb6GyoATaZXzmP8Q2ut
	NEPYyVbKe8FGYo/Zn9eLQBlE2UtuYvI17T2/kVMOeTaXib7Za4ta/+0MWElWxSrQgJCHMVurdeV
	FFpNLW45t1aNckiU10gJl/m1S8lURGe/7CeVcRyUycZRDcoBcPZ
X-Received: by 2002:a05:6402:23c3:b0:6a6:8dd:c76b with SMTP id 4fb4d7f45d1cf-6aa52651434mr1297095a12.1.1789716596447;
        Fri, 18 Sep 2026 00:29:56 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58d55cd3sm462048a12.2.2026.09.18.00.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:29:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 09:29:52 +0200
Subject: [PATCH v3 1/3] dt-bindings: input: touchscreen: document ESWIN
 EPH8621
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-eswin-eph8621-v3-1-514eb1f622c0@fairphone.com>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
In-Reply-To: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789716594; l=2581;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0M4sE/hfoJQ3CKEy3NN7fLe6+z2efpSPXuBLPdijfOE=;
 b=WX8+0kdxCyJLrxBulrnhen64IYl3I2ETVzSl6fJ6URl4i9x9gCqENtZlDBaSJDGq9KicJIqr/
 B9m//xHKyL2CWb+jxJ3+hRP1TgoxEjSYeCr96OAKKwmoPpUOYn1Pv6i
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ESWIN EPH8621 touchscreen controller, which can operate in
SPI mode. Other touchscreen controllers from the EPH861X family (and
potentially also EPH8621) can also operate in I2C mode, this was not
added yet.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/input/touchscreen/eswin,eph8621.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
new file mode 100644
index 000000000000..ac7fa58644ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/eswin,eph8621.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EPH8621 touchscreen controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - eswin,eph8621
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  avdd-supply:
+    description: Power supply regulator on AVDD pin
+
+  vddio-supply:
+    description: Power supply regulator on VDDIO pin
+
+  spi-max-frequency: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vddio-supply
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@0 {
+        compatible = "eswin,eph8621";
+        reg = <0>;
+
+        avdd-supply = <&vreg_l22b>;
+        vddio-supply = <&vreg_l9b>;
+
+        interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+        spi-max-frequency = <2000000>;
+
+        touchscreen-size-x = <1116>;
+        touchscreen-size-y = <2484>;
+        touchscreen-inverted-x;
+      };
+    };
+
+...

-- 
2.55.0

