Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD214F112;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=jF0aGHc46/Jc87wZDiQHu4guuUNs7MNFNgFPxzT33VcBkpkjzKXKNwgvaXVPDQl3TTG4y/3jJReICnMvabLtzTKKVZrubAlZAwcmkVWI4R8CN+2rR5Tvw1h1t6L+pJELPVOnlqyV8z0K3pkJ+5LdHqbLcuDYSHbk46r86qL3i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=CjfCagTQLI8bBi6i3IWnIyNxNKAECGht+E/xZ9ED7So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsMpXcIGT0tebBZ4bV9CnERT1Sa579xNLQogpnsbetkZRLWyL38S86+a71ra8rgoYXw57J+a8ItB7dejbcluyFIuogogFiBYxX+YwGg7q/Tvl3LRt3yifcblkTyKYI0IDK6+TuT5ESHz+0pS1/ro64c3BwIIsQbRyFGkMvZtuQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKjknBo0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKjknBo0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB520C2BCF6;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232892;
	bh=CjfCagTQLI8bBi6i3IWnIyNxNKAECGht+E/xZ9ED7So=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OKjknBo03IpnKGAPltVG9Fky6T/oRTApmA1RH4DVzSjHaDRBhF50+UyShWVa8qFaB
	 k0lVaXuw/2qFbsalio4UtzVUxojBLGtWc7UTmT9ygE6Z+nOX9HhsKDVgaR51xxrvwR
	 khYB062cTkcMPISoEHY8jMzaRADgpUrM4dpOJZzMBt3X+5OOpXWKjUTMnJrYtoU0D4
	 CMZZVjGt90jk9Sv32tnpUXqgxDO8UYdNBT0rlfEqb2n213zXgjNqONkk1RRMSoSFve
	 fanh3SKUq85CfUDpsBO7hmOtv+KKLHyfiEJ9552F9jmK1/HOJaoetXmIxWoVZtfgl3
	 ymq+hYR7VR+lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FD5CD6E52;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 31 May 2026 15:08:11 +0200
Subject: [PATCH WIP v5 3/9] media: qcom: camss: Prepare CSID for C-PHY
 support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-qcom-cphy-v5-3-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
In-Reply-To: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, 
 Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3063; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=S/NCEpJ9Qg9rdkYHEby0/Ggz1JWYH66XExTkL5xCQFM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK6kmjsncTUzeO54xthml2IZ3U2SQw3iaus6
 QSkGp0N+cWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyugAKCRBgAj/E00kg
 cqmGEAChdf28mfhJCEHaxSqPEAwexYTrK/Ebkt0A7/hrBavJYvh+4G+6tEliJunghAi03i25tiB
 WGxu8Efa6Hkej9Cr94uoVOSbDRnVy7DaNR4BJh983oT9qspzEXHCZMgbH29Bn/ZUzUnGbk+IGdm
 Xt9Iv7u3KbgAqY1hzGrQE2voUSz8DSYtXaj2cli7da037gu5wtgQIifYR/ENBhF+B8uREdMp1ws
 HeTO8OWq/bkp8nly2sXd/LgmLux4OehiKMpLfFHYxt+hsozinXHaIBziTq6MYRWBxysrUpbDiWq
 WxpaWZycifJin2QanBEjCTx3UON4+KUXB5afxqbetqcVdtbvyAjnryXM8topDvQyJEhkqOgdcMt
 WjX2mpo65N1c+zsPQG1b4khb+pd4ToaUNff7rpsR4K4p7eGli61KDeo0T/JjteILQo/1XIR9pRa
 nE4mPjj328P7CkjrkrRfRga7dopVl+5gkwUVZDkm4jNUKFrb8tsVq485e+AQePnxU8wk56EqxIg
 MJoj1jOmnR2sJkuAmO+pD+tokOfQkQIvs8p5Uyi3LT9GCn752sBvhpiTYQKURuS6KiiKobc/m5m
 oPX3mqnz+agBeA2eUOPJfsgG9VIOdfhbPw1K76DrCeeToJUtc8HHEx06DrYmbw/zevhXh4DSbDq
 iEQT0p3uQyFJEZg==
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
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
 drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
 drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..52ef730b10553 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -178,16 +178,17 @@ static void __csid_configure_rx(struct csid_device *csid,
 	int val;
 
 	if (!lane_cnt)
 		lane_cnt = 4;
 
 	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
+	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
 	if (vc > 3)
 		val |= 1 << CSI2_RX_CFG1_VC_MODE;
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 48459b46a981b..8d5c872f84ed5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1286,16 +1286,17 @@ static int csid_link_setup(struct media_entity *entity,
 			/* do no allow a link from CSIPHY to CSID */
 			if (!csiphy->cfg.csi2)
 				return -EPERM;
 
 			csid->phy.csiphy_id = csiphy->id;
 
 			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
 			csid->phy.lane_cnt = lane_cfg->num_data;
+			csid->phy.cphy = (lane_cfg->phy_cfg == V4L2_MBUS_CSI2_CPHY);
 			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
 			csid->tpg_linked = false;
 		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 		struct csid_device *csid = v4l2_get_subdevdata(sd);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac8..00e2669db64c9 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -65,16 +65,17 @@ struct csid_testgen_config {
 };
 
 struct csid_phy_config {
 	u8 csiphy_id;
 	u8 lane_cnt;
 	u32 lane_assign;
 	u32 en_vc;
 	u8 need_vc_update;
+	bool cphy;
 };
 
 struct csid_device;
 
 struct csid_hw_ops {
 	/*
 	 * configure_stream - Configures and starts CSID input stream
 	 * @csid: CSID device

-- 
2.53.0


