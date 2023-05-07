Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A6BC77B75
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 09:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjEGJNH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 05:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjEGJNF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 05:13:05 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE0293EF;
        Sun,  7 May 2023 02:13:04 -0700 (PDT)
Received: from [192.168.178.23] (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 70D90CED44;
        Sun,  7 May 2023 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1683450782; bh=+HLqotxx7gZMNsXvbHFzLrlC56VGgmQVw5mOG7any3k=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=I/dZSPdDA572hljFRrN7W+2ZA4mwDEMq7391pceKwdyz751WCX5XnFBoMod0rd1E7
         2bikMtFQoes2CN2bykdWKZVG7E203fuAmAoznXZ581X//h6kpObsQrSTs1wGORjCug
         wqL3wTx0FwtY3TqGFil29xZ0mNxe9naDlnbSLshQ=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Sun, 07 May 2023 11:12:21 +0200
Subject: [PATCH 4/6] dt-bindings: sram: qcom,ocmem: Add msm8226 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230506-msm8226-ocmem-v1-4-3e24e2724f01@z3ntu.xyz>
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
In-Reply-To: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1059; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=+HLqotxx7gZMNsXvbHFzLrlC56VGgmQVw5mOG7any3k=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkV2ua0xwuSXq/FjkXsYzhznBLwXPROZrFFglpf
 spNVlbngv+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZFdrmgAKCRBy2EO4nU3X
 VneiEADYmn8WW8ia3MJJq/N9f/5r4Cd/U20tZ21DQ9MdG3y27pipiRNgtx9Re9Ji9zbl2xIQSg6
 Jp5LgZ/ixxmCPq5AANj3Y6K+oi7Ljh5Z/OcWLnlc2ZokKHq6NvTxeK0xNCqaOStQ/bsmh+38/GT
 uZRLIHV3VfdISsWTSNIrm+uZ1Nz/rUew6gsagvXKNBiCo66bIDFcLjGOhR5+7HWWUj/puJA9KRP
 RXuVpQLbu9tG4lToOYFnSRDX9RFpR0dX0v/6ZAhCk1UE5ObL1hSHPJ5KtLbBsfBh7coGxBJy1Qq
 4xkrKAAyuCb7aZdjgbgv7u87/KXBMz6rgeiPxX5/BD2wH6HGXOGip/NRpcEwv9yif2roQ/YwJH/
 omemRNmuwi5dGpsHYZwl1w2WQiDaHntVdTnfWPl7KzotyWXJNvAVhMzd5NEWR6+LPdnY3Yh9Vj8
 zWTBGdYWvktpsmzFn+APIGnYU7CV/4MddBtoAPHuEqdV4cr4NXucL3V0x862r2mzccdnxVIydSL
 bzrO4omIBHr7qm+Ba3TVOPhwqfdxwrn9Xgc1xWQpckLEXnfBObw9WYsRexWdgd4LQQp2tRF4HoA
 DXZlGsGZ/GR78vWq2jmFRnQTas4KWtZwz04JGdFi+MWywjr8iaL8SiFbipYr2Qt01Kr1/7aT7Fn
 Rcg8Azc/jc9tGuw==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible for the OCMEM found on msm8226 which compared to
msm8974 only has a core clock and no iface clock.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
index 4bbf6db0b6bd..515f0d8ec641 100644
--- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,msm8974-ocmem
+    enum:
+      - qcom,msm8226-ocmem
+      - qcom,msm8974-ocmem
 
   reg:
     items:
@@ -28,11 +30,13 @@ properties:
       - const: mem
 
   clocks:
+    minItems: 1
     items:
       - description: Core clock
       - description: Interface clock
 
   clock-names:
+    minItems: 1
     items:
       - const: core
       - const: iface

-- 
2.40.1

