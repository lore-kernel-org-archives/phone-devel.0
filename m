Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB0376BEB;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107059; cv=none; b=UNGri16lm8DxFu4aGAua4Tpy5sB/OzI/NGH8C70NGQDz07haiYb78XoY0CkzLyjmysKEOdSn9wFpnquSv8oSwvGw6LYQEASP61A3nk2NdFOn63QfvMXdek7uxKKUVL7nDdNOgAnAAKUHfxsyQO507cBMqrinoZG5J0z4h103AzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107059; c=relaxed/simple;
	bh=oiqFXpye5QOfNF+rTWMisr/wKccPtH9iwzgYoKSqE+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bUzTQxfKTWT5rCwDW8g+Ph8bE0qHSnUVM0EFDCZupSTG7wpN5ulklhWjoW2h1bJV+6Nm8OULEtpNrx7l1Y/UtVr/qqUNhKMxEcPqHVRPOlQQ6hLWLuENictVtigd4BWYPZlVWF2TV/UgFeofC47w518x7/e7NFqCDUHJJFpQMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QhTAbd2G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QhTAbd2G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC932C19424;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772107058;
	bh=oiqFXpye5QOfNF+rTWMisr/wKccPtH9iwzgYoKSqE+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QhTAbd2GnGCaV+RCJEuSEAvpQiiOliZiJGVnurU643a9ZfaqWowET4GmtbnhQhYxe
	 rPqel0HvKn4NkJsQWtlkemZf+RalYLFAA2JrjPpljTUKt3cXQP0P/bBV5iKD18y25C
	 MPxFVWamQleHSghwAWWQh3EbTv0IAMlylq0yQsiY4OhNm9HB5VmwDPKJrWDAJOeqq2
	 qJYKfKi+pbuXMmwdg/HFWiWrRyM+Yj5eTzcT3tnTVA/DnCjXUJmcxczQy6IGX5sdRV
	 n+vuEHutBvqBsw8ntfXmqlNm9iShnmCgAR7fFBPHBRAG6FE3VA9JK0ernASDiEfCxu
	 LPkJMnAERkv6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51A4FC593D;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:38 +0100
Subject: [PATCH 3/4] drm/panel: Clean up S6E3HA2 config dependencies and
 fill help text
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-3-bb28a2355b4c@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=nGKahjQwI7znNkaaKEUb98XnwiAFL8M8zDm07QyoU9g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUxizewYKSUVv17EX53w6oLr13vJCfIH3gjN
 bgSVVVKjfyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MQAKCRBgAj/E00kg
 cuWHEACMQ9RZP9Mj9N07PRukwKnM1NxsbM9ekbvTy6YBWoBMA7l6mzlza6rIZ8LYxoytR8kp5NQ
 R4QjlU2Fij9eA2GeoSdRqenK4/8nhj9E4yTC6pODN6eie46VZ43KmKna40EBOVdEiUKJm9ZjmR/
 SxGCwcIJvO24S91njglc9l8Z9fhtd223WYxHvRnRajL1bxFKw8jdIZuNTxbrHqmvYE7YSp0Z4uE
 FUtiQUJJcaHLwdCbdO2Q7JP8WPIrakzzj+PlKaZudhP9blkijZU2OZIYa3S4S0adjUUJaGMSyKE
 /9LnmMh1p/53K3wNtK8EcmvfL2XNSLcHcb8xYBBhig8MIUK1I9222Vn+UFL5DMR7kJHb1fBHa1Q
 +rrtZnG57jBsBPO7fbz6AeKk5PBHEMUBccWITD9oigGFekGgszQZdFJVkMUL4NaqNGty6vAcGPW
 QyAS3uHMWwZ0qqicJNl8iB/6MuuVw9KfJOe+VjRo9rtQxLKJdhwp8MVc1aTdKtjmnj3cEhFMyQi
 KDnL1HAs7lM15lkp6xkp4C7iPPdJ6k35kz15RjzbDA2R2yBynDaLcmSUBzrYuyFuI/aF3dGVN0V
 SrbVvdBahjFY0svjEaf9FSMC7u+0dSmKCDyG+xcFBwbqCXSwtHZjGAiaall7UCvze3hMOiLUetQ
 HWds9Gd7SzWzVYw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS. In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index a81ea7755c03f..4e7b4808f6e7c 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -849,11 +849,17 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
 
 config DRM_PANEL_SAMSUNG_S6E3HA8
 	tristate "Samsung S6E3HA8 DSI video mode panel"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_DISPLAY_DSC_HELPER
-	select VIDEOMODE_HELPERS
+	help
+	  Say Y or M here if you want to enable support for the
+	  Samsung S6E3HA8 DDIC and connected MIPI DSI panel.
+	  Currently supported panels:
+
+	    Samsung AMB577PX01 (found in the Samsung S9 smartphone)
+
 
 config DRM_PANEL_SAMSUNG_S6E63J0X03
 	tristate "Samsung S6E63J0X03 DSI command mode panel"

-- 
2.51.0


