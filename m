Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEFFC433E0
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 16:32:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 022AC22527
	for <phone-devel@archiver.kernel.org>; Sat,  9 Jan 2021 16:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbhAIQcS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 11:32:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbhAIQcR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 11:32:17 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A5BC061786
        for <phone-devel@vger.kernel.org>; Sat,  9 Jan 2021 08:31:36 -0800 (PST)
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 325AE1F4C0;
        Sat,  9 Jan 2021 17:31:34 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konradybcio@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: socinfo: Add SoC IDs for 630 family
Date:   Sat,  9 Jan 2021 17:31:22 +0100
Message-Id: <20210109163123.147185-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Add missing SoC IDs for Snapdragon 630-family platforms.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/soc/qcom/socinfo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index d21530d24253..0a77318b9ce6 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -224,10 +224,17 @@ static const struct soc_id soc_id[] = {
 	{ 310, "MSM8996AU" },
 	{ 311, "APQ8096AU" },
 	{ 312, "APQ8096SG" },
+	{ 317, "SDM660" },
 	{ 318, "SDM630" },
 	{ 321, "SDM845" },
+	{ 324, "SDA660" },
+	{ 325, "SDM658" },
+	{ 326, "SDA658" },
+	{ 327, "SDA630" },
 	{ 338, "SDM450" },
 	{ 341, "SDA845" },
+	{ 345, "SDM636" },
+	{ 346, "SDA636" },
 	{ 349, "SDM632" },
 	{ 350, "SDA632" },
 	{ 351, "SDA450" },
-- 
2.29.2

