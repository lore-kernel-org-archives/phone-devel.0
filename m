Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDB7C433E0
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:33:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 786F464E13
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:33:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhAaBdi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:33:38 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:40193 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhAaBdg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 20:33:36 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 23E873F25A;
        Sun, 31 Jan 2021 02:32:37 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
Date:   Sun, 31 Jan 2021 02:32:32 +0100
Message-Id: <20210131013233.54666-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This SoC while being from 8916 era, makes use of the
newer-style, floor-level management, instead of the older
floor-corner.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 22 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
 3 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 64825128ee97..9422131b4236 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,mdm9607-rpmpd
       - qcom,msm8916-rpmpd
       - qcom,msm8939-rpmpd
       - qcom,msm8976-rpmpd
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 85d1207b72d7..ebf29a77c8b0 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -116,6 +116,27 @@ struct rpmpd_desc {
 
 static DEFINE_MUTEX(rpmpd_lock);
 
+/* mdm9607 RPM Power Domains */
+DEFINE_RPMPD_PAIR(mdm9607, vddcx, vddcx_ao, SMPA, LEVEL, 3);
+DEFINE_RPMPD_VFL(mdm9607, vddcx_vfl, SMPA, 3);
+
+DEFINE_RPMPD_PAIR(mdm9607, vddmx, vddmx_ao, LDOA, LEVEL, 12);
+DEFINE_RPMPD_VFL(mdm9607, vddmx_vfl, LDOA, 12);
+static struct rpmpd *mdm9607_rpmpds[] = {
+	[MDM9607_VDDCX] =	&mdm9607_vddcx,
+	[MDM9607_VDDCX_AO] =	&mdm9607_vddcx_ao,
+	[MDM9607_VDDCX_VFL] =	&mdm9607_vddcx_vfl,
+	[MDM9607_VDDMX] =	&mdm9607_vddmx,
+	[MDM9607_VDDMX_AO] =	&mdm9607_vddmx_ao,
+	[MDM9607_VDDMX_VFL] =	&mdm9607_vddmx_vfl,
+};
+
+static const struct rpmpd_desc mdm9607_desc = {
+	.rpmpds = mdm9607_rpmpds,
+	.num_pds = ARRAY_SIZE(mdm9607_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO,
+};
+
 /* msm8939 RPM Power Domains */
 DEFINE_RPMPD_PAIR(msm8939, vddmd, vddmd_ao, SMPA, CORNER, 1);
 DEFINE_RPMPD_VFC(msm8939, vddmd_vfc, SMPA, 1);
@@ -299,6 +320,7 @@ static const struct rpmpd_desc sdm660_desc = {
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7714487ac76b..9519eb38d695 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -69,6 +69,14 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MDM9607 Power Domains */
+#define MDM9607_VDDCX		0
+#define MDM9607_VDDCX_AO	1
+#define MDM9607_VDDCX_VFL	2
+#define MDM9607_VDDMX		3
+#define MDM9607_VDDMX_AO	4
+#define MDM9607_VDDMX_VFL	5
+
 /* MSM8939 Power Domains */
 #define MSM8939_VDDMDCX		0
 #define MSM8939_VDDMDCX_AO	1
-- 
2.30.0

