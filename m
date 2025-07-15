Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFED26D4EB
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563972; cv=none; b=G21fC3GPHN3MT1vft0LHYCD0ABp2CFBoLBOY4zu6pKbbc8/3XVK/oYHJ2hcnjEPGacTI8o689T7exOPHUSWnI9Srhnz4PXCkcKmr9x2lIU+1Nlai8nsaIhRINvXRBCgtYuP0btYeyaf0xWX2rU3Li49ROc16FEyu1xY8xMFz6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563972; c=relaxed/simple;
	bh=Dj7sJeN7IOMWaxLq6ehLlqQkX01AbHnqO+NBstsBfoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vpu99PYH/9I1sQeN0eVqJOsWajidyddt3e3poGX5BA3+8ZrAdST60XAlqepRya2DHRjKM/PvPJxDogYqebitrDgbLeh39e0lWcg2u5CcdEdc+c10HTKEncNznWQM0AhpnJ2mYh6UDHKqrXjzC5Gb2un02FNVVstJK3UNiO/YBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nbwXRoAb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nbwXRoAb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so10645489a12.3
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563966; x=1753168766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5E4pO8p5egnj+urqAyIweuvaL8G96FfO79rMHUS8W8=;
        b=nbwXRoAbS+lHS3h5pLvtGWLCDm30GsWLy7buhZUKmmnzhTJUju6m5uCG9GlPMQb3lY
         3w7NiIRHsOen4pvImuH+8USfK1MMhtbnA/vIdiqlQ5pp5i7OAdZDC7f+YL0zEzrskQp5
         iWQ+cvVPuf3jmA6/qQrgQ2l3rgvIAEmhhVAX62U1V3MutRSmq4vfY0Qj0tBEG6BU8hrt
         usoHxcVX3uxGuMlyexGdaIr5kKIfyQdD6A0KnwwF+jsC8zPf/4zUgv4jncGuSnSypmKE
         ZIqemAjM7zsJxXxZ4RRgFMJPe7bz3palxhHUAwwI9y898bBVdvO6du4H7+NwEuNO9COX
         vOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563966; x=1753168766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5E4pO8p5egnj+urqAyIweuvaL8G96FfO79rMHUS8W8=;
        b=nNlGa9gp2ItPxl7dfFT5llzMrxC/amVQKMVk6P5GVjJnbL1poZejjusivoJJcf/SlV
         rh7lB8w7pbhBbEIyprD/+S1vt8Taxv7JThoPkhQXgU4DwDEhv2LAZBWatI3yIsLUOgV6
         pdDESYHoflhdoNeREWcYpPjERAo9O7YxqN/9aj/OIJY/clabW1ynNy8fJdzozMknSwOv
         WveA7jOB1eTjYEYc0txAQtc0PqwI4BHyA5MtW3KPrFQ5hKKoPLaV052l4oPD1ZT3fHEO
         Z1o79SYX2w5t7yn2guRAqK3oEf6qYJvdhwdtlNrQ+oFAPULGmj8NQfrerZZuzMugrpM+
         1lYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMfyq0aAdlL1LeKW4Vvi6VuokwGUG1qTUXBLXLw6tPQRtCI1R/rBhmkbN9twPV7EcE57TcWt89MYYpUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0r/11gKtgN0oMGPoZ+wNts+aDckLKUyfcEyg8SvxaS4bIWH32
	58FhhAA/79DN/N5eOG0LCz06r7N9u/L58dryhUqwY1e3zpTglx4JvCvh8zGAtAvTDts=
