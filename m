Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F13BCDB46A
	for <phone-devel@archiver.kernel.org>; Wed, 11 Oct 2023 16:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbjJKQvc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Oct 2023 12:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbjJKQva (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Oct 2023 12:51:30 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38765A4
        for <phone-devel@vger.kernel.org>; Wed, 11 Oct 2023 09:51:28 -0700 (PDT)
Received: from [192.168.178.23] (k10064.upc-k.chello.nl [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id E2A85C88FD;
        Wed, 11 Oct 2023 16:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1697043056; bh=yoZyGjULPrJB/ushmKyYZ0a6kfi9O0JULyRgzUBtrnI=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=cNuxPPz1Np+1dqd/3ExtijuH3DwnDe2wDIzcfBzXbLpuSZs2497YrOz/+dFmW/kcg
         Ar9ftFAAjAdIKwbkR6ifaWnveomrv/d0AlvJ1+gBYUg+gC5RKj3t+1tWRAF+z2CaHH
         Sehb+Rvr8y1otvqg2HNg0ccZdFYBvAVtI4+QD3aA=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Wed, 11 Oct 2023 18:50:44 +0200
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: document HTC Corporation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-htc-memul-v1-1-97c3910f80a9@z3ntu.xyz>
References: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
In-Reply-To: <20231011-htc-memul-v1-0-97c3910f80a9@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=yoZyGjULPrJB/ushmKyYZ0a6kfi9O0JULyRgzUBtrnI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlJtJtLOAcJKdRer+CwseBu0js7AOm9YT9jpIhy
 gJSXEVFLOeJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZSbSbQAKCRBy2EO4nU3X
 VgELD/kB7id1JlJunhXsTZZ1SzNfR17N1KLfufPX7iI7NJO8ELb+5KHa2OCDRdelU+R4UdxZ0jQ
 yZGwEGTxbzjYZNTjEKh09eoU4L0hB2jZej9MsEEojfRK1c+BbvKenWTMkaHJFoKDirgEDRSRgPC
 vRA2k8hEMvhwbUD57prZImWKa2r/N9ADFe6uPleH0Ycg8J+W9NC7JiVbBUnge8Wj6W6LPP7cEqz
 jamVEqcQ20W+zGuDbnKoR05D46VkXL5rboYjEA1W6di9IYYUYPofFfjWSqUxHuEPuSjHbYJ6xhL
 SQgbmiLcb2s6tz4jQW1U0QT3ON49qnBSipR1vpFY4j5C+ZfTXlTEnVfyPlFxxfEIqYHh3DeoPbO
 6UMtddCfJ1PxFbgmd+M7TlDq2gW7SLhIFg/X0XH724JZr4dfVy5RHgbBIOvzQInwbPXbHIW6f4H
 8Ag7HHpQVPLIXTYCneJy6ey0gemrHL8aEr6RD92LNw1dYiC3OsPLGOnDGC45xbez/rq5fOQBDJF
 rcubgQJL1M2RrIOpqsPo8xApFP23umnBJtMdE/XvtGGAg06ru5k/2jziVDCdaFMEi/+wMGOFWN1
 lDUrJSgp0dfWiPvX/dr0DELrTfxWX5XCRWp2ulyw7JV4iomQSiFwIuzKm0w45iN+o52nYv4pxK/
 zUuhRYRaw+Y4nRw==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the vendor prefix for HTC (https://www.htc.com/).

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 573578db9509..9fddc274ce76 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -583,6 +583,8 @@ patternProperties:
     description: Hewlett Packard Enterprise
   "^hsg,.*":
     description: HannStar Display Co.
+  "^htc,.*":
+    description: HTC Corporation
   "^huawei,.*":
     description: Huawei Technologies Co., Ltd.
   "^hugsun,.*":

-- 
2.42.0

