Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC1ECAAD5
	for <phone-devel@archiver.kernel.org>; Tue,  6 Sep 2022 18:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiIFSgD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 6 Sep 2022 14:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiIFSfs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 6 Sep 2022 14:35:48 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C8E6AA2D;
        Tue,  6 Sep 2022 11:35:47 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4F638C761F;
        Tue,  6 Sep 2022 18:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1662489316; bh=8D02+hHtP3O+A5EfJrULu2835893cFwV9lamnSBN2kI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=qmC8T6uTSfeYva6WHMV0gTAvdHS/OBauEjcOB1n58WRDfp14woU9do0OlHqNsaV3B
         L6I9MznFtU0JAVQTP8M66VF8vMT3+3f0z9Ml76JnLdX4IpdJgj4Zqbt/5cIrQ9pWTr
         6ucejJrdepQbff+BwVbixbo3FDyqgB4VBxeOsNRY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: qcom-iommu: Add Qualcomm MSM8953 compatible
Date:   Tue,  6 Sep 2022 20:33:32 +0200
Message-Id: <20220906183334.203787-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906183334.203787-1-luca@z3ntu.xyz>
References: <20220906183334.203787-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the compatible used for IOMMU on the msm8953 SoC.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v2:
- pick up tags

 Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 059139abce35..e6cecfd360eb 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -10,6 +10,7 @@ to non-secure vs secure interrupt line.
 - compatible       : Should be one of:
 
                         "qcom,msm8916-iommu"
+                        "qcom,msm8953-iommu"
 
                      Followed by "qcom,msm-iommu-v1".
 
-- 
2.37.3

