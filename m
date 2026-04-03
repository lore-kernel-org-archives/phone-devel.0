Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B336B043
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217857; cv=none; b=TT79HKN22vffrpGrahJNQ2WFUvmxsu26NUTFYyZoYnwt/5wJtKJLSFdjiF8IC3Kc5oLr1fhgB//XHJ7JX7Wc6jjjN6hmnS1Gybd7a4X+4yqeTsRbkdWVuaVgWe9estniz2crr0AjaYWwqXbjo4DR6PJFumOY4nBDvL9XFTRi0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217857; c=relaxed/simple;
	bh=dKz6DwRy+I8HolN9zZODFxH6W/kWEV1820ON/rHuL/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axcTNE9PDFcCu67mAp4gOuMskRpuzbc/fpsMlBURReKEFC81ydT9JV7bMgPHuK5FsSCPqtsGYUM1hXfK+YPEJbDAmUMcNNgKR+G8+cjhd4ZbfHpGxRyOt9o6UiJ+R/EpEAf7cH5BX9/JMoR0m3IWdWJnhNGYQN0zbvmSH6hmX+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HgDvwEXR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HgDvwEXR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so18637135e9.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217854; x=1775822654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8kJFRzMGSbRY1rBaqmhzhvZeRD1mo+HmubUtJ2Qvyc=;
        b=HgDvwEXRExUust2zZs86mztSShxd0LFyHPl94bTuQWBOFlWeOgrdEulKpIpdWKK9da
         ChVZ8+io5woCySDeSVvHjVMU1u+p4SZpgq5u0GLHQV/1Yl1E/jI1B3RrJ+qioW5UOU4+
         Qy97CYF1SqQI307nazE3ptEfix/TDxEi25F61lFVVZivdwxmJ9Y/2q7/4amMP5tZmouv
         IPLrceW7sW1JX8uHLraU4SUAXSUej0elIs1JNOxiXuT8OvldkcWuyr2pbQq1NibBcGQR
         FxndASUFFc3OSfaibfk5ZrpkHEbggX4WBiPWsYW86m99IDGvFkar/r2XchTCYE3AcKil
         gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217854; x=1775822654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o8kJFRzMGSbRY1rBaqmhzhvZeRD1mo+HmubUtJ2Qvyc=;
        b=TpFB5sn9ooKyWBy2dr4aPQSFbjTulxJaBDDbSpzSWuMAc/6xiLDtSDCXndrQREcJpR
         uJBCvWnx5Jdu62SlN7XrruVqFwDRbCc4HUk75lq9+FglTdyQAkHNZ2zw4pwQRjfcgbF6
         fizMgob3jKnjGKz4On2k4qp8TzqGwjhZC6fD4CcHL1eCzaEoMN5NU67IspmkWqjyL5n/
         mD6VeszzhyVzriObEuoypstDRHzWtRYb5TwNOcIrPFcZM42WFgkvPRPhpcIK8vuOUKUt
         J5tF52VqYZ3SPp9tJX/BSNr0+91a83x2eBoFgad/lrgEeGiT1UxczMPVqPQlXeKeaSGp
         aqRA==
X-Forwarded-Encrypted: i=1; AJvYcCUFd6sdxTGMeUUk5IuYFCG97FUiN+whn+9IPiBUL0WDB5z/5tY9QV+2vmzx/ik8bIzM9n9JRBV876x1GA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu25mZOpvdvEepbmcIVbrDhfxFxMQ1/w3tf+JgyhtfURixUNmr
	augiImhiwtoj1A5SpgzkA8hDFcA3WrmDdywhK37gGA6DHY/7uskRFGSxNUBhOq7Is3E=
X-Gm-Gg: ATEYQzyDP+r7k1Lvayu7q7W+rS1vfZu+hWA9nk3/BtYh8HG/ZyBsVraNtSFAaOyfIzO
	NgkPhBg8LqIsrMilK9zlpUWKV7ZYbd+mlDrd+2FiGaYKBBieK3Qyiuvqfy6x/XOPKXEWGHe+Pq5
	8oOvRsH8Dy1m0Jwe5YbdV9/K0XqeXa/waOcxgyvcehvNbQlRErQ22po8seiaE30Tu63ZJMqMO83
	DQCSL6VQzKM5ZSpfMXhnHB2j7WhVlnF6eUM5hoZhCsbohGKqq0nfIYJqjhVIJn15o3XmShrKuQa
	Skq2RqfgQqQlc1L5W63i5uRc2hVJGZvDSUJUtynlPR5yb6Z1kOH4OPL5ar2qzblCAqQEDrvAGyM
	Ogp1dzsfPkKxYLSxGPqj6Mvzq6Z5DSTWzhgRscWcQL/EiLbLWrQWFJHi26B2blK84/oedlOmcDP
	LFjPcamUDworzgr5x6iymqLGGnOLYmFGhLzQ==
X-Received: by 2002:a05:600c:1c12:b0:487:386:3714 with SMTP id 5b1f17b1804b1-488997b7020mr45285645e9.17.1775217854074;
        Fri, 03 Apr 2026 05:04:14 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:46 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom: document the Milos GX
 clock controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-1-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=2653;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dKz6DwRy+I8HolN9zZODFxH6W/kWEV1820ON/rHuL/4=;
 b=ZWrhOaL/bOAb87rLQ6WBvjaaGxxQRMURRoHdO31wAzXyBY2so/9HvHQutRfD8Odap2pLgA5uS
 YZ8DVhiwCDmBrZqJSGHxM5RhQVJ3cwU+t7eu7IJpTv89P64tyy3nNtt
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
Power domains (GDSC), but the requirement from the SW driver is to use
the GDSC power domain from the clock controller to recover the GPU
firmware in case of any failure/hangs. The rest of the resources of the
clock controller are being used by the firmware of GPU. This module
exposes the GDSC power domains which helps the recovery of Graphics
subsystem.

Milos can re-use the qcom,kaanapali-gxclkctl.h header due to similarity
of the hardware block, and also re-use of the Linux driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/clock/qcom,milos-gxclkctl.yaml        | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
new file mode 100644
index 000000000000..3a9721abdd26
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
+unevaluatedProperties: false
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

