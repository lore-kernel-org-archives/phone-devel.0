Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053812F9D98
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756409; cv=none; b=ckXHmLEkeplj7Acdbw0qCSS3WP3L0Jeu5+mf+DzkqN0bjAhiikeAkbO3Ywh6OBPiWvSnUogzZCm03ns0FpMcYNJKT1fNDu2E3aNdEcLEmobARfTItIc7PWQwUsFWZ5LYLWyEK9axbj2+0h15MUMyS5NVrI4JORqP3FUM1/70WzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756409; c=relaxed/simple;
	bh=L2xsjNTQ2sKBAoSEbdRhmHvgPTTi44GQ14ajC31jI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=moljeKD4adx3RtCxcgSgWNgcRdL/qU2/cb3SDecxCFtfa89CfVufFWqwCvzomGg1pzWKPTWAmGB4PQEVtEL99xLtsB3bFSDLZbMgN1LDKQLyOyqxn9+SD+9hRAAB4MCknQ6mrlvTGLpvUFSLyAn5RKEB+azHcXu+XA9Lexc90A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDO0fcyc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDO0fcyc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso2243975e9.1
        for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 12:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770756406; x=1771361206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUZ/YRPT1sN8gt3KA41XFNZVcdYG5u6xhlqAIrhH5jc=;
        b=QDO0fcycCir1m/MKpzkiZSleQV357ZqE+Lh7Q6Uu/5+R5P7rA6bWXTC4w28ZcGFOPT
         vY63c9xb5+YZL2KvMtD0z1ePE04X7YrqFhBpBCE1L+v+ULv9MMa8Ll32bdmG61qYmBO1
         YudVtxFvodGbguCEjdIug9Dz4wzFBq+/3qPgyGBIqAL1pjHROM268d6S5tJ1swZ9AIO2
         CvquMaAq4Wk66MoxwEcRlpD0jZiPShZ44cBGkjgay4IqGdu5WCBwNMGXoNMnnXq2qXwW
         691ryol9zXuTIfZ0bZKgaRBQepJUKj/2z4YqQVmMhhlt36UlPNPsai5f5ul5RZhyiKcr
         T1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770756406; x=1771361206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LUZ/YRPT1sN8gt3KA41XFNZVcdYG5u6xhlqAIrhH5jc=;
        b=oB/kEXCvp9qpxqQ9lFxJmQCKtCP3EqWmXKqKcJ3N1Vwxqd6bFP+DYHOvf+bIc6FyT3
         R+Ib3yHgf1giT9yCKGRCm5HId6Wkx6dZjgSBDRZF6QaWvYYDQIUIe0zSE8MKS9vm1DIR
         phEdRSi7hWvixYzNuzuXwEuJR4+rYvdoguUf6EtdOB0Xpf7YVS6+JpSB0C99d/PScUEB
         19q5zX5jORBOIm75WsU5db/QqsD44iPz6Q+idCLgwE6qrUUnSal8sW2zrv//b1r+LlcP
         tRuFg9Q6mG5aoN2qFHhXYgIs/HHLQijP6uhSz6b7HEzx+todPbQ9C9W6E29bNYwde12r
         I0cw==
X-Forwarded-Encrypted: i=1; AJvYcCWKsooS1eEjXciQIrW2/k3MvePPk+cvTEHDh6S4yzgJ9f9N5Xc8+8bhNAVL2G30VrXZA4oCsslHwaLtCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfFIdsW2Tw2UA98j2nC7KfL2kYqbMafkOCkHi/neSNLmF1Py/m
	35Zv+Gmc9wR3RNuosPEc6PnqbqhMrZeTPT6X9Tjrx0oe9JxHMAnBjEjA
X-Gm-Gg: AZuq6aKAjn/YEaOS8KsFtqFFiZPwORuC+Ys3AXGd4zTv3XFoHO99J7ScA42HJD8tND9
	CfkWK4z17s9PxmUngSRLTjgEEnIEd4UxUlIcgYqwCB7riYmaUPvlI4wlbuc/0LSPCX8EH2SHPIS
	jEq4MnTZt82voK3xzsGXJXFwYXZL3518+3Hev+rChhMewwwri4p5XUWrWwywATP5rsPocpfVJAx
	lbEs2xNmeFFbnw8DyQzNQ9aYXRMcYlYjdA1J+gelUQrzJ2ianDf4c/la6L6QKNzGIzBpNtOwKms
	Bx7SGzVL1BdKvI53QDiWRfoF5c9LB1WZ0dGyv7QebUUTpOqQsNtIHd1H42+DyHHR6k/4G1+eI0W
	36bXQ/ypB377q1MeWKV2Mp8Rkn0tB8cmms8jSKhN8X2dOp/Cm+hunxTgEWFEVjJhz+AL4Q2/zKp
	cpkJw6U8VPfwjOhnVJ1wh8RJaLDg==
