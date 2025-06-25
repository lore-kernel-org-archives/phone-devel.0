Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCBA2BD038
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842765; cv=none; b=mupcQCQQ6zjeeVdoEz3a6r4Cr6VoQFo8dwsjEH8W1fR9NTJt1zQKioVYzHS3VFb3UcaQRuKiwjLyfI5no7ji4YmfCmgcoULL8oTQyj0MFJv+oOOUHakQf24+2RWzvODzzQlqSDakjyLz9RmtXU7mliB+Kp6IelauAI4c18pD2xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842765; c=relaxed/simple;
	bh=gxtg201aBm+5Z8eJzdDoIz1yyBREa9UOp+ZWLfQvxg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LlcFJYOBZZvGM+Ewq15DeWO8tpCVkUmmR/Vcdic+njwJbiby0NKI2YvMF7ICQV7m/Qgq6SNlCxFLCKFtP86iqysq8LethPlv0mCSsgsB8EWWN5dr82hN+mwDTtk3Ac6uXMGcU/8lm0GApugEr5ICQVv8rzjMLNZEVXKIzQbYzok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UTsGGKbx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UTsGGKbx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2bb25105so1002742066b.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842756; x=1751447556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHYFSQkXRlX9Zz2sIOsyjqI7IiGvUpVJLGuetT9o0Cs=;
        b=UTsGGKbxiouqAC4jRDYM1vRm/7ByzEn/qa1PQN6Dc8ofr3u/Xe7x3lgppMa2wMdbjU
         gU8oA8aPssOSGyI5NVNxjIjHj/LGFIMBBhgDzVVtVTEm7qwJdWQ6pv21TmKyxa5t3Rig
         PGa7BFebXNb4Jwf4OFw/AbVj5uAvaUAz3U0t2UA7cZxI15gAOvxJ1xaJf3sM/uc+lbFf
         qe9yr4JTIsUdo1F7By8E1aKyVz2ts/dZvi/iCl9jtXmXs6P2l3rb3OUrO8KQN7Rp0zIM
         Ng2qn99kgZoz0dewFlaDv07Q11h8/FDMvuJ4Sqo6qtHOwlhS4Cjt5QQdHVy4g66Y383D
         XzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842756; x=1751447556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHYFSQkXRlX9Zz2sIOsyjqI7IiGvUpVJLGuetT9o0Cs=;
        b=EIE3HGs7GsP0xLeo8tdxDk10Va3o3c0taIuL68TMRzZNG3n9A3MnRS7iiCOfX/ESm2
         R42P0JzIdDLLdXiUWPQ+4vBSvfqRV+DrU1sX1yzYDh7V1aX0JYupIfSVUaIvp6bcA2PG
         ZH2msE/tkwQGMP3xHKCA8s7pBENL9asLf40XnzbMlv726XJeR2D/mthIfmi1Ji1fawMC
         rzmH5GGTJmBkQGnrYFL4RJ1FWgQlrVPQQy0DPvFt740Jy6gm3COV6ipcWP7FtR0th+md
         nJhzQzDJB3evwAItmU2FFHDaeABCy5ExflaORDXia9norAmuHcVxuj1piKaZPoyOpo6P
         ikFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSyaxwsq94JCywsTQe53IX1ERMvolUi5OYRIC7Jh/zZDJPuvcFKkD2OO6CF9S7Z0a+T0DfWYE1t4NBUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuvNMOvN3m1VDzdgduAeK1EACwjv72g6KHYYrzcr95KTr2mW2C
	DLLCdde3B/W8aDHVozlOpMTj8IxQ6Taa46TJ1tm+wJ9QU3Qjv3lNQgHemS6aV4f7wkY=
X-Gm-Gg: ASbGncuyPJWolxbzSxXdTGYJjE52u7mIsjJVmtRV/xIy+qk9hGo6kna3vcetUdVz7BP
	tUnHahr2pwgv6TFdpxtvbsudoxmZ6ajQdmNdpTjPbfRTqeProSZ/n/JNwfSTCM9nYb9dQvSnpFM
	Jk6pCAx8dtziePs3uvsJofRAraw0WsIN4WgoOaaw02GFnTUr06sM9/bIhE9aH8KWnWRJKj/4RMx
	7hW0YVic1Gc6aQWqcbwLpz+Ket2HUiy3gfS4RCMa0nr0UimKIalOfMMHcKRqyqu8L75a9uNqKDG
	XBSmMOYO2mVIASo2T/n5hK/f/Y3Yg7K6S6hDuYCKjKEjBSss6Nn4Gzl8aFzydTcsPYiDr/Drmd5
	oZZTUWGwufHGc1M9F9ulEWlQHf+JaU4wq4QslsaUmHtM=
X-Google-Smtp-Source: AGHT+IFrGnnkQstSbRlEF8WBbnON92+br2f7dc6XqOTKL1pmUuWnSAMH5ZM7fyE1vBhhj8djjPbVNw==
X-Received: by 2002:a17:907:7ea5:b0:ae0:635c:a402 with SMTP id a640c23a62f3a-ae0beafa37emr208625566b.50.1750842755674;
        Wed, 25 Jun 2025 02:12:35 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:25 +0200
Subject: [PATCH 07/10] dt-bindings: clock: qcom: document the SM7635 GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-7-ca3120e3a80e@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=3428;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=gxtg201aBm+5Z8eJzdDoIz1yyBREa9UOp+ZWLfQvxg4=;
 b=5giMQ60oBVzGm52aZ9QZ1NGyfeDJZVofnRTSCl+M6h4tNqtgEAWtk+VURh3UlnPpfjid61AMH
 CvoWqYjzYSnBdiDo5PI6/aLSDlsxuIwEyCxw0/wmifKSrMEh+yBrgkP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings documentation for the SM7635 Graphics Clock Controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,sm7635-gpucc.h      | 56 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 02968632fb3af34d6b3983a6a24aa742db1d59b1..26a27602c14669cb8473002e816d1e553423c88e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -16,6 +16,7 @@ description: |
   See also::
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
+    include/dt-bindings/clock/qcom,sm7635-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
@@ -27,6 +28,7 @@ properties:
     enum:
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
+      - qcom,sm7635-gpucc
       - qcom,sm8450-gpucc
       - qcom,sm8475-gpucc
       - qcom,sm8550-gpucc
diff --git a/include/dt-bindings/clock/qcom,sm7635-gpucc.h b/include/dt-bindings/clock/qcom,sm7635-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..804ceac32bfc0399c5c759c865e54fcf04834c75
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7635-gpucc.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM7635_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM7635_H
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
2.50.0

