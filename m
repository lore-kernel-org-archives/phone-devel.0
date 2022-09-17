Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1CFECAAA1
	for <phone-devel@archiver.kernel.org>; Sat, 17 Sep 2022 15:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbiIQP2s (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Sep 2022 11:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiIQP2s (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Sep 2022 11:28:48 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEDA2ED54;
        Sat, 17 Sep 2022 08:28:46 -0700 (PDT)
Received: from g550jk.fritz.box (212095005231.public.telering.at [212.95.5.231])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7BE77C7098;
        Sat, 17 Sep 2022 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1663428523; bh=v4asV90wfFlCyQF8JuVoPDzWUKYRlq+5P7xnjrMbPDc=;
        h=From:To:Cc:Subject:Date;
        b=JopfQzyH6z+17y3+lHqHjd8eUQpnV9BDtlC2p5GanmpkB0M6XDR/ef9iTPpFmiEfy
         k4yO45ZWM8pZEroGdJr3yrG5p2UQ76r+SjydlGQkRdUQ925u3ZsY0N8wcOVYx0/LoV
         7ihp6oWXejLQU95MNlxKyd8EjcONBK5sRRLPOqPs=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document huawei,sturgeon device
Date:   Sat, 17 Sep 2022 17:28:27 +0200
Message-Id: <20220917152829.23568-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the Huawei Watch ("sturgeon") which is a smartwatch based on
Snapdragon 400 SoC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b6257683a700..67ff967ea3ad 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -114,6 +114,7 @@ properties:
       - items:
           - enum:
               - asus,sparrow
+              - huawei,sturgeon
               - lg,lenok
           - const: qcom,apq8026
 
-- 
2.37.3

