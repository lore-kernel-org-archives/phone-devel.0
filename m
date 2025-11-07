Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03CE2DAFBE
	for <phone-devel@vger.kernel.org>; Fri,  7 Nov 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531735; cv=none; b=PM7Jab32YiFIc2rAE/6lFSo/jIs094+5iazXxjvvtS2Sk9MEwbZ1ta/mJC6DJ5LCvqViFbnhtqnYoK11qfsM7u3qDXIjGTyQiSnYMmOaSEHTFalpS9qT86g6NNs942fQihF9tGeJaLeqM7s8sMZfwSfNj41NKwk54e/V9KEmbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531735; c=relaxed/simple;
	bh=wCfL/0TbR2D1La8wfkO0vzsLgEQ1Zd5Y2m8FV9wi1Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pWKv7NBbaN3KZg/L9AE/2toDI4BnOpEHlH9Dj7Xzs4ntYi3GM/FAlNm9R8VyXTvP7fi+yQ6x2O6jQsZL203uSTpmgJCUSoYtgTOlGzLM5gwPdwloanpYzngQxq9ccSgGT/+rqDTsOvowXPEZCfiMGCBdjgbJTz3Gd+GLNgLdryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1HEvjRq0; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1HEvjRq0"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so1576114a12.0
        for <phone-devel@vger.kernel.org>; Fri, 07 Nov 2025 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762531731; x=1763136531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYr/pky6aWVI2M5rA4U5Jbo/T6qeLZWOHBZOpvd4WCo=;
        b=1HEvjRq07orEtdKMLrF/T1DERJoBqusNCgxa9cVyRFQOQPrXX1q0UEoTRPc3SbdAHt
         biMnqwcsIZjXtaMKrb50II95uGXdcFSGgKlMUL7xizvYKBxpaGBtmis6DKlnEQC/7z6Z
         N56YlbxILEhT1M55DItd3eHGOF5WnBB2t5rPqt2nW1QWrJaLN9kNUhjBa7wuVuJTqQ34
         GYBHZSx7k+momuoIUEVgY5SxlreW3yclJpzwDgR6lWlHCaP6+3oYZPkLvM6kfqjcn5e1
         uYyJQkQ47BFasAelH4H2O492RGsEPSLt9gYHjCIVa1kBtVudPL5TfgDdvCrtM4pXxxQA
         jrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531731; x=1763136531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYr/pky6aWVI2M5rA4U5Jbo/T6qeLZWOHBZOpvd4WCo=;
        b=e2s+K5g/T7vcFu+Z6cNrjwmEwSz98zIU3I7ADgXOKoH8VA0bF4lrxwjUe/xiQkaEY7
         Hz1X+zwHF7bhfXuEUwgqDGIz7OlmBhRcbXQJGTqixI3TDuo3tWa+J2ac/IpuPyeMM1j3
         2VtCRBpUQuK493xok9jrD38DFCCYYJEOO1irpoaD9jwOAcEKcJsHWKJ4yJq2EPAZ3ecN
         PCo/rcYoiwA3FaheoTvAfqHOVIwjdP0rNQuS4p9yzQIQ7TfBTFQPf8g8SafqxV6T1Ilf
         v48684p/oEuTRgwOd3o2+KMJave1gYq/iKU5gqBRd0tL09c+5ND6lpTOBIorVip5zNZv
         E/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFdR3vYXpxCga4+1VMEdL4ofPZAfmo1+LLdE5h7Eo4wpy17H8KKk3tORalqI9woPF4EOaYrLx6xXPVaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYTFyNZmvOOtcOLOuLPSYsoKDXLfpDimDB+XKrrA25iO77ni8
	fXlssTKkQ05Dqjn1phxWGjfjKi3/xlc9C08LrMblHxn+b3ehzO0vTF+Vf5v2IvF+TXI=
X-Gm-Gg: ASbGncubDi+jqBHKrESpmvgiruL7omt38GneA6XK350N1WNzFrekeCd7lz6E1uelwY1
	FA9SWw3/Qvqd75TE7lVEhvU9Oa6zjFsoZvqyOvQTPW9ey9prlWHC6UGRJRgR334/KHJdfSfzfAT
	+K/STuESTNfSHEl8+LQnoZW+PVnBZMFxOxSt42+kN5E0QAKYEykvgbGoA6RXEV4BwhODVJpXJkd
	XGElceMKdQWfXm8xA/jL0kKt4WqKwnfzsrNhYqlS7L4Fa88Aa4W4olmf938spHD+zDenJyAKIK7
	V+cF3Acf+xaaS7ECzlWwa5EaeaEuiS7X418FcP5n4cmwqRkLPxnIKHKFgP6x5I27MM6+Fzy4p9L
	s6jA4i3A6Zt8R9eOrwdjkMEnTTsIRX0lNVR7DX7wMRebbnz4g86X8XKk3Q0yIZFF43I1E7R6uSi
	J+xtE7Hy/M+Rji0WiUmnuwEMK994e1kEqLIO28rjq6dLpvvmu1W3PYbThS+k8SpU+dYg==
X-Google-Smtp-Source: AGHT+IEpbRanFI/ly4pOhSKtJJYggLoWCyVGHF5JexpXtBfMcrU0Svhu9ZaKyv7MJNW8LAKNg2Ua6A==
X-Received: by 2002:a05:6402:4406:b0:639:d9f4:165e with SMTP id 4fb4d7f45d1cf-6413f0a08c2mr3306548a12.29.1762531731003;
        Fri, 07 Nov 2025 08:08:51 -0800 (PST)
Received: from [172.16.220.100] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713959sm4444376a12.5.2025.11.07.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:08:50 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Nov 2025 17:08:47 +0100
Subject: [PATCH 1/5] dt-bindings: interconnect: qcom,sm6350-rpmh: Add
 clocks for QoS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-sm6350-icc-qos-v1-1-8275e5fc3f61@fairphone.com>
References: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
In-Reply-To: <20251107-sm6350-icc-qos-v1-0-8275e5fc3f61@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762531729; l=3518;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=wCfL/0TbR2D1La8wfkO0vzsLgEQ1Zd5Y2m8FV9wi1Gg=;
 b=XFhe9WKdgQrhgwCeP/Zu9aHiY8hnx5TxEMqejAH60sY7NNNSJ7zYWpPjHr9tJL6L5Vxd/IUll
 0+5xg/BwfpFCCSx7nx2Yh4b+QYUkjuUBCgHp1iuRuFkX3leuHhJRZFG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the clocks for some interconnects to the bindings that are required
to set up the QoS correctly. Update one of the examples to aggre2_noc to
have an example with clocks.

Also while we're at it, remove #interconnect-cells: true as that's
already provided from qcom,rpmh-common.yaml.

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

