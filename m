Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F637CD4C
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504407; cv=none; b=UHpG0Ttk0zRTcDCe1nHdEdze4xuQPjcAHpMxkuHYKgcdwu0AePL6gxVIraI4PS+cAQ+kXpf8ep8nWbxVCmv/A1r7yQxxXtBYDcIMIi3slG+dHVufVHOllM9fMq/j4Actd+uwouohWjgXmL1g0k9f8k1rljOFT4AqpUAVEz2WwwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504407; c=relaxed/simple;
	bh=AAYQH8m5hJopiQqgeTngADuMlO+elqyJCsSOeSZcnBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UA/JY0z8RCQh8t6RifJ3Cvhe/1fz2AXRsGLu8SJw3k74YXQOZCwWmLFdC6YS/vpWjelRF5QgQ//UBWdPWj+nwm2ha2OdDBJ/16ZErUYAzMExuqWRW/kDcwWYF8ctRHZbENAWjfKqJy3FC1iLI1D0FUu5rfH9brm0WOIa7BgbOUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGaiKDey; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGaiKDey"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so4359659a12.1
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504404; x=1774109204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztVKqP7Iue8aUh5WW0pabHa7SHe1KuIXZfJfBXrdn9M=;
        b=dGaiKDeyCS/zMpoONAWtHlh6/lm5+lp/RD1B9EeSGZ2u5oRIpW1Iirkmz6zYIloLUs
         /VEQqCH0R4Ju26RpDnC1TS3BAF8DBdY3Q1WBZn2Uc+aCHx1O3h2FCSuD7NOXd8cKJyew
         J7uWG3FghoA8CkNzjwbAEajbKB3PKa6EDxnl9TvygmQ7D3+SB4dAu+1gec9Pp9HuS2em
         3BBpwDEj7DyjxSYc6iuY1TW/JVmo7U/pE/tUCSnHUkzJ/wit9T/7rU8xc4H5q+DmUNWl
         NSDJUXU3GBO1RC28jclfsIoF2DHlcKiXVfRlT2OpoKW5x6xn9oR1sY5RKL7fIDYahpB+
         f2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504404; x=1774109204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ztVKqP7Iue8aUh5WW0pabHa7SHe1KuIXZfJfBXrdn9M=;
        b=GmzIu+dOJvInmCftj+asVgRPPKDgsxGFwrbbD8ieBO62spDB2ha5w9pQG2Xf9FHXSd
         KMVtRzepL4NZaDFpVkgugQ6wITFpgCYzj2L8yqgWGSY61GH3s8E4Zsv3P01x8SWnvAQD
         lrvp1hWDYZxU6z4LTaK0ED1uOK3YJjX3IZ/zWQjRTIULBx7DZlLKmBYe0xV6kFNwbqWr
         vnGe1jKDP9tgDH+jA7jB6YXu9xQoy+g4cet/Xy9eRjH6NvFAueyTslxNComHdCod0YiC
         0Rm7LIIhOPxd1Pa8G0L13WO8oXn6w/+oubUIPnZXfvPVIfQFx/2yRMX748fPjebnLMzI
         X9+w==
X-Forwarded-Encrypted: i=1; AJvYcCU6DMuaXgqt7Hwk3dJD+R+O+8LHoYOPkRphJ9l6pyiW0QjdnU2fkqiF11mH64Qm0n79D+C2pyKzbpe2mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+BXHDXBcKW/o8eLZyTd1VZItIA6aAFfNSaTLakGStFgOo5HuS
	BDr2qYEbJTkgHZs+PBs0mI9E16gTVqNtKS9gLwt/tatfVtoIltnrSJxv
X-Gm-Gg: ATEYQzxnKf0aGq9cOtkftTm/yY3ETXt7qW7Xhd60LC4fFvJUxrjn9emmY43B8eN8dht
	xTwuB2+YziFIhj0oeo8hGaV7UW+mLlwgegbcwGi2ELKDoIpUt6ojwonmelN4TYUQW4XkPqfPczn
	cMoaWID4s9t5f19nmyNfctjf69P18VIY57iUv0dOLXliKdV2mB2Pyg/kzYv6lWaGLXayfTQenC4
	LDL56wWNFHD9OnTOi3Rtq0BHvDRchCtgrGpwbzmt5rMD/ESz2Mdm+fsMfkbMSKf3FuywVCjghe4
	DcMH9byYIUVoqhkF4r4YPf+t+pgFjst4cTC0dSUmgJkINT6cIqMPxHWc+yK4QOiMrY41rMlXIsW
	vxpP4uIXJ9l6zzQ1M944dz/VCys9xmRUvjWpIe7gyuEV3TtLrUg8x3r7SlvdBuOb4VzLa7IpqDu
	UcErmUAxHtdWVD79OHlLXALtdVQg==
