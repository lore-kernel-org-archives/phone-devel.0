Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F72D9493
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563975; cv=none; b=RnCeCcyBOTLbAsQ+jZ/YGjW2jazIpveEIF6t2CU2nHdBgwMR/SGcAbzpjtn63F2wAgiCH/hk6g8Is5tHww0avHxro53B+mNr7g2vH89Tt/weUM1H3BbeyE/S1kBS7Qp/KKqCAWDzTS0wN0n2pMXUQ39PMfS6NuDPjqISDF2DG/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563975; c=relaxed/simple;
	bh=CiLnJnnUrfqRenJj+981Vs9REuGXiJVfcw8J0barKMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/J5+Si/hPO2FiU1jBqvHzpueZ2TfeYAilczOEdJAIo6iAO5vNqm+Ntx4YBK/BCKCeFoq3KDrueH+AHRNGI5k97X4uwCjkzOdvw9gds5C9eBsmhjoY5GfENq6ElWC2D2YpICKPvg+Ad/Giniuui6xmasQtHcNmBezMQJyaZ5L2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DcdJlQ9X; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DcdJlQ9X"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo9215570a12.3
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563969; x=1753168769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcfQqYLe3zmIGP6Ac4Qc6scoF3iQeb2uH1PNmMZXhL0=;
        b=DcdJlQ9XG3X9lx0xLZxqkgbr0+gHULzedYjK9uCBULdmZMBsKoIqA/v6bjnJ+tiWrV
         t44H5RftunfRSYJ9ApRvCmRTVnGY5F603dFietodfP8daW2ACX1IJtTE2BrC9MIm752e
         aBNy78VRknb4cZlRq9z5I7lSfvH0nqX9nXd36UQz74hubaOiQnIbnt8f2ECbgqvhjRuz
         gYwLfK/lESfgcDywOw4ZtsKnjJVqgBEu79zebXViaSzkunU3MeLUBHuR/nNS64Mt4LQ6
         lBdU67DNtPtWm3+XE6Rcm4nF7wvHBFSn5O8Q+HEKSjfe8eFXeWurmH2yfOWleW0tlPZb
         KS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563969; x=1753168769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcfQqYLe3zmIGP6Ac4Qc6scoF3iQeb2uH1PNmMZXhL0=;
        b=PZNX5zYlBjsgGN8BZl1u4FlFgbNG5F9Dvv7+abbYrYU+QrgQzoO2BR9R6TJddgqup6
         8d3cW1p+B+NJpGdiPF8AZDeI63EB7VCmbwy4jRGaL4VxFVMbLMkjgRIvFTbpUzFVPmek
         eAjlCiTG2NXLRA1f55r6hawvqllPmg67WzYrlgqvQzjZlD7/6d+suc0ty5nB5vnvUKgY
         G8L2XbVf13x/fnL89FAEyYz4YMw2TZiM5ibbYcJpvV9Z3kehhfWDsGtjWw5mloF1wT+Y
         pxMLcrz0BC5oPoB4ZMRnZHQG9Afdbr/xeT3FRGVdUl1FFmZ0L1QLU5ZfR/F6MSMaQPTn
         Jabw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Icz4sAkrNt7sNmNbiCwdPMpSN/YWzlfI9GSy4824Zi9PFFhstmkQHuFagus4b6J7CV+OH2oxJtB84w==@vger.kernel.org
X-Gm-Message-State: AOJu0YziMRd4XoYB1IUR/R+TzVA9DIzcU9VclqABMmMpXzRiGD1U/0+Y
	Jh20PPRyS7jqNGjCUvlBH/5Y+Pb7CMg9QJZisN4OyMxLjVj43EXjkJ+4UM/x3zJfCGbnreld5vn
	zhCdy
X-Gm-Gg: ASbGncuaQZbGa/YRfyV3uMxCZdwmIkNJee372jZPVs30AnxUou8Vy5zdUXYUufhR36j
	qU0hSDFOXGrQJaLqD5DZIxGlN9G62gTOELfaIbG54RlNwpDNzwGn0eRFbVInRpSNSAy+w6buyCa
	pwoB7mjUeG4L/k3nDHUeO+1kSwck1xkSEIFjg+vA2G1JjhU3H14AlzvFkur7Jz+Fb3cVeHlTF1x
	qaDx4EaSeJppfL4lr0fMI5lG/Fp5EAK3OnyqH3zrd8EjHhemv8RhiWOZG7bw0u5214GbQ+EEsf+
	zrNwZ7MAmGCmit/BftKUJMXP3sbcElio79/smMAbi4RM6Jg5oB2i9U/Qw1hhx//wAh9oztMG/CP
	G4RNDTaU8lCt+CDht/EPZ3gFWeu3fip78yaT40DiZiIIt30Iu+usPIMt6
X-Google-Smtp-Source: AGHT+IGqhGp56tVmzfJsu+xrpGc/fQR2gSpYpE7uD2xa7nnJ/A/Mjq5oXuFg53VJ1sr31mXo0sfU1w==
X-Received: by 2002:a05:6402:40c7:b0:609:9115:60f1 with SMTP id 4fb4d7f45d1cf-611e84a9cabmr13048623a12.16.1752563969337;
        Tue, 15 Jul 2025 00:19:29 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:28 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:10 +0200
Subject: [PATCH v3 10/11] dt-bindings: clock: qcom: document the Milos
 Video Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-10-18f9faac4984@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=3601;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=CiLnJnnUrfqRenJj+981Vs9REuGXiJVfcw8J0barKMU=;
 b=US3XVRm8A5UmyOXxkhOQwajQxY/HeHuBektXtw5i5s4xc4rE+276irs9sWeSLVz+gZ0ezPOwz
 3Q+dzzGxoMdB5s/FextWXFFFtWc+IXJQ4enLrYdUnj/eNvyaVZlVHDd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Video Clock
Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 53 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,milos-videocc.h     | 36 +++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..14c31efe1308aadbea61eb7be7e56039a923aec5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Milos.
+
+  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+
+properties:
+  compatible:
+    const: qcom,milos-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,milos-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,milos-videocc.h b/include/dt-bindings/clock/qcom,milos-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..3544db81ffae6fb7c72b123063b9af4337742054
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-videocc.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MILOS_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_PLL0						0
+#define VIDEO_CC_AHB_CLK					1
+#define VIDEO_CC_AHB_CLK_SRC					2
+#define VIDEO_CC_MVS0_CLK					3
+#define VIDEO_CC_MVS0_CLK_SRC					4
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				5
+#define VIDEO_CC_MVS0_SHIFT_CLK					6
+#define VIDEO_CC_MVS0C_CLK					7
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+#endif

-- 
2.50.1

