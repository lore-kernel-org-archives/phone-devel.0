Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBB226158B
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849931; cv=none; b=ats5ivF+HoPHKIHa8ySATIJF2evshZ52l/n8lKwBcWa6mGGHkwq3d2xbOyHsWqhOmr2xRG3nlqSNOuWACBc0LYqlHZ/SlCRgYMposUINXjNyIjnhmfQhnm0g9Q4kyMD0GEfXCAWYRde9O+CmrL2Z414ZjisZBHiZZffei7q94IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849931; c=relaxed/simple;
	bh=4he5/LPOD9k735J1HjegbOsl8TzYlp/a0Gw3gpQEE/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXxlOLmUCRq+nglnqj0p3ZBez4uzCio4grxxs8dvAfhuIpai9+Mds6ofxcVnS9o6WoURzm3QhNm0U7vsT9hAJB66yLpHJJ0YE2zERBYGCA/t3w9RFJyzu+Avr8o5yaruc4GRUoLgqsYbGzbZqYdRniZNw3mYiU4NjwsNivXw96g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5BPWPZD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5BPWPZD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486b9675d36so199285e9.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773849922; x=1774454722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00hJBv8/SFEu5p3iA/PHAsNTUG+3E4XFfkY4RpU3ohU=;
        b=m5BPWPZD3OSxiU7RoPB/GQpMk+ggE+JujVdCOW8E5KORWP8kr+BXv5PCvVetHdevQG
         YgujG0TPRsc/bJDOs/dZ15X6CVqCUYHMAFVOVVYUpJGAv2r44rm54i9fb9wPvRDQL8uV
         xpuF2cVNBrG5j1EtqlTp6YskPSEvlWsNoflS5QdepEXwOlIvKl6C/TOiqYNQMnK0fMGw
         lCqZczzNUD0+4tLRzMA+cl6IiFOAH8HABLjqLOasG930lC4MdVITwQw5Selr+mp6+t2W
         TS8rHvJV6g6dOyMx5kHcvrGwSlW+6Zmkf5JJF5brLsKOO8NT8kOi8KJvDYYFZqnhHAUe
         j/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849922; x=1774454722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=00hJBv8/SFEu5p3iA/PHAsNTUG+3E4XFfkY4RpU3ohU=;
        b=baggvlCld/X8+7yGqPWufUIH4XttQWIZfOPIVTuLxkU6umXdT3apshBTDkCmYywVPH
         GCz+ayjz1Zz9PLhDzmXlY6HbWLCEb7UbvKWV051vyKxKCLxka++PygPGy2gY4NUsgcOv
         WDXm7W7n46VcY9xxGWSM0Ryl8paDQ7vKvVLDkUlEQlhKSelpYn/StCZl7qhmXCUjpLRT
         UEBOHphhGr8tS7P3Ap8n+z8iyNqBUMWCQf9n5QQpPHrJrri1hPeLeMECSX5FkGiejC3S
         fipe3Q8JUX36eQs4Nc7JyrGTruFKxLc/8e8TvwcK5UF7v+k/qFnhKQTwfaQozmJe3UzG
         L2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCX8KZqbgQ0ouIupB13Gu/lPIEPbyEBqoXgRW3YvJqmHbKsooVAyLTfHDhpZ7kpXTkGHZ0mRDOMQ9c+MKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx95wA5sySedeEG3lEbb8iq92K6rPEhllSH9+sRzxcwgeCCXhe
	q4iYMF49ncygxtuZVbQ+FM92lafzGcW84EoB6mtHaSCvxtp5DZ5gdSasXmoHLtIL
X-Gm-Gg: ATEYQzxJxCoSs2MN7ipmcmV4psAmLHtFOzmwZ/NyGd+o8+vHstMX5obi5AVG+XWvP63
	co/2O6p3Vvay/+FH7hXBBMsqCzssASGvH9lNEsd6oBY7eA4XMhqo3z1J6HWcOaZUFHEn6rzPZ4M
	NCzd0XrbFQMKixWLYEX7tiDny3mHYUXSTxb53MB8MLQypRS7/OTaGZ26FELD+JzAGssOfxngXbA
	c5nL8jvC/nSmgW+pATKTDbCQ906NCt6P49w8gj2oqYbWB/QpngXxUCkDfOkhUJrbGKlM5ltCdSO
	tZuroqNQJubeUtO3suNLa1xUGvMn7H1Sm2MOEMyQ+ZwfJn9zc0Jxqaoxh5y2e52doK8c8wLnID3
	tF2sSEc4e5h7VVQI0YlLRWoM8lXYGZ07IDNNLfKsydKMOJ2ExUYGzQakaM68+80GcVb3QzzXOjy
	WGu+tj6g3XjQUvCvGMdQ89qMelUg4Sz0akiOdmquF4mnT87JHetxg/ZMmVgxvvHvc=
