Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684203B27F5;
	Wed, 29 Jul 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356408; cv=none; b=lzeY3ipW11ISbdC0EYQ0bSjh/q1zzfvn5sH/QuHHBxWDD3trXrvbKTTkGJ3H9dr5HQQTqxxKURz7kieAdnMiUbb5Z4etCzxCFESpLuiBnMvCGT4Q4xSbynyi5XqIPyOCzD70ygV8RfBaL4nneDU3UZMHrc7H9dbP0t9Y4k5zhJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356408; c=relaxed/simple;
	bh=l4eCm8AIWkDUoE3WTsV7Zxme0lc2GyFF0+eYcS0+My8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/+yTQ+eZUQinoXIC8NciMDz+hR3vcyS3Pd1cbipKjGP1WMOfL/T3vdCP+/t4vodXYf7WebCh0cUIkxhv1MOSpAnz11rdQ2mCpw7rXto+7Q6lP9Gyuv7KgU55d6I4lDuBIqm5HmchzlzDONDLuq3moVszmeMN2KIZScGtnfHJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5DhOVZZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5DhOVZZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 896D8C2BD00;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785356407;
	bh=l4eCm8AIWkDUoE3WTsV7Zxme0lc2GyFF0+eYcS0+My8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L5DhOVZZOxB8uYBALt3K7fRNc9n7qdBE+03oDBFCvX5HeTt+s4GcYt/k8wmZHMRfC
	 ZyFAxeGGv5IclxPVzm5HUUSPMzJf0vWDGuynN2NCNQJBu8+On/hJ/8JpdGH4oYDnCR
	 nUjX21IQELQL4wlRfXczt/9rE3omeHU2083ZImbm7x158AX5jSMtO8QHceIyQ57JlE
	 +za1Dqj+ZG3LibaXx+P7AAhcDNAgj1kGera3/dQ+Tbpa61kJHfU7BMTg1yFd/wwrKr
	 EOUmPm2n7l13GL7zujYkJV4wGCfKa+2SIGC51y1skMwJdP8teuf6u4dQipqBAvLeNg
	 m5hyrNgJtOOQA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68439C54FD4;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Jul 2026 22:19:57 +0200
Subject: [PATCH RESEND v9 2/9] media: qcom: camss: csiphy: Introduce PHY
 configuration
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-cphy-v9-2-1f8d9fdab037@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=X7AOYJ4niyGHoBf3ode1cySyXfbTbBCjzlnLn/fppe8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqamB0UTUyMu3zr4PkZsyo96BQ9t0E6rPnBZ2iG
 tzI5GI3aH2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCampgdAAKCRBgAj/E00kg
 cpWbD/0TzgJlNU/61yRJEakc3/O83Qkv7OVrSvJqKOA0h+HDGZsZ85HEyxwhCjnuYM5+hHz2AMW
 axHQRkkb7tYwzTPR23u1nH0S5Z5+e6c7f/F4mW/zDG2qA1vOlVKXmyuD8am9AgK8zfwxuVxZf5f
 ELuzEytKyJ+8ugSJECccwbmR7NKqQ3fpKgZhDPemI1EcBevyzLFxGjkNLbZB/B0CM+ncYsahWkz
 Ub+v5DN794ZBujTHffkoGzu5jij43YP6M3E+59CQKxoKj7wHkxWLtzNtL6c73He+ovr2Hn1SuBT
 h/lKAA5Kkz8iX65ocC6g6UDlUvlq1CaxD4Rttod/sdAZPSPC4XcCXpTDO0b7ZZNPOiGF0PCEwLG
 ez3Pnx72n/pVH0teM2BER2K9wIctnue/0mElGt8FuNosVeWUnJ3EgPE8cuxh2nkcHnDJSmh0Syg
 LhN+ThmEQwSr1CpoV4u1SKt1vDQieGDnyLU5i0aH5OI788eZi7tPpDeVjnfTbAlnDXLe7K6Kt7B
 L0pNSgS8R1R7UycC3OF9CWiECAXYwrvNtX7qfoI+4Th3WrOARVIhU1nJKTe3aurod3P3pch3LbT
 v4324rqvac8B9GJMb/Z+rPiXvv+gUm8js3GqvMAn1UUOEuikyRRak9bL2Mx/QPn7JICN+1Drybe
 cDgqy1VfelqH6eg==
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


