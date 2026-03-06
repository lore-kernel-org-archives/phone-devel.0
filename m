Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3163ACA4B
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806945; cv=none; b=bY9MK/pjy7BZnPw6KqA+heGK1eaakrlt6YWPBputubgnBWUl8X4UAOp52A4NieWFj8cd6ih9BuPMYEyihxGuc9LGfzjluiLb0leEiD/XGCcspkLuYNu/pRKfXtVTu/VPU4TZ0mEOkvvk1Um/m2Dcl09wFwAsOiDTj5IkK/odUyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806945; c=relaxed/simple;
	bh=ZG4vqB20u3oeYRitCqSlm46mL+bG1BN+RLcEZiDnQkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwBNkxD8MGSertFqG/0LXRdsxZOj7Qce8owCg/yVAMGeR881Hutozo4hFQ6DifPnNG4s5xv7DXAkfXBPJ6jbM4BcAHneH9bDdTFnIWE5FPQDNGag1v/0Ret4ifOziJvqYM3iPuoqrXGDMIV490nVTSCL2H4za5zy05BKRXxBiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tpHDeP+9; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tpHDeP+9"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b886fc047d5so1526660266b.3
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772806940; x=1773411740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GN/9HJvWN9Iaz4c8c0n++HKlIZpjwx7e1ASpMCTtePY=;
        b=tpHDeP+92NVfXnaiidl0+aAz3+9aATkukp/U4M8Q8kCRTKo422LBw49wAgopsonHDG
         hWnsEReJ8XLxYhjtfnLC180M43K5M5Zq8P2k0t0oIamber6aqZCPX6ivKDpRlmx2phs3
         pUbvxXX+x/ca0CefIuB1xD7j8rI/MGGcT/BX7fve+1q7CR6FRucs0ZmBU4gYqcFfbDdh
         gVQGJqoZKqwewXXKbffQCy77sXwsjuNTL+vrVnMSrUkUper+UAEvMrm+7OjdqUew/8mZ
         t/AZJvqoqs5H7yBVkUMY9qqlurlz7fSx8E8YLJoUsRXb8TZjlgoE+WEwHNAaixZV7F5/
         7uUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806940; x=1773411740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GN/9HJvWN9Iaz4c8c0n++HKlIZpjwx7e1ASpMCTtePY=;
        b=G6kXU3yrOG/52nNxSlf6SPVG6QJYzf1s30jYMtmqHA03rcxpfC5VNIdaKXzmvvbefO
         u4GWcc4ELh5sAzjBw4j1MghTc0wLPvg+Qs2sJz16FLvsCD8aLQi3DjZ83cHZdM88D+Rl
         n6oDExzN1/C0YDhzgrD2fc31p+MPyzgmDyMLGu+pRsSuj8dChVYUnfTqQ2Avwt9QLEUp
         n2yCmx+TsBnn1S12WfjMeK/8DRfEHvMjMXfHV10/Xs2DNQAscN7lE76JsLVkKfeDefkG
         6hg3LOPMwFJRI/DHOlMW7wHsGXLG//1whohrl5jreEdh1FTc1urbRybhPeSgSMjPr1Pj
         cx/A==
X-Forwarded-Encrypted: i=1; AJvYcCWiidrHCCZPXTBioWQLLZV0oH5dsYcg9L+jqOdTvnOQbOyxAx0YE106fUuhcHOHgiZszypTcVxSY+rS+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5GhXb4XsExNxPr54pEcg0jo99jTY2wNS5LQf7Odh7ZG5a54S
	gP5xZCHkrdwSs9dErUwtva/kWk1X5eFwbo/G8IaR48HmoXczWaVCbKyg2t4if/pzRmeh8jvThAz
	vp4/G
X-Gm-Gg: ATEYQzz/JCfkcrJf4LSGeGx0n34ZiiAEbBqTVH+wlXT+p+NDPGsLwtTGjbNT9u6GNoI
	rZ811QMW0Byv2unzBCGlKUGrmEbHB+lnfe4Djy7BuvfzQ2wu3eTTYBgq4Zp5GSSmh2v4XtWIn5T
	2mjwMRRGxM7AaJNVmCTzvA94Fyeq5RRXTsUCF4NBJWF5lbhOKFHLMNGHtXv9FVKnq73ZCd2FOoK
	RHFv2xUrsHjBe/Efn5tkTzx7vbIXvNSnvfQ5UJ3ciUhL8iAYGuGzoHrHSg1lE438PJp6/kJhGQV
	wR1zPeoAQfSc9nJXPUXIaP2GHXmdsopLQBC+vay9IqZFsBl5+fF3awbQtnFT394zysNK3bGy5zU
	XLKILZFCsktfnQjUn4eLYAQEKCFqJbAZJ4bfbAHscNa88MBp4Sk7x+d4AcVZpLe1gSj70IodVfu
	pdpWL0dEiUcN93ThkZyP3src6+YTxuaDiLp1bqIKl2Tb+QKU2SVhNeQUUNldarGyVgIUWM93Yq8
	Oj2
X-Received: by 2002:a17:906:7307:b0:b8f:a26e:dec4 with SMTP id a640c23a62f3a-b942dbce6a2mr137162066b.7.1772806940159;
        Fri, 06 Mar 2026 06:22:20 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3c66d3fsm517251a12.2.2026.03.06.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:22:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:22:15 +0100
Subject: [PATCH 1/4] dt-bindings: pinctrl: qcom: Add Milos LPI pinctrl
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-pinctrl-lpi-v1-1-086946dbb855@fairphone.com>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806937; l=3950;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZG4vqB20u3oeYRitCqSlm46mL+bG1BN+RLcEZiDnQkU=;
 b=OAJkK1lyilgTaVbUADvWkxNsB0geeBBFLPZb9wjke7dZCGjzcAgc5fzWmWQBfKECKiMnjaKMS
 bSFHpto6X04DKRly3wX4Z4F/zi+JWIE7pZ2R+/kbML4z4GzqH9M38jG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings for pin controller in Milos Low Power Audio SubSystem
(LPASS).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml      | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..73e84f188591
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Milos SoC LPASS LPI TLMM
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm Milos SoC.
+
+properties:
+  compatible:
+    const: qcom,milos-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+      - description: LPASS LPI MCC registers
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-milos-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-milos-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-milos-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
+
+      function:
+        enum: [ dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic3_clk,
+                dmic3_data, dmic4_clk, dmic4_data, ext_mclk1_a, ext_mclk1_b,
+                ext_mclk1_c, ext_mclk1_d, ext_mclk1_e, gpio, i2s0_clk,
+                i2s0_data, i2s0_ws, i2s1_clk, i2s1_data, i2s1_ws, i2s2_clk,
+                i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws, qca_swr_clk,
+                qca_swr_data, slimbus_clk, slimbus_data, swr_rx_clk,
+                swr_rx_data, swr_tx_clk, swr_tx_data, wsa_swr_clk,
+                wsa_swr_data ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+    pinctrl@3440000 {
+        compatible = "qcom,milos-lpass-lpi-pinctrl";
+        reg = <0x03440000 0x20000>,
+              <0x034d0000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+        clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core",
+                      "audio";
+
+        tx-swr-active-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <4>;
+            slew-rate = <1>;
+            bias-disable;
+        };
+    };

-- 
2.53.0

