Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6E44E659
	for <phone-devel@vger.kernel.org>; Fri,  4 Sep 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544431; cv=none; b=T6cXcatfmb/9sL2cKs/i3JV8/flu98WVd6Y4xcEzZiCNi03SUrkmmpUPRREmhq67V4iHHzr4VDaRJQQe2qW1Wa1f8Pf4s6fJaB49JBDzsnaEfzu35dMhfAgZpojvxqgD1hXExb2e3Zwfyy4tkPgGlB+krII4RS6KPF/jYCyZPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544431; c=relaxed/simple;
	bh=uNiYFbN3zOLbDB4O/mU6pDJlgZNfIiOaVp71itH2bYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebAQzzVEC4/w40epNorc40FJCzMo34pD++dtKUyjA63i0do5Y37lHCiFoQlQODgBX6xPqIPnvjsFrPjRhGw7FYE2ZqVaX+mF5sA7fFc9hiSOL9TidBg/9BH0btZ8cDOoOPsffTKa/veou3Hi6yc11B3wD6umppRUrbugwvstr2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5ILY5r1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5ILY5r1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9C2FC2BCFC;
	Fri,  4 Sep 2026 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788544430;
	bh=uNiYFbN3zOLbDB4O/mU6pDJlgZNfIiOaVp71itH2bYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i5ILY5r1hLL3gVtXcEPdzh477R2dISpX2gKBzf5cZHJwHBG3gRwKTyzN2B1TYHUKP
	 hWNrTolm9o7yTnC/JmVbfop00PzplF2Pe2R2kpW4AaajAM4EEkmf2SA04Lxp+Ycwpx
	 mIBY2fSH6k7N4CXleVKlZ/Jije0abdS9ZW0nPJynCoH0Q6a/0rKkMXJqWcfs855rZT
	 E+vnEOHFuVLMtONrPYEDnlPbkIfZiKx23WSgc5gYr4OuPYYwxFmXUTo2ozYl6/mUvL
	 a30fWFr3xTSRWY/b6wxicLmBs1ehgaW3DxsYFKj8rg5ZIWvn2908UGxyQ5cb832lIb
	 D0OaFbgp3zj+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D41C79F89;
	Fri,  4 Sep 2026 17:53:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 04 Sep 2026 19:53:47 +0200
Subject: [PATCH v2 4/4] configs: qcom: enable QMP USB3-DP combo PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-b4-sdm845-usb-gadget-v2-4-cf1baa65a6d4@ixit.cz>
References: <20260904-b4-sdm845-usb-gadget-v2-0-cf1baa65a6d4@ixit.cz>
In-Reply-To: <20260904-b4-sdm845-usb-gadget-v2-0-cf1baa65a6d4@ixit.cz>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Balaji Selvanathan <balaji.selvanathan@oss.qualcomm.com>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Peng Fan <peng.fan@nxp.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Aswin Murugan <aswin.murugan@oss.qualcomm.com>, 
 Federico Amedeo Izzo <federico@izzo.pro>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mxpWgs1cNiJ065iRuJH0M7lM5/w0wLWaEBrcuJ5E9S4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqmwWsQ3P6+DzLXZDk2gCub7kJuIUW3iDrS/F1B
 3P650IXTz2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapsFrAAKCRBgAj/E00kg
 cuyfEACA42HNsoYti3oBe6ToQm1nKJpRk1CBVP6vz5P+dVLCCNVQEubJmNEWIWiiGRdGW3E+FSo
 47dl2/7jtOaTR2PSqp/TBJhEZVETR7F2s/UhUNPB9KuT2SkFPdDXNzZBcLNVaPqB4/RjwBbt81J
 0PGRelkgFhft7TLDxezTCdm7Kr4f0noBzMnPrpSkWZ7NHVGLGDAb+Wpcfiqw2pixgj76whANbIq
 CHW3DJySIrku/aNQe3CQ8jtCpE21JZOXVhzP3JkPqwoavRt6lo6CZQYWg6rTFAfKeUzvknlJ5zg
 23W6aVJN0vFuH562r/iv109H06FH/AG4BZxPnzsL/Q8UpHNmgTMjbMPwWS/6aZZXgJ2UF+W0m5l
 eoe/fdzJ5MvIyZ/WrBBqVNs56pC4qQpiLzX8agxaQJjjcs1oHCWAFxslKfnyuan8quz/6k7rfh0
 FWiP38f25GsUp+VXLv6W54C6foVQ7ayGQlLCrJsSI3TGGhhr1sQ8O7PnxqZoSqBnP1nmik0RpCP
 QVw05BhoTYxwWpfZRcMfwQ2q/TuY7RdRY6L4GZvnhMnSwwASew/YDmZHVYiVSEryx5yDIZ73MZk
 t7ZFVhoa5L/lpNU4+/2ixbw3amdrhv+C5lcrOdk44p2fNyv8ihfHTRrkz9I7JcGRk/lhPjqaaJA
 ZDAU1/bvzX3zI6w==
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

Reviewed-by: Casey Connolly <casey.connolly@linaro.org>
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


