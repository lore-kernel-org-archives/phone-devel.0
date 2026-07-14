Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55373DB329;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011015; cv=none; b=oY1do52ytc8rZ+4hkHMxqmqGx9bGhImZrIOMISYBggSlsSGe2/E4I6PMwaLD1KutMkzOxhfnnHrVggr6rFxeg5iD5uAJviTGjc6H8oMYKlrCornHTyGDweciWXsxcc64KoHbNMmIjY39o0azpscrpTNpGIiCztpsHY5GbjZWejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011015; c=relaxed/simple;
	bh=BmjNwW2GrvmbXnV3xY6LBLF+hBmbOUehz7dVQDQK/xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/qtEOg2OHr5f1AvnHaiBrLcs7ch9rfdYshBcnVkztd98LK2lWFQPpYBb5tHLdS37//736ZcSdva92Grpc6yXQSyuPLoush4RVv9iLDDyEHmIpBNdMYuodgwCY0lnFlcRJKs667reJd3Zn7wVGijSPnMghQC70fDBR5iw8e2gck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FziAKfl0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FziAKfl0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DBD6C2BCC9;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011015;
	bh=BmjNwW2GrvmbXnV3xY6LBLF+hBmbOUehz7dVQDQK/xg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FziAKfl0Rc+7F1FE6UmI2RYMK2tnVYHBMBnTPRlbcLxjQOAt3lhu36VwZDhOQ2FK1
	 0TO64Q1LF7bZsh0W9OsyTspQ4O/fvivlBJD4PGbTb1WCS6Ze6pw4N1jTrbewuLXgHo
	 5YnFBpOQgzs1au8rZNdK2pWg08yTCcsCXDApR52QTiI8YXw3PO1sdHkUB5btAF1hcP
	 jGukkpuwrEy5rmMtV78FVUVRsLNS+dX+H932G+SeTyvzw9MF9WZIrow2J8itEZeins
	 vf0BoBlMgSuhDvnJe8TspxrJuuXgjKtWtvsqIJb5Ot+ZEa+mySZTSJKFuxCHZAkJlb
	 e65YELv8mOphQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7AFC44507;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 14 Jul 2026 02:36:43 -0400
Subject: [PATCH 5/6] phy: qcom: qmp-combo: Add serdes and RBR/HBR/HBR2/HBR3
 tables for v1 DP PLLs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-sm8475-bup-v1-5-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
In-Reply-To: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011013; l=13250;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=+/TDxSqbOiuBRvtOrwuUu9yWXKYD8U5nmYomWVInFUA=;
 b=lb2/Z/G7lyHJucs9SVtG2+7buZ0P/obAciorxxqaE3QXzsyuXGyxyH3jq7cmXBldUPhUw6J5u
 uB2BvK7d3FKAuMM7C9OVAIps9gbLDW+ZW7u3P9jasd/NIW2p/7bdeZN
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

These tables for v6 PHYs only cover PLL v1.1.
For serdes, the difference between v1 and v1.1 is the value written to the
BG_TIMER offset.
This value is set to 0x0e for v1 PLLs and 0x0a for v1.1 PLLs. (SM8550,
SM8650 use a v1.1 PLL)
For RBR/HBR/HBR2/HBR3, most values change.
Add support for v1 DP PLLs to accommodate SM8475 support, since SM8475 uses
a v1 PLL.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 161 +++++++++++++++++++++---------
 1 file changed, 116 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cdcfad2e86b1..8c09d4c1594d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1337,7 +1337,30 @@ static const struct qmp_phy_init_tbl qmp_v5_5nm_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_5NM_TX_TX_BAND, 0x01),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_ENABLE1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CMN_CONFIG_1, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BG_TIMER, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_CORE_CLK_DIV_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_CORE_CLK_EN, 0x0f),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x3b),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYS_CLK_CTRL, 0x02),
@@ -1471,7 +1494,55 @@ static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_POST_CAL_OFFSET, 0x10),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x6f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xe2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xe2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x2e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x21),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_serdes_tbl_hbr3[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP1_MODE0, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP2_MODE0, 0x2a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_LOCK_CMP_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xe2),
+	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x18),
+};
+
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
@@ -1483,7 +1554,7 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
@@ -1495,7 +1566,7 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr2[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x46),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0x00),
@@ -1507,7 +1578,7 @@ static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x10),
 };
 
-static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_hbr3[] = {
+static const struct qmp_phy_init_tbl qmp_v6_dp_v1_1_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DIV_FRAC_START2_MODE0, 0xc0),
@@ -2443,19 +2514,19 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
@@ -2859,19 +2930,19 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
@@ -2905,19 +2976,19 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8550_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8550_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
@@ -2951,19 +3022,19 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.pcs_usb_tbl		= sm8750_usb3_pcs_usb_tbl,
 	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8750_usb3_pcs_usb_tbl),
 
-	.dp_serdes_tbl		= qmp_v6_dp_serdes_tbl,
-	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl),
+	.dp_serdes_tbl		= qmp_v6_dp_v1_1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl),
 	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
 	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
 
-	.serdes_tbl_rbr		= qmp_v6_dp_serdes_tbl_rbr,
-	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_rbr),
-	.serdes_tbl_hbr		= qmp_v6_dp_serdes_tbl_hbr,
-	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr),
-	.serdes_tbl_hbr2	= qmp_v6_dp_serdes_tbl_hbr2,
-	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr2),
-	.serdes_tbl_hbr3	= qmp_v6_dp_serdes_tbl_hbr3,
-	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_serdes_tbl_hbr3),
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_1_serdes_tbl_hbr3),
 
 	.swing_hbr_rbr		= &qmp_dp_v6_voltage_swing_hbr_rbr,
 	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,

-- 
2.55.0


