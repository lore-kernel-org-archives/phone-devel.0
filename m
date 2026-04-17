Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E4231A23;
	Fri, 17 Apr 2026 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408946; cv=none; b=dQAsXPm4FwfxfZPbBvnPMN5BoWfz3PESm3wYaKw0u41DSaT1iSd7PSIwgzzrtEUxqKaEuIrPFLNff6m2B3khkKZrALcabm4lvll8tMAYXjgGCDn/MUnlBLW3jRucxeLDFm2iM9uGmedDm3dcIDFGE0Gh6BdSrSvdHBnCDy55T5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408946; c=relaxed/simple;
	bh=BUM1sFfc4z+gNHol3L3e6w/35+hoaRKwg5VUfwrXLdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L/DGqqvPYvH/wE7oxXO6/sMDd4/sn9e02dmWa5veVf9wQdbidEtfspXzMZx0em1S4ISfcDaP3mZLLhL+khqfiIj5F7atxlt34WtcQWotc3u2OfrUGdXTjbhc8b0ckySoZcDa5wEc4NjgeexKeUV1I2j2LNJteQjO8W7LErtLcFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMbHhbsv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMbHhbsv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19334C19425;
	Fri, 17 Apr 2026 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776408946;
	bh=BUM1sFfc4z+gNHol3L3e6w/35+hoaRKwg5VUfwrXLdE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nMbHhbsvhFuKS17AdiBMfoaIvdOwn9vUmoGOZL475/6lsy/6HyIbeWMTzoxEhjonY
	 yjvsUgKIASBtwRgmELj0Dg+r3INSCGq3r1OCAUv1Qk/FDHKLKbuqUb81KHiDaGqseK
	 5iLbkGvK400ES9Ndn14Q2CI5L4q407ZS9FklD18nKXXKbAXnKjI2rZRBLOeUE6muE1
	 5oQnFLwwS9TS92evz+b5ngGPo9cLVlNfirqnYOgkhoIizlWLdMeWdseNFA3h2FhGCZ
	 KZ1Sf5JOmLUigrt6hFdfpducUfKk3aD91uzxEyJOakZmEXemfjckVbdzTn52lMwpb2
	 BkFr9dL3OAwTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B91F8E4A7;
	Fri, 17 Apr 2026 06:55:46 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 17 Apr 2026 08:55:42 +0200
Subject: [PATCH v2] drm/panel: visionox-rm69299: Make use of
 prepare_prev_first
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260417-axolotl-display-v2-1-8ce5341e46c2@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAG3Z4WkC/3WNwQ6DIBAFf8XsuTRCQU1P/Y/GA8K2bkLEACFaw
 7+Xeu9xJnnzDogYCCPcmwMCZorklwri0oCZ9fJGRrYyiFZ0reSK6c07nxyzFFend9ZzZVDyDpU
 ZoK7WgC/azuJzrDxTTD7s50HmP/u/lTnjrNfTJKyQw02pB22UruYDYynlCwCuFoOsAAAA
X-Change-ID: 20260415-axolotl-display-715ce416e5c8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9qaIOk2jaDgB2Cwe96XjpEy/bDYDz7aCW+7/jIamQeA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp4dlwDVNUHkEYKJ4EK7EcKFKl9f3Jw1BBY493q
 Y324AJTfe6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaeHZcAAKCRBgAj/E00kg
 cttsD/9m2anpA36jjz0zc5Pmrdj7RngeZZnHIPytR2ydyH1jeLbPHn2F3Ibnu+mYJPis3syIgUk
 KLSCVr7eT56sD8tETG37D/OvZfDqkCyG9fNoKC1m1+I9pw912f32cPe+GsC6mVIEcsOD+RTIAyD
 YDddEQRCYz8hTnlm+9pNpYU5iIYzRRurP12ItgvLGRTToPtJ8SOYudEiDnTsN4AO1iF0o6MUDhl
 ce70P+RizgTNbVt58vdBANuGmQ3NomKt/Al/UfTT/cSse836BevvVkmyXEfBHyU7lDzSA7MaZ3y
 DWX3iYRulpWJN+xY3iDujFthoZZj0W8z0W3Q8DtZWYguIKEH92785pu4TAtA3HHasKDFdc3Apih
 JyKhDwFhhQQCZ6LZUPG+BKTrH1a8wBDqE/F8RXW3+xN0Sp7yzXlXvdXTtrtXmO6iOGb2pIcOBhr
 0zomRSKVy7xoI0T5t8TAwpyvIEYpAaf23uioV+yXyPiH7+VMNTylg8Z7zU81mWOmgmgqgi9ldp4
 ehxKx7DtYVYHWReGTKS8zCkRxzBnxbcUkbEau2JLOhGjR4+smPCLAodZYHDYtbUBoji3xoiomMt
 2Yuiz1fmJuyDWbgAFI6AS3uLVjEdNBuR08wfr0ZvoFZ1XpM71s5jAkR2yZRFZA/GYrzMlduEqiT
 O16IDSInnSNhg1g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Guido Günther <agx@sigxcpu.org>

The DSI link must be powered up to let panel driver to talk to the panel
during prepare() callback execution. Set the prepare_prev_first flag to
guarantee this.

Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
Signed-off-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Move the prepare_prev_first before drm_panel_add(). (Douglas)
- Link to v1: https://lore.kernel.org/r/20260415-axolotl-display-v1-1-7abb2d248355@ixit.cz
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index e5e688cf98fdc..f1430370ff942 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -371,16 +371,18 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
 		dev_err(dev, "cannot get reset gpio %ld\n", PTR_ERR(ctx->reset_gpio));
 		return PTR_ERR(ctx->reset_gpio);
 	}
 
+	ctx->panel.prepare_prev_first = true;
+
 	ctx->panel.backlight = visionox_rm69299_create_backlight(ctx);
 	if (IS_ERR(ctx->panel.backlight))
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
 				     "Failed to create backlight\n");
 
 	drm_panel_add(&ctx->panel);
 
 	dsi->lanes = 4;

---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260415-axolotl-display-715ce416e5c8

Best regards,
-- 
David Heidelberg <david@ixit.cz>


