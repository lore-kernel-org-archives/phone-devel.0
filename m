Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC79F3BF689;
	Wed, 22 Apr 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851322; cv=none; b=T4gGfrgI8afvjhL/bZ0z5QVL27J8tcxPlFrz2tLfmJK2ndHh4bw6UworQK+Pkp7aqOH/zKFOj5b4GnoP+hZ5lx8fKySa4LwuarWLUnqUtHdKFRy0bdwAyHBRhvTVGAkeLEfNaMeTlZ7XQFsJ1m2qeiVKMcl4HZpITKiTJN4/9/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851322; c=relaxed/simple;
	bh=K0QCVo5ALBEs41KyVKfs3ycfbrBMm7RYQg6EZ0+LXo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HhiGobVRAOdjrDOHf/o7F08FgE/t2aq31JKcUF/QLcfmFUlN5WAaHhwlr8PZLqXOsnZQ35v9goI7NPUS/xnjTkMKVIjwK9p8Ukv3v9z9MGs3CPUiLamH2c0ejQKCBvPfLVetQdXZ9mbDJSzKqKFdd1JR7d2HjbgyL4Vjq4OZRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK6t8DWH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK6t8DWH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 744CEC2BCB4;
	Wed, 22 Apr 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776851322;
	bh=K0QCVo5ALBEs41KyVKfs3ycfbrBMm7RYQg6EZ0+LXo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KK6t8DWHmcFYX4wiUVsAC3k0Q3r9NDpTmNnRfMNTtZUIi09ETzUDkLoSAVV3mvUWy
	 URff3qFfdV/tI/Y4VEDdfPSPylhgGAarET2bC9UGfm6APbDhJ6HXm4a5wIpowIlBUL
	 LRF374sP8oOKaUFbxQTwuxq7YyRtYB3Mw5yFg9qs9trbMPvcaW4XxB4y5IQoDGi9ZL
	 btdCQ8b/EreHhTT5qAeMH05kGk3t9MN8F+xPwhLnZaBSqFCc9KDptAADZAWUx/DYDp
	 Q/XP6deG9dl9Mz3FtUTbU4Isq4xoIVoHTijdBdx2WTXL6qyiHZGuFUtelPKOE+3t4J
	 9yNI0nbmMRCnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6193FF9B601;
	Wed, 22 Apr 2026 09:48:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 22 Apr 2026 11:48:35 +0200
Subject: [PATCH RESEND 1/4] drm/panel: Clean up SOFEF00 config dependencies
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-panel-clean-up-kconfig-dep-v1-1-d825e9ffe911@ixit.cz>
References: <20260422-panel-clean-up-kconfig-dep-v1-0-d825e9ffe911@ixit.cz>
In-Reply-To: <20260422-panel-clean-up-kconfig-dep-v1-0-d825e9ffe911@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1740; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DAaFafWyDcSH7f6w40haps2stWSTD0Bd9lNBAMYDas4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp6Jl4vQxNPIa0rU/KQP11LJVDeZX6wN19aQBsQ
 jkhxCkWHDWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaeiZeAAKCRBgAj/E00kg
 couuEACDd5cliA9KTLX42F5dxYaZoR6tPflbuebpOuI925j0NbdcHGOYCavC9H2jQ4pjB9v7gKV
 M+GzdOsVpIhjoDfN7EyTfN1b6KJDehb1PZRBGZ93bIwMGSaiPoqPuKYs+eFKH9P1WIfSOgax5Ws
 j1vUbOb49LjLfe+NKMD8LlEk9fol675/SzFBvOWBL+G1luWHRRlbMyprC65HJodBRTTFZctSqNd
 FXgwRpyVAwU7++19MXnzbUGsw1kIjjDuIxslUb3gqCarG0PYiyi4QEAHeROxGGAg9gfZqzjwFRa
 E8jg+/Y9xDBXgOAIFFRFQwWE8gEETpArRKzlyllEesNRXCIJMC5tFM9Bfqdo8Ii4fJVMBWPm60Y
 pbrt3NsoZPpadFgIyCXpSC+wlMqWlVfvd2tAgn14cNQCzG8NQ+ebrFGppPAkqVeHPB3xWPYsxFG
 OFOl9SwOlSr8pha8knjKjaocdacxRZ/W0KmyIG0S7xwgfjOMAhy4PZmRsi9bEHeGtYHpE8cgH/U
 REkL15FhNvLk7AeKzqf5woyXpjAQlHJk2mdKbqhmG+x55IVkqWvr5XWcqdn1XOCL+pS8S8yU/76
 VSyS9829MrvruWRqAFTmVLMwN1NB93OBIFGhHSZvBjW4ZoOKFDgXA8Zbly0kklma/Fsr55JRM/z
 mNA0Yb08eO58BKw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Marijn Suijten <marijn.suijten@somainline.org>

As per the config name this Display IC features a DSI command-mode
interface (or the command to switch to video mode is not
known/documented) and does not use any of the video-mode helper
utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
uses devm_gpiod_get() and related functions from GPIOLIB.

Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 79264f7bbd0e2..2fd3222ba2e3b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -904,20 +904,20 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	help
 	  Say Y here if you want to enable support for Samsung AMS561RA01
 	  panel, which uses Samsung's S6E8AA5X01 controller. The panel has a
 	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
 	  DSI protocol with 4 lanes.
 
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
+	depends on GPIOLIB
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the Samsung AMOLED
 	  panel SOFEF00 DDIC and connected panel.
 	  Currently supported panels:
 
 	    Samsung AMS628NW01 (found in OnePlus 6, 1080x2280@60Hz)
 
 config DRM_PANEL_SEIKO_43WVF1G

-- 
2.53.0


