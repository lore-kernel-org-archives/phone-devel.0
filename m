Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687473D0929
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921559; cv=none; b=Y2AInmIgYC/kW47jxzU56EUE4dHpp4TY2jePuQQcD2dnDJOMNQ8CNLE1VkGBsAAe1fslydkA1o8DLvuqTmf8LL31jdlB7w536ozdK0xhbaJetPDub5J5VlHa+Eh1yhK5n1TP8HdadwKF8KjjKfBSypMwbn0EWo1+/fmw2L/bqdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921559; c=relaxed/simple;
	bh=vP7EEpgruq7jb0BDTrxCYCk5LMVt/Xx+6zryX3dg/1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=myM+1da6jeuZey9DhmY6Gti9iRcJH9xeXGsNZK1exwE+6iTIg19SeMHe/I3HpgPwyS7nM7x/lMmZJK9/sClhoxsvHWoZSSW5hVZjEvKEpOtAGSmaphobNmBHb/8dcmqsw6sPPTpjlu/X3yDtwolDFKoGdzP3CnzvERhoajnBGyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7OQDXqI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7OQDXqI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9813eed77eso100736866b.2
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 04:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921552; x=1774526352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmQLMk8d0z4Tj8kbX0Ny9TubbIjksPecuXhm9eaS99k=;
        b=l7OQDXqIkrquyEl9F9P++NtxrMfAcBxbuN1XXy4/TavPtiQQZz/KQ6Ltr9bdn4scDm
         Y6ASrV7Zf8b2dZsYPVqXSwAIzTkrqKurpGeHR+vHxBHKDEo38DO7WVL05AHkEYP8DxVW
         cgPT3Cm2a0vG4WQ16j7HZhZdVCigCVd/H8JowXiOpwxs8xYTvG9ombgdSx+rWrlmALyY
         S7N320pFRbB7AM39GAoSTMgpSennphYZjQujPsl7AXcu+tjP84HHLLCorEg0Hj3mA3tx
         jLGm7VTuCagDBbCVdRMjme2ymHcHc2+yj6j/fAhEBEDKLgluL6/pXzvhDj7/EJ419dm+
         BQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921552; x=1774526352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kmQLMk8d0z4Tj8kbX0Ny9TubbIjksPecuXhm9eaS99k=;
        b=I76p8q3aZAHkQWKcWjB5xHeyPauIoq61wT0ouIpxUfrS1YBDXMDKtUrrwI1hzTi87Z
         5L+ckgE1q0w8QREzFEGLIbTJj7pEX5CD8ssGAaroOKCRHT/Ib1mJeXXQ6JPmZvmMXI83
         ZL3z+dctOyrrX6phRTw4pTMS/HOIugii664Cd2T93mwXcj3Vv/UiIv/vJCAFuD8ionRn
         7UNLkXISSJ3gOHymyh6jNAWQBYPLjyW8qvZl2gLM3B+zKJ21hX684rMM9vapjOXBwNwi
         iG4vXS0eP/+iR/skyJjL6dZ1iAcoLVGLyUE5f6lI6tJ+tHUoVvlDnMb6ZdkwWf9K6GxR
         Irpg==
X-Forwarded-Encrypted: i=1; AJvYcCUiHcnzG3cm+4I4yZc8t0HKIx1eGBKZdD6bMoTn4BuTk6GWY0uW2woAG98gikueAdkENMabKP8eqys/zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydHulYOgK3EoiHEb5hHn82kbqT1ITwxPEXdPr86avYKmaFHd09
	tQ6B2ff8YlTzqj1Sp7giZJe4t1lw8HLEJkdofx+DH5wzuTZaM7Ar8BqR
X-Gm-Gg: ATEYQzxC0jvinfoQkNo8njxNrATCb2aXCTXh1kfESXIe7qaf4w3PahmMAz7Uwbk/fFT
	T1GAAzmGBY1lat/hODAreY3DIlY2k2QGaaacePmVLTeSa4exhm66LCREbwvAgEhPBQY7MVelJyy
	8zpLfFE4l6jitEq3HHsuDG2HIefuCJnZESa80N3WsTIrVUwreDcLIH8/gkgMRnHUE6M7TYOB+oa
	2yrQ39BWjfdWmMY9B0o6IdN09LnOk/EQ8A7WSLdi3pu4A89/A7wT2E3tSRCd7E2PryNaFPhDcl/
	L+6yVpMKDaUdDIcT/gyWRAk5yhzHjRcWPd3ArFbx0BpfXnvaFF7pQtn/yoCrQ4blEsUZl4Q4sCZ
	oi4xbTCF6qqRaycOueUxyXFiWPt9sdQRgPrFdP9u5qgf5SXyZZx9nOnP+O57Jq9peWNj29+JTq1
	H0aayApCQXRGkX62cVxebi9NUbkA==
X-Received: by 2002:a17:906:1d01:b0:b97:91c0:fc3b with SMTP id a640c23a62f3a-b97f48c1dc4mr394199366b.16.1773921552076;
        Thu, 19 Mar 2026 04:59:12 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm461399166b.42.2026.03.19.04.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:59:11 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 19 Mar 2026 13:58:42 +0200
Subject: [PATCH v5 4/8] iio: light: vcnl4000: replace mutex_init with
 devm_mutex_init
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-vcnl4000-regulators-v5-4-a025d3332805@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

Replace mutex_init used across driver with its device-managed
counterpart, so all assigned mutexes get destroyed.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 287ccd89cfb2..cd7e6ee42cc5 100644
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
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(dev, &data->vcnl4200_ps.lock);
+	if (ret)
+		return ret;
 
 	/* Use 16 bits proximity sensor readings */
 	ret = i2c_smbus_read_word_data(data->client, VCNL4200_PS_CONF1);
@@ -1979,6 +1987,7 @@ static int vcnl4010_probe_trigger(struct iio_dev *indio_dev)
 static int vcnl4000_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	struct device *dev = &client->dev;
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
 	int ret;
@@ -1993,7 +2002,9 @@ static int vcnl4000_probe(struct i2c_client *client)
 	data->id = id->driver_data;
 	data->chip_spec = &vcnl4000_chip_spec_cfg[data->id];
 
-	mutex_init(&data->vcnl4000_lock);
+	ret = devm_mutex_init(dev, &data->vcnl4000_lock);
+	if (ret)
+		return ret;
 
 	ret = data->chip_spec->init(data);
 	if (ret < 0)

-- 
2.53.0

