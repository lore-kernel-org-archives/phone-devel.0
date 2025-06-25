Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146129AB18
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842759; cv=none; b=sID8MdYRBCTk6EoBvUpz5uaCdtxtzNeOifY8RRTwQquJ1KIrLIZyNqbah4DDfiiTCJWHApejxLgKZapo0ETvLBUn5NmZ6pUJOUKE2sdWqNkkJeTGb6OMoLsovwwkJrFyHhQkrtgXgTAHataafdwIRq3PNoWjB28fH6EOcya5eG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842759; c=relaxed/simple;
	bh=wlfh+1W3Yk1ZGs9hBshsqvaX7PF80+ynWaNZAUcxrOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twCqy+3S0yNaweEdUcgtSmi4SQct/f3ImfhWEfBjT6yTowMzBfoMOSldrsIQyQn5ft+q5zg5IZB5sraoMMWLLOs3Q3NtmRy9KE715XUNh7pOrOv+TKC+Eb39OlzLA7bQ5NK973ER2z9x/O1xqplVxJ8fEBg5gjiKYUYbWl58t0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qafCgY/c; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qafCgY/c"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso9119820a12.1
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842754; x=1751447554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jd7xJvI8U6KJmaOFVsZsTyhneNOAXksVQYXksX57DtI=;
        b=qafCgY/c9jY29L9Tm8dYzC9McPUqrn3ozzwDmmNrfHLhgDLwA78v9Tqbh8KCOPDrNN
         QnBptuI8dILN+z0nnog14SrdkrocuD189Vi2DfMeUo4/5t7ky1RqJHQ7BW1e53MoXDjy
         jE1GIfaIlwdqpK5/AI9AewryL/Zpe6kXqlQtbxooKpQgnBR959j+rdZZOQxm0R2hAOKB
         KAAJyBNbgBqMxhbgCEmygTIL+3Kgdyygj4wV/FTi6quF6fRVCJ1bLoOw4bAa1/B1Ewy4
         D2pgDFQPOan0pYfGCOBFBwtL7mOVKxExXTaAam3G6/KcvKDgERW3GOqGP0L/K26QXMQk
         zn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842754; x=1751447554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd7xJvI8U6KJmaOFVsZsTyhneNOAXksVQYXksX57DtI=;
        b=GchaGAfd20s4gjskWvwP5HKTLbFVbm8dTw9GOZRnHMPC6Hq5at9phG9jwuj7mny3f+
         Cky2JQZeUg6W9HOleBQmMA558bcynz3me7EEAx7Fu6oJghWieVjce7Vdy39d7P2uEepw
         +J7HXWhWg8buE/cfBrAcLMIgnFlsgzVQ6yf8tlDWLJtdjGrQG74VOHp2cGS8JSwqTjCy
         Z8hY+Xit39XahKjhoOdX81O6AF0VWxzDxmVaBXWOqznweavDkFNQ0nMFrOV7RmjKBmX4
         hVsW20PWah2Dc+VPGAd9TfyixAWXBoPkEge8l5DmhnB30K//AbCaLmLP0lx7iC0yYnG+
         QWNw==
X-Forwarded-Encrypted: i=1; AJvYcCXDkZ1UrLtHlww8Uds/8ZeGuiC/c4/1/MyHnPGC+LinaGbtPQPKVFfCqtpcjoEhignxjC/KfcuKbSe+OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYDgvUktr2J1oFqHlnmzpQH82z3x0JdFMHHMU5hXmIZVDW3ppz
	YlxSCHFCKMyPwDq9PmQENpRAG/uVujF2tmVvnwwIVf0Y4pz0eM7BnmL9d4ezc8IQtvU=
