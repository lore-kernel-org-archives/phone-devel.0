Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3614F396D36
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316521; cv=none; b=LeJWHtp7PMbGsWC8muY+EtcG42eSyEiebO/XOaSsEN8oLXKwSN4X8sT7DY85N/6kTG9lvuXd7DBjugQlcEJ7beZ5ellsmrPlxlijSDxb7ZvidKCY8a43TRquJsKNadIwXiARkm+dQuSLwac20WJXZZYXLMf3Au0Av+MIx35z24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316521; c=relaxed/simple;
	bh=m4dKAXdAH6DYSmhToOzqTyXzvgKyMUu2UsuHl6U3UaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzKjc/Lw3aiInO4QqjKTAYvmOE92z8xTLfHSexNRV1b4xMgJubgVDKHrQSNr/8CJH8KvXXwWGc34A3TxXizHC+fPBBTZ0Efa1jjHWRCJLZowYd6wzGKzGqHRTULw1BSV6uKQb6TNGe1QSYgCTln6PM23SXfREodGADw/n9uijXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+e8gSDi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+e8gSDi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b611274bso635227f8f.3
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316518; x=1773921318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ51pF+yefCyM47+DFkZmWWHtm2Vln7aBCXDpF0opWE=;
        b=S+e8gSDikjcXFDfXV8fDPtql0EeKiyrLzkVikYdMgeiG2/TnZHgEk/0udwxENs4k+O
         Md2IryRuQIO4FqrZeFkZihU6WTh1sqVkml5wKXYNWGl+Rs6CxihSXVg5+lTAYuTtRyS7
         r2hX0+DAub9uKfVUzt9iH9FlnfnVd0cCpG/rysjngCd7NLWkAlrM3ggXuI47fnvdr1G3
         AW9AWZbYT9PqVQcAb/X6n+lVujoEN7rM6wZ/ay2or8zgO8hLInCpaYKk78TigD10eJYV
         SsBG7J24pBuvLbA46zBegb2Vi+5NYe7LkxaBF3olOl33IJNMLUpp9jn3MhBXeE9y1XOf
         kAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316518; x=1773921318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJ51pF+yefCyM47+DFkZmWWHtm2Vln7aBCXDpF0opWE=;
        b=Kvl/r+aurI4zxvCQUQPjQfuk8m3eE7ogbumobrcsv49NuOgtkHHc8eKWcKpFW56eEh
         xzZMZNpJqlMItZkhymIpXykiO8H4UwNma9RhErf21M4gAmf7h2JHkX74j3hPGbV1ZY7U
         Zdg/sjCUwKGektRyIQ+RQ4NRbDDWtIJ0np8id5uvlxfteqoPMGw8s0x3jFty7rKnhQd0
         r2jGDsngwN9vzEw2F9V1Z5MnJAojPeNb0TbYTEyXsbXhZxm3MmWH45dxlzgy0m9pkB5Q
         Y2+B5+u0Ex1DuSglirg+RmA35bOIEMi3EKEbuCNKascC7TX03Ch8Mh/YxyfP7DiCWepP
         pkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhAnhltkQSK5wiaS1t2PPPhG0eDIkDI8i2m6yQRGP1KcP8//RvLuChBbQDCTUpTXXhxi/OU5JC56XEDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4yKE7TwGTNjVxCTTEsa87r2zC6jGxyX3o5uAMjuU30ks5ka6
	dtF1zriPHZNnjenQ1jk4EZ5KQtMoQd89keK7p4rP4yeyrCyUATxuMJj5
X-Gm-Gg: ATEYQzzBo394l4KuR/EzwL6bY0Q6R+lTkbMJym1YI6+wE4KwR0pWn23JR844p+nsd1A
	WGVI5JodnYBePXrfJPufAaPGRarLZbo46XF+fdh8icTbZkUtyw1GLx1c4Aup5opeL7l+dp/AepW
	BRh6AhG2oR4oRmFHVK630JNWN4z29LJGBxhZEfdVpq9Y8OpmfomzGCxxf/J5mDOWDp3HgO4cqEn
	rU6H1XrAhCvgssD3LODAeP5jLBRrq96GhhCEcMogByF+ij/O+RR1WYJiJAN7iUmx3hCzep3dO/s
	dO+KbouiaVqOownLWKi2WhCRyeSOIoQqS9BZO7OmJrklQ698qmXR2NGV7lgkYeX5MQizBtHApYu
	mVWeyXCwex+o3DWxdQf/Rfl1BbMwLQNtiP5760g6SkZ1NhjhIZEiqqAntOCdup2bc2+DQQoRoq4
	U8x/cZ9nh9WZpg9zHwDQh7gmutDCUQmj+R1/SMYhk85oBoSSJ3HY0HR6qSK/7vcKFxtlu0JJsiN
	A==
