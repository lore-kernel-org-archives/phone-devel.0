Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E02BC19F5C
	for <phone-devel@archiver.kernel.org>; Fri, 20 Oct 2023 10:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376967AbjJTKgJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Oct 2023 06:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376932AbjJTKf7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Oct 2023 06:35:59 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C4AD64
        for <phone-devel@vger.kernel.org>; Fri, 20 Oct 2023 03:35:52 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ba081173a3so106893866b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Oct 2023 03:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697798151; x=1698402951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcOsTWZFgk36Pr6gD973XFfrWfkQhr13IcUUfM7456o=;
        b=B3HpL9rwjP58F9+ojrAYWhu0KKiuIa9tjlrJWOUopb8kGUUHqTYSXloUhow/KsMnL6
         vBnZioIZ5CeUdV+HtrBwgtgMvtj2gfesgi4u5ghTMW0wJttqsMem5C0FltBKhyehrYKD
         EVBN2rp7rrldWw2WWydUEidCZ0S0slEDHUO4SLB07VGmplKuWiLZIMQei+4K8Bf7rjqS
         Lgt8uVZlC2lklG9CwUycytTDOnLmO0rOsJgqbCL2mSIuoM9RZk8j3cWxwHtgEw179I3W
         GV241vorvwQb0LHP557m2eYz8Cfs0KGmVKuclyoUFI+GSHlGlRsPoyu45XVSaNRki4DF
         qvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697798151; x=1698402951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcOsTWZFgk36Pr6gD973XFfrWfkQhr13IcUUfM7456o=;
        b=O2xL1FsG7XWhBhM8i2q8ym4AqOcNtJ+WMjQHlhfbCj3ra12NsEpi8xjO27oPspx/ET
         Gjqi6dii4kMKgfQWKWJsen2EAyeTXUSvkBmSEeGybev6h4BVwi5VWfVBhokzpYiJ7usG
         bqz9oW0e9R9GWiPni9bnw5SSJoISmUx1BYcXSN4mNsBzvi8Hvt9fN+iAUbtja9/MNxsE
         hX7oi4m8KTRqwXX2STxp6tgQULeXOndD3rHj6zOuVcyWG3OqL58ZE4ufvSoYdzYM9aFO
         8MR6k88OncNIcPSuzoUKIjg0ipHxXZRPUvbmoKmbBKsO3wGPrybtCRMOBMJeAQqdbuV9
         opZg==
X-Gm-Message-State: AOJu0Yy6shhiH+r0pwnQJ/kXwVfBoFSWy/2dRgLAMgq7U24U/rPEEWd5
        +TWEzdw5kU1Td0OqcdOtaqk1TA==
X-Google-Smtp-Source: AGHT+IFXFm/4t+e5StIvyM1NDl6E74qUulPaU1GTzNjJDDZnnlzXaNEbp6AQa7eU8JChbIQrHL2+tw==
X-Received: by 2002:a17:906:fe04:b0:9c3:cd12:1925 with SMTP id wy4-20020a170906fe0400b009c3cd121925mr966287ejb.58.1697798150757;
        Fri, 20 Oct 2023 03:35:50 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709063c0700b0099c53c4407dsm1226701ejg.78.2023.10.20.03.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:35:50 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Oct 2023 12:35:46 +0200
Subject: [PATCH v2 1/2] dt-bindings: usb: add NXP PTN36502 Type-C redriver
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231020-ptn36502-v2-1-b37a337d463e@fairphone.com>
References: <20231020-ptn36502-v2-0-b37a337d463e@fairphone.com>
In-Reply-To: <20231020-ptn36502-v2-0-b37a337d463e@fairphone.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document bindings for this Type-C USB 3.1 Gen 1 and DisplayPort v1.2
combo redriver.

The PTN36502 can also run in GPIO mode where it is configured
differently, without any I2C connection, but this is not supported yet.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/usb/nxp,ptn36502.yaml      | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
new file mode 100644
index 000000000000..eee548ac1abe
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nxp,ptn36502.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PTN36502 Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo redriver
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,ptn36502
+
+  reg:
+    maxItems: 1
+
+  vdd18-supply:
+    description: Power supply for VDD18 pin
+
+  retimer-switch:
+    description: Flag the port as possible handle of SuperSpeed signals retiming
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
+          handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@1a {
+            compatible = "nxp,ptn36502";
+            reg = <0x1a>;
+
+            vdd18-supply = <&usb_redrive_1v8>;
+
+            retimer-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    usb_con_ss: endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    phy_con_ss: endpoint {
+                        remote-endpoint = <&usb_phy_ss>;
+                    };
+                };
+                port@2 {
+                    reg = <2>;
+                    usb_con_sbu: endpoint {
+                        remote-endpoint = <&typec_dp_aux>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.42.0

