Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800A3A3821
	for <phone-devel@vger.kernel.org>; Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788042208; cv=none; b=G28W98GPCqb8NUSt76SWonV/hV9Aa15RrsQ3fQA2XAttIJCLrrWMJ/k1RjQAapxMoVTrFCWQhaQbj80hFUP7HBTJXLMWj6L+vvF4cK3a5mED/MCOQ8uGyet5YY7ZLEA7zhRDtgm8fvnzIFZ2UZ9xesd2XK+37Di3xjEUUrKao/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788042208; c=relaxed/simple;
	bh=p8jhOCRHMvaqSS3UenCMFJKWjXa78hSRd5p6vVB2KGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6i6qQcui0AbU5CZlfAxeVlhTHf9pEsFImgLoKYk9o2fPVl1uF6mVyjAZcnD30uBRgL8LS8SxbmRfsWniOgFA9P+XY0lPCBOqfS7xMe6v5cAfGY4Banx3dXGHvW5NI4MlUkx34e8fpgaX9dkbrogWj96GlS+t5xWPRqaefj3U4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCu2RP4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCu2RP4S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAC22C2BCFB;
	Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788042207;
	bh=p8jhOCRHMvaqSS3UenCMFJKWjXa78hSRd5p6vVB2KGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JCu2RP4Sn6VdGSL1XOUI2jKFQIyxCXgAbreLnsUm6Wqt8QIMUU92VYSrRplWFgdWT
	 nglhTW1dYbvBUvGOYqDhsMNjnlZYCa3k4NpYxvYn5OFeJyj/313irkNnoN2Nswd1Mu
	 62YoWxD2d9hrUQIcPMupfUnhuswwi9fJHzTJwhMZyWFqNtkAOSOYWKcTeJtJB012SL
	 hzZIGrAuSQQOtqeulBPUmVl5V76qnzPcz1f04o610hs7TS4cu4zW7lloeYvRZA0HST
	 rH2oVB5PPEP0Tu52BWvGUTuJf5mz9A9uggUcc5DjmHe/5rrpdnDOj43XCwjjKWZz/L
	 Vwb/Yz65QfJ3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931D2C61DE2;
	Sat, 29 Aug 2026 22:23:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 30 Aug 2026 00:23:27 +0200
Subject: [PATCH 4/4] configs: qcom: enable QMP USB3-DP combo PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-sdm845-usb-gadget-v1-4-9f20e842d628@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+1d4BTHteqIRt7GUekOg8l3SKZOkytAi29bL4pgGHWA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqk1vezUgRAXSMNhLkvZpC4upz6ah3U4IDJT6WA
 V11YExWTZeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapNb3gAKCRBgAj/E00kg
 cmxuD/0fhWvNHp1IWIdKuSkCKvDggkizofzUBFwEf2MD2KsG7whj3d4ioz7TSHpoiPRZvyiBmg9
 rUIVzVJooz5iDxkKnGJJzIuaQRpwt/wJeVJy5ERXD1Y7KarRZVzD5y3+WBKT7Frgp1laS//cHQh
 UOsx6auVgkVOMV+g3LzXjLaji/g3/pPkahIoBCUKv9Nr1tIJf02Fxop+w/2O7iZwLUGK2wI9LZu
 0vmQmisCPgNlHxi6ERBMT/YKjn/FFXZuv8PmmXID1iHAmsYkx6DGx2xVImHao+UbTirJ2C4r0v1
 btPoCrMLzfN2COmqvF2R1OtqAtoRUrE/nZRbeKehrgyTd7gUXqWkflK29oXF3BRTj1aMDlFQsc1
 CnD9sFlHlY2k01U52OM1Xhlu8d0JGiXED4n9ImLE+XHTtQADxwpdRLRwRriN4AqC0UvQGQNIm0l
 xIXNRgI3hoBxJcOETlD4+4PzloAL5PEn0ZypItl4vMf6AMaRcTKfusnctCu0issWK5zpJKwr1/H
 K08pGqfAprITTM06ttkT0+U6M0+jh+ZqnZyNh7N0dPAZVY7NkIIp58U0jwQ2dajf7hd2TBKxWR0
 1eZXYGy797dcwi+l2wpZf+OQE2tuMqHlaDqr32t0kJRCmic3Kc/g7YSGLhGi4VouwB5qm3l2Dba
 z/qXoLb4mZCU3cA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

SDM845 boards need this PHY to bring up their USB controller, and
without it in the defconfig the driver is silently left out of the
build, so the PHY never binds and USB gadget mode fails with:

  dwc3-generic-peripheral usb@a600000: failed to enable ep0out

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qcom_defconfig b/configs/qcom_defconfig
index b0d0f51b1c0..880edcb504b 100644
--- a/configs/qcom_defconfig
+++ b/configs/qcom_defconfig
@@ -104,16 +104,17 @@ CONFIG_MMC_SDHCI_MSM=y
 CONFIG_DM_MDIO=y
 CONFIG_DM_ETH_PHY=y
 CONFIG_DWC_ETH_QOS=y
 CONFIG_DWC_ETH_QOS_QCOM=y
 CONFIG_RGMII=y
 CONFIG_PHY_MICREL=y
 CONFIG_PHY_MICREL_KSZ90X1=y
 CONFIG_PHY=y
+CONFIG_PHY_QCOM_QMP_COMBO=y
 CONFIG_PHY_QCOM_QMP_UFS=y
 CONFIG_PHY_QCOM_QUSB2=y
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_SNPS_EUSB2=y
 CONFIG_PINCTRL=y
 CONFIG_PINCONF=y
 CONFIG_PINCTRL_QCOM_GENERIC=y
 CONFIG_QCOM_RPMH_POWER_DOMAIN=y

-- 
2.55.0