X-Received: by 2002:a05:6000:40de:b0:439:ca7b:f4b with SMTP id ffacd0b85a97d-439f8414530mr11409322f8f.50.1773316517405;
        Thu, 12 Mar 2026 04:55:17 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7058657f8f.31.2026.03.12.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:16 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 12 Mar 2026 13:55:09 +0200
Subject: [PATCH v3 2/3] drm: panel: Add Samsung S6E8FCO DSI controller for
 M1906F9 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-panel-patches-v3-2-6ed8c006d0be@gmail.com>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
In-Reply-To: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773316510; l=12761;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=m4dKAXdAH6DYSmhToOzqTyXzvgKyMUu2UsuHl6U3UaQ=;
 b=rJYnfQSIS0E8j9XCSofc3ODo4LiOjStxPf2kfWQ6KZPAPJoehQ0NFRs+39xmYLPNFHsb1tZc/
 gtCm99/Ycn4CZdHvXUHUF28LiougZ0rZs1jF9UknyUKAD+0l/9/kapJ
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Add driver for Samsung S6E8FCO DSI controller for M1906F9 video mode panel,
found in Xiaomi Mi A3 mobile phone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c  | 302 +++++++++++++++++++++
 4 files changed, 317 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7aee8dab903cd42c245fea3cf8971dcd99b2196..d00775a09445a8a1bd626ecfd27903471d08d33a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8187,6 +8187,7 @@ DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
 M:	Yedaya Katsman <yedaya.ka@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m1906f9.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c
 
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca1b688ce6fbe4295ec9009007e693..ee9cc6939f2ac1dc4542563fd73f68ac5f9ee371 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -893,6 +893,19 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
 	  DSI protocol with 4 lanes.
 