X-Received: by 2002:a17:907:746:b0:b97:6384:2317 with SMTP id a640c23a62f3a-b97650e5609mr440832566b.17.1773504404085;
        Sat, 14 Mar 2026 09:06:44 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm151722366b.52.2026.03.14.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:06:43 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 14 Mar 2026 18:06:35 +0200
Subject: [PATCH v3 6/6] iio: light: vcnl4000: use variables for I2C client
 and device instances
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-vcnl4000-regulators-v3-6-3c4a48d30676@gmail.com>
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
In-Reply-To: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

After moving data->client and client->dev into variables of their own,
replace all instances of data->client and client->dev being used in
vcnl4200_init and vcnl4000_probe by the said variables to reduce
clutter.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index c8bb1826b916..9b7cd3f0c8fb 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -362,14 +362,14 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 	int ret, id;
 	u16 regval;
 
-	ret = i2c_smbus_read_word_data(data->client, VCNL4200_DEV_ID);
+	ret = i2c_smbus_read_word_data(client, VCNL4200_DEV_ID);
 	if (ret < 0)
 		return ret;
 
 	id = ret & 0xff;
 
 	if (id != VCNL4200_PROD_ID) {
-		ret = i2c_smbus_read_word_data(data->client, VCNL4040_DEV_ID);
+		ret = i2c_smbus_read_word_data(client, VCNL4040_DEV_ID);
 		if (ret < 0)
 			return ret;
 
@@ -379,7 +379,7 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 			return -ENODEV;
 	}
 
-	dev_dbg(&data->client->dev, "device id 0x%x", id);
+	dev_dbg(dev, "device id 0x%x", id);
 
 	data->rev = (ret >> 8) & 0xf;
 	data->ps_int = 0;
@@ -413,23 +413,23 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 		return ret;
 
 	/* Use 16 bits proximity sensor readings */
-	ret = i2c_smbus_read_word_data(data->client, VCNL4200_PS_CONF1);
+	ret = i2c_smbus_read_word_data(client, VCNL4200_PS_CONF1);
 	if (ret < 0)
 		return ret;
 
 	regval = ret | VCNL4040_PS_CONF2_PS_HD;
-	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF1,
+	ret = i2c_smbus_write_word_data(client, VCNL4200_PS_CONF1,
 					regval);
 	if (ret < 0)
 		return ret;
 
 	/* Align proximity sensor sample rate to 16 bits data width */
-	ret = i2c_smbus_read_word_data(data->client, VCNL4200_PS_CONF3);
+	ret = i2c_smbus_read_word_data(client, VCNL4200_PS_CONF3);
 	if (ret < 0)
 		return ret;
 
 	regval = ret | VCNL4040_CONF3_PS_SAMPLE_16BITS;
-	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF3,
+	ret = i2c_smbus_write_word_data(client, VCNL4200_PS_CONF3,
 					regval);
 	if (ret < 0)
 		return ret;
@@ -1998,7 +1998,7 @@ static int vcnl4000_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
 
@@ -2022,10 +2022,10 @@ static int vcnl4000_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	dev_dbg(&client->dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
+	dev_dbg(dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
 		data->chip_spec->prod, data->rev);
 
-	if (device_property_read_u32(&client->dev, "proximity-near-level",
+	if (device_property_read_u32(dev, "proximity-near-level",
 				     &data->near_level))
 		data->near_level = 0;
 
@@ -2037,7 +2037,7 @@ static int vcnl4000_probe(struct i2c_client *client)
 
 	if (data->chip_spec->trig_buffer_func &&
 	    data->chip_spec->buffer_setup_ops) {
-		ret = devm_iio_triggered_buffer_setup(&client->dev, indio_dev,
+		ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 						      NULL,
 						      data->chip_spec->trig_buffer_func,
 						      data->chip_spec->buffer_setup_ops);
@@ -2046,8 +2046,8 @@ static int vcnl4000_probe(struct i2c_client *client)
 	}
 
 	if (client->irq && data->chip_spec->irq_thread) {
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
-						NULL, data->chip_spec->irq_thread,
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						data->chip_spec->irq_thread,
 						IRQF_TRIGGER_FALLING |
 						IRQF_ONESHOT,
 						"vcnl4000_irq",
@@ -2060,7 +2060,7 @@ static int vcnl4000_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	ret = pm_runtime_set_active(&client->dev);
+	ret = pm_runtime_set_active(dev);
 	if (ret < 0)
 		goto fail_poweroff;
 
@@ -2068,9 +2068,9 @@ static int vcnl4000_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto fail_poweroff;
 
-	pm_runtime_enable(&client->dev);
-	pm_runtime_set_autosuspend_delay(&client->dev, VCNL4000_SLEEP_DELAY_MS);
-	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, VCNL4000_SLEEP_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 
 	return 0;
 fail_poweroff:

-- 
2.53.0

