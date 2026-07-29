Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBF53C4562;
	Wed, 29 Jul 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356408; cv=none; b=PsUjsjyzjOz+uGXDqLJlEDfJ0Vs1BnF2/MeuzDxsjdS43WR6YnSVRf0uReSXRLp5vej6ih3Sqcm2W+urgteRfHND0FJIrUDw/vumxE8+1ju7HKsncmTwgCzN8KBW9eKX2S1s9yJ+FyQdXaDC4AJnP1s3JT+omoOKryqicWKnuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356408; c=relaxed/simple;
	bh=ZtkKxd60xEW43VntlvY4sLAKHlCHp3eULW5s/cjLDhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtiUaB2a/a4qXMJFqXiMDLqFVvgXXK8cAsGOVrdXQEoBJgy3tymtpaGxHFpTLv3m6AFCYwl6up+qIMhHtEfIpUbDc/i2NuOVFmVXNJLXyPmeer3CPo4nnmsJOm6Ze3VzG0f3Yd+3Jh8xQeuLjUr7Ib3a8OJuhl72aeQa3P63zqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcrWNS+z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcrWNS+z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B19CEC4AF0B;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785356407;
	bh=ZtkKxd60xEW43VntlvY4sLAKHlCHp3eULW5s/cjLDhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rcrWNS+zYGKGEiGm+cmyfmLyJkLIo6gPSROimAcGu7Ck3YOjiqnff/fdetii7D5Ex
	 W9cw/FtRe4PYLvhNM/fCn+SuEjZHkYeC0hn0hZJIyU/971tmhxFGBDX0s77pmfH/sg
	 adXnvSoM6bNFQdyU0n5Lw15dgkhpetSC30bjtOG0NloI5wKbUGPMeN+kdcIskVW9rY
	 D8pGCtgQ375FIAy6zzHCnh5AY72lNXTtRu8kvZuUVvFwXK5dBcK2U241vzrulrCTsv
	 SDtJzu21XvMUSTnVQ6xi7RKaToE0VTLjHWxBOGA1fUd5bwpxykpoKnoiwBXR6VAMOe
	 OQIumwBvXssnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9BCC54FDF;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Jul 2026 22:19:59 +0200
Subject: [PATCH RESEND v9 4/9] media: qcom: camss: Prepare CSID for C-PHY
 support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-cphy-v9-4-1f8d9fdab037@ixit.cz>
References: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
In-Reply-To: <20260729-qcom-cphy-v9-0-1f8d9fdab037@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3790; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Dwf77+B9c0r+gobTTVReD8yJa9lkMli7TZg+cx0MdpU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqamB0psmU259WbZFc0zqyTL4oVR7CPLS0ZPI2v
 Qh8A77j3LCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCampgdAAKCRBgAj/E00kg
 cgdSEAClgKJpbk4LrWmkqgDIep1tBv1tnIepgnwbLS38c13qo8v067gxii2Eyo5NkQFRBs4uocn
 lAmjUNCooucSMR2VvlQBO1N1fWHYgo6LWkA+ODFBminp3uLwazInkxlCAhOdxXGBvFbCis3PrkV
 IHtL5nDMzrdzPThFgqfvZ81x4i+1lyR0XnN6Em7Bd1B5AYigqgRnURbVaRtl0YtJRgpZX6w+vWX
 aVLTCR+41NW63ldxcAELRKh4vigndHJMlqkpbaRppAJEBZikgIAajctrTzNRA0U8FnqNS46v8zA
 ejJ1hWqdrtXgCkcK42RfxK0qQuOXzaP6N90PzwRqgA7EftZDwt/QUhDpB032xnf4dikORBq9EGb
 pDiPCFwn7tNQOFK25uqQk2yJGHiNZnYRq/ci45atpa2R65Xmb+Xx99LtQxIu6c1anf8l9pKp6DK
 7SHWv26Vz5+nJAWX07SYNo8gZDO9rvlyCTJznMBD8PeHG+uunGb01v/usEux6fITRpU7bOVGvzr
 50WElq2wzIDjN1Zbz1agxBl8gUam7QdCWd99FqSFOW7hAHvhQNkeJICYvR6lCnFkfcdmhNDDZ9M
 ExkXTr72rP8+gmg6GFPijCBFPX3INKu3avIrUZ46g5flLvmfuBhsPylnPPk55EhFtc8aDte4FfU
 mcHBF2YllZQ4hsQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Inherit C-PHY information from CSIPHY, so we can configure CSID
properly.

CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
 drivers/media/platform/qcom/camss/camss-csid.c      | 5 +++++
 drivers/media/platform/qcom/camss/camss-csid.h      | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..a5b406cc8ead3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
 	int val;
 
 	if (!lane_cnt)
 		lane_cnt = 4;
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	val |= csid->phy.phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	if (vc > 3)
 		val |= 1 << CSI2_RX_CFG1_VC_MODE;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a981b..bcc34ac9dd212 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1286,16 +1286,21 @@ static int csid_link_setup(struct media_entity *entity,
 			/* do no allow a link from CSIPHY to CSID */
 			if (!csiphy->cfg.csi2)
 				return -EPERM;
 
 			csid->phy.csiphy_id = csiphy->id;
 
 			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
 			csid->phy.lane_cnt = lane_cfg->num_data;
+			if (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY)
+				csid->phy.phy_sel = CSID_PHY_SEL_CPHY;
+			else
+				csid->phy.phy_sel = CSID_PHY_SEL_DPHY;
+
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
 			csid->tpg_linked = false;
 		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 		struct csid_device *csid = v4l2_get_subdevdata(sd);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac8..e65590b0df69f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -39,16 +39,21 @@ enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_USER_SPECIFIED = 6,
 	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 6, /* excluding disabled */
 	CSID_PAYLOAD_MODE_COMPLEX_PATTERN = 7,
 	CSID_PAYLOAD_MODE_COLOR_BOX = 8,
 	CSID_PAYLOAD_MODE_COLOR_BARS = 9,
 	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN2 = 9, /* excluding disabled */
 };
 
+enum csid_phy_sel {
+	CSID_PHY_SEL_DPHY = 0,
+	CSID_PHY_SEL_CPHY = 1
+};
+
 struct csid_format_info {
 	u32 code;
 	u8 data_type;
 	u8 decode_format;
 	u8 bpp;
 	u8 spp; /* bus samples per pixel */
 };
 
@@ -65,16 +70,17 @@ struct csid_testgen_config {
 };
 
 struct csid_phy_config {
 	u8 csiphy_id;
 	u8 lane_cnt;
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	enum csid_phy_sel phy_sel;
 };
 
 struct csid_device;
 
 struct csid_hw_ops {
 	/*
 	 * configure_stream - Configures and starts CSID input stream
 	 * @csid: CSID device

-- 
2.53.0


