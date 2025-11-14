Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C424303C86
	for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112678; cv=none; b=N8sGxqJKYen/AvXO4dKS9GE1kXu6lQoDX+so1UATDwsU6VW3ko3yqoay2WqWsq2AIEyamcb2aD4PRwvTEHQeflgd2tV3q8xOEHjBCZhpQOXE02/SQ67lT3zy8WBeqlCIp3IKCHQ5YaAmWx8bnvcJy2OcyjLUx3pOc8yDwoZ27os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112678; c=relaxed/simple;
	bh=q0tdVNOipK0Zpcd1nOMTcB1YUnAJWRHGAYSLJd0+tUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGhSdQ88xBv0t+gA1AxqgkRQwt5ePEEfwmoVRemZaoUFKxqDYExrsKeVq+u7wcozHi+8HjyOvaXEsMTG++4U2q32//1UjntZJKNX1kZc9r85yNZn+PcoeNAKfRnOJehRXO+2uXz8f9jRa1lTaNsRYGv9f2Cbjh8p6m6f7moMXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gR1zIbKF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gR1zIbKF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7373fba6d1so17959566b.3
        for <phone-devel@vger.kernel.org>; Fri, 14 Nov 2025 01:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1763112674; x=1763717474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8JMr12gzEjNmdYRXSFO9HGUKWRef+CBtmkwn83lm74=;
        b=gR1zIbKFr1KabG/XKfdccpKKfRFNJifMWvqmFXIV3ZEyufzgwaU7Ise51Xkyy3X6g9
         Zm9Uc6pMtIP2sUanbr8ubnYuVIA1CC5pUWKDOtcDQZXBmDUhYI6WYRCFYe/tePmW+KbX
         5j1BWQfNpIVT6Dmio90Vv6hlnaxbOH73WkGZDSUyynIyRe3ibsPO9Zxs4O+gUiCEx+zH
         ngNrf+NEhTPU+pCRBadJP18IRrZa4XJpVOE7M5Vqg3JM227S2UlvyaK1UQxZsp4Ulcq7
         n1UWAYWzxUGL+PtN63Asj8rJlll03aTdRsf/7gds+Rp9h1qY9zm833wu8lL90EdQWGzo
         erbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112674; x=1763717474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X8JMr12gzEjNmdYRXSFO9HGUKWRef+CBtmkwn83lm74=;
        b=cquKcEU0h6wHblG7E9MuemPxiBjImaRy+cHQrqIKmRDKNGbPvQmtu3KICNiGQ74KoO
         QUDyEz4Crk91KIG7f01PWdQcnDlabmRIjWlPzhe/BRgdbtkZ5TRBftoipG85+3pKt7uq
         xXciIZzJdRXvJ6UjUlVAuhMrc++lFZB4On5IpZfO3aQMl3bbmvW3mOtFJIOiDOx/z7N9
         903HNgVWQhIJ4WRWu4lWXmN2nUZA45d0tka5ENBNcvCsrKSXuYIXPe6mb1qkkMmrxhsz
         dfq6Gng9eCXgFpeI979ObAczEKIo1AK8EnHB4/bjJuCE/olp94KK2M8Vruz1qEBC5c3H
         hI0A==
X-Forwarded-Encrypted: i=1; AJvYcCXHgNQS9NvkCEuIiRlHfZxYYue9O9GKVXc/gx2HKTwTEUdaoCqSigkIsGCBDV5UUeta/hsQ0MsAqduVzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnmdigdKN1ssW2iThO0mDA8xWDrop3/j50iJylnqTrL8cx+Wvr
	28ks91ygiH3/vv8sADTtUYLMscOR18ZGMW5npqtvjvL+tC/PpsS6X4ZAtWiu2FlmE24=
X-Gm-Gg: ASbGncuWhDHMtsoccHIJgxIdqDWPl4oXMGg0oYSR7Vz1mWbkwoNjfwHKwSgQDwXmXCg
	HjjVt9/IBP8MOJsnmpdP2QbwY6MtmwzLJC/d48D8EUsxx0IzZkHfGK5mqqo0GaCKD1n8zGUkQyu
	1A+uf0F0QjuAmOrvfA61IHpaenGQlQ+7Fkgyz+1Z777SiTkXplBcGzswEWJIL0kVSs85QTHjhCa
	xhoN78AzxFwffbmbqvpgo7KTFjipy+FQsaNi2HuOyq6W7xEhDuoboa0cr693thGbVk+X7xHO2oT
	VbJ/a5u992uTUee2ZYEuMee6BqzEaMLJGx8Hef3xT+MCyHFd5OK/uDSw0imEBcBzgNMP6c/0/Yb
	cCEnA1zL/B7xPJsidhRu8OAjZ8d9LNktmqYypjd+0/OTIUk/2lbN4cRlNa1HkX76sW94oOvxag8
	qJWniB31aJj5/ntECoehY/UDKSX0rffniQoVURHoN6UTjFAWekJYAjFdvpIAIv2dkcrQ2GBGzfJ
	Ml/s4IsChYRS8pP1cVg5ncEfH5O7CyiDA==
