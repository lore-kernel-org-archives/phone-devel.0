Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB13126B3
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 04:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622806; cv=none; b=H3/2nma7WIhFyoIuY/9fr7njYqmyOJofj/zmH/s4uV9M9MaRV3PtRcx61i5hoGPU1Yolvg9ZA5IJxa+JtofvZamg1Zx3LJTICQEV9SRZUuegj688E7ddG5vtqBR+E/RNBngZebM9OND0zCTXt6SoccmKs2zBrKuqf0dx8Ky8hcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622806; c=relaxed/simple;
	bh=JOlQ96NJcQ9WqBWC+odzZHxXWUjTEa9IMsvQfvNGCto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJXuReWU5j1sp6K4+zxLkQZh7VTU+gHOphzo9TqdmS/3EmW56okwKo1HQ/VtnbK15i+4wzQ4D8+vYFtYoHS8u/U9ikA05oS1casIhXjvdNDwTbmNqz+edXewZIXuGt2/oVK84hoSM1B5sYJajpj/dxlO8xgGuQV53O/MNrQ8oa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbdRNql8; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbdRNql8"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c5389c3cd2so292669885a.0
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 20:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622804; x=1769227604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tf+jvLCJJOJoojEtmxyeWIw57LiHEmAdAqVecpslvUk=;
        b=MbdRNql8Y2bd26ymNAXN1YLrAzlKk3cYwYTMSSVc0KEYR+6ij59kvHgVBcIUpxz6in
         W7XKs97J9LAfOaEZrlGe2GCrv9zK36I1yrRnyj73sGEzJ+XO+ev1A+Kgrcun5Op6k4sM
         4gl+lclxKbht/3Z3ED07Cb964EN6ZNcHaOXepPE7adULEjLHkDtVgUBz247CG22HLjSM
         1oaDk9ccrmnxXvZKRFtle/OkfFwb6Pxvz/+Tv/qJMKA/YCDzVCRUcZp33T9jXNlPsMtu
         ehd1shzcps2O7lrI7gXusukr1Qnod9zrboqwZgn4XZ150euxpMtueNJYZtgCMxWB2lDx
         aB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622804; x=1769227604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tf+jvLCJJOJoojEtmxyeWIw57LiHEmAdAqVecpslvUk=;
        b=L7BWz7uNoPh4Czf9X3GAyhTKdXp0Dr+jy6IORuPbYiZt988YwyXeswQ2BIQ/Jn+OvT
         gBC7YyytE3A1avyaz1s3/JkZtBB73ovsZpLHJOKbS35R5RmuKmQXFkZ4lYCdqZGmVgWx
         qeK0YurvkzoeJOIlugYNi3HgOydUc5okZHjjEX+hKlXUILrV/nPAAahZAZkiQcCw08L4
         8rYILBPZjmhgge3MNGfPar6JJIe9Q1Yt/83QkAi7tx3Phl1tKDNd8XtiOh6wDVVUFMAL
         TCvaGvWu3w41L5sbyQUo8jWikTFDCcJ74JZ4YGQ2JKkUO7C6qKUnpgA6cyve/geBb9KA
         k6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK4k+rT3Vei4DLvUCzqqOvbaJCDFNMQbU0QZTtJzDw0HVOsESrSdM1/5u8g7d+5dwnFyrHIEz0zACS6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ge8IIbgEWrfzckhsAxL81g8DXY756Ad/MM+16Hef2hM1DE1/
	+KaxR1sXJXEIWG2fBoOryOhU+ZkEj9+CPilX72g2nCdiocD+al+8gB4r
X-Gm-Gg: AY/fxX4iX06v0cyMweMgS/E1IV/RqdAccmYEX+UlBbAG1zyUlPxwTHiE97sjNY5je6e
	bQVNIVYXZy+yrH6X+/cgRL+JKp+hNepkA8cgLJQC0YFV+AyeuRG/A5T3HqGqDUSiOx97bR+N1AK
	Ja164nz4u5Bwy+XJgEWDtz45XZuIqrY56ArutYiztvMYSngOgUFmvFuuQdjtUmDzUppiPjazoGU
	lgqkL90oqT7WYnNFY1DQjgy1gbCpO91veGLbWMrlT9jQ9hcgHCBx7W2WERDKbBVYf0MAQ5618O1
	7mzOkJT9Hb+FDNlfi1hFs9vJw7MNQ5STIAJLgCIKJxPgNYrGNEDWjG5oRQbUVJWchginygsADjj
	aOpLNLFOOiaeFP5pwqBKxlJ42BH9Ja7cfHpLJAmN7evckmxi6fEmGyfKpo0kHGdFuPbB0OrbrZM
	/5f5U03R6tprN8ieK2IkhZEeDE4dX7z4JZoo1QbHUwe8q8lur5KGJbA4gkLiCOrMvlOJ0yLeTqd
	Yc=
