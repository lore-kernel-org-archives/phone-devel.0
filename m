Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F9A22FE0E
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 00:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288069; cv=none; b=AZk5rZQCTvMZ5wjwjdyTAD+5UCdLaKNv792b8c+Siem2S8cFVFrzL/2HdB9AmGdNLuRUaZrhoxupILqws69sGtwsXe4q4dUY55UvqzN4afqCyEWzO6qLR3GOW3YTbRuGTOf1bFYk792sriDORou4IheifOLc6PiCEQhV+PRBTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288069; c=relaxed/simple;
	bh=pVDlvVS5Bi6Vg+pGcrdIxRvJe/OF7V/L/8y6hmVgEX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGu3tLej9TGBVC//4nqpNATWTKV4K24DdfenwlfRrLsvWz5+MrNwadv5WnS/oJ+obP0yMlH4YFuzRqizeWDbeCkMBSDX2hqDzz9LBwaQXskZs+ECJ0bC9mSAPVBS3oxF2lcYnk618NFvwMmXdNaQOdJGXDn/z9AhzowcAFd+3lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GymMXMIE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GymMXMIE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb38e6d164so518786985a.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 16:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288067; x=1771892867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbk1GUedD4ye8Cnd2HrixlkkqkX5OW0vDgVQlNzH9xs=;
        b=GymMXMIEo/YeX6lcjURHfo3fLa8XjAljeGp4EXuTKPM9DVxTrQWuJSw8wteReyHSFK
         k372WVsZKXoksXUFyOslF5VxBh+222YygYvHbcsOFeW3e/2ikCL8VUJXUoj2B0sURdzl
         ln37VsWiYHgl8Nk9bKd6Czud6Qf7JIcBk9Vmvd/YLHMhNpwvkpa4pFtJ8RzrWWIxTOjx
         0TiJCCK2G2Y0e8/ideeKn2MYpjSmmqcG+v1F7qX2CuWGRLRMM/AVMXOMMd4iSctY4BeV
         4z8XIM2YAA1o9yhYILYJ4F4vikvd72IQlU3Jm2j4Jaio8ODM8uIrGtNKbpJDcvdZGYeV
         wb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288067; x=1771892867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lbk1GUedD4ye8Cnd2HrixlkkqkX5OW0vDgVQlNzH9xs=;
        b=vIJTgYGWR+/rR0/rktS4Fkanckai0B+ZMO6Jw3v1Ly+ZSIvBJ4qGvuvnPYwbkHMiV8
         uYcYEDtiyq55DObXINu1fnGEjKc6wjEIA7+/JTPXEAIGDrLlEHg0mIlZ53R4NQq3siQO
         cYkICyug9euj5h31ZipvQgCOO3Hf7owvTCFl8nDfN7R849gKrrRYb48fk2MmdePac4CB
         sHl8drM6QIERILk98VQ2YGkYOcp6xPEna6kI2UCsr/dVZMO1fzZWw85U2sShpBRWx+ph
         MNckMnIOyRanvMH2K4HuycfgqQnhutR//k3ThjXCdLlMeEzqNxwHHBsc3QxyjxPNWKCd
         h16Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKf8WoJ3LfyheacJBhpZ2lJMg8EP2AuE4r9fm/9bNPE+xGPIvZ8s9E+2/mlK1ejtcCjzGU/unHMZxUjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykf8k35LyWyGKWzX3BFYJghvP7xDpkkevNFPx9Mt/iX0vwSjFL
	0S3WrfdtMLHVUANgCZA/iG3rOq9NtpeRQ2vvsE9GJZEnuKQMdujATBN+
X-Gm-Gg: AZuq6aIXUCOLv8cocbdW3UEu9pNmMcpf3BQWp8SRTzjkU0E4Eakw0JUTfK2w//ux+HK
	8+2WHy3YUTIEhcdmi95kb9IZCoInBfSTqIQ7zrbQ5CQMXq+jQQsVZBwRKH4iAX8roaH9hPTEx0/
	rcAicvUL0ux5fZZKrzl7r4XaBPnM4O4DpBb6owYK62xOPYnkS3xGjHWlhtFgBr4QzTy4iRU8xF0
	VjoX53ZuBlTk7becSPFqwYw6wYVJgIrD5IFvIgMEgm/o4WICb9DeNALXZe+2vp0fTyU2kqDDVZB
	ySva+4jIOo73skSHAKj/x5jFKMmqossc10klwwKKJdMvgB5MAd1WyDAhJGccL3+fbn/LQCG1JKw
	+UnChfHgmsU1f4gBkRCGvt7JDQp/uq3MyqfpT2EgRZpHyGqhwOBcCrPY7+vbEmdF6endhyN3Wxk
	WbReWI1d7VDUrKgdFB7aRwikLKjHus8A==
X-Received: by 2002:ac8:7f48:0:b0:501:4f38:3d47 with SMTP id d75a77b69052e-506b4000f79mr134622751cf.53.1771288066964;
        Mon, 16 Feb 2026 16:27:46 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdbd860sm148817756d6.46.2026.02.16.16.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:46 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v9 3/7] media: i2c: imx355: Support devicetree and power management
Date: Mon, 16 Feb 2026 19:27:34 -0500
Message-ID: <20260217002738.133534-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
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

