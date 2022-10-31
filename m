Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0BDECAAA1
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 17:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiJaRkX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 13:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbiJaRkJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 13:40:09 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266613D73;
        Mon, 31 Oct 2022 10:39:49 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 325DED019C;
        Mon, 31 Oct 2022 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1667237987; bh=2Gi0EKJdVgf4UQs0CB/NSQnG2y/0R6oOHuiW0D9biC8=;
        h=From:To:Cc:Subject:Date;
        b=KXmF94VbM5DR089XGQaH3c2n6/JW657iwEtLEGFAwaRlFPQrt/lVVSqKjYCg7y2H6
         kmyBUYFh7t1TzdfRZBglmCeThI583SQtPUQDwlubPNhgtOMi/u4FpHpS1KBXZ9ADZT
         bLScWcHmHGRPRUXHcd3oKZUYe1nvhxqzGDT8QUbU=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: mfd: qcom,spmi-pmic: support more types
Date:   Mon, 31 Oct 2022 18:39:31 +0100
Message-Id: <20221031173933.936147-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

* 'adc@' is either spmi-iadc or spmi-vadc
* 'charger@' is either pm8941-charger or pm8941-coincell
* 'usb-vbus-regulator@' is usb-vbus-regulator
* 'vibrator@' is now in yaml format, so add it

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes since v1:
* Change dcdc@ to usb-vbus-regulator@
* Link to pm8xxx-vib.yaml

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 777f2da52f1e..cf10d62ace54 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -105,7 +105,9 @@ properties:
 patternProperties:
   "^adc@[0-9a-f]+$":
     type: object
-    $ref: /schemas/iio/adc/qcom,spmi-vadc.yaml#
+    oneOf:
+      - $ref: /schemas/iio/adc/qcom,spmi-iadc.yaml#
+      - $ref: /schemas/iio/adc/qcom,spmi-vadc.yaml#
 
   "^adc-tm@[0-9a-f]+$":
     type: object
@@ -115,6 +117,12 @@ patternProperties:
     type: object
     additionalProperties: true # FIXME qcom,pm8916-wcd-analog-codec binding not converted yet
 
+  "^charger@[0-9a-f]+$":
+    type: object
+    oneOf:
+      - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
+      - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
+
   "extcon@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
@@ -135,9 +143,13 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^usb-vbus-regulator@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,usb-vbus-regulator.yaml#
+
   "^vibrator@[0-9a-f]+$":
     type: object
-    additionalProperties: true # FIXME qcom,pm8916-vib binding not converted yet
+    $ref: /schemas/input/qcom,pm8xxx-vib.yaml#
 
   "^mpps@[0-9a-f]+$":
     type: object
-- 
2.38.1