+config DRM_PANEL_SAMSUNG_S6E8FCO_M1906F9
+	tristate "Samsung M1906F9 panel with S6E8FCO DSI controller"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DSI
+	select VIDEOMODE_HELPERS
+	help
+	  Say Y or M here if you want to enable support for the Samsung video
+	  mode panel M1906F9 (M1906F9SH or M1906F9SI), which uses the Samsung
+	  S6E8FCO DSI controller. The panel has a 6.09 inch AMOLED display,
+	  with a resolution of 720x1560.
+	  Found in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
+
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..19e1e898dfd4af2d34eafe7a6ded5ad74fc7ee04 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FCO_M1906F9) += panel-samsung-s6e8fco-m1906f9.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c
new file mode 100644
index 0000000000000000000000000000000000000000..ccf18da59271dc4926a536f795a38d8eae349e00
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Kamil Gołda <kamil.golda@protonmail.com>
+// Copyright (c) Yedaya Katsman <yedaya.ka@gmail.com>
+// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
+//   Copyright (c) The Linux Foundation. All rights reserved.
+
+#include <linux/backlight.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+
+#include <video/mipi_display.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct s6e8fco_m1906f9_ctx {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data s6e8fco_m1906f9_supplies[] = {
+	{ .supply = "vddi" },
+	{ .supply = "vci" },
+};
+
+static inline
+struct s6e8fco_m1906f9_ctx *to_s6e8fco_m1906f9_ctx(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct s6e8fco_m1906f9_ctx, panel);
+}
+
+static void s6e8fco_m1906f9_reset(struct s6e8fco_m1906f9_ctx *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+#define s6e8fco_m1906f9_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define s6e8fco_m1906f9_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+#define s6e8fco_m1906f9_test_key_on_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
+#define s6e8fco_m1906f9_test_key_off_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
+
+static int s6e8fco_m1906f9_on(struct s6e8fco_m1906f9_ctx *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	s6e8fco_m1906f9_test_key_on_lvl3(&dsi_ctx);
+
+	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x0000);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x20);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04, 0xed);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
+				     0xe4, 0x08, 0x96, 0xa4, 0x2a, 0x72, 0xe2,
+				     0xca, 0x00);
+	s6e8fco_m1906f9_test_key_off_lvl3(&dsi_ctx);
+	s6e8fco_m1906f9_test_key_on_lvl2(&dsi_ctx);
+	s6e8fco_m1906f9_test_key_on_lvl3(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
+	s6e8fco_m1906f9_test_key_off_lvl2(&dsi_ctx);
+	s6e8fco_m1906f9_test_key_off_lvl3(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fco_m1906f9_off(struct s6e8fco_m1906f9_ctx *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 20);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fco_m1906f9_prepare(struct drm_panel *panel)
+{
+	struct s6e8fco_m1906f9_ctx *ctx = to_s6e8fco_m1906f9_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e8fco_m1906f9_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	s6e8fco_m1906f9_reset(ctx);
+
+	ret = s6e8fco_m1906f9_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(s6e8fco_m1906f9_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6e8fco_m1906f9_unprepare(struct drm_panel *panel)
+{
+	struct s6e8fco_m1906f9_ctx *ctx = to_s6e8fco_m1906f9_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = s6e8fco_m1906f9_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e8fco_m1906f9_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode s6e8fco_m1906f9_samsungp_mode = {
+	.clock = (720 + 350 + 40 + 294) * (1560 + 17 + 2 + 5) * 60 / 1000,
+	.hdisplay = 720,
+	.hsync_start = 720 + 350,
+	.hsync_end = 720 + 350 + 40,
+	.htotal = 720 + 350 + 40 + 294,
+	.vdisplay = 1560,
+	.vsync_start = 1560 + 17,
+	.vsync_end = 1560 + 17 + 2,
+	.vtotal = 1560 + 17 + 2 + 5,
+	.width_mm = 65,
+	.height_mm = 140,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int s6e8fco_m1906f9_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &s6e8fco_m1906f9_samsungp_mode);
+}
+
+static const struct drm_panel_funcs s6e8fco_m1906f9_panel_funcs = {
+	.prepare = s6e8fco_m1906f9_prepare,
+	.unprepare = s6e8fco_m1906f9_unprepare,
+	.get_modes = s6e8fco_m1906f9_get_modes,
+};
+
+static int s6e8fco_m1906f9_bl_update_status(struct backlight_device *bl)
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
+static int s6e8fco_m1906f9_bl_get_brightness(struct backlight_device *bl)
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
+static const struct backlight_ops s6e8fco_m1906f9_bl_ops = {
+	.update_status = s6e8fco_m1906f9_bl_update_status,
+	.get_brightness = s6e8fco_m1906f9_bl_get_brightness,
+};
+
+static struct backlight_device *
+s6e8fco_m1906f9_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 512,
+		// The downstream dts claims 2047, but seems to ignore the MSB.
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &s6e8fco_m1906f9_bl_ops, &props);
+}
+
+static int s6e8fco_m1906f9_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6e8fco_m1906f9_ctx *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct s6e8fco_m1906f9_ctx, panel,
+				   &s6e8fco_m1906f9_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(s6e8fco_m1906f9_supplies),
+					    s6e8fco_m1906f9_supplies,
+					    &ctx->supplies);
+	if (ret < 0)
+		return ret;
+
+	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
+				     "Failed to get reset-gpios\n");
+
+	ctx->dsi = dsi;
+	mipi_dsi_set_drvdata(dsi, ctx);
+
+	dsi->lanes = 4;
+	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ctx->panel.backlight = s6e8fco_m1906f9_create_backlight(dsi);
+	if (IS_ERR(ctx->panel.backlight))
+		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
+				     "Failed to create backlight\n");
+
+	drm_panel_add(&ctx->panel);
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
+	}
+
+	return 0;
+}
+
+static void s6e8fco_m1906f9_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6e8fco_m1906f9_ctx *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_s6e8fco_m1906f9_of_match[] = {
+	{ .compatible = "samsung,s6e8fco-m1906f9" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_s6e8fco_m1906f9_of_match);
+
+static struct mipi_dsi_driver s6e8fco_m1906f9_driver = {
+	.probe = s6e8fco_m1906f9_probe,
+	.remove = s6e8fco_m1906f9_remove,
+	.driver = {
+		.name = "panel-samsung-s6e8fco-m1906f9",
+		.of_match_table = samsung_s6e8fco_m1906f9_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e8fco_m1906f9_driver);
+
+MODULE_AUTHOR("Kamil Gołda <kamil.golda@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for Samsubng s6e8fco DSI controller for m1906f9 amoled video mode panel");
+MODULE_LICENSE("GPL");

-- 
2.53.0

