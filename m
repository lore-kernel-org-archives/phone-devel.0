Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B22FB969;
	Wed, 29 Jul 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356408; cv=none; b=O2vrErF3wUmufmdXuzDBqacT3S6m0oHEXs0kwXvoJygujQqmz671XVYcXvnMwqTF1dlgBGJEA+pwATXn+gqI7ZCfismrTq+ovtvGUlVuvZ6QUrfA+GrJ06aQ1iAoKp7BjwJhtrAg9bnE9Ajjz51JgHamOXjsWq4Y6OYSMSZtBgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356408; c=relaxed/simple;
	bh=Uk/b7YYDhvgsGviOg3h2t2SDHyXuI+Sg+OG/3Q4uIb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XVxHqge1L4nv6BxqdMaqwQY43f5fMPGooLfTLmW94PIY987DiXLh0UCtH80Zdf4PBfiAj4k15WDWgHyKwz+E40yQZRwqMz2SOg6ZuUgGOzy5+I/0R30tM4YuOjqkKO83O/Hr2qMgRGRnyaTluh2KT10XJTBSjSzko4iyM5VHJ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbSGOru2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbSGOru2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C285C2BCF5;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785356407;
	bh=Uk/b7YYDhvgsGviOg3h2t2SDHyXuI+Sg+OG/3Q4uIb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sbSGOru2Cf07i6EgTxmnhqr+7TQQHOwUBip4BGSC4q6QdwUUSpcKn+C4LDKtWrSjC
	 0ar8BJYgfzfe+olIH7OlgYSd0VLs3Qno2h33GZhRFK+tEmxSSYQPqVevlHZLagN3LY
	 yo2iOHzBE8ieQ9F5utBm7SYE0LEFzImupKJJC+/b5cUXkyAFG8VAmoPH/8tpnporlH
	 hgzZUKt3uII44NErW7ZuDaeisLNWcXYkOf+12d6DUuwggV/coiF72j97Ja5MKlfUnw
	 NluJdRVgmuEtj8rvwb+Wt1C1dZiTEhbGTu332wv/Lg/ip3p0sFLO67vRw0ypNiFj3r
	 Pfy1VYsY++oPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4722DC54F51;
	Wed, 29 Jul 2026 20:20:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Jul 2026 22:19:56 +0200
Subject: [PATCH RESEND v9 1/9] media: qcom: camss: csiphy-3ph: Fix lane
 mask calculation
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-cphy-v9-1-1f8d9fdab037@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4gZLnNPEAXXeOriBAOpQ0RLijJCSPBaruO2JK2La25Y=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqamB0D/WEwBLCTjLj8KeBnVkmz70gKtjM+vX5r
 RH9WRRTRUSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCampgdAAKCRBgAj/E00kg
 ctcuEADJTLBzW99W5nyfBGx+t44Y8VhURBxCKlTzKZkxgbLt5NkzPvIi6k+LQCiQtbR4KE1BRH6
 +uTClKFxsyUslZKgBaJi3qVPY8AYPgS3MHlW8d42aUJPTh96LVCqeGrbomLOXiDelfrT9dEaPUQ
 +DM04Bv3QQ0YfbFsXuDxOWSqSelGbCtwBtF3jBkTzoe5TNdkyrJMvKEznMMK7IB5CmA2zzHb3Q3
 ksADiLAg6cmC1wi8qK5mbEZPcRz4kKY0OEEeFxvDyGoPfoel4xcH0/WxI/UK6HW16hQG6die2KG
 mdStvJ3Lz8DArQFDi5UyiDByIhIT0h01TUEuICOgOUnmPWSNd4d20HfThUqu7tiNgfx5rbFMJhB
 AEXSOr7d29BlGY9bFt8AYCim5rsTTxbUjWV4JQ47+8rJlPm9VqOpFWRAX2oUNKu9cj+3v9aSqUA
 2CuMLDbNJ40KomJalvlLhnyKgoVnxt1Ybatq1kznQ+dHCU/m6l+jrZQAYf/RxnPdXCgsP01q7Qs
 uNBnSJUlS/Rz9TBRvchvYqwb4j8MHu6Faq0DWPr8xSoBsr414WbIGCPX6HJFEqLdM6eAqM5ESfG
 p2usBT8qhMLnMroY8EW10nkCdY/QUfaT8dIPfJupi0HlNTbWhhYFtcX6M6FHW0kYZB//0s7ABHn
 Dx25ZG6RMV703Yw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The lane mask must be multiplied by 2, but this was accidentally omitted.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index dac8d2ecf7995..7c8c0e41bc62f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1114,17 +1114,17 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
 {
 	u8 lane_mask;
 	int i;
 
 	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
 
 	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= 1 << lane_cfg->data[i].pos;
+		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
 
 	return lane_mask;
 }
 
 static bool csiphy_is_gen2(u32 version)
 {
 	bool ret = false;
 

-- 
2.53.0


