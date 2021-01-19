Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E78C433E9
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 21:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 754C222DD3
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 21:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbhASVgj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Jan 2021 16:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391754AbhASRwY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Jan 2021 12:52:24 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540F1C06137A
        for <phone-devel@vger.kernel.org>; Tue, 19 Jan 2021 09:47:32 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8C4EA3F1F1;
        Tue, 19 Jan 2021 18:45:46 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v4 2/3] MAINTAINERS: Add entry for Qualcomm CPRv3/v4/Hardened driver
Date:   Tue, 19 Jan 2021 18:45:43 +0100
Message-Id: <20210119174544.227202-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119174544.227202-1-angelogioacchino.delregno@somainline.org>
References: <20210119174544.227202-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add maintainers entry for the Qualcomm CPR3/CPR4/CPRh driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 66052be495fb..3d9f9037f1c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14766,6 +14766,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
 F:	drivers/soc/qcom/cpr.c
 
+QUALCOMM CORE POWER REDUCTION v3/v4/Hardened AVS DRIVER
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr3.yaml
+F:	drivers/soc/qcom/cpr3.c
+
 QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
 M:	Ilia Lin <ilia.lin@kernel.org>
 L:	linux-pm@vger.kernel.org
-- 
2.30.0

