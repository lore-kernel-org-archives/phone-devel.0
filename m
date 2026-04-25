Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87D372ECB
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141882; cv=none; b=OEFDaL/pucZ2OTUJoyv/jksIpJ9UDZ8yijQmkoTdm+grTBylgQH0huZXCDdVCb+I3R8Q9QUPIVUSGH0eMUQtg9cpdzV8AcFBp4MKxaM4ZL5M48meMporIL7FqDmQkN8Jx8t384pQC+j8DXnAMjoCcFpGCDg+KuePViO/tY1Lpp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141882; c=relaxed/simple;
	bh=sFgdCYiD5TfywfevqOqs8Vz5/tI6iCmjO2YFGeFbPAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWH+c12ZGEtxEAcSiPK3ppYwUDyYBwuYHyE5higvGhHkldJUVmOfrMZZbGc7DE2SgupM5mWA/QQHaDT9SkX0ASJo+TXAKz3Ad96LXg6YZPNyIPnvJSgAfBNTrAjI+BU8daCYdvyIP2TYTvuxRz+PF+rsZLNErX4LQ7J1Zqvqdzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spY9IRBA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spY9IRBA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so101765675e9.0
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141879; x=1777746679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=spY9IRBAQm24NEyYKsyUxzdxxh7SyRDyR/3fim6JiAnc9mUp7uIklerXnVUh10iZze
         gA7Nnrs6FHLiPl00ffSCDBRXvDWl6Zx0Or81GbvWB9qKPVsO/stMBC46tC0zRwUnnelO
         2D/qNA/L6XOUSjaVCDEHBmZ0QQh53MNodNWTd4KKk1IplhukLUbJ+FKfQj0fwwsFjc+w
         d5NpIr+clY/WjMhb688lstS2GvXdj06SkfwXyDkuXnRCacNMQmmRcmcBGo1ugKrFkGh+
         708hCnIkoGoTukJUlZeZWttzNlJyNjrOGoIvqr+dBtUrFLuWjy3TAHde1ZJ9pQz61Jya
         EabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141879; x=1777746679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Tgdu3+sQNzcBRuzqvG3gzHTwwqwtEDe5RVadLhXWo=;
        b=mMjwKkdptFiDYMrP3qjNuB3KmHBaMvliQLo8tKrlhuSlMmLd4zAg1meNBy866MgrC+
         voycJV7+0eJ4VrNkN/YE1TV5/hG0Uwtw11nue6pMXvIqjmRiFhhg4lc6wJDKzXbXry5g
         WY8SFo5nmF8FyxbFQHCqzowZZHiZ42ColoX8w2wvaRRgncRdF7/ufrDieg4+DLu/uJ3B
         iHkl06faY7KJXH0OFSSrIfc7VNskClpcA5jOPSfkAmc6tpdEgaSIf0voIfQnotEo2LjA
         EbN299emlvwKPgQgGo7Zy+li26GAIXD/LQZW6cUwc8NCHiYKznFKxOAUaB84X7zESxBN
         88Kg==
X-Forwarded-Encrypted: i=1; AFNElJ/sxnHuUdb8FqzoK8JqA64U3gYC0ec5sSdJvgWSAsoemO76BeyPogWZlaqv45QlLJYRIgew94aWktQLKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WRCT7kfAtRq6AJjnG5HY0Cklp+dqRhSgNktHIgMw3n2hNa4w
	fwOwFuVspJWE/jNAz66EF0cv6dTXtFrtvc2XkzDihyadZzz4RZTMqYjG
X-Gm-Gg: AeBDiesYml6kwCmM6GY7wpQ9hMPp1SU64ZDhKzruFqMsFK2GaOAm/FKUOwZfC8TuUKK
	esCW0OrMZ2g/2d4++OR4v4vBI6R1IW50H6MBxj19LWIN9PRWKTODHiwXUWe6wrPRcIkPwxvwwLL
	S1rtpEAe6B1zUYPL/FcaQ3O4gGXhAUlivqtLlFpk1tGBpiAZqI2IJobkwiURuZY5+XNiSyOAX+s
	wSNgtxUItDUaHcd8lP/IVIjvmJL2T+vOMnnzX20FlmjCuERAygO/wkNDaKTvsi8/z5xj98slT39
	gHtLEXgLPhwGXI6bf//OwIkUU9QhbwS7o2ljBPQObUUMlRavoZe41Vl40V/SLbdnB3+js3On0yX
	qWOp9UFxg06mO2yzL43+b5jjAEqAScvaVQNVV+Hh9pzJzsZ0Hx1mADLiEwb4lduY4XKWC3SLzAz
	rX6JbW39j2ryD6up0m0ZBihSlpLtzi3bxXhBs=
X-Received: by 2002:a05:600c:c0d5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488fb74dffemr410723485e9.9.1777141878764;
        Sat, 25 Apr 2026 11:31:18 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:02 +0300
Subject: [PATCH RFC v2 01/11] media: dt-bindings: venus: Add qcom,msm8939
 schema
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-1-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add a schema description for the Venus video decoder/encoder IP in
MSM8939.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../bindings/media/qcom,msm8939-venus.yaml         | 147 +++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
new file mode 100644
index 000000000000..5790b3bf5aef
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8939-venus.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,msm8939-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8939 Venus video encode and decode accelerators
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+  - Erikas Bitovtas <xerikasxx@gmail.com>
+
+description: |
+  The Venus IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,msm8939-venus
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+
+  iommus:
+    maxItems: 1
+
+  video-decoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-decoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+  video-encoder:
+    type: object
+
+    properties:
+      compatible:
+        const: venus-encoder
+
+      clocks:
+        maxItems: 2
+
+      clock-names:
+        items:
+          - const: core0
+          - const: core1
+
+      power-domains:
+        maxItems: 2
+
+      power-domain-names:
+        items:
+          - const: core0
+          - const: core1
+
+    required:
+      - compatible
+      - clocks
+      - clock-names
+      - power-domains
+      - power-domain-names
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - iommus
+  - video-decoder
+  - video-encoder
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
+
+    video-codec@1d00000 {
+        compatible = "qcom,msm8939-venus";
+        reg = <0x01d00000 0xff000>;
+        interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+                 <&gcc GCC_VENUS0_AHB_CLK>,
+                 <&gcc GCC_VENUS0_AXI_CLK>;
+        clock-names = "core", "iface", "bus";
+        power-domains = <&gcc VENUS_GDSC>;
+        iommus = <&apps_iommu 5>;
+        memory-region = <&venus_mem>;
+
+        video-decoder {
+          compatible = "venus-decoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+
+        video-encoder {
+          compatible = "venus-encoder";
+          clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+                   <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+          clock-names = "core0", "core1";
+          power-domains = <&gcc VENUS_CORE0_GDSC>,
+                          <&gcc VENUS_CORE1_GDSC>;
+          power-domain-names = "core0", "core1";
+        };
+    };

-- 
2.54.0

