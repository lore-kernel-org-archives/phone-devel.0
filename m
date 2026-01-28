Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF734EF0D
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603220; cv=none; b=m+iukU86RA0zJsNlgIbidQmSvqjEeVh+Rd3hB7byEJvQyQ5viJjvMtGi5XTzhwffvpwvecq4JYcTL9dwR4ubHOE+F0tJV0mtE35g4d1998ndO41OArcrE8EVCg/bEO0sU+cdToD/uh7eiYQYRaAnWNWIjWY3cSsvFa60fjN86tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603220; c=relaxed/simple;
	bh=hJzi+1WVJi3bViEFfHTLerRF56fSuL0dTkBkrX7hZ2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrG+aVafVSYkl7VsnlgmFBpAfUM35+iRRZLjyohBf6mCxvPZFlvnPhoDR5xcDh/rbZJ8bHkGOpcGhQBW7QckRAtur+yhENPPvhcEfsYYDRCcdlS5I0m0fHtTOrI4m43xWhyWSbTLYVRGURIp2xmUUNKgTi5eYyJiKQ4OOMhXla0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=t3Ihowf6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="t3Ihowf6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8849dc12f6so1078483266b.1
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 04:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769603214; x=1770208014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmDCujZ3dSL1dQK8DryTjI+m1X8tch6zwLYuMjQ/ExI=;
        b=t3Ihowf6tbDIeZZJU3O9dEWvOEsvEnXmFSMlPXPN7ralfnsrN5OAIjP3nicU5GIItQ
         sAkt0kIwyEs9xph/yYyfawGivgwWQbHFVi6Rzf231ZpyCWs+QrcQZJgHNZ/je89VUPyh
         WToxOHLCO/QEAbckF8V/enRsiNaS0jbAZVrxa+rxS0HkEZtNBFZwCGkdbp8IgkbpjrvY
         1sPhmFegIT4GO3fNEPdTEShM5u6GG1yAMEORdg3tqoVJygY/YS1NvFeg6nUQbpR0Bjuv
         Teb++7fJijigE2uqsmhgBB5zLIrl8ov/GB10Yojfyc6chrWNo+f9orejGAH5k6/w31WQ
         +4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769603214; x=1770208014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YmDCujZ3dSL1dQK8DryTjI+m1X8tch6zwLYuMjQ/ExI=;
        b=H/fRy3mbwqgkp+kLXhIvTvFfU/9bYDY/DIfWf6TBq0mIxFgbu0C8IzzTKGohfE/CSf
         gxe26TV3DNxNKz7ovmDad3nlPs0fRhA5X5Y6jjyXrsle4waSo8M02JN3K+StnYgCuHIa
         YQwtqosP6lP8GvdK5/Ta5MEZbSCe/yuRKKYtF6JPmGqgUp3gXevehkb6NCAvaHkTdCfC
         Vc04g47X5oKBIoMBOh0+UmRI+V/6GHwF4bas+5jINQ+b2V38q7WFFPWWiunOw0VcFS0s
         lQqo59oSuq0SZT0DQAua2W6mkfPUyjeyX0XkS9y00+G/VzUiWf+s/4ARIGQ8IImkwf6S
         CbZA==
X-Forwarded-Encrypted: i=1; AJvYcCWMxSxAgiTcLDIWQlFMgWGdyhzRygQKONaJnlwHxT0RoKHRG/7FeByYAs4HBUHK2vJjAeLc5ReRohrMfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeew8aKnCcw9SX/r08MK+fM+QqGLk1sHr7sVdTOztlR0Jffxrt
	Mf4kS1og4Mj/1gMqm7r5CONySpJcs0CuSWvlKUzrzyJWUQjicXJZmuMz9Wq585T3Vb7U/mvkW3F
	WO6KyGHI=
X-Gm-Gg: AZuq6aLPKQhQSNiOilV0r9ZJS0ieiNjpSMOo8toqExIU7Dvh/2k9DaTCjAcdqxLJU9z
	lPleRZ4oogYD0Hi5fN3WCLvWHbraNcWSXvkwQOsyPOsTQiXy+eqSQCkaB0nepaGQbymwmNekYPR
	fnw7XYcj4Uhc/G8U4Os9shcOSGaTJ2N9xPaIfUDhOt3oovSVB19VFRPeBzbiV1bQevFlI6UlA21
	IB0FERMqa31I2DeKKOWn8HLEP+OXbC3JohCCO6ZhIW7/ZOaTPWUtQWQ3mz4DDg3pqmikhcTlvhN
	Q/3dyaDTFNGwB9YvZjE77JQlDjeB1fYBRrobpMVbs+B3BORt4S+CPG3/Ry3600DoFvLr+ShEi/1
	iB8FFVmYNf8IdmhsQw9/Z4HmMn4blLQ0y92uenWzQi9EMar7L/xYkDqCBBt/gRBnK4wijOgZQQi
	3ZcE42agdtcR6S9o3JLz6nMvgvEPe6hCDcn0gxb0kFhSZjsMKe6v4Xotkg78tUsQGJkA==
X-Received: by 2002:a17:907:1b10:b0:b87:7b75:5637 with SMTP id a640c23a62f3a-b8dab3b00c9mr392020266b.62.1769603214028;
        Wed, 28 Jan 2026 04:26:54 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm119536866b.46.2026.01.28.04.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:26:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 28 Jan 2026 13:26:49 +0100
Subject: [PATCH 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769603212; l=4248;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=hJzi+1WVJi3bViEFfHTLerRF56fSuL0dTkBkrX7hZ2g=;
 b=lIHYjQ0cXxLLwj1T5hLZ2ritI4/NmHhGE1D5u6eSjvyTteYEuDnEs46ziWjOyej1zWV6sV2uR
 kJu2vPZOI8IAUG7IzFiZCrLTjWVw7Dieku7WJfS80m9UIGV8oXDJyC8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings for pin controller in Low Power Audio SubSystem (LPASS).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..2fa2484e7bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 SoC LPASS LPI TLMM
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM6350 SoC.
+
+properties:
+  compatible:
+    const: qcom,sm6350-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+      - description: LPASS LPI MCC registers
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm6350-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm6350-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm6350-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-4])$"
+
+      function:
+        enum: [ dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+                dmic3_data, gpio, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+                i2s2_data, i2s2_ws, qua_mi2s_data, qua_mi2s_sclk, qua_mi2s_ws,
+                swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
+                wsa_swr_data ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    lpass_tlmm: pinctrl@33c0000 {
+        compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+        reg = <0x033c0000 0x20000>,
+              <0x03550000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core",
+                      "audio";
+
+        i2s1_active: i2s1-active-pins {
+            clk {
+                pins = "gpio6";
+                function = "i2s1_clk";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            ws {
+                pins = "gpio7";
+                function = "i2s1_ws";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            data {
+                pins = "gpio8", "gpio9";
+                function = "i2s1_data";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+        };
+    };

-- 
2.52.0

