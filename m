Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808F3B0ACB
	for <phone-devel@vger.kernel.org>; Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788042208; cv=none; b=L0TVd8cZqPYWvUXE991oZKFgD2Kqi8+79ucRICrMDu98FQRkhJgbSNvQDTMupdJU/0gE2Oh8UX++NxXDSe2MaOSFg++rrlPQduQxt4cTdqMMaIERrlzGxeXAzlbMyHe3Myv1JDDsRCtm3LSi1P4jyRrojkR+W0DNZLPDo4y5kes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788042208; c=relaxed/simple;
	bh=+QWCbs1vfrSCKDX5ZN1jPHavFu0rJEFCEzsBG9w4yAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMpyApdLUrWMdniYHfpgzqJCRbryfbRUrs6jqAvdRelfIIjq8aYXT2jtTAs7SmoT0WDvk5Nfu/Z+ZzQSMcKia4Hu99fKl/4e7VlXMTcIuL8YVv5RuMr9/10+RAz0CEcWTyuNfv190mjX4eaRf9zLU3nog5XkCG6ljyDWNZHIse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppGSSUZ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppGSSUZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8438EC2BCF5;
	Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788042207;
	bh=+QWCbs1vfrSCKDX5ZN1jPHavFu0rJEFCEzsBG9w4yAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ppGSSUZ1SxcahHjSFuNtFJjSRuVeShuWOKLpQhIfIeMDuxCZ14tmNN3fDvPnyTzdQ
	 3zRr7k6SuOW4vyuiAw9YUq1B9Y+xvf3nPA8wvGyF5PB8hjqTd5PXYRYJ6kEcNf8DS3
	 AA9PnuNxzOkaxkGZhJzh9u9c3KeBTekb/AwsXMdXYo1Jxza9OGhSGOTOt9FX8X0NRW
	 OWahQcDTlGx2ekC8Xfws/6CfDtMjYaVroMyJeunMEliqrGfP0AR+NpGFjm1PyqIfIW
	 eBsYoZ66M11Pv7bly/Xn0XgIV1Wuqb6yMq9OR7s+7oQwB7L4BDam8gt3njFiGBHLFb
	 OXznqfQfVgFlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FA6C61DD6;
	Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 30 Aug 2026 00:23:24 +0200
Subject: [PATCH 1/4] phy: qcom: qmp-combo: select PCS register offsets per
 version
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-sdm845-usb-gadget-v1-1-9f20e842d628@ixit.cz>
References: <20260830-b4-sdm845-usb-gadget-v1-0-9f20e842d628@ixit.cz>
In-Reply-To: <20260830-b4-sdm845-usb-gadget-v1-0-9f20e842d628@ixit.cz>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 David Heidelberg <david@ixit.cz>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>, 
 Federico Amedeo Izzo <federico@izzo.pro>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, phone-devel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5779; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=701kb1nWbHqICTnqECfeQq6zz5Gduo4j5M+dKN2PlgQ=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGqTW92gQMtkvtNeFUqt2+m6HunIGNtjKw2tqo3B9ibuupwME
 IkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJqk1vdAAoJEGACP8TTSSBy4XcQAKqR
 jSOT232ZZPs79+e5lN8OzUJ5BWDo1FnIQYo08c0F1qxwLaEnsRGFuwlAjNyE1q0VcI23/E8Y2cz
 H4BUC0Ln5HWI76vjDvbHOEuPIxfBXnk9+nadrm+vBmAomba85P+4VlF6yZc8twQCoVnD+fwlraU
 mwcKx2yc4+ycVk547IHla4kKcepREqMv0jjYCILWWjBZTYmH4Lmudcupe9jhP+wDhmvu6X2hup2
 eO4jzF2XFmyoeygZD5aGJx/NpjGJ/E1q5qbtB6LSZuQ1iz8CJsbG6zFyCZEI+yG5bQWSGTXzb2r
 CsQUIh/w0Iyk2q463dj3LLTyiJCr2JHc0mD/ihtCbMNkBUo36PzOt1vGNQdK67EKAdjKUp1c0VE
 CNSI52a51I4AauqJVvO3Y7pPH+otoo0LIgU6OZI7WFfXBD6a/yIeN1IOcGxhVB7478E1mDx1BW/
 LW0Vrlqmq6dITY7Ouz4Nivv0C0aiAMhMx9IWB2Xl/E7Z6R6hhLdiOBa/dsR3JLGB2VchKc7SoNv
 eZ2yK8ygEbcwz8YNAW9VGzeMGcjV9H4SSqt6Gcv+wSEqq4tnasPUnTeROuAg/hgLnesmkrBPrEK
 t2H5Iy3NM5kmm2vswNOYZl2sZcWaVvy+v3b5CoDf2p3FRIiadB9NRK6pSbmVatSaQgg6vrPJ/QB
 HiOTB
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The driver accesses four PCS registers outside of the init tables:
SW_RESET, POWER_DOWN_CONTROL, START_CONTROL and PCS_STATUS. These are
currently hardcoded to their v4 offsets, which is correct for the only
supported PHY (sc7280) but prevents adding a v3 based one, as only
SW_RESET kept its offset between the two revisions:

                        v3     v4
  POWER_DOWN_CONTROL   0x004  0x040
  START_CONTROL        0x008  0x044
  PCS_STATUS           0x174  0x014

