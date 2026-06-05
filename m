Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E6346A11;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665285; cv=none; b=lLpKxwxyiK55niEODBO6ZmWnmZFPc1mBeP6LbKNIEGH9IT5ikz4LuwL1RII6c/uB4bBUApGYkK0fgSZnhb8NmjQeQ6iKesgBpjov8SuQfjLbAfjTPOZfyk/kNVnK2WfJhoRXhsM9vuB4x4NtREap/9xGRPR6wAkx5Hw1MxVPbSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665285; c=relaxed/simple;
	bh=l4eCm8AIWkDUoE3WTsV7Zxme0lc2GyFF0+eYcS0+My8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPJrr/VsiQxIfAGbMk8lXsh4RekDMABx4ybapmgDY2lUmPPbTp1oSKFzvg1gZFBmjEkr219QJMmw9vqX2+jDCxz+RmeDwI/qVt2GLixjFDvBywfdHlMv24h5To4UGojVaDBvEsh0aaWerGxIJatuBuHFOcLRKIZockCJ+CqDn1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5mS2nEf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5mS2nEf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7994C4AF09;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665284;
	bh=l4eCm8AIWkDUoE3WTsV7Zxme0lc2GyFF0+eYcS0+My8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s5mS2nEfOBlkx4J3RDvaXUfGZPebNDzwJtzyun/uf6Q7ZIYiI3bTSc9enz76Qt5S+
	 pamXgaxTe9lkCf/tomi/pjU6Wgz4XNKTiZqPzs67cohHl5bur1J392Z9vOCb0gSeTG
	 1pWAq4M++H3qFhR5TPs2rf20xNi9UlKxhg8j1Cj5+18KlJwB4B63a5FbPY2bHMl97p
	 jWssh5GDyjupaczgJJP+1iLT57ve23dYEt9hYv4pYs4U9kSJldoZOOVGkDa+4jm0at
	 Lz6WHJM20GbAezeUKH4sQo8L9N97xYTpZbC9h9LggTUw2quotVIoXjxbpVQyjUsmxh
	 lkZDCDvlwPMnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B220BCD6E79;
	Fri,  5 Jun 2026 13:14:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 05 Jun 2026 15:14:39 +0200
Subject: [PATCH v7 1/8] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-qcom-cphy-v7-1-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
In-Reply-To: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=X7AOYJ4niyGHoBf3ode1cySyXfbTbBCjzlnLn/fppe8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqIsvCpu23xb+dSDehsmAwNCCye+poRgbnQOPcd
 6HygHQq2AyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiLLwgAKCRBgAj/E00kg
 cj1FEADGAFYTnBOK/L90yh7uUSeCg/culB5FYvWKvrfqnqn5SM9ItCYKX1j9Zkw95EP74s8G091
 5QfxrSuwSwjW0TfcP2roJasvQhLLtV1G3ryQUN+EjZB2g0xEKyeGai+s75T/NairKkKwJgRIsdO
 wgWAUqEwVK4omfo5/bGmNQRUGceIPKUrXUmNnzQXnzXGwH7TQHwJ3cS8SEa47P13o1tgFTs/lSK
 qXEqhL1rDejKpDSCGtx/0/22ltpoKTE8RRMO6KhRbe+hZUYv5tNb+9rhQA5XaFd97mjXiNB/Kz3
 G5bpZgvLv/dMIzwzTJ8BMml9YkY4bJTv63CzSe4MML0oDFxNQk/blDgRpXxFQtCrvvTcwKRU8BR
 KPsSnJBG/BzGVbAR4hkzPFGJuRnfsSissJuzZq9JOSWTSOfkATg/ge0B/jWzUOw6574Jp+pO/A4
 tQP9JVyHx0ywKMlpM3wKtq1y3UWtIHIsZBecBcMYrMhni196ijlICrXcEXGV9XuOIyGuLTD8iXP
 PDSwZiv40mKqKWA5W49z3Vsps/uQ6VG+Qo7Z94JQCcfYAo8Y6ce/UNa0Z0KSogoqsJNL8N832QD
 zFKgrUtb0cA4hVvML33pmnsszFQJq0r5skSkE5NWm5cLIdQo92WArCE3iKry85cvTq1/8XOYJKI
 fNqYWdYCSinnZMw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Read PHY configuration from the device-tree bus-type and save it into
the csiphy structure for later use.

For C-PHY, skip clock line configuration, as there is none.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
 drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 9d9657b82f748..2ebb307be18ba 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -25,21 +25,23 @@
 
 struct csiphy_lane {
 	u8 pos;
 	u8 pol;
 };
 
 /**
  * struct csiphy_lanes_cfg - CSIPHY lanes configuration
+ * @phy_cfg:  interface selection (C-PHY or D-PHY)
  * @num_data: number of data lanes
  * @data:     data lanes configuration
  * @clk:      clock lane configuration (only for D-PHY)
  */
 struct csiphy_lanes_cfg {
+	enum v4l2_mbus_type phy_cfg;
 	int num_data;
 	struct csiphy_lane *data;
 	struct csiphy_lane clk;
 };
 
 struct csiphy_csi2_cfg {
 	struct csiphy_lanes_cfg lane_cfg;
 };
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7..072c428e25166 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4761,19 +4761,23 @@ static int camss_parse_endpoint_node(struct device *dev,
 	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
 
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
-	lncfg->clk.pos = mipi_csi2->clock_lane;
-	lncfg->clk.pol = mipi_csi2->lane_polarities[0];
 	lncfg->num_data = mipi_csi2->num_data_lanes;
+	lncfg->phy_cfg = vep.bus_type;
+
+	if (lncfg->phy_cfg != V4L2_MBUS_CSI2_CPHY) {
+		lncfg->clk.pos = mipi_csi2->clock_lane;
+		lncfg->clk.pol = mipi_csi2->lane_polarities[0];
+	}
 
 	lncfg->data = devm_kcalloc(dev,
 				   lncfg->num_data, sizeof(*lncfg->data),
 				   GFP_KERNEL);
 	if (!lncfg->data)
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {

-- 
2.53.0