X-Gm-Gg: ASbGncsbyww0Bu02y+qWumg6YCnUgX0C33uUpTLD04zx7iWFksHBZ08XkMiSg3YCP33
	+t546K5mKE+0w7/oMPFlONJk7/eWnTMcsCWpHfXw9EJuycC3EMMDNAWFFPpu7Tv8BfwccqlHe6s
	a0QiYaW9Frvh++5zZiR2a59Nc0l8FALDm64XPXtVYg/g9/9NQY9hdi/oyetiL2J8RkNS07V5SjZ
	CgzWghoyxKBV0zqgGBhmy4vtp3C2pIskG90MesSsXxsRg4GOvFI5CQQSGpVFwuo+awdRpTBzcZh
	fPDsz0KStTix0cu2mxUWuQpSr0RuHlb0nWq7G/dyvknwsvtlxM843RftJ9cfKG4vjb8PWQSCawE
	AU56U/Sfh4yXq+eKOMNUXMtknbacIwd3T4X+R+I6zwdU=
X-Google-Smtp-Source: AGHT+IGA9R8BfALsGEL7fi6xj8wmTk1kie1raycb1U6bTuC7aE6zkc7E+3LGBzH7+YPa/k68NGruGQ==
X-Received: by 2002:a17:906:1651:b0:ad9:982f:9206 with SMTP id a640c23a62f3a-ae0bea7ecacmr181892166b.61.1750842753856;
        Wed, 25 Jun 2025 02:12:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:23 +0200
Subject: [PATCH 05/10] dt-bindings: clock: qcom: document the SM7635
 Display Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-5-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=5163;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wlfh+1W3Yk1ZGs9hBshsqvaX7PF80+ynWaNZAUcxrOE=;
 b=9EBVJRQeKPjAowlzrVxQug55Udh2Z/5WYoTESXBfumuTis7QBWSPSfSP+Jbh5P/xIQH6OabLx
 oVFAOV3K46BBgX3TOC8oC2OyQjdjtakdAoNjoFH7bbKyFeaucOsJV7s
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Display Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm7635-dispcc.yaml         | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7635-dispcc.h     | 61 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7635-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7635-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d0427126bfc14b5064d3e08f26169d3408803942
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7635-dispcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7635-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on SM7635
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on SM7635.
+
+  See also: include/dt-bindings/clock/qcom,sm7635-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,sm7635-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Display's AHB clock
+      - description: GPLL0 source from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7635-gcc.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    clock-controller@af00000 {
+        compatible = "qcom,sm7635-dispcc";
+        reg = <0x0af00000 0x20000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+                 <&mdss_dsi0_phy 0>,
+                 <&mdss_dsi0_phy 1>,
+                 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
+                 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm7635-dispcc.h b/include/dt-bindings/clock/qcom,sm7635-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9dc5476eb89e8fb6a67b6413a1aa87c16ba22c0b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-dispcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM7635_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_MDSS_ACCU_CLK					1
+#define DISP_CC_MDSS_AHB1_CLK					2
+#define DISP_CC_MDSS_AHB_CLK					3
+#define DISP_CC_MDSS_AHB_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_CLK					5
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				6
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				7
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				8
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				9
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				10
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				11
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				12
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				13
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			14
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			15
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				16
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			17
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				18
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			19
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		20
+#define DISP_CC_MDSS_ESC0_CLK					21
+#define DISP_CC_MDSS_ESC0_CLK_SRC				22
+#define DISP_CC_MDSS_MDP1_CLK					23
+#define DISP_CC_MDSS_MDP_CLK					24
+#define DISP_CC_MDSS_MDP_CLK_SRC				25
+#define DISP_CC_MDSS_MDP_LUT1_CLK				26
+#define DISP_CC_MDSS_MDP_LUT_CLK				27
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				28
+#define DISP_CC_MDSS_PCLK0_CLK					29
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				30
+#define DISP_CC_MDSS_RSCC_AHB_CLK				31
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				32
+#define DISP_CC_MDSS_VSYNC1_CLK					33
+#define DISP_CC_MDSS_VSYNC_CLK					34
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				35
+#define DISP_CC_SLEEP_CLK					36
+#define DISP_CC_SLEEP_CLK_SRC					37
+#define DISP_CC_XO_CLK						38
+#define DISP_CC_XO_CLK_SRC					39
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC power domains */
+#define DISP_CC_MDSS_CORE_GDSC					0
+#define DISP_CC_MDSS_CORE_INT2_GDSC				1
+
+#endif

-- 
2.50.0

