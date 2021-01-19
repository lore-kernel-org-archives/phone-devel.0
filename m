Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29F3C43381
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 22:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A503230FE
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 22:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730743AbhASWZz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Jan 2021 17:25:55 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:41585 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbhASRqN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Jan 2021 12:46:13 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 08E053F0B2;
        Tue, 19 Jan 2021 18:44:23 +0100 (CET)
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
Subject: [PATCH v4 1/7] regulator: qcom-labibb: Switch voltage ops from linear_range to linear
Date:   Tue, 19 Jan 2021 18:44:15 +0100
Message-Id: <20210119174421.226541-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
References: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The LAB and IBB regulator have just one range and it is useless
to use linear_range ops, as these are used to express multiple
linear ranges.

Switch list_voltage and map_voltage callbacks to *_linear instead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/regulator/qcom-labibb-regulator.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 9f51c96f16fb..0fe0f6bce4cf 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -59,8 +59,8 @@ static const struct regulator_ops qcom_labibb_ops = {
 	.is_enabled		= regulator_is_enabled_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
-	.list_voltage		= regulator_list_voltage_linear_range,
-	.map_voltage		= regulator_map_voltage_linear_range,
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
 };
 
 static const struct regulator_desc pmi8998_lab_desc = {
@@ -76,10 +76,8 @@ static const struct regulator_desc pmi8998_lab_desc = {
 	.off_on_delay		= LABIBB_OFF_ON_DELAY,
 	.owner			= THIS_MODULE,
 	.type			= REGULATOR_VOLTAGE,
-	.linear_ranges		= (struct linear_range[]) {
-		REGULATOR_LINEAR_RANGE(4600000, 0, 15, 100000),
-	},
-	.n_linear_ranges	= 1,
+	.min_uV			= 4600000,
+	.uV_step		= 100000,
 	.n_voltages		= 16,
 	.ops			= &qcom_labibb_ops,
 };
@@ -97,10 +95,8 @@ static const struct regulator_desc pmi8998_ibb_desc = {
 	.off_on_delay		= LABIBB_OFF_ON_DELAY,
 	.owner			= THIS_MODULE,
 	.type			= REGULATOR_VOLTAGE,
-	.linear_ranges		= (struct linear_range[]) {
-		REGULATOR_LINEAR_RANGE(1400000, 0, 63, 100000),
-	},
-	.n_linear_ranges	= 1,
+	.min_uV			= 1400000,
+	.uV_step		= 100000,
 	.n_voltages		= 64,
 	.ops			= &qcom_labibb_ops,
 };
-- 
2.30.0

