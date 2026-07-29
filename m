Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3F3B3C01;
	Wed, 29 Jul 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356408; cv=none; b=XJ5wuf3EG7v2+vrwC4+OnscPDqj3RWNHKQFOIaNqVybszrQRT9y0pFr1mZK6csAS7e9naKc29IGlbP9yW4Hx89wvf/V9HJjf1E9PvUEjC+/kFZ4N/ZnFaaVX1rxtsq2m/O3Vm3QyRX311JF0vP8b24AQFsWDIMt9IZmuDoZTRGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356408; c=relaxed/simple;
	bh=H1VFUp3PjkKWJdD41MKRZH7D7dfv43n0A4wgkEm6UuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KWGn/IzdpoLxnRf1p52wVE9rQW/YGk7mo2DYTd+PzQcX8a/NahY+n+DIfjeHKPVVKYeAJ44l99oFlIVvOMBNUgyANf0jz37burLVVHGtVfC1Ngj5UbIlGyETEPNtjl15VVcfw+JCM3nm5rknifPkRd01hOviskjI2T2cpdLwJss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0b6zHij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0b6zHij"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C921C2BCFD;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785356407;
	bh=H1VFUp3PjkKWJdD41MKRZH7D7dfv43n0A4wgkEm6UuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l0b6zHijzOGoXpYxjOPot4ErChuM5ifwD0FcVSdmfqa3p+h4a8DdXlKdYC3NhBZG9
	 OabdCTd2a4emMAoNscFTM2j/yuvLtZL4i3/2KSHNjL9p9t7/fLm2gJHfj0NnPVwgJh
	 xXHQDEFP2bgpYYfyYGHTrxwfyowVHLmz/pMgWiRNEmBy+HWbz0gV2jMpHEWbdE8qL8
	 S8GYHJh8M7QUM91Hj8GCehdq5PKLJOAGKGU6YGgnTPZjeBjlBgpiuOJs7XspjVuJLY
	 xsqgor8ovN2/tEf5FQAaN23sOhSu0FRx8ZJEqqdbisKAQXfgC6eDLN9ZjwhAPNXZlZ
	 3EfcjkLctvemw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CE6C53200;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Jul 2026 22:19:58 +0200
Subject: [PATCH RESEND v9 3/9] media: qcom: camss: csiphy-3ph: Use odd bits
 for configuring C-PHY lanes
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-cphy-v9-3-1f8d9fdab037@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TVUoRIJn5ULvYNpapsB4ZItCc34ZCZTZby6Hd3C8I2o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqamB0Yqcez/mNdnAcduqI4tpOAQ1ejiV2+n9XR
 F/0yqnJKjWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCampgdAAKCRBgAj/E00kg
 cm2/D/9e2x0ckwzqSxpJSi08fBpCJPDxWDexw7MWhp5JULyyT3P4F7QZl39C6ps/IZyXJK1mjmY
 xslQHNNr5rvxgXap2RYrU5r7m01yGhD6eQulYkvOWNDTTMVADNrwA8vscpS18HaWbxzWG7Eq2qQ
 m/cDHI49g4M4m4QZTw1ZCqFDoPj2ZkqQk+RDvor1xsPUvVIF8o19iccPAiHjpT4OvPoz8j+fj94
 cdp2vLCabyGrxuzYSVIgmK23lVAQ4j65Ujorfwdpp1oVUqdsQdPRiFD9ZnxY9rdbqeAh3e79uhk
 +KsRWk1u/f/3hIOKLh2mUlLxUr646DIdaGcS5BIW2Vq1dJwVNv+p8l6Ckvs7Iz1q8aRZxfDOnhX
 PZJLnTCOirjmCjZb+jTBB7OkKR9HAj7/iX+oQnUZfZyu/9XXrbpDJKlUPGoLcYhS+oWAtERmFu5
 IAXU4F8i1pgcx387VE/+UN6UKzAxYX2oquGJHJjnOgqPb7DSJIXQdEkJe9HI8oF8L8fl2IPQEhS
 K1ZHli7e40bZBj037ONzF9I4zsBayHtBWHAwPKCxD+5ZOkMNf/t7109vemvyAo5i1/+cHaG65S5
 iMCQ5v2PEiYAjLqJ8sKDg+R2rNHkB5D4c+pA5sg0CT/X+NDnK9vsN9MWF5/L2FYcuMzY0t4o8gc
 nfwMYNl/WZjzzqw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

So far, only D-PHY mode was supported, which uses even bits when enabling
or masking lanes. For C-PHY configuration, the hardware instead requires
using the odd bits.

Since there can be unrecognized configuration allow returning failure.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 7c8c0e41bc62f..dfcd9ed2eb7a3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -9,16 +9,17 @@
  */
 
 #include "camss.h"
 #include "camss-csiphy.h"
 
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 
 #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
 #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
 #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
 #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
@@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		writel_relaxed(val, csiphy->base + r->reg_addr);
 		if (r->delay_us)
 			udelay(r->delay_us);
 	}
 }
 
 static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 {
-	u8 lane_mask;
-	int i;
+	u8 lane_mask = 0;
+	u8 offset = 0;
 
-	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+	switch (lane_cfg->phy_cfg) {
+	case V4L2_MBUS_CSI2_CPHY:
+		offset = 1;
+		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+		break;
+	default:
+		break;
+	}
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
+	for (int i = 0; i < lane_cfg->num_data; i++)
+		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);
 
 	return lane_mask;
 }
 
 static bool csiphy_is_gen2(u32 version)
 {
 	bool ret = false;
 
@@ -1155,20 +1165,17 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
 	u8 val;
 	int i;
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
-	for (i = 0; i < c->num_data; i++)
-		val |= BIT(c->data[i].pos * 2);
-
+	val = csiphy_get_lane_mask(c);
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
 
 	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
 	writel_relaxed(val, csiphy->base +
 		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	val = 0x02;

-- 
2.53.0


