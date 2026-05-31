Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E838BF9C;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=ecVNsSu7rh0g+ahyRxY83vcZbIDf+oFpbcotq8dyHgLlVLUIL28KT/J2rDL0cZXoNkxVD1akHkrSeo8P5/3jmtV6P26GOaFQl0+s+jhVC7OxswnTBOm+Frk9zY04NHApCibMX92L6H98/GRRG7pRj9NORb/kdbwYsyN/sUUktR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=17T18MV/I1YKh1hB7ml1dL+WXinLPv4amS75jlFgZPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maC+Q2IMcjmCAdAtNmb9Z65t6QxKPS8Mb7AyUizHdPBgn3U344Q95pW+nb3Zs/5NTsf9zK0wxnCobBSpjX7H9ZkLSqUQsrlbwV8Ka9NXSx3w/8QxIgtvfunmxb1/jiIYtJX7XSEKz91vNcFie6OJIznBIV0ont9nKMMfvV2K0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0asvBVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0asvBVe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 335FCC2BCFC;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232893;
	bh=17T18MV/I1YKh1hB7ml1dL+WXinLPv4amS75jlFgZPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L0asvBVeh+X14IFSK7zCYK7jLUPHFZUUIzThwUNbxu9+ugAOQJ80/fCys9cr7GXI0
	 +bwPbPmjHV3jmUSRrIuqIYqs1LolS0xueGzulAs6HlwB0EQcWDH1HGs4Uc6mtp4o47
	 +j7VI2LIlavbkSJ6cJLm2H1YsSg1s+Gas48Aq5qPvnbgebP+ChskphkTq36s9dXhSG
	 kHw1Sb1zvC8hauLCAysj4XM4pW1g70aUuJ+7bZdCml/SJdv8IIxKqp3nzHPSRnF1OG
	 yMeUe9wF66aokl7nypTFYgNZdIAAxW9H5cliyy4C54F2u9s444PVD3ZhkobmD79u9v
	 Yk7ZdjlSs/Czg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A708CD6E52;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 31 May 2026 15:08:17 +0200
Subject: [PATCH WIP v5 9/9] media: qcom: camss: Enable C-PHY where
 available
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-qcom-cphy-v5-9-6be0f62b4d65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=WvoNxYtj1sUqw5yG8DzYK/GGXWIIvs0AM/cwzkoEgMc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK7hetDp3vpxAgr4G++P32MskYK9DBrT6G+E
 ieQj3Kp836JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyuwAKCRBgAj/E00kg
 cvLkEACoPbM3rHce6UNhOnbN21d16SIVm2/tEsCQ6HAQSHnk2g4pLTKDTpHx5ADRalvzxRcadQj
 NnVSG5Q5raIopmCDix57N6IvHIdQABB+1FXb1wW8gn1ud3y9NztmfqkudKK9nJZTYThVyTZeaYP
 yrQJ4RugQRq+empnvLaYvb+AdU6TmVfZsaHPeNhZWUg5mapcbqKptRGnVNoa7hIc6h5YqsPWbws
 rJ40CPuQo9F3ZIs83eSquk8JhispxoP21Pv3ZUl2gJOFNIvrBBdBsepKe6JyigBn6xKKGBxSf4T
 Ht0lA4nIRyW0ek5atq3r0yYZXcxYb8N9EypVM5/a/UU6jQrhDf9QaR8NrNGyZjtvfNiIvuaxI2g
 hziMF9uC1/6VjZ2lEAQrs3Au89Zi2VvIaImrc1FTGkjbWIn2YajVPH3c+6CK0jTi9Ng45g8qu/l
 rGd01odrkNhhl0VlknYLKDmb1ogqrOMXyH81DdRPCVHedYh6LepEnpVWPzIbNOm/RUUSNT8PfXQ
 wASPAwvJv4JHiGmiOSAqVCC3LcuHnfBgR1Konyhec1+i9wMhKA69dkuoh48RmNuzmrxVYuvgN4j
 DSRRub7fyszqqwf3rPf2QAlYB3aDIWd5ntxHbqMCQ20KjJsbvI/vn9n+IM48cy5Wr96t8gMw30H
 iCIffkhdq+yxLdA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

After all the changes done we can now safely enable C-PHY for a SoC
where it's available.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/camss/camss.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index db4e14a84a95f..555c53343a1e9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4761,21 +4761,21 @@ static int camss_parse_endpoint_node(struct device *dev,
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


