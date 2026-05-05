Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695B847ECEF;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989223; cv=none; b=NDFeoAhzCHXrE/8Vudf5vvK8cfTqXXW3ogm1CZInIg0gvheLfzVZ06b2oydprJ+TX4+JVm3A4v1oUyQJm+K44xPkT9GSMrLSwpYSOPPH1rLW1K3s1yarVQJ2bJWcwUQVrn0361AwLMYDzfE/d3M2FMy0YA7HWGraOVpemwE38s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989223; c=relaxed/simple;
	bh=//Y+/r+/tM8UGYOTCqVNHTEEgnX1Rpm29wI2eQHBetw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRNxBgpl5faleGkbDYWuwZVlX4Gl9tkRBMRmvRxM3gIwh2Zz3i7OuX18XodtrnKOakk7URNtq0luj7HNAuvIu9jnG5ZqXQkHfg79kqmEqg8aolzAsKg4kajs4iRWHVU6x6NHLbs0nSDfAHCSRnmgW13z1dGZ/yHiHONZ44BsTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTLOv2yU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTLOv2yU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BDFBC2BCB9;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989223;
	bh=//Y+/r+/tM8UGYOTCqVNHTEEgnX1Rpm29wI2eQHBetw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lTLOv2yUz8v292NnimV79h6sbGH5FzoJOgGNZ51bhOG6JrXSGjrRj5fqC8K/7dgMC
	 MORH32ZWn+c2pvsdu55pqqTJpQXUsWbHG/pHbsEEnssMTophdURB9m8nn0madunDKa
	 br06Hy7Ai/PxdhQs2yeiOFwH0ZS7aq3K1SwdUPDceZ2zwbjeF+WF0cAdsrrgpREKyL
	 8zr4Md2zEaS4S70bqsHtzf0O382cf0OUXykCBsHNohanvwENDEnKLsdhq634crQKav
	 U/whTeMZd5gS48xgAEVw5TJ/r2QKzNLYEycyzJ1MKfY5QDKf0mSKkKfPGZfeO7VPZR
	 MgB2ww9nH7HEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108A8CD343F;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 05 May 2026 15:53:41 +0200
Subject: [PATCH v2 2/4] drm/panel: Clean up S6E3FC2X01 config dependencies
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-panel-clean-up-kconfig-dep-v2-2-9cc31d6e6919@ixit.cz>
References: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
In-Reply-To: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tMPycBU9bYA9m9HbJGQQMSogaUvweOSqPEkrM2y7OiM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp+fZlIjuwo12NBe88aqBKlnXnMhUAVO+Xg/BS6
 e5F5cMbs+iJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCafn2ZQAKCRBgAj/E00kg
 cpyfEADRF3qMUJ/VAns8ufTXnAt7hJtg1BJasyriXpoNW8SIxEdpMtGfdssrYrfU1dbWEh66nNs
 9aep64SF2TdrybA+YErRVBCFsHhAwufkleyaUch39yHLXbEbQMxZjWqQCydPWQp4Rz9tn5cz7zE
 jeZregN2VXZB5JTwij38m7JZyOh8XB7DTNnHsePJ3C2TF+o3B+KNUsndFzcXyu2tLpRkZqsp9ZK
 OKI5RQTqVIr+EhOSrvNdc0ygdeIO/Mdb2u+mqhOTXFzU4OiX0Q9lMV19ZowE+tcHLxou9vH/9ml
 JJWTczh9HU7bPWCR3JeDbkKiqDtJzlKo9MCEX4M4wFyQq5oLEoJczM8ujB480wSDG/LF1HMItGm
 hZp2glUL7CNqEQFQsL8tG5FSDG3r8WPZjzxaiqA5bWp1n48gDxl/sdbSDLchFucwGAd/2UTUuWh
 +pnmczotsRLBMDtVk5UmV6KgqRcgyjXnp4N4SGk8EC28MjgLtPLNLNDzsdA9HHpolf1GN/RVyW2
 18gDVd20Af25HAuCCwmuuFvc0btybkxENLF/ht8Q2u6aupvxWhv2VspYDB9DOkT95f4eNcQj8ZH
 tQfd6wLTRftt2gXO6D/L5Ks0ho9LAQdWAnLUDmQ6xz9ypVy4mpDjNQsu+6l3Th1PYfkDYs5NJB2
 MzkUSnCkPVAjJBA==
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
 drivers/gpu/drm/panel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 627b839ac9edb..813380ca76117 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -884,20 +884,20 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
 	tristate "Samsung S6D7AA0 MIPI-DSI video mode panel controller"
 	depends on OF
 	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_SAMSUNG_S6E3FC2X01
 	tristate "Samsung S6E3FC2X01 DSI panel controller"
+	depends on GPIOLIB
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
-	select VIDEOMODE_HELPERS
 	help
 	  Say Y or M here if you want to enable support for the
 	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.
 	  Currently supported panels:
 
 	    Samsung AMS641RW (found in the OnePlus 6T smartphone)
 
 config DRM_PANEL_SAMSUNG_S6E3HA2

-- 
2.53.0


