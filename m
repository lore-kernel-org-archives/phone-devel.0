Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C03126C2;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107059; cv=none; b=qTchThFic0yPd0PfTavSoQNn4AcpYql2FBX9epBWlU7J6LCoAG3wQI/DPoqZHJdm4YjbTEZIQI6RnSwx70zoTVBLuGw7QDFXEd5HZi+k8bVUBES4e6qfpmiUhzNAd1x4CjNqt24GNe3sY+OhXkdmv/jbwMxpHVu8y7h7qQwDn+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107059; c=relaxed/simple;
	bh=CjqHcKW4Zc60TOEH0FSOOPRjRVQ7cQn2MFyhUhnn/NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bjtqF08IE+l6eKL50PA90PdWhqDtQl5hmmIK2qIvcTQWNHTCGo/zNdr8HX/1pAJ6HSabw051Q5lOO1HoW3wS/Im3fH+WH9cS4U8Mzh8QvK3GQxo3nzQ7P2nLeGZryT5qEeMQsQRD2LlyXCoPTxjY+xdQiryXWFgA1imL2n/250Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCj1X1kA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCj1X1kA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFDBAC19422;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772107058;
	bh=CjqHcKW4Zc60TOEH0FSOOPRjRVQ7cQn2MFyhUhnn/NQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GCj1X1kA3YfP1LUuxGKSi3VXXo92KPFZOT7UhoKeg6hET6D1/sTvCczA3TrV6052k
	 ZpZ/65PDJz514M29TVTALxMz+LYtL/r8VJAl4d2/XsVewNHW+aY5U1qDR22ZOkUkJ7
	 Su4bN4TToTERHr4rGbTUmNb6Fx9Nf+NW4spyhQfwbPtt2jIZJoZCGZEkUBig+yA1E5
	 24yMX/3TtDStGlHeILxsdGrUYq0uew1oNTta4fSobYb4PxZQPKc8dEUnyvF1UgB5jx
	 g2nOwGLu5i+bnnzu8b87SV/NhmvKbid7v6fsgs9ftJXpBD8fEZ0CuDWk1rKamBetld
	 2w7m7O3H0ErGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A548EFC592F;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:37 +0100
Subject: [PATCH 2/4] drm/panel: Clean up S6E3FC2X01 config dependencies
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-2-bb28a2355b4c@ixit.cz>
References: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
In-Reply-To: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=1E7aVpRA10O6F1jEpxvHIj22BqTrWHJFHanlhtXUI1g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUwrjHompueBqEMEG/sPuQckQy/doRmtGAiM
 41Q6oUHSEWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MAAKCRBgAj/E00kg
 coXXD/9c6tXLegZ5OTv375490elWzhRTjE0pplWcDDbaQgRxZVMvThHWQ8PEdK4Rje1OrCu8Yqw
 iZtf9lqajpg9ZOnqyslWLHMdQvyycbZVZJbkuV4dmg9M61csS3zvxzsSJKWPRtLdU/uctArl+VS
 +9viiYAYcjQPIKOVmMKJIr0K7LPHBdh/WxzPYpmbKxu9Ikzid4vUvVP4XE50GKWlQq+kHuvDgoQ
 OQFSdvDT9nUgc0/b2geRpHxeowDdG5sVV9EK/lahBumcVb/U+59W4Z8WsQooUgR34Q/6/2bED4n
 xONrDYoRPDpUAX1qWX141HnY1Rwtr2EsglFLDT14rXJRA9fKYd1iBimRiq4lVAJoxuK0g4PNr2u
 HCVv06mf8ivmbErJB8JnmWQIsYezZpiqUr/FgE8OBt9SVPBdf3f9MQkITYiATK6ofbPDHapShTo
 V42hIHKt3MMRSvhlK4prqVeeO6xasfjBRqPLJzy0cjz73awv+EAhYagcPr450xlNFvyfpl139Rf
 zzhNVwb1MQDxlpi0ebDy+e7EgOtO9/qTogcCN5Jzouszhx8b5+qvNiXGt+7L60BQFMO7oI+Ww2r
 xXoN7TOS90MlkCfqIObn5MzMwXpvVhy/D4ZPRViCUikgbnkioEglzJCFcs7pw8hw0lcdKabxQ7r
 HG0HJwtzPAcdyPg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 88148c30ef26 ("drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 2fd3222ba2e3b..a81ea7755c03f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -830,10 +830,9 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
 
 config DRM_PANEL_SAMSUNG_S6E3FC2X01
 	tristate "Samsung S6E3FC2X01 DSI panel controller"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the
 	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.

-- 
2.51.0