X-Google-Smtp-Source: AGHT+IFVw6W18ObaGtKJ10Xcu6/Wv8WS6lJaqKvbaiYmoVzwfv2DfFS03nbiscfYrjzyMjgufvOJfQ==
X-Received: by 2002:a17:906:794b:b0:b6d:9bab:a7ba with SMTP id a640c23a62f3a-b7367983f21mr198473566b.42.1763112674394;
        Fri, 14 Nov 2025 01:31:14 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0509-ec01-156d-fa6e-7f19-0b67.cable.dynamic.v6.ziggo.nl. [2001:1c04:509:ec01:156d:fa6e:7f19:b67])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80841sm352104366b.41.2025.11.14.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:31:13 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 14 Nov 2025 10:31:09 +0100
Subject: [PATCH v2 1/5] dt-bindings: interconnect: qcom,sm6350-rpmh: Add
 clocks for QoS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sm6350-icc-qos-v2-1-6af348cb9c69@fairphone.com>
References: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
In-Reply-To: <20251114-sm6350-icc-qos-v2-0-6af348cb9c69@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763112672; l=3585;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=q0tdVNOipK0Zpcd1nOMTcB1YUnAJWRHGAYSLJd0+tUw=;
 b=FAC/10Tl8wr016SZ4IcHv4CK42tFzSJwEkm8di1F3bIXqCBdcMAPpX8vgYbP1x+OpJTVeyIQL
 wYRjI9Mf+M2Cq785SPpuAuPbLGIfZNanyu0KKe2VDC7KeR5gqXvFHK3
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the clocks for some interconnects to the bindings that are required
to set up the QoS correctly. Update one of the examples to aggre2_noc to
have an example with clocks.

Also while we're at it, remove #interconnect-cells: true as that's
already provided from qcom,rpmh-common.yaml.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/interconnect/qcom,sm6350-rpmh.yaml    | 65 ++++++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
index 49eb156b08e0..2dc16e4293a9 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml
@@ -12,9 +12,6 @@ maintainers:
 description:
   Qualcomm RPMh-based interconnect provider on SM6350.
 
-allOf:
-  - $ref: qcom,rpmh-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -30,7 +27,9 @@ properties:
   reg:
     maxItems: 1
 
-  '#interconnect-cells': true
+  clocks:
+    minItems: 1
+    maxItems: 2
 
 patternProperties:
   '^interconnect-[a-z0-9\-]+$':
@@ -46,8 +45,6 @@ patternProperties:
           - qcom,sm6350-clk-virt
           - qcom,sm6350-compute-noc
 
-      '#interconnect-cells': true
-
     required:
       - compatible
 
@@ -57,10 +54,54 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6350-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6350-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre USB3 PRIM AXI clock
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6350-aggre1-noc
+              - qcom,sm6350-aggre2-noc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
     config_noc: interconnect@1500000 {
         compatible = "qcom,sm6350-config-noc";
         reg = <0x01500000 0x28000>;
@@ -68,14 +109,16 @@ examples:
         qcom,bcm-voters = <&apps_bcm_voter>;
     };
 
-    system_noc: interconnect@1620000 {
-        compatible = "qcom,sm6350-system-noc";
-        reg = <0x01620000 0x17080>;
+    aggre2_noc: interconnect@1700000 {
+        compatible = "qcom,sm6350-aggre2-noc";
+        reg = <0x01700000 0x1f880>;
         #interconnect-cells = <2>;
         qcom,bcm-voters = <&apps_bcm_voter>;
+        clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                 <&rpmhcc RPMH_IPA_CLK>;
 
-        clk_virt: interconnect-clk-virt {
-            compatible = "qcom,sm6350-clk-virt";
+        compute_noc: interconnect-compute-noc {
+            compatible = "qcom,sm6350-compute-noc";
             #interconnect-cells = <2>;
             qcom,bcm-voters = <&apps_bcm_voter>;
         };

-- 
2.51.2

