Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95433C433E9
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EEC264E13
	for <phone-devel@archiver.kernel.org>; Sun, 31 Jan 2021 01:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhAaBc2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 30 Jan 2021 20:32:28 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:56195 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhAaBc1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 20:32:27 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 79DA83E66E;
        Sun, 31 Jan 2021 02:31:29 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] phy: qualcomm: usb28nm: Add MDM9607 init sequence
Date:   Sun, 31 Jan 2021 02:31:24 +0100
Message-Id: <20210131013124.54484-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This is required to bring up the PHY on MDM9607-based boards.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/phy/qcom,usb-hs-28nm.yaml   |  1 +
 drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
index ca6a0836b53c..abcc4373f39e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-28nm.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     enum:
       - qcom,usb-hs-28nm-femtophy
+      - qcom,usb-hs-28nm-mdm9607
 
   reg:
     maxItems: 1
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
index a52a9bf13b75..8807e59a1162 100644
--- a/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
+++ b/drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c
@@ -401,13 +401,26 @@ static const struct hsphy_init_seq init_seq_femtophy[] = {
 	HSPHY_INIT_CFG(0x90, 0x60, 0),
 };
 
+static const struct hsphy_init_seq init_seq_mdm9607[] = {
+	HSPHY_INIT_CFG(0x80, 0x44, 0),
+	HSPHY_INIT_CFG(0x81, 0x38, 0),
+	HSPHY_INIT_CFG(0x82, 0x24, 0),
+	HSPHY_INIT_CFG(0x83, 0x13, 0),
+};
+
 static const struct hsphy_data hsphy_data_femtophy = {
 	.init_seq = init_seq_femtophy,
 	.init_seq_num = ARRAY_SIZE(init_seq_femtophy),
 };
 
+static const struct hsphy_data hsphy_data_mdm9607 = {
+	.init_seq = init_seq_mdm9607,
+	.init_seq_num = ARRAY_SIZE(init_seq_mdm9607),
+};
+
 static const struct of_device_id qcom_snps_hsphy_match[] = {
 	{ .compatible = "qcom,usb-hs-28nm-femtophy", .data = &hsphy_data_femtophy, },
+	{ .compatible = "qcom,usb-hs-28nm-mdm9607", .data = &hsphy_data_mdm9607, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_match);
-- 
2.30.0

