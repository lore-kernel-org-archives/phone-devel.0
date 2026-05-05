Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7930CD9E;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989223; cv=none; b=bubfpo/r1UfiXwQqAGVPaT5xVpNdKSrDfb1lSC9+UuCDlO07cil2Zo6h7Ba+jR7becZP2oGuMBTVr+TvKojSkXGo9QxiQ+/Mb8VO2Vx0/0ioeyMBET1DPdxEnmEXQxKwN5HhACW07IlVtGwnwmzFscCf4glILr4SpfOqKtJP/ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989223; c=relaxed/simple;
	bh=mC6wlA1gmKWuqXf2SGLFMrrIqUF0N65NZG2jchAVO3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onT1gAVDgK18NVNqxTSyeBYQ2KZScZFLDv5jWW1RhUcvAWlvPnmb9B46U6gjjooWp3BeeCv1oJbO6XUWviUYFRvyBZQcxei9xiRTiBUc/4sf9S9fgXSU3ExysTVL3f8xmzw89tdRPBl6LMC98CtKgQWEDrSNNRdTywHCoH2J34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIMsCFwE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIMsCFwE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AF49C2BCC7;
	Tue,  5 May 2026 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989223;
	bh=mC6wlA1gmKWuqXf2SGLFMrrIqUF0N65NZG2jchAVO3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FIMsCFwEKKmHQetNWz0kXmFWv93uXI2hAtGk01C50DQf+cMPgfftYEOwBe1aCafJE
	 jiyrYzpwdHx/5uUi/strfg7obzbp9Svi1VlBpN6jMKSv80vDp67IlebLf0vdKTpFfI
	 2hJNnZlA7Iojnp8q05E/XRoZ4EysJh822pwcTZqUoIKb9Jmt4Lvn6hO/dU9Nb0KdVp
	 MJagR3eC3oo/JBbfRr9FWUHKHtyun0+tAahgt+1vzMwIaN3miHXJmTtDsgCws8sv1j
	 SJO4CfeE1U0d81ofnL3l42J7NANAenRzsJtSv2JmAXBzq6SoHTv+gmDois2F65UzJz
	 Iq4BDxbj3EoOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3391CD3436;
	Tue,  5 May 2026 13:53:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 05 May 2026 15:53:40 +0200
Subject: [PATCH v2 1/4] drm/panel: Clean up SOFEF00 config dependencies
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-panel-clean-up-kconfig-dep-v2-1-9cc31d6e6919@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TVGOFZIIfQs7jOp2zryQfUMRnfUQK6EtJZ6mq42pgvA=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGn59mWg904dRVwsSoZ2pmLahuq2VvOjkEQLPq3qQyTcohEUl
 YkCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJp+fZlAAoJEGACP8TTSSByAncP/R6y
 rXp3lXzYCRzCEjocs7PTfuDH6KuHywwvH0C34lPGnnlGMmk4Mr4BjQTP1r2DDre/fp/l4bhcebD
 ET4dCz2PlhvU3bvQfBtktPykIfBtcxbCM4x4xSD1uiteT//9uSWgccD5i3kr8WYh2hdSYf5nlFF
 IIHxkBqUSDrzai9PrCkhrJZjViZoU13Z1XSwDnK+3dAce/pM8DM112e3j0VSo2Bb9sSihs8PBGd
 8kvEn1JjT0WNA42JFqw61Uc26SMzAjMcykkdyyJzw0A2ukmRy5bpsdY41DT4OrW8DwdbiPKiOSL
 t0C6FKJFxM0o8sN+n4UAhk0T4UlAOmH+wHUqCpEwDRrLfedwCzwdsR9E2Vk/TdAqz5Rm3Kpjr/7
 /jG6BM/J8MoCMpI2mjKk0dv58AUrci/ww8s6UuWCf2v4/c3xAWtv5xnoAklsyW2o58RYfGWiCIO
 dCyU2uAdkYwIvDjQfsJ6nRGWJyVGltwfUwx+nG7AOf6cMR/X6g+8YVuz2fFy4SK+o+8RIbRNClN
 M6YYu9p2hqadIuVG9ZSQbu3J9FdXo+eiVHL1y4R7wiUfzfXa1jq49bYiTcX7bNgtFxlmilSJR+g
 K8vPSQNPRN9W2h+WoN/1WjCWhdGu51EDCaCUX5gMvtKVVi25Flzp2poSQquBCKoPciCoLPcLvBE
 Ykvzl
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
index d6863b28ddc55..627b839ac9edb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -976,20 +976,20 @@ config DRM_PANEL_SAMSUNG_S6E8FC0
 	  S6E8FC0 DSI controller and connected panel.
 	  Currently supported panels:
 
 	    M1906F9 (M1906F9SH or M1906F9SI), 6.09 inch 720x1560, found
 	    in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
 
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


