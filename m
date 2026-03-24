Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EF34F48D
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317699; cv=none; b=b8FOULE070jtWJWk8eowamhVhD/X3OG2oVRmiGk65Q4rJQ2KeKovJBfx+0J8oIG+6gZ5vsNENCXut3pJl6P4x8qssDlmuXGlgZziu2P8+Asrei3VVkAWWPnX5V5dNj66ng0S8Mj5ExcXEmU6yY3xk+YKBolWCUcU66WAIz35Ebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317699; c=relaxed/simple;
	bh=pVDlvVS5Bi6Vg+pGcrdIxRvJe/OF7V/L/8y6hmVgEX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTHXsFnCKKJNg3Kw6EPgUCB0rL8CI1FYb88Nr8WQR/eTbYUkv9qeMVY5sD5x1jtppzDxurOSnkBwlDVsRM5NieP5aM08BwvPtvEkcBx8sk6UMFgkIWHylnYWsLNXowlG/rKa5vYHZm9sVs2VAvDjuD8PphFDO78DYs+xefzaHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pHK5sy5n; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHK5sy5n"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506aa68065eso6179641cf.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 19:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317696; x=1774922496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbk1GUedD4ye8Cnd2HrixlkkqkX5OW0vDgVQlNzH9xs=;
        b=pHK5sy5njb8IbGq034HGIXFHdOMTVpt+Lx0W+spIpxa/uAdy6zOBYavlcDGVsmgz/9
         8C6Pzr0wpAkLnYoTUNhgR8s2FzsI7BbkcDgr/T+UT1JnAYpRVQPBhZydRQVv+h6+NBMP
         +7d15mDdWKWABg1q2Sew2o9n+GeBa1VeSOB+sp/XUUtBSXqYa5C63HWxEnaF9lGojhig
         mUwQo4XSXX4rMGZyOFA7V8jjpI+F5IE6oXnUlycMdwm1vdfgzZTkGdSjVCXIIV9DqlvC
         luaxmbcz5yd+fV8/i9T7rggoTjlpMb18I+wOk7ytzMTooK0gPvgL43FKarDyMI7DgO2P
         eOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317696; x=1774922496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lbk1GUedD4ye8Cnd2HrixlkkqkX5OW0vDgVQlNzH9xs=;
        b=lCmSTUsXQBPQwYXvNZRZGQRFeQZAAuQx7KpetNW/qPHsksZFAX472bGJvIKjZNzrwh
         BfVm8MlLQKYzAKpX7PPOUX44bkkeOg2f6jmw/3rLsJm2gVMJhzmygA3uMWhxQ4MtB/of
         56oJGv2kD876sPS1r3neaOqMoqyVfasbApkmtxdJpN1yYa2KoFH8mp0uhqE2XKlrPgxA
         GnedSol8gQQEu6JRQMKPjOSCoE+dYFKNUDpD+KFZlYxiCcnAnt7xAiWLSakHz6koA1Ns
         sl6icL8JS0tVeR3mM5PofPXYndjZ/nq/3Vi0DkfYLTi8kyow5ECn0UImrSMFlwpYIxIE
         AiOw==
X-Forwarded-Encrypted: i=1; AJvYcCXK5HTdOsYYCX79mbvgqwRCpAmBKR9nyM8U9zdU6EceqvTWvw7A6LVi4WmdRsHBByAaOlcdRewP8vNq/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBUrKgSKemlnnqANxaHIXB5xJd3nJjUXZDjKv8Rb/F41/CYsqX
	jJWP3CKnnBK0HThbBmlWnuWNTeszu3pOCTbzoO9ec8EWggUMN2mbvqf6
X-Gm-Gg: ATEYQzzQoaR/G46LjWku5QBAURZRdVB6YMOYcRK26yYJLoDSjgW2oSs335+lI1V8oIW
	vJifK3q1+tqwFksoilyO9rug7vh3R3K8NAcQHpbrUFhFbIJjGer4RQ8B87Y1NKzMzy69hQACe4X
	a1I16vEEXf1cwgr7bs6eN6sSmlyrufDTW9XKEvhidT8CvhnwvUtBEmImEZCvQqFsBfELi9Bq1eG
	I9sB2VD2HGHmItkvhGRnqaKmvq5VP5d1Isf1cSvJKhXnRtsmOWHm/CQjjk57+8ABk5ku4ZV/X/y
	uLu6Doy0pchSdB4fqwSluRFxrkKruoaTWGRoBrVIgAQb63QCQv2YPBRoRoqA5+kr4ZNDfqe0M3n
	4QcYUSQXMRxosLvT8xhr5c4Yl6t93Uz4bQ0G/PCyyBlSlS+P9Bmjjyj4Q4POoiOLdJvJRFERL0h
	rmCmpstOnx9grA82y5uZcKRxRr9g==
X-Received: by 2002:a05:622a:5c9:b0:509:2455:2b53 with SMTP id d75a77b69052e-50b37545ee8mr230744501cf.49.1774317696032;
        Mon, 23 Mar 2026 19:01:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36d0671csm99718411cf.10.2026.03.23.19.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:35 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v11 3/7] media: i2c: imx355: Support devicetree and power management
Date: Mon, 23 Mar 2026 22:01:28 -0400
Message-ID: <20260324020132.8683-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
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
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 111 ++++++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 776107efe386..9ca87488c933 100644
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
@@ -1515,6 +1528,52 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
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
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clocks");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to enable regulators");
+		goto error_disable_clocks;
+	}
+
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
@@ -1689,16 +1748,26 @@ static int imx355_probe(struct i2c_client *client)
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
@@ -1706,13 +1775,24 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_probe;
 	}
 
+	ret = imx355_power_on(imx355->dev);
+	if (ret)
+		goto error_probe;
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
@@ -1752,6 +1832,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(imx355->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1768,7 +1851,11 @@ static void imx355_remove(struct i2c_client *client)
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
@@ -1779,10 +1866,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
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
2.53.0