X-Received: by 2002:a05:600c:1f11:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-486f442fa32mr69793485e9.15.1773849921237;
        Wed, 18 Mar 2026 09:05:21 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8baec5csm2282225e9.15.2026.03.18.09.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:05:20 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Mar 2026 18:04:49 +0200
Subject: [PATCH v6 2/3] drm: panel: Add Samsung S6E8FC0 DSI controller for
 M1906F9 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-panel-patches-v6-2-7a30c2f85e0b@gmail.com>
References: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
In-Reply-To: <20260318-panel-patches-v6-0-7a30c2f85e0b@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773849909; l=12525;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=4he5/LPOD9k735J1HjegbOsl8TzYlp/a0Gw3gpQEE/s=;
 b=TXf1QZOOPoTkZ4qYKxqTn6yuUpvyEnxxNR6o0vghmnHWTrJjs2W7OCwov0Ch5GJLYWha/6slJ
 /YCF0vqCPPeD59DpxMAxmzolxswIke20KvI0wGx6YecQq6979tQkNiF
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=

Add driver for Samsung S6E8FC0 DSI controller for M1906F9 video mode panel,
found in Xiaomi Mi A3 mobile phone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---

The downstream dts claims a max brightness of 2047, but seems to ignore the
MSB.
---
 MAINTAINERS                                        |   5 +
 drivers/gpu/drm/panel/Kconfig                      |  13 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 .../gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c  | 301 +++++++++++++++++++++
 4 files changed, 320 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636268346979ddc270f8cf0905c722..d57d4c128cdd7fde82ba9c68b5f1b6d883a36860 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8183,6 +8183,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG S6E8FC0 PANELS
+M:	Yedaya Katsman <yedaya.ka@gmail.com>
+S:	Maintained
+F:	drivers/gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c
+
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
 M:	Casey Connolly <casey.connolly@linaro.org>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 7a83804fedca1b688ce6fbe4295ec9009007e693..fed15b7c08ba579a0a09108bca1646b4821f94c6 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -893,6 +893,19 @@ config DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01
 	  ~5.6 inch AMOLED display, and the controller is driven by the MIPI
 	  DSI protocol with 4 lanes.
 
