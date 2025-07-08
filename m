Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC04F26A084
	for <phone-devel@vger.kernel.org>; Tue,  8 Jul 2025 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751970053; cv=none; b=t/00E2fX22R/oHYLd/gCvvyHM/2/MLdoZh+zQZB3GgEdNF5+WQyNmnEf0wyqQLCq0Ex3Zmq23AZ5Q6kVk/AcYbnrXLPWmNME+5euR4g0J+d33Ul6/Ydv2MxfJh2gXd5IefkEkOLMTW5hYG977HRqoktXcdiCgBD9dKx9FWT9s64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751970053; c=relaxed/simple;
	bh=ElsSbEJA8AwkIPqQIMKrRL3D14OLtVaNEYmPEIsjV6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sTOz2IppsOmKA/SmtsjvJXheqOBOT6stRPjYGUkz7LkJw4iuhElOm5JkI9b0Ao5y98Ix5r6671zDt3VWCDELKol6qppSBHJObhyqEwmEIrPgYq7X6ir2bghG3j+bIlVURaJ5gocy+QV+Zcq7PQrfx148zLRlN9SIA+wc3K6Gd8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WC8jT2x0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WC8jT2x0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so7763215a12.0
        for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751970049; x=1752574849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZRPMb+8cA2V0dYbf85NqITawJpU2dKEA/V8oIyC7gE=;
        b=WC8jT2x08aNN2VotvNxOGiaF6UCxAkhu2oBsTzjMc18ZBvjS8DMy9xZLPXEd20CrUR
         xCn4LZJViS5vlg/0hLzPVapEoifarfsGnd1o1UtCASnLv6Ge3tOQ79xQwNrB12u1+H4e
         J41vrk1FSuO1xo8tk3//M0dGwgCpMdmh24J8Hmxxv4wKwDgih9p2Q2xRvEipDq92/rXN
         rQzcWTb2O7cKDAd+fji6lZY5mjVIRH+kGSdMtoFkm5Pk0iNvsSUicrqZfqels9Ai2Auw
         dIuhZtS5Spr/JsXSBFOErkpg4TYTj4aknKp87+NOiEY6q8g5ReoQAlYmod1YGAeDpWzg
         yW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751970049; x=1752574849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZRPMb+8cA2V0dYbf85NqITawJpU2dKEA/V8oIyC7gE=;
        b=aOT8Ka6o1ogUdVYiHKSSQdwMY8dDTpCj5v1ijcWsm8ZllYIG7OdeRmyUfVCokaTaph
         IJ95ggiWlxWvo4CawOEckcAfWesnzm1JStNlAMumg7+osl4il6EFWFrMGLB1RCiMO1w7
         rygcOEhS8QkNyR2CVy6JQw6gs/RxdAeY9kLQaHOwPabNYXu7BkPcik3dChFgP2rlgYc3
         fiZxuEYD5ctFrCY5YPgsKmJyncLVZsd5VKnlojgc7fi4gD7pX6TtKTlwop+OzGbZNnBi
         g4XmNZy4YCFWYqH7se7s/d3AGxep/ysNSUZjPMt7/Ay3Md465yGy/NPk0MMdeAH8wTRn
         Ayww==
X-Forwarded-Encrypted: i=1; AJvYcCXkJcgarMMtGOMgQLS5XGnqGN1J7faCOI+m9n/OUdQsAMejCCUYV5dFZ1izguFmramcoEc4/jsPJKqZXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvRLTS980CNCZK19SFFPnVsvt8QLIb/mb3PH6I1W3Mj28thLeE
	I0DwPuuEvQZx9oXH/gA0K+aX1Jd5P7zyAhZHRJUj2Z+4Q7/LI0Ydee1gga+onmHyMvE=
X-Gm-Gg: ASbGncte46Ri96fYpdD0rY9y6uBevEomNEPOvKK3zvZZyjJIA05BqNb4RtjF9mlO2NO
	QvCpZyGtGcdkyGRaQZm26sLG2uIN9eNA83NeKOSxxgDs2erln6Xu5TOexkSpt6Z+XS6h10mp0vE
	0p8HW/ZX2XgT1ae2snBqy1MOeIuZT4EsGX4eQmRunU4VHIZ0rLgDEOZAk6eBl0h1TmVwRoCr4q9
	lFK/fis8b3OwMhJOZxXJBI5ZWH/tLAvRvKi3VZ04grjh7Zx8vN2kjKz7Uetru/cWFGTdyNFdLlU
	BmvYxdJlbr96CNOTTujwW0pIbYme9piGkNKN+Of1JYGoCD7pjg1qc3fuDBnLqgHfX8aeRyQXAOY
	RfUc8rbshq7b/swim+rZBiDtSB7i5soBH
