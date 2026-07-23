Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5362BF3D7;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784772182; cv=none; b=mxkJGJgabrK5OG7NCUk4fi0kQH1hkg/DWiPRTEi+PmH+CVjQl+SQv5HFASUbglF+exYTKm0XI4XXRznJX5XOX8nfRRZ1RSTEAyazhXNqPOxSP2myqbjGXzMqlnPpCFzB8eLvwSfz5syXhZZdcpeGhZs189y2EtJxUCrs+7IW2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784772182; c=relaxed/simple;
	bh=DEG8euhd5JLh30PfhiVY4dSvqS4JvY1creVU//YkYZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZig26RjgGLy8oP9Bt6Ujx8r+7fwcM82HH99wN+S5x5htrOTK63yiCadEjzGLM3EEEKphi+MtKWlDQfAo+u1NdIZG44VYRppMmSnhzjKJYTy+AOStVXp9gQGWQ1V7AVH5ts8dmBJE1xSZMjHi3Rkff18KB+8WTivFbUQs+3oow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nk66nb0E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nk66nb0E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D12DC2BCFA;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784772182;
	bh=DEG8euhd5JLh30PfhiVY4dSvqS4JvY1creVU//YkYZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nk66nb0EumFc+yhJqCNdbbdhWiTFHis9VvIQjTBGbCTIe1GVRnr0KjFsi5uLrXqNf
	 Q4+VR2gte+2ewvjOfEr5iaY0F0YC8Jh5uNnCad2+HKUnY8ynHsLvxXcvvnn9b+xF+L
	 B4nhaJTICKO25JNSKbFXdMEb37pXi+221YUPB8nebtzQjubk3sfAIXPgSPAcQt196L
	 E4/t+VJlyeLw2b64DcGkiPdvd1zGGX7P7wWpt3n1bIHQcZWyh9qQAFdMSnXhWSc3zq
	 Z2HZs+CyxhCAE3Mol2fGHOGzNylTLfpbuDLcRWAnS7mbq5cQe5OJhHl559IYoi7/hN
	 UEbWR3fNhTOig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74602C4453F;
	Thu, 23 Jul 2026 02:03:02 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 22 Jul 2026 22:00:02 -0400
Subject: [PATCH v3 2/2] phy: qcom: qmp-combo: Add SM8475 support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-sm8475-bup-usbss-v3-2-0dd5da218ab2@proton.me>
References: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me>
In-Reply-To: <20260722-sm8475-bup-usbss-v3-0-0dd5da218ab2@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784772180; l=11066;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=RVLN86+UQKtmY9cCYU0KqvQIUlUqHpXKayiKQtybKmE=;
 b=F4eBt1SBFh2GtJf/0GaF/GYKSh6NM8whNKW0ToKvoE0yzYEYspnQn31s2u+SM5UdAO3j9IT0O
 5OnF622M08UDWLlQ+TFIasoFgGd5Oz8bTRD4gC9heq0RHCVPFRUwEyp
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Has been tested with the following capabilities:
- USB Type-C at 10Gb/s
- DP Alt Mode, using HBR2
- USB Type-C at 480Mb/s + DP Alt Mode, using HBR2

RX and PCS USB tables had to be added, while serdes, TX and PCS tables were
reused from other SoCs.

Some SoCs such as SAR2130P, SM7550, SM7635 and SM8475 use 4nm-v1 PLLs.
For SM8475, trying to use qmp_v6_dp_serdes_tbl structs (which are for
4nm-v1.1 PLLs) causes link training to fail because of ref clock
differences, which in turn makes these structs differ.
Add structs for v1 PLLs as well.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 169 ++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 9bd666ac2c49..8b46f36bd24c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1063,6 +1063,55 @@ static const struct qmp_phy_init_tbl sm8350_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
+static const struct qmp_phy_init_tbl sm8475_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_UCDR_SB2_GAIN2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_GM_CAL, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_LOW, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_LOW, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH2, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH3, 0xdf),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_00_HIGH4, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH2, 0x9c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH3, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_RX_MODE_01_HIGH4, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_VTH_CODE, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_CTRL1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V6_RX_SIGDET_CAL_TRIM, 0x08),
+};
+
+static const struct qmp_phy_init_tbl sm8475_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+};
+
 static const struct qmp_phy_init_tbl sm8550_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE1_MODE1, 0xc0),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SSC_STEP_SIZE2_MODE1, 0x01),
@@ -1337,6 +1386,29 @@ static const struct qmp_phy_init_tbl qmp_v5_5nm_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_5NM_TX_TX_BAND, 0x01),
 };
 
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
 static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_SYSCLK_EN_SEL, 0x3b),
@@ -1471,6 +1543,54 @@ static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_POST_CAL_OFFSET, 0x10),
 };
 
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
 static const struct qmp_phy_init_tbl qmp_v6_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V6_COM_DEC_START_MODE0, 0x34),
@@ -2838,6 +2958,51 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.has_pwrdn_delay	= true,
 };
 
+static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
+	.offsets		= &qmp_combo_offsets_v3,
+
+	.serdes_tbl		= sar2130p_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sar2130p_usb3_serdes_tbl),
+	.tx_tbl			= sm8550_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8550_usb3_tx_tbl),
+	.rx_tbl			= sm8475_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8475_usb3_rx_tbl),
+	.pcs_tbl		= sm8550_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8550_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8475_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8475_usb3_pcs_usb_tbl),
+
+	.dp_serdes_tbl		= qmp_v6_dp_v1_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qmp_v6_dp_v1_serdes_tbl),
+	.dp_tx_tbl		= qmp_v6_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qmp_v6_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qmp_v6_dp_v1_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qmp_v6_dp_v1_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v6_dp_v1_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qmp_v6_dp_v1_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v6_dp_v1_serdes_tbl_hbr2),
+	.serdes_tbl_hbr3	= qmp_v6_dp_v1_serdes_tbl_hbr3,
+	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v6_dp_v1_serdes_tbl_hbr3),
+
+	.swing_hbr_rbr		= &qmp_dp_v5_voltage_swing_hbr_rbr,
+	.pre_emphasis_hbr_rbr	= &qmp_dp_v6_pre_emphasis_hbr_rbr,
+	.swing_hbr3_hbr2	= &qmp_dp_v5_voltage_swing_hbr3_hbr2,
+	.pre_emphasis_hbr3_hbr2 = &qmp_dp_v5_pre_emphasis_hbr3_hbr2,
+
+	.dp_aux_init		= qmp_v4_dp_aux_init,
+	.configure_dp_tx	= qmp_v4_configure_dp_tx,
+	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+
+	.regs			= qmp_v6_usb3phy_regs_layout,
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+};
+
 static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
 
@@ -5001,6 +5166,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
 		.compatible = "qcom,sm8450-qmp-usb3-dp-phy",
 		.data = &sm8350_usb3dpphy_cfg,
 	},
+	{
+		.compatible = "qcom,sm8475-qmp-usb3-dp-phy",
+		.data = &sm8475_usb3dpphy_cfg,
+	},
 	{
 		.compatible = "qcom,sm8550-qmp-usb3-dp-phy",
 		.data = &sm8550_usb3dpphy_cfg,

-- 
2.55.0


