Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BE36682C;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107059; cv=none; b=kh71SrDKI4D9xurVzDZF+/JERUCqvZzn94jo7ZppKEUw23sROlkXrMnuIck3Sa1wLdhWNJvWT684XWs73USbPaPjr8eRn26MWXNuGFeJxNe0TlVPV+qs+hL4E/42ernaN2mMDRgxc8iATTS/3oWuk7xQwgQRXNuR22x1SF7KZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107059; c=relaxed/simple;
	bh=MqSJmu1uXT6iOqp2k37q1PgdWKfSaMyjLJfRuK9RPqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nx3rz+qr7n5dPG4oUCOLmaYh8QeLAPcxN8DWHOlcYdd1f4gguV5Uy6LOUDIF8Htgf3ZUc9XABK4wnNBJWrX8exXk94MLjl1kb4RoON46mjwQGTP5Hf0NmvF2VcCxFB79syUXnP3EjuPMRzh4oYRffNCGQU1hld2Nw8Wwp74v2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rx/XTseo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rx/XTseo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A02E1C19423;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772107058;
	bh=MqSJmu1uXT6iOqp2k37q1PgdWKfSaMyjLJfRuK9RPqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rx/XTseons2fHbfB9DcdbMfx02OEkrvjkSiDPtHMZSTPrEmuG9Qz9CvYlnBcMf9zJ
	 HynLUBKWlqBfY5BkYlKY5D5Iy9HiMYb8NyGVe/EUMQmdy+mHgOw0PDUTW7Y573vcZ8
	 v2BWiu6nYmaBfweiJGZHQEjJHjghY/SI71zRucSF6duxdnP58EcofQzUt0JjwdhmKQ
	 F/PWYR1+Q+2lJXV1Ul+86F+MML33WqnHDAOfoisiYMbStxGEnecF7sNP01Q04gq/1d
	 prK2hLqajdnWoTnX2KgDCXFtJyfc6pJm6v2A65H+LuwuJBlZfBxwpJ+IUR1O171lag
	 /XJ0oYXM5EsZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95777FC593A;
	Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:36 +0100
Subject: [PATCH 1/4] drm/panel: Clean up SOFEF00 config dependencies
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-1-bb28a2355b4c@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=S2VmpYOqwuL+0OJ8gYr+mbqdWnTXUGRv7C3ek1BRY3c=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUwi1CjtxFs5Sj/rXK7pY5bi2RLpIoCFPyEq
 woAahnB0l6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MAAKCRBgAj/E00kg
 csbJEACtWhRwtEV68IEUPumQ+0W9UDjFpTKqA8vLw/EGhDWAix7givziihyRR1aHGeHf/dKVy3O
 9pBRNgts4TpFp+BWpTRDvsbrbyMbPN/6/S3Ov0hZngQ6YEFxUtoFfk/N2iveGvjm69OZnvm+2Ef
 JcK6Q3y0EhevQUzu8iIuX+KL1TNO7TCphyA/fx7ij1+NW+u5Eh04hGK1a85wrpfEiPDtcgqJoU+
 X9uEt5lxwmtKtB8tHvNEwGe9sFJpm9RQSGrAz165iQrFLkuISl6SwUBy6Vq9boP04jCsCR1KQ34
 nMZ9u7Dg9BJRLiNhN1A44OItCJxNMS+ub9ewBb4ByTSQWVwiZS5ACHL9FqK561saFj0FGqSyJAH
 e/eZg/WcKOsBqj7r9X+V6TfpPKZR40Dlp7zDscBGkKleTPsusuC5susIwQpVcXSosn9XvSSPLFq
 zv4uxSljWYPJ8ZsJdOj0jUucRydhC/YHX2uGaAqEw6OKDPeT0fh7xoQWgMUIK41nMyB3Yie2jhW
 sxxhnhq9JaURXRZif4pcIgxHk/eh3yI6tt+mVxE7+9s26varnrOg73ZusLYpcryditqWCJx8PFf
 ilSm7nGXfu/5zOlE7QutiTJIi2N/MFVr9OEX4gMfu61fiRhjFDg4qJb5PJS7/eTHaoOHVFuBNow
 US66dQ3OiFT+CyQ==
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
@@ -909,10 +909,10 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 
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

-- 
2.51.0


