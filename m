Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6A1FA3741
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 17:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiJaR5n (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 13:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJaR5m (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 13:57:42 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A39513D30;
        Mon, 31 Oct 2022 10:57:42 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 6D6E4D019C;
        Mon, 31 Oct 2022 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1667239060; bh=T31Q5b00T3Iund348MXglCDwIzPXstTlieIV5jGe2Vw=;
        h=From:To:Cc:Subject:Date;
        b=brXRGWoxRW1SOfUxNjEHozDNiSed2hrMK4H/CE1T9tfiNlF2iA9rUYw5fFwTjvGwE
         Jbh6zWUkkEVR27t6xFV4GTCas41B/HaknJm3W+D2zG6TR2M6eEqczYeHbNX73YeHkd
         hUirHbQEebvjgYFyMKg5MZDSp64gspX+eZp8QLjA=
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
Subject: [PATCH 1/3] dt-bindings: mfd: qcom,spmi-pmic: rename extcon node name
Date:   Mon, 31 Oct 2022 18:57:14 +0100
Message-Id: <20221031175717.942237-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

extcon is a Linux-specific name and shouldn't be a part of the dts. Make
it be called usb-detect@ instead.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
This patch builds on top of
https://lore.kernel.org/linux-arm-msm/20221031173933.936147-1-luca@z3ntu.xyz/
But could also be applied without, if conflicts are resolved.

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index cf10d62ace54..14aa42057d6f 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -123,10 +123,6 @@ patternProperties:
       - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
       - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
 
-  "extcon@[0-9a-f]+$":
-    type: object
-    $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
-
   "gpio(s)?@[0-9a-f]+$":
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
@@ -143,6 +139,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^usb-detect@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
+
   "^usb-vbus-regulator@[0-9a-f]+$":
     type: object
     $ref: /schemas/regulator/qcom,usb-vbus-regulator.yaml#
-- 
2.38.1

