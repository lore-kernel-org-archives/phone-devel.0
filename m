Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888F3C433F5
	for <phone-devel@archiver.kernel.org>; Mon,  3 Jan 2022 07:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbiACHqz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 3 Jan 2022 02:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbiACHqy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 3 Jan 2022 02:46:54 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA024C061761
        for <phone-devel@vger.kernel.org>; Sun,  2 Jan 2022 23:46:53 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id f5so132759449edq.6
        for <phone-devel@vger.kernel.org>; Sun, 02 Jan 2022 23:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FpUpDyeqdIwrTg7DpeH+O7GDAXcG9/zStdWFn40wZxM=;
        b=fkoxAtyfRxgXmBpNA37qq2y02aeFEcJTFZo83O9Q183hIXbn75tvmRH1RdiIEZ0T7N
         /DDE8mH2qG70zqOyn00V5uP+NQCqoIO49GxDwlDfdIXCKlZRObgGoG7YyMVA0ooSC6ri
         7moN5rAyqJiq0dyJriezAkSNv+Y3HoB7gtM435uXjh9SJglJ2m+J5q9n/l0O60C4z0d1
         lL980kgofTMjEO5BRQm7ociWJXkIlt8ue3chq0Asr0wnTpcyQTCFqNWeByv9sjNKv+RI
         Pu+WonWwjAG0OgvJRVt8I2Ve433yP1Pb/kICaLYQrFA4IhqXzdQGoE87JjU/PMInR+1o
         A/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FpUpDyeqdIwrTg7DpeH+O7GDAXcG9/zStdWFn40wZxM=;
        b=ksohqnKZe7R8wMJ3YBCdLLeCbjx+Q11MX77TXwXMeGSPtnm60+FNRSxUqpcTAZa/XX
         L1BbU7QIPPyp6bxcERuppmCxIAlEAaMYzvZmcfy67IV3xqAbtbDWb1STYYbBYY2ELu+p
         4PNS1KMm0DQjd/1pZP9bhq88wrIpgAhbn2sBGXrGz/wU6TY+m+SYnDDMQCpaOgy8IDCn
         w80IDXEPeG3qSvMZXAM8Z4GU3vYe6Bs7OgID/UNM2Ayo8ahcldGiNmWT/nsAJvn39s/6
         x6H49x3QATHH4SV3TsJ1YGRuG0hYLGkUhIZv7uI6aDxh0WQHfNB4GVdsX6RiLhM55RrU
         8VdQ==
X-Gm-Message-State: AOAM530fdS1MMlGqwBuhd1jyg77J7VgzvfXWZAVRFzdLw1vFGMf4aYB4
        BYqFEdlMuwFS5xFo3i0mGOvELlF2WLLEccIO
X-Google-Smtp-Source: ABdhPJxrHn6If14+blHbzSEOrY1KNk0zR6rTse7/vD0oqUVZw6X+dokjXZ1MAESoqfu691ty7pyXDQ==
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr42897859edu.46.1641196012385;
        Sun, 02 Jan 2022 23:46:52 -0800 (PST)
