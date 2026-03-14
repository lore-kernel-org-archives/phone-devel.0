Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860FD3783C3
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504404; cv=none; b=VOk3aBeFQxHbbqpSJ1myrQEkiOyOeO3yqx4hQ1G3Fdu7FBkrYOr4qrQKr/7hNiR/b2PcH0XkE3UsOerMlJbS3Mhhw8B8sAQM3qG7wEoDZyB3KZObV7+FdH5vbaYcsVfanzBr04dCcLUMtOqB6R9CJ50sux5E3VjWVo0Dt1tET4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504404; c=relaxed/simple;
	bh=3QQmY5CvKjA1E5rLrX7dDBxYJh7qOARmrpAafvS7J+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9RhQXsl8xA1K3CVhw5JpgAhwA+IzZsqWvo8rl+Xx5Hcr+mLknPsR33HBsFDg+Yp5UVtcLBlVClzunn6cmbQndNE34kJOsiFn/SttuVH4QUFj6l8zQAcZ8/NpXUq6Cfdq1YsASlhn+CbiHXa60kG8Wnd2HXZT8yv72mK7BPQf3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Db0+Hzbg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Db0+Hzbg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b979d16dd0cso37420766b.1
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 09:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504401; x=1774109201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jgo0ap3z9r3Z/5/BkWKWT8DoiYsa3x1eda5HahP1HP4=;
        b=Db0+HzbgF5GmjcmoHiXDGdO1My9I5q8mAL5FCQvV2Jd3BVIOVbLSiFOcfpFyU2yzYw
         mo8H2DQOoLvr6rrjQjReAHmE9FAzMJm5ox9zv2goWBEc1W8DvzIGJYiBnTEu2M0Cz5h3
         ZJMV0ox8iXPBV193iDFW9Mju7rck5JZzIUQ5f/iX5An7GNiatM9Ml76t+SeU3CVTZHrq
         81kzhcQfIIrQxRacSjoehq6d5X3f879xNRumQtMK9m/2dPaDvn81qT+hiuwLXUGSifaI
         bR+3KF0pdr3Ws2rXvkK/22Wvw3VsYlhldy0S+cmpcNvyuKrXKm74a48YFh0IbDkxXkew
         PlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504401; x=1774109201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jgo0ap3z9r3Z/5/BkWKWT8DoiYsa3x1eda5HahP1HP4=;
        b=Mb+NGDB34UhAK4o8CdTMwCNaSazWCEECj7K02VRIbighdLzQQY/mWfXR/sZQ01P3+K
         RFZFXUqDbf+40ESqQ1pC2GQ+pTQm7b/OtKcA7GZrcwIPAJEQSvmXmENCdtUBy1Mr8gGz
         OhZ8W0XMzOrwzqoYcOlDKZLHtQbHjT0tbDn+4J2fAmOSYX/ZkoVNvm1fyVtCmgDgIOYd
         5HpD3XBf6vy759ssPx0XWKiab905m5JY7R34ZiT/vElZfDvfWd7XEb1xyD33b1CzMh71
         HZOhCNcs47nJIDLgIHvA5uvzaQWQmIjaB07LAHyVFa8vgxaPl1TKon3x9TUHhtonKfrm
         g28g==
X-Forwarded-Encrypted: i=1; AJvYcCWvBB1WHplX/3pauCKV910YUaTJLEYZNlqtAQklkxeQXqJyFKimN1mwy46YPTM+eC/Go33zS6V5730Exw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAPplRJzt7ToB8HwcJkB3v/mPk4eZbNvDJh/T4NA0kRtcPnaoH
	+Bts0G4Q2L3ZsR9wDawi0ZDNl9c+G0mMv7zeypZoO5+pMFkLC3MdyB+O
X-Gm-Gg: ATEYQzx/vDsKAH1AglyAipK5ayaCQsdRkCzdFD38Lu2OFcouxlDIdevAVe7DdVMxB6W
	623/CVvkx693/6nuwYSOFCGw3AWaHBikeJ6iRSpv6OrnGgCf7/QU7gotpV8d3JeCcoM7KgsN6R+
	kDply1T/WtdWB6Xhu3jRxMVfbss/yK4etmtV32Nks4mD3rEwnIB5ht1g3WqRrTCMm9JLVOEpYyo
	8aquiiZkCax2hk4aDQj98WxIjF7HN55EwuhkSJ5CWKsgUPACGdnWp/9MpNwwRiqsdGmYLdvRx6T
	xDgJr6pFpXLiPUNA3akXon/F45CjXUJ2ThcCPnlbFxGcXO377YGjt47K6m97DkI/IXU01/FlQU8
	uTIfw4c2RxjHAfUTKOHymhuGXtNPgCheEdXpzMCVINLybXYaaj+K5ofO4CZX6GulAQ6u++nIX9s
	eBmJxGHRlHK2wg84jpmDyBH3FeMQ==
X-Received: by 2002:a17:906:dc90:b0:b97:6a80:38b6 with SMTP id a640c23a62f3a-b976a803ab3mr374400466b.13.1773504400837;
        Sat, 14 Mar 2026 09:06:40 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm151722366b.52.2026.03.14.09.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:06:40 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 14 Mar 2026 18:06:32 +0200
Subject: [PATCH v3 3/6] iio: light: vcnl4000: replace mutex_init with
 devm_mutex_init
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-vcnl4000-regulators-v3-3-3c4a48d30676@gmail.com>
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

Replace mutex_init used across driver with its device-managed
counterpart, so all assigned mutexes get destroyed.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 939ff2d65105..0ee307fc5ab7 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -356,6 +356,8 @@ static int vcnl4200_set_power_state(struct vcnl4000_data *data, bool on)
 
 static int vcnl4200_init(struct vcnl4000_data *data)
 {
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
 	int ret, id;
 	u16 regval;
 
@@ -400,8 +402,14 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 	}
 	data->al_scale = data->chip_spec->ulux_step;
 	data->ps_scale = 16;
-	mutex_init(&data->vcnl4200_al.lock);
-	mutex_init(&data->vcnl4200_ps.lock);
+
+	ret = devm_mutex_init(dev, &data->vcnl4200_al.lock);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_mutex_init(dev, &data->vcnl4200_ps.lock);
+	if (ret < 0)
+		return ret;
 
 	/* Use 16 bits proximity sensor readings */
 	ret = i2c_smbus_read_word_data(data->client, VCNL4200_PS_CONF1);
@@ -1985,6 +1993,7 @@ static int vcnl4000_probe(struct i2c_client *client)
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
+	struct device *dev = &client->dev;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
@@ -1997,7 +2006,9 @@ static int vcnl4000_probe(struct i2c_client *client)
 	data->id = id->driver_data;
 	data->chip_spec = &vcnl4000_chip_spec_cfg[data->id];
 
-	mutex_init(&data->vcnl4000_lock);
+	ret = devm_mutex_init(dev, &data->vcnl4000_lock);
+	if (ret < 0)
+		return ret;
 
 	ret = data->chip_spec->init(data);
 	if (ret < 0)

-- 
2.53.0

