Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A619B23AE62
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771311750; cv=none; b=MF7EY1uZ1kdEOVX11ji81R76flNorHCp9YSkwx6/poGqvjq3Pg70l1mVBH0zYdFnK49VZw27aKRxJxqvX+coyumvMPHIaNC7/RkyEdzP2iDdBxVlz7z4bb5JS3sN2HwZOlFS03pKtLVS7fY6Uujre7jzqQV/mYg5QwVLfmITvDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771311750; c=relaxed/simple;
	bh=qiWZYmjl5ej1vZQ3GjrGLzbfWBOm3zp+Klvi+X03qOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZF6AmbhN7/Cniv1073YJAabDo6cnB7bbm/1/OTsY1rHqftlrzecQmbOrpcxogsf7eqTXc/rXqbKg8O610fJx/w2o3QJfqCtVm+spAuAq1v9W2dAtRXLvv9DV+CLyC0AsUVxy4Me1OIZ+VM7/z3wwyi0GNG8t2paK8Jrn6l7gdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=iuQ5293A; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="iuQ5293A"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771311747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CurkBCDBoSHvQL72S8wPE7bvhT/px5KQEHYARnZIZ/w=;
	b=iuQ5293A51Bq2wdelf03oW4hhk1/p5JYKFKoOCKDuVeAhwzi4RqrmB9KVmlk21QluJ4qMG
	dUilg6zZ02Kpv7K0iHoY+xPTfP4C3dk14sLn7/pYA5XJtKoB/n0KXMpIiBU7WU/FZRdYUH
	djt6rY2KA0Xf8bLRJg6gugTN7An/iH6Ta1kJnOb4o5IVcsqPZRKX7MDC7d9Dejo0lVOad6
	4LmBhb6zfawy7SkiBtssn+YBVptjQOaafvbzFQCwNAui8Xpc67BA0j7cyHitvjtY1JPA/b
	QGgXmzxKS+E+k1CW1CJALL5OvzSBswD/l+YIJ9UQHJGH3p6j/ZSW9hba8HJ41A==
From: Val Packett <val@packett.cool>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>
Subject: [PATCH 4/4] drm/panel: himax-hx83102: Add support for DSI DCS backlight control
Date: Tue, 17 Feb 2026 04:00:12 -0300
Message-ID: <20260217070121.190108-5-val@packett.cool>
In-Reply-To: <20260217070121.190108-1-val@packett.cool>
References: <20260217070121.190108-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The HTF065H045 panel based on the HX83102 controller does use DCS
commands for controlling backlight brightness. Make the driver fall back
to DCS when no external backlight has been defined in the device tree,
like many other drivers do.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/panel/panel-himax-hx83102.c | 65 +++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
index 34e0e956db48..8b2a68ee851e 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
@@ -7,6 +7,7 @@
  * Based on drivers/gpu/drm/panel/panel-himax-hx8394.c
  */
 
+#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -76,6 +77,8 @@ struct hx83102_panel_desc {
 		unsigned int height_mm;
 	} size;
 
+	bool has_backlight;
+
 	int (*init)(struct hx83102 *ctx);
 };
 
@@ -913,6 +916,7 @@ static const struct hx83102_panel_desc holitech_htf065h045_desc = {
 		.width_mm = 68,
 		.height_mm = 151,
 	},
+	.has_backlight = true,
 	.init = holitech_htf065h045_init,
 };
 
@@ -1049,6 +1053,59 @@ static const struct drm_panel_funcs hx83102_drm_funcs = {
 	.get_orientation = hx83102_get_orientation,
 };
 
+static int hx83102_bl_update_status(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness = backlight_get_brightness(bl);
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return 0;
+}
+
+static int hx83102_bl_get_brightness(struct backlight_device *bl)
+{
+	struct mipi_dsi_device *dsi = bl_get_data(bl);
+	u16 brightness;
+	int ret;
+
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
+	if (ret < 0)
+		return ret;
+
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	return brightness;
+}
+
+static const struct backlight_ops hx83102_bl_ops = {
+	.update_status = hx83102_bl_update_status,
+	.get_brightness = hx83102_bl_get_brightness,
+};
+
+static struct backlight_device *
+hx83102_create_dcs_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 4095,
+		.max_brightness = 4095,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &hx83102_bl_ops, &props);
+}
+
 static int hx83102_panel_add(struct hx83102 *ctx)
 {
 	struct device *dev = &ctx->dsi->dev;
@@ -1080,6 +1137,14 @@ static int hx83102_panel_add(struct hx83102 *ctx)
 	if (err)
 		return err;
 
+	/* Use DSI-based backlight as fallback if available */
+	if (ctx->desc->has_backlight && !ctx->base.backlight) {
+		ctx->base.backlight = hx83102_create_dcs_backlight(ctx->dsi);
+		if (IS_ERR(ctx->base.backlight))
+			return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
+					     "Failed to create backlight\n");
+	}
+
 	ctx->base.funcs = &hx83102_drm_funcs;
 	ctx->base.dev = &ctx->dsi->dev;
 
-- 
2.52.0

