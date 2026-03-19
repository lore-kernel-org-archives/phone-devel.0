Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B4E3D1CB0
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921564; cv=none; b=Wfmc3qkU4ysLK52RrHYUwraB8+RldP16ZV0d0U/OVr4JbN8in+hCmYdXNJB938s3X9QrCimAs2ufjH2ErYIJrN3i/RrKfDm8zeVyoWEZToQJUxlGImWbRL1/86bkzGJvxmoxh8KK8zIOLD3YDeVNgxs/4qeksp2oHCn/nWXCDiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921564; c=relaxed/simple;
	bh=TzB0TDBcyModHlhscKkRyhu+DntXkSWYAGvIUGrcGVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Brp4C3lNoOhbICnOxUQIPDytnGOC1AbQeicMGuolLRtXOGzkuR56s7LVOaGDmJTvoG6uRQrrWRTS5GwTFutmmNrI5cTnPerfMUBk+iI4rNOtWwkS4bmZcWP5Wbov6FMa7jFQ6gdEX9esQcsNkJD2AJn68mNSYwRGGXL2RQ4YpmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMkyFP2+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMkyFP2+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b98133bdc4bso74741766b.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921558; x=1774526358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUcQHeprPMeRllf18ooNN99GRIW3qgL3Mo3SFM1oI1s=;
        b=DMkyFP2+RoShdqM5fkCewz3/YopJRFfIKyjB/7aWy43bEWh7HaSr/E5vUqANaoMSuX
         epwv4rj/yKxfFnO5X7ZoNgVkm/eLO5nUnAKPaZolMz/hEvbO9vzUkCqbJcf/5tiFR8xK
         lJNhKfZL3YFeyYEb0R2KAWan3neVPFB5CzaPTHyj3ltIPH0ECgf2aWlbwVlRFe/qCTJf
         /ecaUNRmxeNcWfc7BNh4H7VxZORFDn+yd9o3UEAq7aBhCQsYbvuMm2DQ3mvRS9rU5Fxm
         Ssc08XU5QG2VdaDTCJPv1Ze9w/2da9rPljuW0wFIs2r46kQF5Tjy6YY4xQ7rRaORXjel
         2vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921558; x=1774526358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WUcQHeprPMeRllf18ooNN99GRIW3qgL3Mo3SFM1oI1s=;
        b=ltMIG3XkvNYCzT1FBQAQzURcJT3L2U0V+pcRRNqSv9KJvkvybb6SLqWfD/bgeyvXeN
         EZ/kgTvdrnbUnn3iduvcDMrZAa3j9pE8cgxYGVwjLH2VCYFjHrdxBu/qdTZZSWYMe7vl
         xjLh6L9YF1AFMBZb73gmZSY9QhmBlILDY9N2MEX+biiNbbMyUFt45eDjUgMqXUGoc/Y8
         CYK0mB8eVbNB1r2XE6R0SDgvYqdU+yR70Ad9MNnpeOkVzIdlD0nVR40SJRufhUMA7DSB
         b27BQQqIZkpbiGAdAHblmfGJulCMV+n7/ZUhQ/7DE/aPw+KTPMfpftt+Ajbx8KH+gPxJ
         af8w==
X-Forwarded-Encrypted: i=1; AJvYcCUPoUJ7FURNwwdCf0WwNEjxre16zP/mQdKPQ5daOiNJxSOaVAIbuQJ9IyEy2237G4xSMddeJt/CLWomeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbz7esNSTkDXXzfIqXl/1P52u161PvP3p1WNO/7JsfS9fDWS10
	WxhLLK4YbziagQ0xeEH016ItM619idU3vK/x55D8d0ddb568p+NgOsDm
X-Gm-Gg: ATEYQzzaB+33Z5RPVseGsVEAky6wBDsjI2SRpMUTBlr54z7IRpILq3IrrWLPeSOikaX
	pZTE+0v3aU6Cb6sfDhaVIVL1wagQMd/kcfegHHrxge69zGaazin6jUlKp1DWq/VEU0hI/Y3LWL4
	xWWvlUfzLweOXQxwscD4DzbjwTkqiGjmyD4hR2e723WkyqYtMhfe4OQj/sjwx6+v11WLPOGmBpz
	AtLD9hKVO5HEo0s6mPQrWmM3xh5YQS+CX610NV0s3DcGjZAPJu1heVeUQX2jmk6ChrPbjKCEzqN
	TqkeDrNnUWIQayHEOBoqxWdH65R/tlHVogxQkgSIJIZuCog/02pO5BfqQAiUmpr9Euu4lD7q9+j
	qeJmjfcPCZtUp09ik7GFu6xrqpHdkR0cleyyDhanxqd7tDpQSfJOydHGOxEqN6MJd6hV2SGPHc2
	Ogs/icluEb8TuoHtAsUf3xI5ZRHA==
X-Received: by 2002:a17:907:806:b0:b97:a9ac:5e05 with SMTP id a640c23a62f3a-b97f4a700e4mr524920666b.35.1773921557711;
        Thu, 19 Mar 2026 04:59:17 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm461399166b.42.2026.03.19.04.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:59:17 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 19 Mar 2026 13:58:46 +0200
Subject: [PATCH v5 8/8] iio: light: vcnl4000: add support for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-vcnl4000-regulators-v5-8-a025d3332805@gmail.com>
References: <20260319-vcnl4000-regulators-v5-0-a025d3332805@gmail.com>
In-Reply-To: <20260319-vcnl4000-regulators-v5-0-a025d3332805@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Raymond Hackley <raymondhackley@protonmail.com>
X-Mailer: b4 0.14.3

Add supply, I2C and cathode voltage regulators to the sensor and enable
them. This keeps the sensor powered on even after its only supply shared
by another device shuts down.

Reported-by: Raymond Hackley <raymondhackley@protonmail.com>
Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 0a4d82679cfe..9650dbc41f2b 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/units.h>
 
 #include <linux/iio/buffer.h>
@@ -1985,6 +1986,7 @@ static int vcnl4010_probe_trigger(struct iio_dev *indio_dev)
 static int vcnl4000_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const char * const regulator_names[] = { "vdd", "vio", "vled" };
 	struct device *dev = &client->dev;
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
@@ -2000,6 +2002,11 @@ static int vcnl4000_probe(struct i2c_client *client)
 	data->id = id->driver_data;
 	data->chip_spec = &vcnl4000_chip_spec_cfg[data->id];
 
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(regulator_names),
+					     regulator_names);
+	if (ret)
+		return ret;
+
 	ret = devm_mutex_init(dev, &data->vcnl4000_lock);
 	if (ret)
 		return ret;

-- 
2.53.0

