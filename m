Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8E338592
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 07:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409674; cv=none; b=UAFiYIxBO9TSoeDc6LhfThP0Tr8Qj0mD3FMwCdSILR73pWiEb+myByOszd07v4VyNNSFCJyxVD2hOBVdj/PpVuCOxpXpb6Q4md3okgAmQv9MPD0eMotJ6izAHySb98aA7BkQ/O5dJfNZlL9aXzb0IUYynSHM8eolof1zrPFKxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409674; c=relaxed/simple;
	bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqBlZYZJ/gq/+Cu/O/bDbVMFmIy11Qel9f26qllPzMs2MXtWv0bT5DLG01OrJWZhZAtb38eDaK8m5mJDSM7cy36Km5vOuk/i33fvpBKquWCSWHN96dQU/dfQz7R8NK3A3brpPeOtTcBq6eHmlX9wf4U+eZiIEZVIAm+9gfyRlOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ypKbL/9h; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ypKbL/9h"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so489048a12.2
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776409671; x=1777014471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=ypKbL/9hVKV/zgm165L9uPUrp9LyC4sZX+h6STSboH+oGsxrbakQEQAdqSdUVGk/l4
         Tt2aU8DrjMAnoOxrKEWLURC2c7cFMbOf9qrLkjGVbb1Rl73ax7n0v1K6T2Tb9rc7bgp7
         iP/fCfhvk1I0ZXtR7KBYH1HiDIHAry+8A3eSK7x3HMciAYOdcJnxrJjIArmGiKeqKhnh
         gAQLUuhVKu1Dnya3bbl5cy2woe9zc4MWzr8sWns7tJbVyqOYRfk112bI0tiZFoJFmWR/
         6juvY5n/70YRUP5s0QvE4SP5oKbLB5ekAFftgCajuXGYK6gnHXWU5xiohE6vbabkbE7S
         wyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409671; x=1777014471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvOfVZPOjPhsoW4F3DQC7Jn5+Am3jq15qDLt0sa1MzA=;
        b=UTgMPZTVQm6KVn7EpxWRvoMz8t1sq2zmFEEK13vzhseVdwNDM7bhYo/dOmVmiiey3f
         Q5OpLhUBWykh0MQAAl1j9KXrgdnUzJKPuG8j9EvhuSXqRmDLF/pRM18vVLA28hxHrEGb
         joITgvJEC8pwKcijJZJ69ClyWybioe7mwsurVo/4wTfmca/VcwsqCGn6hAY3xu5BmjQp
         rGEDoHUE8HZS4tKLv30LhHwfkBtq7JnWGTJ0NlNVgbcbjpIVzMvCBHLN0wdBudmIpO79
         yPNXfglKXx+nf4i7dreUZxIa1/+/6wR/7N3TKJ8VL0Fg8kAn9RnAJDUhoRDNDvPcUsUC
         /wBg==
X-Forwarded-Encrypted: i=1; AFNElJ8fWB7h/euJMphLNektybh6Rbha0GhnW14zRZUxPv2kx/99LJk7Nd+J+cJwtPLNo3aGsAhJX/ZMoTQFeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX0R/O5bIdpWr9ZL5yry8dMcYUPOYXXKNKJ9mGQcTRqogbiYbT
	4Jrfi+ISObXXtuFWo4jnUO12hGuqq7efIOf5r8uQGHeRNCgvqIdQl0Rca76DhhU9Z2c=
X-Gm-Gg: AeBDiesE1KCNoe4F5o1AKOKH2nWoFfBVwYz3RJf82cXEjr+yxR/pHs9chi4I8hsIUVl
	Z25j+2ex1SfZY/1knlZ2qJoyGpCeAp+3H4wbum0H5YlT68tLWz8CvMgFNclE3QsoqAORskWLtPl
	8yxi/IPnHYSGGyzavgnmNu6Tvp1QxHavSUtA6bCSgSW3U8h96ff+CO7jWbZp/nPz8/o5D4xk90E
	EchRJg+CVWNuwVmBSggevE3RaprkCtFVbA6bpoTJ7doOir1H7PjDsJ9gHoyxplEZ1maXly7kZIl
	48MMGkYJ4vxchK9tLet+vvOCKYOLutNboYNmiKX5uTQz8L540no4tdN9+R+jSgx1gw8H5Ydf5WN
	MZNMeK4UG4D6jnHtIXek8EriipLVuq5e7+S3V01vDIjJP8C3HZDrJOJWi3UYlhvVN1MNM9X7rgy
	A4g41Pi47qvuGtHhJayOPjtjPVJIjPOPC5egmy+ljZ5INNPkCjSSuH2f1FCnqrFK9s52Ydawszw
	3FHtzmJYnsuidR0
X-Received: by 2002:a17:907:1b09:b0:b9d:e69b:58f7 with SMTP id a640c23a62f3a-ba41945c089mr80672066b.21.1776409670939;
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
Received: from [172.16.240.100] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdfd27sm26448466b.26.2026.04.17.00.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:07:50 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 17 Apr 2026 09:07:44 +0200
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-milos-gxclkctl-v3-1-08f5988c43a2@fairphone.com>
References: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
In-Reply-To: <20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776409667; l=2723;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=AMCItOgDdHgKRdx1GXTFHeaC4r97dyq4obHVbtp3GHw=;
 b=hUIxkwNCfgNBT48GTiRI3BvsQ5rtFklAYZzv51cQl26o2DQEuT+YGDpXuqxrSQEZS2UEtKPQ+
 DXfgdvp/FGZBzOFwEIAp8Nhu5X+KFyue9GP1EMWKw+uLxVinjHuHvWV
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Milos can reuse the qcom,kaanapali-gxclkctl.h header due to similarity
of the hardware block, and also reuse of the Linux driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..fbcb5d3f3e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,milos-gxclkctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Power Domain Controller on Milos
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description: |
+  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
+  Power domains (GDSC). This module provides the power domains control
+  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+
+  See also:
+    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,milos-gxclkctl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    description:
+      Power domains required for the clock controller to operate
+    items:
+      - description: GFX power domain
+      - description: GPUCC(CX) power domain
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d64000 {
+            compatible = "qcom,milos-gxclkctl";
+            reg = <0x0 0x03d64000 0x0 0x6000>;
+            power-domains = <&rpmhpd RPMHPD_GFX>,
+                            <&gpucc 0>;
+            #power-domain-cells = <1>;
+        };
+    };
+...

-- 
2.53.0

