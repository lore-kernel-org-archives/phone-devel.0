Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15940CDB468
	for <phone-devel@archiver.kernel.org>; Wed, 11 Oct 2023 16:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbjJKQvB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbjJKQvA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Oct 2023 12:51:00 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B248F
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 09:50:58 -0700 (PDT)
Received: from [192.168.178.23] (k10064.upc-k.chello.nl [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 03771C8910;
        Wed, 11 Oct 2023 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1697043057; bh=wWDTX8e5KM6wfhYspOStX6JRz8pBMYK5n8PtCv39+Zs=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=U17D2dQQi4wIgCEJR+X6nmK9uxOE3boT728BlHMY81HbMo2CvUpwlPkhiFqpFO+yJ
         KyQn//6BD7/Kf04IhQWpjAHSrd1f59Dxr5Z2KjC7dOqwglN7zGrPA6hLyoJZU2ZR/q
         5w71boRLkgp2+6/YxlrSF49AleOTgPRIMafaC4Kk=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Wed, 11 Oct 2023 18:50:45 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add HTC One Mini 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-htc-memul-v1-2-97c3910f80a9@z3ntu.xyz>
References: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
In-Reply-To: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=wWDTX8e5KM6wfhYspOStX6JRz8pBMYK5n8PtCv39+Zs=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlJtJuMDQrXStHLQgRUrmQfVK2d/DIKRXkn5Jeh
 63mYTP2nsmJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZSbSbgAKCRBy2EO4nU3X
 VhsPD/9n2pg5XT9maiQHFgQ06W44KTlVP8QWKS2E/Zj/bmA9PH7XOlfnU8Z7O/ZgduxDNDKgN5/
 rAHG6zsm+tesC5Pp1BcFgbyEgk0rzC413KDlu26bV8CNHF/UvUinDsgVIEfkapXjcJ1iNn9Yttr
 EXEUDvpUKr29bMYIcZ7vtbU0ORl/CuuFkil/+QKjtyUYELMHZxlZoEBho451fvwY5LSrs1limX8
 ysLvBLl3o6JD8oqxHFdTBHCFR/LsZJzSd380OrwwPye2i5uhacdpqQdzUO2cV5IVYE+mG8MD1uJ
 a7QuEp1w28aycuV4D0prQDhliudTh7jQom5Lk2os/E/B1fAX8D4568T+gMW7tpMKzs8nc9cGyNY
 W8XLCakZRETMpUOXtaVGmnZn4fbweTRKZ1J6uo4Ss69FtOQLj8E8i0yJ8+Bim+Pri5G21m6DCN4
 0WVDmC2272MTmuiDipe6Zi4NkDO+gQPloTcsZmaPQknGIlMqG5SjvRFRjvqbUWxlPRi5+ahhHub
 6+w3Tx856ZVPxQ6dbaEA1B0uI3jbZFkH74tBGYvjk9tNvkoRJ5m9tM+qG3uFl0ivpuKyFyLhe56
 X2owpViO7qiaW8Ly9g4agnFRD6hAHGFD6RyGoJXYL2FeaAo5FR11hOUjyCbWsJsEyEXxNj/c+Xa
 8YHzaAK/8XB4uTg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible for the MSM8926-based HTC One Mini 2 smartphone.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2a607b1595c9..1b7f094aa100 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -192,6 +192,7 @@ properties:
 
       - items:
           - enum:
+              - htc,memul
               - microsoft,superman-lte
               - microsoft,tesla
           - const: qcom,msm8926

-- 
2.42.0

