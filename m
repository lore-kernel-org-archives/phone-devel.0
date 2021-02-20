Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058B3C4332D
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 15:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEAA364EE1
	for <phone-devel@archiver.kernel.org>; Sat, 20 Feb 2021 15:57:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhBTP5V (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 20 Feb 2021 10:57:21 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:60245 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhBTP5U (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 20 Feb 2021 10:57:20 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id DA5301F613;
        Sat, 20 Feb 2021 16:56:36 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/6] clk: qcom: gcc-sdm660: Remove gds_hw_ctrl from GDSCs
Date:   Sat, 20 Feb 2021 16:56:15 +0100
Message-Id: <20210220155618.176559-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220155618.176559-1-konrad.dybcio@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

These GDSCs do not support HW control, so remove the property.

Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 05664d6b612a..bc8dfcd6d629 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2362,7 +2362,6 @@ static struct clk_branch hlos2_vote_turing_adsp_smmu_clk = {
 
 static struct gdsc ufs_gdsc = {
 	.gdscr = 0x75004,
-	.gds_hw_ctrl = 0x0,
 	.pd = {
 		.name = "ufs_gdsc",
 	},
@@ -2372,7 +2371,6 @@ static struct gdsc ufs_gdsc = {
 
 static struct gdsc usb_30_gdsc = {
 	.gdscr = 0xf004,
-	.gds_hw_ctrl = 0x0,
 	.pd = {
 		.name = "usb_30_gdsc",
 	},
@@ -2382,7 +2380,6 @@ static struct gdsc usb_30_gdsc = {
 
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0x6b004,
-	.gds_hw_ctrl = 0x0,
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-- 
2.30.1

