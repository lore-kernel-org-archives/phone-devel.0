Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD48C433E0
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:31:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4792923A75
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 13:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhAINb2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 08:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbhAINb1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 08:31:27 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6F0C0617A7
        for <phone-devel@vger.kernel.org>; Sat,  9 Jan 2021 05:30:43 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C83361F570;
        Sat,  9 Jan 2021 14:29:45 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 6/7] dt-bindings: regulator: qcom-labibb: Document SCP/OCP interrupts
Date:   Sat,  9 Jan 2021 14:29:20 +0100
Message-Id: <20210109132921.140932-7-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Short-Circuit Protection (SCP) and Over-Current Protection (OCP) are
now implemented in the driver: document the interrupts.
This also fixes wrong documentation about the SCP interrupt for LAB.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../regulator/qcom-labibb-regulator.yaml      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
index 1cdaff66fdb9..8cf883d78a45 100644
--- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -28,9 +28,10 @@ properties:
         default: 200
 
       interrupts:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
         description:
-          Short-circuit interrupt for lab.
+          Short-circuit and over-current interrupts for lab.
 
     required:
       - interrupts
@@ -45,9 +46,10 @@ properties:
         default: 300
 
       interrupts:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
         description:
-          Short-circuit interrupt for lab.
+          Short-circuit and over-current interrupts for ibb.
 
     required:
       - interrupts
@@ -65,13 +67,15 @@ examples:
       compatible = "qcom,pmi8998-lab-ibb";
 
       lab {
-        interrupts = <0x3 0x0 IRQ_TYPE_EDGE_RISING>;
-        interrupt-names = "sc-err";
+        interrupts = <0x3 0xde 0x1 IRQ_TYPE_EDGE_RISING>,
+                     <0x3 0xde 0x0 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "sc-err", "ocp";
       };
 
       ibb {
-        interrupts = <0x3 0x2 IRQ_TYPE_EDGE_RISING>;
-        interrupt-names = "sc-err";
+        interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>,
+                     <0x3 0xdc 0x0 IRQ_TYPE_LEVEL_LOW>;
+        interrupt-names = "sc-err", "ocp";
       };
     };
 
-- 
2.29.2

