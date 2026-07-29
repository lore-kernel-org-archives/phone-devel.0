Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFB3DD50F;
	Wed, 29 Jul 2026 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356409; cv=none; b=hYbsohgFAIsfO31kNDUpLgkQr2mhhin8NE9zF4ryX1g2WgJTiO/8jYjMPIUqAnah2VV1lMSs9Jk3jdsP+882BueOzXzp02pRnNb2OrqjcEeSgrNanx43VQxFMkat6V9tuPrv049Ymn536pgnR7R51hi2ll5NO8QtK6SHxzXFbQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356409; c=relaxed/simple;
	bh=l3uzC5RqqxzM3n8/+39StV34+5jEjjflyVqKlx4xsuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BbxxdJyD29QfdtaL+kzVu/1lOrv1M4z83WRS5vUc02Hx3D/EhC0uP+Ho3954vauv5G/+S763RdXQZmGg+mciJJygMxYvC0HoBo8TNGFXaDYVVfGwbBQunkGLzMKrq5ZRgLIP3qFyxqxLyn6NXy8A/rdLtQd0VbxBnecF6AidnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWB0nm+T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWB0nm+T"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 564DFC2BD04;
	Wed, 29 Jul 2026 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785356408;
	bh=l3uzC5RqqxzM3n8/+39StV34+5jEjjflyVqKlx4xsuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FWB0nm+TzOfD+omaGvq8wFvGUhmChpdK1idaP3FqMx0PKF+LplSgiO4UF1cheuz1X
	 BCG4L+kvebZmxvigwJWP83azT+D9qOmrqZZWG9N1Y8YS92Y/xEPwRhmcWIxDzVNZaS
	 d4HBdrbHNVWJ/MDAcgqCdU/c0Vzxn0SmMG2t7bEPHgFcAuEc/J9j3ffxv1Mfws6vkD
	 vJdsGCxz6FswpDX87uCjEm+8zUgnpjuCMA12Su/Nw6+aIHsV16Br9o1eIT/0BuzhFc
	 NQRq89Oa6wwCaCeH4YhEcCHwl3hHsdUZ/iirbZerEtMlRi/v4mOYQiCntyGMtEoLzB
	 f7hEHfPxfAucw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3761CC54FDF;
	Wed, 29 Jul 2026 20:20:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Jul 2026 22:20:04 +0200
Subject: [PATCH RESEND v9 9/9] media: qcom: camss: Enable C-PHY where
 available
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-qcom-cphy-v9-9-1f8d9fdab037@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XCi14gM/uWIoK+pzO3oCf9ehRkiwcrxS49fsQobP0+s=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqamB1zZ7QAiPDoC5gAqXSX6EKBoxRoPY+rGAGB
 Xcv46eSWueJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCampgdQAKCRBgAj/E00kg
 ckgDEACNwIgS2inuwJOumJhd7D/ExslLPniv0Zi1Q3fek0s1ZhB0ID4+u1v4RcuF7ldhaYe33sn
 Lj4LoPDo6u8CeTBgGhCK86nZJ8xakR2vKqlYeyT5RQVEy5RpsSTZHv4gOzbuKZNFzGNf3uHmqBf
 kCIbIAF96rdvY60vpid07YOEr81EO+YMd9++Hoq3iTsw3Y49yg6wSpgym0KmFBSIsk3xjVu65C2
 ddmlMCKDZw6fGaZzFOs9MSFBSLmn4qnH6YZADzHUQ5wc28W+HR3HKyf1wPE9gDuyFjT1m9dBoLG
 4ZETQXoYm4/HB2Zpz8t61j9ita8prFXeljVpNfmReLSNywpw8Q+qioN/Usvkpmt0IR6r8yjmz/C
 oWWzEsU3kBp5EnC0mRY1ZXvVjFMsSZ1GfjoVU5sHjKU7ybwr6hviVjtmSmu//hDs6I86C943f6b
 hzeOrbtJR7dKUk1CyTJU/d5xZ4LXN0unu0JTJFxG/IfM5brkp/ozZs5bCKsGTlcpWZKjmMUyFPH
 5B13+j+bElis398ZxsXFYmNkufmspNFzohlGiOX3wHsfalFg4WY0neV54UrGSd4SacNojsgf2Zn
 gI+bN4ijTog9tokDh5m3ak6N7aGxPkzCr/wPDlUD9JHzd9QiDkmB1S60UPQf4z9rNFOXBnmkjc3
 Mb0aQfnaeQTNCsg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

After all the changes done we can now safely enable C-PHY for a SoC
where it's available.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 66171069057f8..ebf8f21b5fa2e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4760,21 +4760,21 @@ static int camss_parse_endpoint_node(struct device *dev,
 	struct v4l2_fwnode_endpoint vep = { { 0 } };
 	unsigned int i;
 	int ret;
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
 		return ret;
 
-	/*
-	 * Most SoCs support both D-PHY and C-PHY standards, but currently only
-	 * D-PHY is supported in the driver.
-	 */
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+	switch (vep.bus_type) {
+	case V4L2_MBUS_CSI2_CPHY:
+	case V4L2_MBUS_CSI2_DPHY:
+		break;
+	default:
 		dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
 		return -EINVAL;
 	}
 
 	csd->interface.csiphy_id = vep.base.port;
 
 	mipi_csi2 = &vep.bus.mipi_csi2;
 	lncfg->num_data = mipi_csi2->num_data_lanes;

-- 
2.53.0