+config DRM_PANEL_SAMSUNG_S6E8FC0
+	tristate "Samsung S6E8FC0 DSI controller"
+	depends on OF
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_MIPI_DSI
+	help
+	  Say Y or M here if you want to enable support for the Samsung
+	  S6E8FC0 DSI controller and connected panel.
+	  Currently supported panels:
+
+	    M1906F9 (M1906F9SH or M1906F9SI), 6.09 inch 720x1560, found
+	    in the Xiaomi Mi A3 smartphone (xiaomi-laurel).
+
 config DRM_PANEL_SAMSUNG_SOFEF00
 	tristate "Samsung SOFEF00 DSI panel controller"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index b9562a6fdcb38bfd0dfee9e8c11e16149ada4386..bf2b178f507ba1c1173d2b6a468c5fe5d23977b6 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS427AP24) += panel-samsung-s6e88a0-ams4
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01) += panel-samsung-s6e88a0-ams452ef01.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) += panel-samsung-s6e8aa0.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA5X01_AMS561RA01) += panel-samsung-s6e8aa5x01-ams561ra01.o
+obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8FC0) += panel-samsung-s6e8fc0-m1906f9.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_SOFEF00) += panel-samsung-sofef00.o
 obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) += panel-seiko-43wvf1g.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LQ079L1SX01) += panel-sharp-lq079l1sx01.o
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c b/drivers/gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c
new file mode 100644
index 0000000000000000000000000000000000000000..dcf1c3896203ce4b3afdcff5c41e4b13de77014f
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e8fc0-m1906f9.c
@@ -0,0 +1,301 @@
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
+struct s6e8fc0_ctx {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+};
+
+static const struct regulator_bulk_data s6e8fc0_supplies[] = {
+	{ .supply = "vdd" },
+	{ .supply = "vci" },
+};
+
+static inline
+struct s6e8fc0_ctx *to_s6e8fc0_ctx(struct drm_panel *panel)
+{
+	return container_of_const(panel, struct s6e8fc0_ctx, panel);
+}
+
+static void s6e8fc0_m1906f9_reset(struct s6e8fc0_ctx *ctx)
+{
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(12000, 13000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	usleep_range(2000, 3000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
+	usleep_range(10000, 11000);
+}
+
+#define s6e8fc0_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define s6e8fc0_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+#define s6e8fc0_test_key_on_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0x5a, 0x5a)
+#define s6e8fc0_test_key_off_lvl3(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xfc, 0xa5, 0xa5)
+
+static int s6e8fc0_m1906f9_on(struct s6e8fc0_ctx *ctx)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	s6e8fc0_test_key_on_lvl3(&dsi_ctx);
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
+	s6e8fc0_test_key_off_lvl3(&dsi_ctx);
+	s6e8fc0_test_key_on_lvl2(&dsi_ctx);
+	s6e8fc0_test_key_on_lvl3(&dsi_ctx);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x05, 0xf4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed, 0x01, 0x81, 0x04);
+	s6e8fc0_test_key_off_lvl2(&dsi_ctx);
+	s6e8fc0_test_key_off_lvl3(&dsi_ctx);
+
+	return dsi_ctx.accum_err;
+}
+
+static int s6e8fc0_m1906f9_off(struct s6e8fc0_ctx *ctx)
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
+static int s6e8fc0_m1906f9_prepare(struct drm_panel *panel)
+{
+	struct s6e8fc0_ctx *ctx = to_s6e8fc0_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(s6e8fc0_supplies), ctx->supplies);
+	if (ret < 0) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	s6e8fc0_m1906f9_reset(ctx);
+
+	ret = s6e8fc0_m1906f9_on(ctx);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize panel: %d\n", ret);
+		gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+		regulator_bulk_disable(ARRAY_SIZE(s6e8fc0_supplies), ctx->supplies);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int s6e8fc0_m1906f9_unprepare(struct drm_panel *panel)
+{
+	struct s6e8fc0_ctx *ctx = to_s6e8fc0_ctx(panel);
+	struct device *dev = &ctx->dsi->dev;
+	int ret;
+
+	ret = s6e8fc0_m1906f9_off(ctx);
+	if (ret < 0)
+		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(s6e8fc0_supplies), ctx->supplies);
+
+	return 0;
+}
+
+static const struct drm_display_mode s6e8fc0_m1906f9_samsungp_mode = {
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
+static int s6e8fc0_m1906f9_get_modes(struct drm_panel *panel,
+				      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &s6e8fc0_m1906f9_samsungp_mode);
+}
+
+static const struct drm_panel_funcs s6e8fc0_m1906f9_panel_funcs = {
+	.prepare = s6e8fc0_m1906f9_prepare,
+	.unprepare = s6e8fc0_m1906f9_unprepare,
+	.get_modes = s6e8fc0_m1906f9_get_modes,
+};
+
+static int s6e8fc0_bl_update_status(struct backlight_device *bl)
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
+static int s6e8fc0_bl_get_brightness(struct backlight_device *bl)
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
+static const struct backlight_ops s6e8fc0_bl_ops = {
+	.update_status = s6e8fc0_bl_update_status,
+	.get_brightness = s6e8fc0_bl_get_brightness,
+};
+
+static struct backlight_device *
+s6e8fc0_m1906f9_create_backlight(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct backlight_properties props = {
+		.type = BACKLIGHT_RAW,
+		.brightness = 512,
+		.max_brightness = 1023,
+	};
+
+	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
+					      &s6e8fc0_bl_ops, &props);
+}
+
+static int s6e8fc0_m1906f9_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	struct s6e8fc0_ctx *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct s6e8fc0_ctx, panel,
+				   &s6e8fc0_m1906f9_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = devm_regulator_bulk_get_const(dev,
+					    ARRAY_SIZE(s6e8fc0_supplies),
+					    s6e8fc0_supplies,
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
+	ctx->panel.backlight = s6e8fc0_m1906f9_create_backlight(dsi);
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
+static void s6e8fc0_remove(struct mipi_dsi_device *dsi)
+{
+	struct s6e8fc0_ctx *ctx = mipi_dsi_get_drvdata(dsi);
+	int ret;
+
+	ret = mipi_dsi_detach(dsi);
+	if (ret < 0)
+		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id samsung_s6e8fc0_of_match[] = {
+	{ .compatible = "samsung,s6e8fc0-m1906f9" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, samsung_s6e8fc0_of_match);
+
+static struct mipi_dsi_driver s6e8fc0_driver = {
+	.probe = s6e8fc0_m1906f9_probe,
+	.remove = s6e8fc0_remove,
+	.driver = {
+		.name = "panel-samsung-s6e8fc0-m1906f9",
+		.of_match_table = samsung_s6e8fc0_of_match,
+	},
+};
+module_mipi_dsi_driver(s6e8fc0_driver);
+
+MODULE_AUTHOR("Kamil Gołda <kamil.golda@protonmail.com>");
+MODULE_DESCRIPTION("DRM driver for Samsung s6e8fc0 DSI controller");
+MODULE_LICENSE("GPL");

-- 
2.53.0

