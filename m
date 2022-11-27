Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E43FC43217
	for <phone-devel@archiver.kernel.org>; Sun, 27 Nov 2022 18:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiK0STV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 27 Nov 2022 13:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiK0STU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 27 Nov 2022 13:19:20 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2829BC0B;
        Sun, 27 Nov 2022 10:19:19 -0800 (PST)
Received: from g550jk.arnhem.chello.nl (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 93D2FCAAFE;
        Sun, 27 Nov 2022 18:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1669573127; bh=te1aGjpIXAW8fSvdUbBWpIhdrJ7fXXsmXhoh/IVj0Do=;
        h=From:To:Cc:Subject:Date;
        b=aMwF6niYRfggap4nzdMlPYPNqteKrjSNjV6tUW8l6miNu4CQWipTGx3ZQB8S8wDJ1
         TkB7rNGz9CwtgkMpChtKKXkeuN5GjhDu78Ky+xD/eAPbe3YCGt8aqk1O3+JcfwMDVy
         GswCWwPO/Ej85ce4lbKieoqV8LAzkrzZUZ3W/fmg=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
Date:   Sun, 27 Nov 2022 19:18:34 +0100
Message-Id: <20221127181835.806410-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the OnePlus One ("bacon") which is a smartphone based on the
Snapdragon 801 SoC.

Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 463509f0f23a..3d2cc8ae34d8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -167,6 +167,7 @@ properties:
           - enum:
               - fairphone,fp2
               - lge,hammerhead
+              - oneplus,bacon
               - samsung,klte
               - sony,xperia-amami
               - sony,xperia-castor
@@ -896,6 +897,7 @@ allOf:
               - qcom,apq8026
               - qcom,apq8094
               - qcom,apq8096
+              - qcom,msm8974
               - qcom,msm8992
               - qcom,msm8994
               - qcom,msm8996
-- 
2.38.1

