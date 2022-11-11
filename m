Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DC0C38A02
	for <phone-devel@archiver.kernel.org>; Fri, 11 Nov 2022 13:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbiKKN72 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 11 Nov 2022 08:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233985AbiKKN7C (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 11 Nov 2022 08:59:02 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC3D8C580;
        Fri, 11 Nov 2022 05:55:51 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 61DE06602A55;
        Fri, 11 Nov 2022 13:55:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1668174945;
        bh=MdaH8KbjjoGPf2cEN4UiKaUO79dviS/rWyElqvdnnE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cUJeBGFEK9tJM82NFtDomK6VlVFl04kG4uCim8R1xkWipIEew9uQ/HZDFlnir/yqY
         fGPqhsB+aOqCFVBHhHxodATBSxgl2HIF9+oMqeBpGU8twu4lRcwLkC9g5dKiw8gFNN
         xxIWq7+MDq9kDBNS+MxMfH3MyyUfBKuIXpjglktShKZYy0qx42pyPiTi3itAC37pbj
         aclVnOKQUilTgZxJZPPP357Ay8LZaHvPGVvloLylvfoIeA9KmbCtmyB73gyAJbEb2d
         OvYWNg5LNSK1iE44u+rGx6CtMyYIYJ0o9OLAbbstIoqcee77ZpxI8towd3g9+xvItM
         w8aeQvrcrnlTg==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        marijn.suijten@somainline.org, kernel@collabora.com,
        luca@z3ntu.xyz, a39.skl@gmail.com, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 7/7] dt-bindings: iommu: qcom,iommu: Document MSM8976 compatible
Date:   Fri, 11 Nov 2022 14:55:25 +0100
Message-Id: <20221111135525.204134-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111135525.204134-1-angelogioacchino.delregno@collabora.com>
References: <20221111135525.204134-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add "qcom,msm8976-iommu" to support IOMMUs on this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index b762772f80e7..b7a5822ac00d 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -9,7 +9,8 @@ to non-secure vs secure interrupt line.
 
 - compatible       : Should be one of:
 
-                        "qcom,msm8916-iommu"
+                        - "qcom,msm8916-iommu"
+                        - "qcom,msm8976-iommu"
 
                      Followed by one of:
 
-- 
2.38.1