X-Gm-Gg: ASbGncsm1S8SDVJpjFH7Rfsf+YYVrOnDTkPr7GXEJ2WCOfjAWein8SgvlwRj9ndpg+4
	2OGNQwNQ7Y1cpNljUKDt7oqUzopOUsmCgX/Ck1BfpGytpq/j4wHI4SQI039Zn9W2izaNeDf0rML
	jjv7HJL7bO5bMWcx7dle8x5mz1n7Gk940HNM12WDU1MdsfV6RTPGpK4htYz6tKH+G1FQi/JcVgd
	vOyFix1+0NK8ifeIGkyPS3AKeyZOdE6rJmg1z5TC1QcD9GeFRzpxpAZ3Ifog11c9tcEjlDAk5r1
	b8jzvt7SkmTSihx/7zpoDY1VhnPHlRZd9KX0IwumlIoQewKtuhv9N7Y8CI3As+5odWXz+/KaDkd
	zaq9h2JLpaW3c2G6S9oBUf9h9sPlOcDWstyPHkIU5XY/gFq4L75jr+7xchi3MC9G8j1U=
X-Google-Smtp-Source: AGHT+IFM/MkD8xwykZKz531GWjehmFKVZTOEfKFLvrwVBI0R1l1MW9Yb4+xhBU2yAumwc4Gpx7aMgQ==
X-Received: by 2002:a05:6402:40ce:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-611e851653emr14396269a12.33.1752563966261;
        Tue, 15 Jul 2025 00:19:26 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:08 +0200
Subject: [PATCH v3 08/11] dt-bindings: clock: qcom: document the Milos GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-8-18f9faac4984@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=3408;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Dj7sJeN7IOMWaxLq6ehLlqQkX01AbHnqO+NBstsBfoA=;
 b=xnUcse+3mwGuObLkcgB8oveGCpUBnXQvIJoE94ldQlI1Y72gZ0PXQMrQirMqejysjEQAdh/zB
 9kV+kZjRayfA5dz34+1qfRUfI3MlwQ092yEkaDftAZVywVuok0Se4PK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the Milos (e.g. SM7635) Graphics Clock
Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,milos-gpucc.h       | 56 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 02968632fb3af34d6b3983a6a24aa742db1d59b1..44380f6f81368339c2b264bde4d8ad9a23baca72 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -14,6 +14,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also::
+    include/dt-bindings/clock/qcom,milos-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -25,6 +26,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,milos-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,milos-gpucc.h b/include/dt-bindings/clock/qcom,milos-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ff1925d409fcf3a0930bdb01f06b13218b0e3fe
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_MILOS_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_MILOS_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0						0
+#define GPU_CC_PLL0_OUT_EVEN					1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CB_CLK						3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DEMET_DIV_CLK_SRC				10
+#define GPU_CC_DPM_CLK						11
+#define GPU_CC_FF_CLK_SRC					12
+#define GPU_CC_FREQ_MEASURE_CLK					13
+#define GPU_CC_GMU_CLK_SRC					14
+#define GPU_CC_GX_ACCU_SHIFT_CLK				15
+#define GPU_CC_GX_ACD_AHB_FF_CLK				16
+#define GPU_CC_GX_AHB_FF_CLK					17
+#define GPU_CC_GX_GMU_CLK					18
+#define GPU_CC_GX_RCG_AHB_FF_CLK				19
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				20
+#define GPU_CC_HUB_AON_CLK					21
+#define GPU_CC_HUB_CLK_SRC					22
+#define GPU_CC_HUB_CX_INT_CLK					23
+#define GPU_CC_HUB_DIV_CLK_SRC					24
+#define GPU_CC_MEMNOC_GFX_CLK					25
+#define GPU_CC_RSCC_HUB_AON_CLK					26
+#define GPU_CC_RSCC_XO_AON_CLK					27
+#define GPU_CC_SLEEP_CLK					28
+#define GPU_CC_XO_CLK_SRC					29
+#define GPU_CC_XO_DIV_CLK_SRC					30
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_FF_BCR						3
+#define GPU_CC_GMU_BCR						4
+#define GPU_CC_GX_BCR						5
+#define GPU_CC_RBCPR_BCR					6
+#define GPU_CC_XO_BCR						7
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+#endif

-- 
2.50.1

