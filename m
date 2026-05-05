Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E80E47DFB8;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989223; cv=none; b=QXMYh9klJwOMYIgJRBSdrBxdvHYTNxMn5bIhqxoDhQFm2VqFjHFXQ2KpLv2x4n/+MST0DexongiUMMJkO/vVZuBhCCMda8n45MeXY3TghHANm0ue7yJGHeQfKEEq7/DEZ/K0Tb/xi36Yiopv81C2LF0j9T+VZAKlwwkqPQGzzKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989223; c=relaxed/simple;
	bh=WJLW1LIBFRlns54JhZuKAzNjilqRJNlCoxN2hCz5D+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIFe5HwiBCpXaefY8PuxhreGc23X88Z96Qf2Ks9DJYAP0GGstAvP7rWHlavyZtpupwrUFQDON9CcDuR1K5kvcyAy1AgLR2iLyi8i1sGWdhrIwGgToN4z00Wps5sywOt8MnSM4QXsCF3m6UCZrhtXi65XSsbAae4LifmSPWiHvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yzr6ZnFS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yzr6ZnFS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29D98C2BCFA;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989223;
	bh=WJLW1LIBFRlns54JhZuKAzNjilqRJNlCoxN2hCz5D+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Yzr6ZnFS863lFhr+fM+WNCQAW5SUe16zpHrUooQje0Iuu4HBN6zvH9+Ql4UAxVy+S
	 3P3yWEGhtg0At8Ktpbkyo6wwf8cd/JYksESwklUZWFr0xVnu7ofrZApNOf52gqLsq+
	 rYoS54syGOl6MHn3XwdmCaFWzg/Mi7pZH8Q7Sj1EG6W3NlmOdiIePxJgvrhjTiVoF2
	 tDbWXaMgPd1Avn/3GJH/Tvcs3jaohZGEFoaVYQP6IahLFs03CjytrEOR3tLwEp2DX9
	 ilq6Cd9FAxgxvRKwq+K8wabDhN8Ml9UXU9hwpGjY/cnwPkUbODhC2R0Q5fN3rozPBK
	 3WtzXqwN87+rA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B30FF8855;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 05 May 2026 15:53:42 +0200
Subject: [PATCH v2 3/4] drm/panel: Clean up S6E3HA2 config dependencies and
 fill help text
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-panel-clean-up-kconfig-dep-v2-3-9cc31d6e6919@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=kaTc3CFnkJzzXMWx8bermuEVEdbEt+t1LKTOg/OEgqQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp+fZlZuFsQpcrrhCiCZQPl5lR5ffQgn5kiiG4L
 Tn5g0ph4uuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCafn2ZQAKCRBgAj/E00kg
 ckxyD/42mOAxQtMxFcc5olDd9cUMwA+teThsvrzosP6epTv4ngLYB+bfUvq2A+mQAarpIBFxxxA
 DIdRnq+9OeIVBUk5VCRIwwMU2I6g03/6tu8nun6wEYEb87ikLJD0k5OQAYU7woQl8Zq6y2COP//
 2Gxe+Ve8lYF5zB5NBL7+YnzA1O12Ap2N7FzS30w27N0lrewLAITgGRpzxmWgtP2jp5RsDZ+gQSX
 NDr5hXsPFQ4oM5i0Hy4TEOnaX4jradVJ6FDbJv3h/Z1CBsavbVj3XFxtIQB02/aVjq0wKHnUb6U
 X2mgsORWfOqbfbTn3acFNVS+ikF/A56O3HPltpBibI0r/9tBiv2NzqfECjlQCQ9Qh/eiDlgrsBq
 TWfidQ3cWmH2ZlwcbXpO1mAR/1dkPMo3WkvUS6sujca5HOHJlQj9ELP9DbfrKHbHTCyw3wHCy7+
 OC5iTXPS6pWk/ck+6qVEfCvlukKeDDLC4xjRaez7qZA0+OZgvyPrySH1vR0xIo+9g939ddRXsmA
 QgqQ0q/L8c7qG4S7Q/ldRynGbM87ChyiuDFn2FspuIv6KJ0KZ/5nalANOFTci1cSnLAevdzjc65
 3WO9lKwItZTHBkuU75MXiHEnswELuEffJ9RqLbGEMDxAygYyv97Z0xJ04fPWG7+O3zHbuBHcMcK
 3Caugx9mvZ/bqsg==
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
 drivers/gpu/drm/panel/Kconfig | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 813380ca76117..9360297ee99e5 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -904,21 +904,28 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
 	tristate "Samsung S6E3HA2 DSI video mode panel"
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_SAMSUNG_S6E3HA8
 	tristate "Samsung S6E3HA8 DSI video mode panel"
+	depends on GPIOLIB
 	depends on OF
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
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 

-- 
2.53.0


