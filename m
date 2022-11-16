Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F09C4332F
	for <phone-devel@archiver.kernel.org>; Wed, 16 Nov 2022 14:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbiKPO4w (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 16 Nov 2022 09:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiKPO4u (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 16 Nov 2022 09:56:50 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3465FA7;
        Wed, 16 Nov 2022 06:56:49 -0800 (PST)
Received: from g550jk.arnhem.chello.nl (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 046A6D0542;
        Wed, 16 Nov 2022 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1668610607; bh=hbfp0V1IHiEOEuEmjv68ebcEIFaCovt7AmRE/i6p7xY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=tWGZtzYYZgKIE64Uv3yP12DXLBmtnRRzjnMrqnqJe4qovaWUB/DrmNc43gEufDuuo
         99pAARd1i4xoswh0Et9whqPu0rz37NOO0Y2dMA3QpEWJye0Btj+IfNcgt9E4RpPm76
         DrRizALQmun/6bQqzyQNIXZAPZzVbjB4BAV7CHJk=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: arm: qcom: document new msm8953-family devices
Date:   Wed, 16 Nov 2022 15:56:02 +0100
Message-Id: <20221116145616.17884-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116145616.17884-1-luca@z3ntu.xyz>
References: <20221116145616.17884-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the various phones added in upcoming patches.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1b5ac6b02bc5..8fd6338240ac 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -34,6 +34,7 @@ description: |
         mdm9615
         msm8226
         msm8916
+        msm8953
         msm8974
         msm8992
         msm8994
@@ -47,6 +48,7 @@ description: |
         sc8180x
         sc8280xp
         sda660
+        sdm450
         sdm630
         sdm632
         sdm636
@@ -189,6 +191,15 @@ properties:
           - const: qcom,msm8916-v1-qrd/9-v1
           - const: qcom,msm8916
 
+      - items:
+          - enum:
+              - motorola,potter
+              - xiaomi,daisy
+              - xiaomi,mido
+              - xiaomi,tissot
+              - xiaomi,vince
+          - const: qcom,msm8953
+
       - items:
           - enum:
               - lg,bullhead
@@ -609,6 +620,11 @@ properties:
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
 
+      - items:
+          - enum:
+              - motorola,ali
+          - const: qcom,sdm450
+
       - items:
           - enum:
               - sony,discovery-row
@@ -625,6 +641,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp3
+              - motorola,ocean
           - const: qcom,sdm632
 
       - items:
-- 
2.38.1