X-Google-Smtp-Source: AGHT+IGyKzQH8EiBpFIhcuyhJlSyvXgEUEiArxviPQcv8WrFOXy9pqEjBUm18kdUsJa5c3MVQPpsjQ==
X-Received: by 2002:aa7:ca57:0:b0:60c:3c19:1e07 with SMTP id 4fb4d7f45d1cf-60fd6547550mr12283965a12.15.1751970048867;
        Tue, 08 Jul 2025 03:20:48 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm6827718a12.75.2025.07.08.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:20:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 08 Jul 2025 12:20:37 +0200
Subject: [PATCH v2 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip Interconnect in Qualcomm Milos SoC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-sm7635-icc-v2-1-e158dbadb29c@fairphone.com>
References: <20250708-sm7635-icc-v2-0-e158dbadb29c@fairphone.com>
In-Reply-To: <20250708-sm7635-icc-v2-0-e158dbadb29c@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751970047; l=8656;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ElsSbEJA8AwkIPqQIMKrRL3D14OLtVaNEYmPEIsjV6A=;
 b=C6G79KccVkv/zZjZnaILGw7g97dn1M48hVr6zg7nv1HbRT1yP5GgUii8bosLa3Jwp6lr3dj2E
 WNipKvPeUgpC/x2/PGMey3jmOW1MzihmGK5GRc4R5D181Ii4k443/+P
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the RPMh Network-On-Chip Interconnect of the Milos (e.g.
SM7635) SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/interconnect/qcom,milos-rpmh.yaml     | 136 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,milos-rpmh.h | 141 +++++++++++++++++++++
 2 files changed, 277 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,milos-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,milos-rpmh.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..de11ddec6c233d1391ff5ff3569abdadd3d0d3a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,milos-rpmh.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,milos-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,milos-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-aggre1-noc
+      - qcom,milos-aggre2-noc
+      - qcom,milos-clk-virt
+      - qcom,milos-cnoc-cfg
+      - qcom,milos-cnoc-main
+      - qcom,milos-gem-noc
+      - qcom,milos-lpass-ag-noc
+      - qcom,milos-mc-virt
+      - qcom,milos-mmss-noc
+      - qcom,milos-nsp-noc
+      - qcom,milos-pcie-anoc
+      - qcom,milos-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-clk-virt
+              - qcom,milos-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB3 PRIM AXI clock
+            - description: aggre UFS PHY AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,milos-aggre1-noc
+              - qcom,milos-aggre2-noc
+              - qcom,milos-pcie-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,milos-gcc.h>
+
+    interconnect-0 {
+        compatible = "qcom,milos-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@16e0000 {
+        compatible = "qcom,milos-aggre1-noc";
+        reg = <0x016e0000 0x16400>;
+        #interconnect-cells = <2>;
+        clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,milos-rpmh.h b/include/dt-bindings/interconnect/qcom,milos-rpmh.h
new file mode 100644
index 0000000000000000000000000000000000000000..9326d7d9c2a3b360aec62797963de9b07b8f6f9e
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,milos-rpmh.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MILOS_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MILOS_H
+
+#define MASTER_QUP_1				0
+#define MASTER_UFS_MEM				1
+#define MASTER_USB3_0				2
+#define SLAVE_A1NOC_SNOC			3
+
+#define MASTER_QDSS_BAM				0
+#define MASTER_QSPI_0				1
+#define MASTER_QUP_0				2
+#define MASTER_CRYPTO				3
+#define MASTER_IPA				4
+#define MASTER_QDSS_ETR				5
+#define MASTER_QDSS_ETR_1			6
+#define MASTER_SDCC_1				7
+#define MASTER_SDCC_2				8
+#define SLAVE_A2NOC_SNOC			9
+
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define SLAVE_QUP_CORE_0			2
+#define SLAVE_QUP_CORE_1			3
+
+#define MASTER_CNOC_CFG				0
+#define SLAVE_AHB2PHY_SOUTH			1
+#define SLAVE_AHB2PHY_NORTH			2
+#define SLAVE_CAMERA_CFG			3
+#define SLAVE_CLK_CTL				4
+#define SLAVE_RBCPR_CX_CFG			5
+#define SLAVE_RBCPR_MXA_CFG			6
+#define SLAVE_CRYPTO_0_CFG			7
+#define SLAVE_CX_RDPM				8
+#define SLAVE_GFX3D_CFG				9
+#define SLAVE_IMEM_CFG				10
+#define SLAVE_CNOC_MSS				11
+#define SLAVE_MX_2_RDPM				12
+#define SLAVE_MX_RDPM				13
+#define SLAVE_PDM				14
+#define SLAVE_QDSS_CFG				15
+#define SLAVE_QSPI_0				16
+#define SLAVE_QUP_0				17
+#define SLAVE_QUP_1				18
+#define SLAVE_SDC1				19
+#define SLAVE_SDCC_2				20
+#define SLAVE_TCSR				21
+#define SLAVE_TLMM				22
+#define SLAVE_UFS_MEM_CFG			23
+#define SLAVE_USB3_0				24
+#define SLAVE_VENUS_CFG				25
+#define SLAVE_VSENSE_CTRL_CFG			26
+#define SLAVE_WLAN				27
+#define SLAVE_CNOC_MNOC_HF_CFG			28
+#define SLAVE_CNOC_MNOC_SF_CFG			29
+#define SLAVE_NSP_QTB_CFG			30
+#define SLAVE_PCIE_ANOC_CFG			31
+#define SLAVE_WLAN_Q6_THROTTLE_CFG		32
+#define SLAVE_SERVICE_CNOC_CFG			33
+#define SLAVE_QDSS_STM				34
+#define SLAVE_TCU				35
+
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_GEM_NOC_PCIE_SNOC		1
+#define SLAVE_AOSS				2
+#define SLAVE_DISPLAY_CFG			3
+#define SLAVE_IPA_CFG				4
+#define SLAVE_IPC_ROUTER_CFG			5
+#define SLAVE_PCIE_0_CFG			6
+#define SLAVE_PCIE_1_CFG			7
+#define SLAVE_PRNG				8
+#define SLAVE_TME_CFG				9
+#define SLAVE_APPSS				10
+#define SLAVE_CNOC_CFG				11
+#define SLAVE_DDRSS_CFG				12
+#define SLAVE_IMEM				13
+#define SLAVE_PIMEM				14
+#define SLAVE_SERVICE_CNOC			15
+#define SLAVE_PCIE_0				16
+#define SLAVE_PCIE_1				17
+
+#define MASTER_GPU_TCU				0
+#define MASTER_SYS_TCU				1
+#define MASTER_APPSS_PROC			2
+#define MASTER_GFX3D				3
+#define MASTER_LPASS_GEM_NOC			4
+#define MASTER_MSS_PROC				5
+#define MASTER_MNOC_HF_MEM_NOC			6
+#define MASTER_MNOC_SF_MEM_NOC			7
+#define MASTER_COMPUTE_NOC			8
+#define MASTER_ANOC_PCIE_GEM_NOC		9
+#define MASTER_SNOC_GC_MEM_NOC			10
+#define MASTER_SNOC_SF_MEM_NOC			11
+#define MASTER_WLAN_Q6				12
+#define SLAVE_GEM_NOC_CNOC			13
+#define SLAVE_LLCC				14
+#define SLAVE_MEM_NOC_PCIE_SNOC			15
+
+#define MASTER_LPASS_PROC			0
+#define SLAVE_LPASS_GEM_NOC			1
+
+#define MASTER_LLCC				0
+#define SLAVE_EBI1				1
+
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_ICP			1
+#define MASTER_CAMNOC_SF			2
+#define MASTER_MDP				3
+#define MASTER_VIDEO				4
+#define MASTER_CNOC_MNOC_HF_CFG			5
+#define MASTER_CNOC_MNOC_SF_CFG			6
+#define SLAVE_MNOC_HF_MEM_NOC			7
+#define SLAVE_MNOC_SF_MEM_NOC			8
+#define SLAVE_SERVICE_MNOC_HF			9
+#define SLAVE_SERVICE_MNOC_SF			10
+
+#define MASTER_CDSP_PROC			0
+#define SLAVE_CDSP_MEM_NOC			1
+
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define SLAVE_ANOC_PCIE_GEM_NOC			3
+#define SLAVE_SERVICE_PCIE_ANOC			4
+
+#define MASTER_A1NOC_SNOC			0
+#define MASTER_A2NOC_SNOC			1
+#define MASTER_APSS_NOC				2
+#define MASTER_CNOC_SNOC			3
+#define MASTER_PIMEM				4
+#define MASTER_GIC				5
+#define SLAVE_SNOC_GEM_NOC_GC			6
+#define SLAVE_SNOC_GEM_NOC_SF			7
+
+
+#endif

-- 
2.50.0