Received: from localhost.localdomain (144.178.202.138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id h3sm2017101ede.78.2022.01.02.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 23:46:51 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
Date:   Mon,  3 Jan 2022 08:43:48 +0100
Message-Id: <20220103074348.6039-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Convert the PDC interrupt controller bindings to YAML.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
* Adjust description of second reg-name as suggested by Maulik Shah

@Rob Herring: Hope it's ok to keep your R-b given the above changes

This patch depends on the following patch, which fixed sm8250 & sm8350
compatibles and adds sm6350.
https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss@fairphone.com/

 .../interrupt-controller/qcom,pdc.txt         | 77 -----------------
 .../interrupt-controller/qcom,pdc.yaml        | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
deleted file mode 100644
index 3b7b1134dea9..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ /dev/null
@@ -1,77 +0,0 @@
-PDC interrupt controller
-
-Qualcomm Technologies Inc. SoCs based on the RPM Hardened architecture have a
-Power Domain Controller (PDC) that is on always-on domain. In addition to
-providing power control for the power domains, the hardware also has an
-interrupt controller that can be used to help detect edge low interrupts as
-well detect interrupts when the GIC is non-operational.
-
-GIC is parent interrupt controller at the highest level. Platform interrupt
-controller PDC is next in hierarchy, followed by others. Drivers requiring
-wakeup capabilities of their device interrupts routed through the PDC, must
-specify PDC as their interrupt controller and request the PDC port associated
-with the GIC interrupt. See example below.
-
-Properties:
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
-		    - "qcom,sc7180-pdc": For SC7180
-		    - "qcom,sc7280-pdc": For SC7280
-		    - "qcom,sdm845-pdc": For SDM845
-		    - "qcom,sm6350-pdc": For SM6350
-		    - "qcom,sm8250-pdc": For SM8250
-		    - "qcom,sm8350-pdc": For SM8350
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Specifies the base physical address for PDC hardware.
-
-- interrupt-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: Specifies the number of cells needed to encode an interrupt
-		    source.
-		    Must be 2.
-		    The first element of the tuple is the PDC pin for the
-		    interrupt.
-		    The second element is the trigger type.
-
-- interrupt-controller:
-	Usage: required
-	Value type: <bool>
-	Definition: Identifies the node as an interrupt controller.
-
-- qcom,pdc-ranges:
-	Usage: required
-	Value type: <u32 array>
-	Definition: Specifies the PDC pin offset and the number of PDC ports.
-		    The tuples indicates the valid mapping of valid PDC ports
-		    and their hwirq mapping.
-		    The first element of the tuple is the starting PDC port.
-		    The second element is the GIC hwirq number for the PDC port.
-		    The third element is the number of interrupts in sequence.
-
-Example:
-
-	pdc: interrupt-controller@b220000 {
-		compatible = "qcom,sdm845-pdc";
-		reg = <0xb220000 0x30000>;
-		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&intc>;
-		interrupt-controller;
-	};
-
-DT binding of a device that wants to use the GIC SPI 514 as a wakeup
-interrupt, must do -
-
-	wake-device {
-		interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-In this case interrupt 514 would be mapped to port 2 on the PDC as defined by
-the qcom,pdc-ranges property.
diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
new file mode 100644
index 000000000000..7e425f0b87cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PDC interrupt controller
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  Qualcomm Technologies Inc. SoCs based on the RPM Hardened architecture have a
+  Power Domain Controller (PDC) that is on always-on domain. In addition to
+  providing power control for the power domains, the hardware also has an
+  interrupt controller that can be used to help detect edge low interrupts as
+  well detect interrupts when the GIC is non-operational.
+
+  GIC is parent interrupt controller at the highest level. Platform interrupt
+  controller PDC is next in hierarchy, followed by others. Drivers requiring
+  wakeup capabilities of their device interrupts routed through the PDC, must
+  specify PDC as their interrupt controller and request the PDC port associated
+  with the GIC interrupt. See example below.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sc7180-pdc
+          - qcom,sc7280-pdc
+          - qcom,sdm845-pdc
+          - qcom,sm6350-pdc
+          - qcom,sm8250-pdc
+          - qcom,sm8350-pdc
+      - const: qcom,pdc
+
+  reg:
+    minItems: 1
+    items:
+      - description: PDC base register region
+      - description: Edge or Level config register for SPI interrupts
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-controller: true
+
+  qcom,pdc-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 32 # no hard limit
+    items:
+      items:
+        - description: starting PDC port
+        - description: GIC hwirq number for the PDC port
+        - description: number of interrupts in sequence
+    description: |
+      Specifies the PDC pin offset and the number of PDC ports.
+      The tuples indicates the valid mapping of valid PDC ports
+      and their hwirq mapping.
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - interrupt-controller
+  - qcom,pdc-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pdc: interrupt-controller@b220000 {
+        compatible = "qcom,sdm845-pdc", "qcom,pdc";
+        reg = <0xb220000 0x30000>;
+        qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&intc>;
+        interrupt-controller;
+    };
+
+    wake-device {
+        interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1

