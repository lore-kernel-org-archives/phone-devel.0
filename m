Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D0367F53
	for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533054; cv=none; b=ZsKjg1kF/Apo6rh25F4fJTJTttuH37JufBHlyK2UlHYsAI30yNm9tqWhPB8TkT1Kx4MxacRujy4x7jDoVQ7z/GAWE7hDG2+rR0BpmEifPGN4u5Txp6M/XZn1ZriSw8UJcoh7AtdFEdvHvweKdNtKppP1DIetB7lNLFZuv2+z/P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533054; c=relaxed/simple;
	bh=++Zm2pL/MChTSAhZsB+/yIpS7A5i7sldIEDzeeK5d+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjX3PRVf+XEPNMQ9v+xrfgDNubqlou7WIg2B/HgWUPvt0QdppcuohouEWgehqgMm5ueAcqjUW5zPjm6Sp6nZHxZjU5lnq3q2y+jh00H9hqX75jyBh0UU/ARVrdfdQxc8qggs8EEqBtblCIG7mAA1NCo4y1k9m65H5cNeTe3aVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TxFoCeyO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TxFoCeyO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so9443295e9.2
        for <phone-devel@vger.kernel.org>; Thu, 30 Apr 2026 00:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533051; x=1778137851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBbkcsBOmDIqFMej9O4JHGnof1KdN/ltnqYnyUZPxWc=;
        b=TxFoCeyOQ53bx3xLrUqFiDZ6yQtYm99YrV9s7LWpxVNTOM8/vqoy2YkNR8+ZLjyxB+
         lV8ulJXQQQJBpMekWW3/+v+OHu/bljP6qiBLTcnTNxMi8WTuK2jHY5L2NYBx+JrvHnSM
         K4sDO3DdIrJrC9apq6rvZKbXB8RL0+o5EQgZJA/hob4hier00d+Opj2gANN++dYTT9rd
         I/gEPJZ6KcXDXFGd2lvV9MMpgrHgbnvqM/sqZ2M5aJqfooSo15aB0fQKIUnH1VI5m8HH
         6ulUphi9vpuXGhx1eIZHM2hu/svgJh591GVZHbE5WiwqjklMeN0wbAawplncouWeA6ay
         +4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533051; x=1778137851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBbkcsBOmDIqFMej9O4JHGnof1KdN/ltnqYnyUZPxWc=;
        b=q54at2dEDiGvtuX8dXnhJmj1j8Z9fgc/y5ueV1WTnUlf05wjYM39LvyC0ksTHMJlHn
         dyetRO6bPMcMsMUIMoCsvatr32iXq2/488zOeo/R5QXm3mnvQ+z5iAouKa3Dt376BGqE
         n+fGw+KhStx6r/YiSm2h0Z7aDIjRTKX8SYzc6/vOuethH3DqWCJWxYQOBCNFL944H32Y
         w+Jg36UjhbdktynTmuYxK2ukQc9qsGMIneN8FLpPtli9+yvQnSHiABUtCfBcc2pbjjwK
         cKQHwcqJZtQcGqEOjVuJUdl6XDW+7cbALJ9tPD9b6bURQYquplHbxEz1MpNS50kqyuQV
         AlqA==
X-Forwarded-Encrypted: i=1; AFNElJ/6VJ4MhacX5ayvwrBfuiT2qIF5dVg1VJdSGZzYimHy8PdQSrDSisY5GqrLxxY+XcYP5vHMnNbIa9SnIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKwWLT/pE2ik/+Dpmr3koCtu+QgwR5B6Jj74OKr8eN4n08G7EI
	DCh2KEXaRBpgX1GU0z6dGwAtvl6PjPpprvS5jShXocTwqch8scrjd2DZiMkdc1Irwh4=
X-Gm-Gg: AeBDieuHZk8QYGPYryIRYpf6tQN/Q9ahUg1TsUddMWIIXw3ChJK1Ac2/+YTltgpbyZF
	xHFKqpbhkjd7SQoB2w0WUvXX9thMU3w5ntPKEWdc2qTVeizCn5rLs7KMO6vBMc5ntMXZ0W/dfNe
	k8dyU8oSp3RI77jDKeCbY7e9LbjIzDA9ZSMURwh3uPQ4Z29aYrWKAnm7LqMRXbSI+AWpfslLk1F
	2T+PIKZuxvPCedHTDu5A6Y7GgH2PoS2rfV5JuGs43d0af35SxQJ6oVaC3VnGmp0UnbPhMLhNaCT
	qNuyKzYpMLydJElk/Nb5xugffH2zRPgX6XMTHnEw7ogEECo52z2CJC2GZFj9/mXMA7FI0xZuvzE
	4cYst4Wjznwp6fIobp1Xm1V4WhurOsruC421lgRouaJnmeUjzwFbzMrEvoNnHWGeG4tqbyG0m1C
	W/BEHMXVULvyOABQa9L6+cK2eVLz0RExTc9+IJrNHSyOp0XiMf7gH7V11CdYr70C/sJVlglj/Vc
	i6QPz7D
X-Received: by 2002:a05:600c:8010:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48a8446d803mr27313725e9.14.1777533050634;
        Thu, 30 Apr 2026 00:10:50 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:41 +0200
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-1-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=4264;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++Zm2pL/MChTSAhZsB+/yIpS7A5i7sldIEDzeeK5d+0=;
 b=wCxpg9VKhtvBlcsVwO+rhrpLgpZq7Tffn+P+K4ExFHjmHauGEt94udWS7U9SIxL/oWz1gsCD8
 YAwzsMMudU1C45c+O5zWc0Fk9EldsqOPdJRynW98+F78rtn2U4FyM8S
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings for pin controller in Low Power Audio SubSystem (LPASS).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..4903b2d37d89
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
+        i2s1_active: i2s1-active-state {
+            clk-pins {
+                pins = "gpio6";
+                function = "i2s1_clk";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            ws-pins {
+                pins = "gpio7";
+                function = "i2s1_ws";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+
+            data-pins {
+                pins = "gpio8", "gpio9";
+                function = "i2s1_data";
+                drive-strength = <8>;
+                bias-disable;
+                output-high;
+            };
+        };
+    };

-- 
2.54.0

