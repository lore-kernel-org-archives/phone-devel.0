Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3690A27A929
	for <phone-devel@vger.kernel.org>; Fri,  4 Jul 2025 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613445; cv=none; b=FYX6Qt3twRxulObaG74KAc7l6xQpGJ7P9aJD/Vq8/TSsFPZvFIT0Sotf7D/ZlB4+de1kdNd+EbNzSBGxNrx2jd4nMJtxJG+9NdmbvKnMrfRnpin8mLtRD1/Dgvc5xgReaKUbL0+/LtEiRTwhm1UbonM9amcXoIzwOedD0x2jxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613445; c=relaxed/simple;
	bh=PVuKMZBgU5Gqk5noHlQNv8LiZylEEl+BlaXBoHIGVLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nodj9VI7rGrLQsv4cqctyBhVW3GpNxPOInOS5clD2j4FxbPyrq2DzKQ9/h8J4WPC6V0+Y8vcBPdhoJFBxILppQJ1F3/0YGvoYYpIakCf8sxDm7Vsb+hrCaZWsD/xthNeiev5xFnnWi1MrZjB+jd/DhfC2AYDyAWydmGGTwlS67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nc362fa5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nc362fa5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so90788366b.3
        for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 00:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613438; x=1752218238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwqyRoBuQ3n+PVcIxyl3R8nyBLP2sz/jvG3WxS9Cmjg=;
        b=nc362fa5ZzZZQnVHDQaS57JnyFLpzsfZxXg7RfYGvuc2VZR9RsHkxHkdSJNOgZvIv1
         AbDmattXdufTKWGpVp1stnfifggr/f4r7pBfJCP5Vs5pvK6t819KNcTmrfecgQnE/XDq
         /PscU+a9s1Nhtx5NS4cQoy0jkVMQ6YUD/C2hWOiirzJoFl7pQh8alBD0+EortvqQnoTF
         YwVXJEaZw5z75TI+3MbfiCzY784aa46AxaOAQos3NdiRWe2AI+bMVrtTFCS1nImM5w9m
         IgIXyYUeasPRg9OMx0I70UeEsESpoWrXyQatiKqe6MSPkVzry+2eBnJii5DqdtNeF6Wp
         7e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613438; x=1752218238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwqyRoBuQ3n+PVcIxyl3R8nyBLP2sz/jvG3WxS9Cmjg=;
        b=LqugSPZzI7JefknQxCByfb5JH+9SQ5QEtj2IjCy5mkSnnuUeFcU24ihWEV6lHS8kgV
         KqbxrOXEA+1ldsCyw2ATbQJilCxzfpy7M7FPR4olpXHrb3HCMJDaopesKMk/15iW9a8H
         AKlhpvklWPFW3pTeHSX8/Pds2tQ5RsKlz7avxW3zVK5NVofx6AGClwYZ2CLLx19JMnPf
         BiNUuYR1AyaR6LsY5g4JRIxkUI5clZczIjTtOsT6WNKILqXZ47gp2q6WCdu/q5G6i2ke
         Z7FM0eMkcpapMNd//c8l/yAXKuJNt2FjLkSERtDosuNTXavbKTt4BIOt1UuF0e4LRVHK
         0xuA==
X-Forwarded-Encrypted: i=1; AJvYcCXnyFIiqbL1hlWFA7y7ZpKxjpnx6Brdbct7iUqAyhE9ALEG1x3hS+r/gcr7UNBB0zhKLc/XpcuJhw58Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYHZBnqfZyIm4a4neDwmUxFQDymFmUYKOKyGagxRIvzSfxEDbh
	DQyEq+SFSQinC9m097cVrSQMrfxC3RwjKivLGGPyox/p4rQzMkX3yW1F0V2cvSov0PI=
X-Gm-Gg: ASbGncsambIY5riT/ps2OKETJZWlcuQSjK23ZxLfrVzc0QR27dmf6+pxRxYW7/oL+Sv
	nx0/mf98DHZkO5utRaPCOSM6UnjlBrNLpULBDSFKIMX3lJvZq9me498NwhbDdsH7ocPJtKw5IJD
	DhJy4GmJvo1gP+/LRJtXe722HeOqDGbh232v18PMev8+F9RPxVH3b8CnSeMjHJjn/fIDMsv4mCu
	8F7CI9bOwgv7NdW1TtG44CBp59ShQ+MCPF2/HJ+3rWnjpHGXW2C++o0kVTpeFDOtySlsLJAUVCu
	BNQcHu/Jcs/emwdPrqzbCSrbFZ4qvzjAwMBwkdFm4OXapf0r504cx90TVO7mgYysnzUf2KoUG+u
	WmreteHZ7CrYG90QsihT+/w/CIWZo2ROi
X-Google-Smtp-Source: AGHT+IFNEWtwqvznIxWo6mXVd/kNhDwA9dfc69BOLn/A2Z/oB25Ul8kmB1Vi8xLP+T+divSGAPgifQ==
X-Received: by 2002:a17:907:6ea3:b0:ae3:6744:3680 with SMTP id a640c23a62f3a-ae3fe7f4260mr93043666b.42.1751613437889;
        Fri, 04 Jul 2025 00:17:17 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:16:58 +0200
Subject: [PATCH v2 06/11] dt-bindings: clock: qcom: document the Milos
 Display Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-6-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=5162;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=PVuKMZBgU5Gqk5noHlQNv8LiZylEEl+BlaXBoHIGVLw=;
 b=nUvFnWIZJixuKe/GWjZP/d810LcWQ3wDIZGb1H740ps6Ek4ZylG4vpSQ3bDSqRNq/NV/8kJGa
 az7buXJq3dFCphuLQIN8kucYwNd9EGJ2k4irPrVlJJyLX1NsVCvr68W
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Display Clock
Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-dispcc.yaml          | 63 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,milos-dispcc.h      | 61 +++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..94908804756b29bab228fd539c365945bd6b401a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-dispcc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on Milos.
+
+  See also: include/dt-bindings/clock/qcom,milos-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,milos-dispcc
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
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+    clock-controller@af00000 {
+        compatible = "qcom,milos-dispcc";
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
diff --git a/include/dt-bindings/clock/qcom,milos-dispcc.h b/include/dt-bindings/clock/qcom,milos-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c70f23f32f0ad637b25244d2bed1f17cdeffd69c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-dispcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_MILOS_H
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

