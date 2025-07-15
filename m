Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B462D8395
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563970; cv=none; b=d7RjcPceny8Rha9ArwmopZ/C95yKbLvotxR11z2sNJgmzEYHv9cT/kucESugqlsDRXQuIgmaaqp54+h0nm3SX3Vv1j2SEB+SAKa9zJZRrImlxX5VEHqbvU9Zz8/t4FLQtC8EXQ3cll5/04hbu5uizsGTRsdXrGzeUTvfoqAs6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563970; c=relaxed/simple;
	bh=VwfqHpso1OiiAuM6DJpcct+RzKRoptkbJ13YmmDEfKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TOquRu5GZ3ndg/sALAkgZ6kbrjLTnHdo/uC2r0ZCRVLIZYVccb/0kayovhKPPFikree1WRMuAjtY9G8bGV5ca/nXmJ/Pl5Pqb2lQj3lzuG1G80VRgFV5dS4TedCFdgYY9xEANW1vA6mF9TIFxjkBnhbxhZW06bKY4CPnp+hcm4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QKCdeKuu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QKCdeKuu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so9781394a12.0
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563963; x=1753168763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebfTDkzvLDE5Yl15rpM3HQGy6bi4xkSd/6v+gonqIYk=;
        b=QKCdeKuuzotPPCj5KDzkusXsnAtpRpwUCYrJTga9tmAmxzef+mFeYMcJ4ziPXpPM9w
         eHhrKtzx+lS8kbQU9XNGhPvbLTpHxpEGqE9lh7IQZ7EJ3w4zHaMOuQVO/Qcct4x2LY9U
         LUuOjl8qbkQASOEqceDpRH8SIPJi1p10k8nSkBSDW7iC3FoAuAyrq2x6NEHJSn+D9pzW
         PgMZ7qFI6ZsNEHnbB2NNTXglrj+vXYz/aQLrH2XCwcgmT/XUqA9eRywWRiOsWHPZkyQh
         fuvrkiJjbHcNVdH/LP1wx5XrPaBZkyl+i9u1208u/YpXDh7IKKyIGxrsQuFEorEm6+6d
         6wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563963; x=1753168763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebfTDkzvLDE5Yl15rpM3HQGy6bi4xkSd/6v+gonqIYk=;
        b=fvitfCoZ+rJ40hULES8UCcULehJU2umh3mHMGxg6NRWpKUlitoCRVSiVII6ifZNhJd
         QjLroJSRO1jLIJx8zbRc8/AKe3k/HpOddUemcSnBjZaQDHggF0bwfEiFxx8ocws8aGpz
         4cZJ5eDKm5JFeBWuk9RSWmHQCuMCQKMLTXV8Mad1SRhacBSYU0+a6w56sj8qfXIhMu7J
         xt/8uytfE7Ro5Wc7YySuzarOdGK3eZ0God0xCVCojCUxTRt3yykG8EOhqd+O793s4gDi
         DzbDNw4NUcMybvs6oESUEI4NUsgHw7ZCXKsYF78pEIEzl9/hz/pt+b4H5rLPJ+FReQ8P
         aNkA==
X-Forwarded-Encrypted: i=1; AJvYcCX1avYlSpXOvs2v5fS4eF+kX0r+39yD6u5dFsTsl43/17UtYQcHyBUuyVrsR8FsGisTXLantIUOirEg7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/O8jAwPNJkt41UQl/TIFDqKtJARHWuCNepz/cT1fwwxLlDi0e
	Qsdrl0J3nN6VHNQVKvpKLvi6K88ZbActUbU7ez6mtwZ6XF3wt1vR/Fk8c66cwQX6B9k=
X-Gm-Gg: ASbGncvPStH9nitgZJEkhUYHPbY0JegaIadXXQyYUQb7djw9X8UJyCQ7LkRMOTOe0ql
	nCs5XE4CBf+xVi4vqdqhlagF/nCVlo5n7pROue1hwDpiWgU54HmTcksJQTZJ/nEuz8tlxVPCXA6
	VbC1VBv1flpJ+lw/7BKToM5y+vvpoGIjVuWvcjppQEaQzn9BiroFUo9IIrf+Uo6VRbKxlfFw9iG
	iMvh4YiXul45Fpm6/L78x7QNNxNxyE+/zA3w3UeGqCXHLZsb5vCcoL8GgwuRGO+HQOtWkloYvJN
	mKvt03rHGWdFppd1gK1Xu8LQw1dRtYZERhPDtGonrXzcHvyWG6MF4E+aTcFG4clichS5CafI31E
	ahvIO4ApOK0J2Ik+KytAXNqbHdmv7I8vYTn9N3/LBgVveAGhDJUfpQYdjSN0i56vIRWY=
X-Google-Smtp-Source: AGHT+IEzpO8yKzIUGGcqpv4AyMmLOO1LD+6dixvbi6e7JoxzmvCMWqqgGXUWVssoCXhI7a8Q2toY+g==
X-Received: by 2002:a05:6402:51cf:b0:612:3d0c:a728 with SMTP id 4fb4d7f45d1cf-6123d0cacb0mr5469396a12.12.1752563963165;
        Tue, 15 Jul 2025 00:19:23 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:06 +0200
Subject: [PATCH v3 06/11] dt-bindings: clock: qcom: document the Milos
 Display Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-6-18f9faac4984@fairphone.com>
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
In-Reply-To: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=5229;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VwfqHpso1OiiAuM6DJpcct+RzKRoptkbJ13YmmDEfKc=;
 b=c3lyzuLhuyT7u6O7LbLbOaKmyQ/j6fC4TJ3WvxMwxlfjFw0nie4El1Y+0sbnOoRII1w+nRQ1B
 LfPnfuVjsQZATWWns6vTx+MRAOIIgC6YL6oo6G4IHS2MORyCERClw4x
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Display Clock
Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.50.1