Move the four offsets into a new struct qmp_combo_regs and select them
through the per-PHY configuration, mirroring what the Linux driver does
with its regs layout.

No functional change intended.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/phy/qcom/phy-qcom-qmp-combo.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qcom/phy-qcom-qmp-combo.c b/drivers/phy/qcom/phy-qcom-qmp-combo.c
index 0d63e482ee4..e4550302b71 100644
--- a/drivers/phy/qcom/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qcom/phy-qcom-qmp-combo.c
@@ -42,16 +42,34 @@
 #define SW_PORTSELECT_MUX                       BIT(1)
 
 /* PHY slot identifiers for device tree phandle arguments */
 #define QMP_USB43DP_USB3_PHY    0
 #define QMP_USB43DP_DP_PHY      1
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
+/*
+ * Only SW_RESET kept its offset when the PCS block moved from v3 to v4, so the
+ * registers accessed outside the init tables have to be selected per version.
+ */
+struct qmp_combo_regs {
+	u16 sw_reset;
+	u16 pwrdn_ctrl;
+	u16 start_ctrl;
+	u16 pcs_status;
+};
+
+static const struct qmp_combo_regs qmp_combo_regs_v4 = {
+	.sw_reset	= QPHY_V4_PCS_SW_RESET,
+	.pwrdn_ctrl	= QPHY_V4_PCS_POWER_DOWN_CONTROL,
+	.start_ctrl	= QPHY_V4_PCS_START_CONTROL,
+	.pcs_status	= QPHY_V4_PCS_PCS_STATUS1,
+};
+
 struct qmp_combo_offsets {
 	u16 com;
 	u16 txa;
 	u16 rxa;
 	u16 txb;
 	u16 rxb;
 	u16 usb3_serdes;
 	u16 usb3_pcs_misc;
@@ -187,16 +205,17 @@ static const struct qmp_phy_init_tbl sm8250_usb3_pcs_tbl[] = {
 
 static const struct qmp_phy_init_tbl sm8250_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
 struct qmp_phy_cfg {
 	const struct qmp_combo_offsets *offsets;
+	const struct qmp_combo_regs *regs;
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
 	const struct qmp_phy_init_tbl *tx_tbl;
 	int tx_tbl_num;
 	const struct qmp_phy_init_tbl *rx_tbl;
 	int rx_tbl_num;
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
@@ -340,17 +359,17 @@ static int qmp_combo_com_init(struct qmp_combo *qmp)
 	qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
 		     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
 		     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
 	qphy_clrbits(com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
 
 	qphy_clrbits(com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
 
-	qphy_setbits(pcs, QPHY_V4_PCS_POWER_DOWN_CONTROL, SW_PWRDN);
+	qphy_setbits(pcs, qmp->cfg->regs->pwrdn_ctrl, SW_PWRDN);
 
 	return 0;
 }
 
 static int qmp_combo_usb_power_on(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *serdes = qmp->serdes;
@@ -387,24 +406,24 @@ static int qmp_combo_usb_power_on(struct qmp_combo *qmp)
 			      cfg->pcs_usb_tbl,
 			      cfg->pcs_usb_tbl_num);
 	}
 
 	if (cfg->has_pwrdn_delay)
 		udelay(20);
 
 	/* Pull PHY out of reset */
-	qphy_clrbits(pcs, QPHY_V4_PCS_SW_RESET, SW_RESET);
+	qphy_clrbits(pcs, cfg->regs->sw_reset, SW_RESET);
 
 	/* Start SerDes and Phy-Coding-Sublayer */
-	qphy_setbits(pcs, QPHY_V4_PCS_START_CONTROL,
+	qphy_setbits(pcs, cfg->regs->start_ctrl,
 		     SERDES_START | PCS_START);
 
 	/* Wait for PHY initialization */
-	ret = readl_poll_timeout(pcs + QPHY_V4_PCS_PCS_STATUS1, val,
+	ret = readl_poll_timeout(pcs + cfg->regs->pcs_status, val,
 				 !(val & PHYSTATUS), PHY_INIT_COMPLETE_TIMEOUT);
 
 	if (ret) {
 		printf("QMP USB3 PHY initialization timeout\n");
 		clk_disable(qmp->pipe_clk);
 		return ret;
 	}
 
@@ -434,24 +453,24 @@ static int qmp_combo_power_on(struct phy *phy)
 static int qmp_combo_power_off(struct phy *phy)
 {
 	struct qmp_combo *qmp = dev_get_priv(phy->dev);
 	void __iomem *com = qmp->com;
 
 	clk_disable(qmp->pipe_clk);
 
 	/* PHY reset */
-	qphy_setbits(qmp->pcs, QPHY_V4_PCS_SW_RESET, SW_RESET);
+	qphy_setbits(qmp->pcs, qmp->cfg->regs->sw_reset, SW_RESET);
 
 	/* Stop SerDes and Phy-Coding-Sublayer */
-	qphy_clrbits(qmp->pcs, QPHY_V4_PCS_START_CONTROL,
+	qphy_clrbits(qmp->pcs, qmp->cfg->regs->start_ctrl,
 		     SERDES_START | PCS_START);
 
 	/* Put PHY into POWER DOWN state: active low */
-	qphy_clrbits(qmp->pcs, QPHY_V4_PCS_POWER_DOWN_CONTROL, SW_PWRDN);
+	qphy_clrbits(qmp->pcs, qmp->cfg->regs->pwrdn_ctrl, SW_PWRDN);
 
 	/* Power down common block */
 	qphy_clrbits(com, QPHY_V3_DP_COM_POWER_DOWN_CTRL, SW_PWRDN);
 
 	return qmp_combo_com_exit(qmp);
 }
 
 static int qmp_combo_reset_init(struct qmp_combo *qmp)
@@ -582,16 +601,17 @@ static int qmp_combo_probe(struct udevice *dev)
 
 	ret = qmp_combo_parse_dt(qmp);
 
 	return ret;
 }
 
 static const struct qmp_phy_cfg sc7280_usb3dpphy_cfg = {
 	.offsets		= &qmp_combo_offsets_v3,
+	.regs			= &qmp_combo_regs_v4,
 	.serdes_tbl		= sm8150_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
 	.tx_tbl			= sm8250_usb3_tx_tbl,
 	.tx_tbl_num		= ARRAY_SIZE(sm8250_usb3_tx_tbl),
 	.rx_tbl			= sm8250_usb3_rx_tbl,
 	.rx_tbl_num		= ARRAY_SIZE(sm8250_usb3_rx_tbl),
 	.pcs_tbl		= sm8250_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_pcs_tbl),

-- 
2.55.0


