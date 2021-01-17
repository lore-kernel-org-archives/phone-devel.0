Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A9CC433DB
	for <phone-devel@archiver.kernel.org>; Sun, 17 Jan 2021 22:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BDB3224D3
	for <phone-devel@archiver.kernel.org>; Sun, 17 Jan 2021 22:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729956AbhAQWLJ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 17 Jan 2021 17:11:09 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:51569 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730124AbhAQWJT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 17 Jan 2021 17:09:19 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7BAC01F546;
        Sun, 17 Jan 2021 23:08:35 +0100 (CET)
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
Subject: [PATCH v3 4/7] dt-bindings: regulator: qcom-labibb: Document soft start properties
Date:   Sun, 17 Jan 2021 23:08:27 +0100
Message-Id: <20210117220830.150948-5-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document properties to configure soft start and discharge resistor
for LAB and IBB respectively.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/regulator/qcom-labibb-regulator.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
index 53853ec20fe2..7a507692f1ba 100644
--- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -22,6 +22,11 @@ properties:
     type: object
 
     properties:
+      qcom,soft-start-us:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Regulator soft start time in microseconds.
+        enum: [200, 400, 600, 800]
+        default: 200
 
       interrupts:
         maxItems: 1
@@ -35,6 +40,11 @@ properties:
     type: object
 
     properties:
+      qcom,discharge-resistor-kohms:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Discharge resistor value in KiloOhms.
+        enum: [300, 64, 32, 16]
+        default: 300
 
       interrupts:
         maxItems: 1
-- 
2.29.2