X-Received: by 2002:a05:620a:6cc1:b0:8c5:3202:8bc2 with SMTP id af79cd13be357-8c6a6717fb6mr743115785a.35.1768622804038;
        Fri, 16 Jan 2026 20:06:44 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c274csm369814985a.21.2026.01.16.20.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:43 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power management
Date: Fri, 16 Jan 2026 23:06:54 -0500
Message-ID: <20260117040657.27043-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A device tree compatible makes it possible for this driver to be used on
Open Firmware devices. Initialization of power-managed resources such as
the reset GPIO and voltage regulators can be specified in the device
tree and handled by the driver. Add support for this so the Pixel 3a can
use the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 116 ++++++++++++++++++++++++++++++++++---
 1 file changed, 108 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 776107efe386..5a8da035ba5f 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -3,9 +3,13 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
 
 #include <media/v4l2-ctrls.h>
@@ -125,6 +129,15 @@ struct imx355 {
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data imx355_supplies[] = {
+	{ .supply = "avdd" },
+	{ .supply = "dvdd" },
+	{ .supply = "dovdd" },
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1515,6 +1528,55 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_power_off(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx355_supplies), imx355->supplies);
+	clk_disable_unprepare(imx355->clk);
+
+	return 0;
+}
+
+static int imx355_power_on(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+	int ret;
+
+	ret = clk_prepare_enable(imx355->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		goto error_disable_clocks;
+	}
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+	usleep_range(10000, 11000);
+
+	return 0;
+
+error_disable_clocks:
+	clk_disable_unprepare(imx355->clk);
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
+				 imx355_power_on, NULL);
+
 /* Initialize control handlers */
 static int imx355_init_controls(struct imx355 *imx355)
 {
@@ -1689,16 +1751,26 @@ static int imx355_probe(struct i2c_client *client)
 				     "external clock %lu is not supported\n",
 				     freq);
 
-	/* Initialize subdev */
-	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
-
-	/* Check module identity */
-	ret = imx355_identify_module(imx355);
+	ret = devm_regulator_bulk_get_const(imx355->dev,
+					    ARRAY_SIZE(imx355_supplies),
+					    imx355_supplies,
+					    &imx355->supplies);
 	if (ret) {
-		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(imx355->dev, ret, "could not get regulators");
 		goto error_probe;
 	}
 
+	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx355->reset_gpio)) {
+		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
+				    "failed to get gpios");
+		goto error_probe;
+	}
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
+
 	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
@@ -1706,13 +1778,26 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_probe;
 	}
 
+	ret = imx355_power_on(imx355->dev);
+	if (ret) {
+		dev_err(imx355->dev, "failed to power on sensor: %d", ret);
+		goto error_probe;
+	}
+
+	/* Check module identity */
+	ret = imx355_identify_module(imx355);
+	if (ret) {
+		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		goto error_power_off;
+	}
+
 	/* Set default mode to max resolution */
 	imx355->cur_mode = &supported_modes[0];
 
 	ret = imx355_init_controls(imx355);
 	if (ret) {
 		dev_err(imx355->dev, "failed to init controls: %d", ret);
-		goto error_probe;
+		goto error_power_off;
 	}
 
 	/* Initialize subdev */
@@ -1752,6 +1837,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(imx355->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1768,7 +1856,11 @@ static void imx355_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(imx355->dev);
-	pm_runtime_set_suspended(imx355->dev);
+
+	if (!pm_runtime_status_suspended(imx355->dev)) {
+		imx355_power_off(imx355->dev);
+		pm_runtime_set_suspended(imx355->dev);
+	}
 
 	mutex_destroy(&imx355->mutex);
 }
@@ -1779,10 +1871,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
 
+static const struct of_device_id imx355_match_table[] = {
+	{ .compatible = "sony,imx355", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx355_match_table);
+
 static struct i2c_driver imx355_i2c_driver = {
 	.driver = {
 		.name = "imx355",
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
+		.of_match_table = imx355_match_table,
+		.pm = &imx355_pm_ops,
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.52.0