X-Received: by 2002:a05:600c:820c:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-4835054f3f4mr58429895e9.18.1770756406345;
        Tue, 10 Feb 2026 12:46:46 -0800 (PST)
Received: from [192.168.8.10] ([2a00:f502:160:28bc:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7d6f3esm71451965e9.9.2026.02.10.12.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 12:46:45 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 10 Feb 2026 22:46:11 +0200
Subject: [PATCH 2/2] iio: light: vcnl4000: add support for Capella CM36686
 and CM36672P
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-cm36686-v1-2-aef68dd46ad4@gmail.com>
References: <20260210-cm36686-v1-0-aef68dd46ad4@gmail.com>
In-Reply-To: <20260210-cm36686-v1-0-aef68dd46ad4@gmail.com>
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

Add support for Capella's CM36686 and CM36672P sensors. Capella
CM36686 is an ambient light and proximity sensor that is fully
compatible with VCNL4040 and can be used as is. For CM36672P, which is
a proximity-only sensor, also remove the IIO_LIGHT channel.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index a36c23813679..97dd930d57f6 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -185,6 +185,7 @@ static const int vcnl4040_ps_oversampling_ratio[] = {1, 2, 4, 8};
 #define VCNL4000_SLEEP_DELAY_MS	2000 /* before we enter pm_runtime_suspend */
 
 enum vcnl4000_device_ids {
+	CM36672P,
 	VCNL4000,
 	VCNL4010,
 	VCNL4040,
@@ -240,6 +241,8 @@ static const struct i2c_device_id vcnl4000_id[] = {
 	{ "vcnl4020", VCNL4010 },
 	{ "vcnl4040", VCNL4040 },
 	{ "vcnl4200", VCNL4200 },
+	{ "cm36672p", CM36672P },
+	{ "cm36686", VCNL4040 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vcnl4000_id);
@@ -1842,6 +1845,22 @@ static const struct iio_chan_spec vcnl4040_channels[] = {
 	}
 };
 
+static const struct iio_chan_spec cm36672p_channels[] = {
+	{
+		.type = IIO_PROXIMITY,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+			BIT(IIO_CHAN_INFO_INT_TIME) |
+			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
+			BIT(IIO_CHAN_INFO_CALIBBIAS),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_INT_TIME) |
+			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
+			BIT(IIO_CHAN_INFO_CALIBBIAS),
+		.ext_info = vcnl4000_ext_info,
+		.event_spec = vcnl4040_event_spec,
+		.num_event_specs = ARRAY_SIZE(vcnl4040_event_spec),
+	}
+};
+
 static const struct iio_info vcnl4000_info = {
 	.read_raw = vcnl4000_read_raw,
 };
@@ -1867,6 +1886,19 @@ static const struct iio_info vcnl4040_info = {
 };
 
 static const struct vcnl4000_chip_spec vcnl4000_chip_spec_cfg[] = {
+	[CM36672P] = {
+		.prod = "CM36672P",
+		.init = vcnl4200_init,
+		.measure_proximity = vcnl4200_measure_proximity,
+		.set_power_state = vcnl4200_set_power_state,
+		.channels = cm36672p_channels,
+		.num_channels = ARRAY_SIZE(cm36672p_channels),
+		.info = &vcnl4040_info,
+		.irq_thread = vcnl4040_irq_thread,
+		.int_reg = VCNL4040_INT_FLAGS,
+		.ps_it_times = &vcnl4040_ps_it_times,
+		.num_ps_it_times = ARRAY_SIZE(vcnl4040_ps_it_times),
+	},
 	[VCNL4000] = {
 		.prod = "VCNL4000",
 		.init = vcnl4000_init,
@@ -2053,6 +2085,14 @@ static const struct of_device_id vcnl_4000_of_match[] = {
 		.compatible = "vishay,vcnl4200",
 		.data = (void *)VCNL4200,
 	},
+	{
+		.compatible = "capella,cm36672p",
+		.data = (void *)CM36672P,
+	},
+	{
+		.compatible = "capella,cm36686",
+		.data = (void *)VCNL4040,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, vcnl_4000_of_match);

-- 
2.53.0

