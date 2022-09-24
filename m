Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F642C07E9D
	for <phone-devel@archiver.kernel.org>; Sat, 24 Sep 2022 15:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbiIXPbI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 24 Sep 2022 11:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233940AbiIXPao (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 24 Sep 2022 11:30:44 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB7D2666;
        Sat, 24 Sep 2022 08:30:30 -0700 (PDT)
Received: from g550jk.fritz.box (212095005231.public.telering.at [212.95.5.231])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id D2774C6F7F;
        Sat, 24 Sep 2022 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664033427; bh=zV910eCqFNnfwi2bNmNVba6poAJMtaqZWIluNorpGww=;
        h=From:To:Cc:Subject:Date;
        b=jYiokasqVqKaAJOIG6yJB6FtYFPiJ3ayo58/chffmyvQQqJ6jSVnxlH+KZn4LL1nn
         RrDVp41psJvXJL8+gP1x0UcDJqFbBN8CtKOqfYw1YilSwRi0Syt7aJupS1wqqaXb2G
         uWtb1CMsy6ahnWlexl7mQ0WyQXe6S3frfB+vEqoY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document huawei,sturgeon device
Date:   Sat, 24 Sep 2022 17:29:36 +0200
Message-Id: <20220924152937.4076-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the Huawei Watch ("sturgeon") which is a smartwatch based on
Snapdragon 400 SoC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v2:
* Pick up tags

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

