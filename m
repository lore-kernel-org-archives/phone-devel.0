Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362003D4103
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 16:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025151; cv=none; b=mAKtZCOKdgMfBd99h2bXpZmlrZF7jX7dhvIzxwwgpOgWYzZpjUSGhUvLcqem6xi9HttS6tpXFYkPoQKdhdoq22dXpk90aVUdX/pMkG0gqZC0SxjMHVRgQXTLJz+QXn0bk6KEkV1N8Fc8bAjZBn3J+vNHQOummUMsXt+jkbmQioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025151; c=relaxed/simple;
	bh=o9yuL6PRLokAleeSzTGeuD72GREI4YTgIHEt7F+oLcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iC98n+owoxqSAGXjDppWBtsZBuleakTxPJOW01Y75QEUXTu6ndiWL6MlPf+QUhb3CXxattnTUz1StONNeR2DQZMeei72TtX1Gh4zfm3zpvfpk3CvFyouECm3942njrlyW49FT25xdBtFrHZ2ULaNGSCp0uXZpCS38v/hKKIqIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeW33kT1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeW33kT1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so3469645a12.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025148; x=1774629948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9tF8LrahXLfIcW+pium+UIUX/witzxrg1SajUiru84=;
        b=AeW33kT1roubZ8TdDxaMMszZGe4awa5fx0oQ1VEsE9y+2dCdEEA8c6faqnU1He6Psm
         ngxlm5VOdojvVIGqkhErHR08mzddnZjcTnf66EFU/wOxfNDEuMxWJDl3XsZJYH7B/3Z8
         vthmZQdnaE0YaUZqFqWnnrJaqcEeXBBoM4rgFFyi/C6KnFGPZW6y8uoLMbLbdK8zdFc2
         T4ir5dtRBIj2ay7yzi/X7oVNaUKZyiqg3jBrpBJ9lszua/WYoD2xO4HLSd/6ICcfXS8e
         7CKLvbemsIlUDjbAHXXgSiNET9TAm+VUrGtbudAezzpt8oLcb6qiawcnGbW/DCJdHYDD
         wtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025148; x=1774629948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u9tF8LrahXLfIcW+pium+UIUX/witzxrg1SajUiru84=;
        b=qNj/QM3fB38w52YVIO3X94GYcIZKqsLi7LHW5Cc+STYSJ4FRksGU13tuvYwfC8uclx
         RebegHUSebSfZ/sO4i6IDpXhKX2mdP7tTd8SB7BOkk+FhfSfJTdH323sYs5CG5zMOnmb
         y9Tt5sgLY5gJ20Th3nLlELzGkpX715O0jO83WuXOiYpQmQDQWcJR0enhb9Uhxtgng1bD
         Jw6FGT7K7eT2btiV6ID5a6OI8hMn6wkb29BIF6uKMwyTj7wCPB9jbGLCqH2GdkFABk7E
         c2z2QrqX3MjnpYvxage46xCCcyF5rvBnSP482RL5QporDIj5wun+sfDY5KyxSQuGbVJl
         5Lgw==
X-Forwarded-Encrypted: i=1; AJvYcCXPzbYq1fBbpMYc6B0H/Wv+0el/qAyrEv/3Ayv1NX/f6GdcCPrsjLWtWTaYQ5lVrGprnXMybD2oXxPHOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxojXrRTSNAOko6829fgxOeGxrbOjfS5wDDwPFFkUDCk21VrVxe
	JS0woZy/q4PE4hX8R03eTi3FTns+UNpz+aaMLemF9U9Pu5RM8VsMRTMC
X-Gm-Gg: ATEYQzzPv8aElky9Z0zdCA1vEg9zN41E2pfSRIAqMeXJ8QlkLFebquM9pdeJ0Driq7F
	CZyFqPl35ttlroHITscFjvckC5sEgB0izMpohbJtqHpXFyzzMo1qPzR3u33vGtpJAtxnsDsVykF
	7AaPo1IlV+AQDRT8YS97WQ2z1HpTdjKnI4DmpHniTHUi54RRiluias0lyf4jWqXXzw9s9DQl+Tv
	GYnTuTGpVTshyM1RNgiZd6x1bHTmyuXy46+l+oqhekTJud8WWVfYXChXplS0euZVit+4yN6GuVb
	OMnzy3cURs4b7nxwGBounpFx8A1bG07FvUrcdb6JGMz8v6G+CEb21/Tz7q4sv7NnN00VQdpYMVn
	YbGCbwF6QsSwVBRV7oU/ysMp9QmwHUvtssHyjQMypohxOQ3cNF3g+1307D+90967oJ8qKMXH7tk
	55jSKzZ2NRwh4XSTxqq252Xv+1Pg==
X-Received: by 2002:a17:907:170c:b0:b97:9139:738 with SMTP id a640c23a62f3a-b982f2f0c72mr221017566b.33.1774025148287;
        Fri, 20 Mar 2026 09:45:48 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm176730466b.33.2026.03.20.09.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:45:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 20 Mar 2026 18:45:39 +0200
Subject: [PATCH v6 4/8] iio: light: vcnl4000: replace mutex_init() with
 devm_mutex_init()
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-vcnl4000-regulators-v6-4-0d24d20b1a5b@gmail.com>
References: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
In-Reply-To: <20260320-vcnl4000-regulators-v6-0-0d24d20b1a5b@gmail.com>
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

Replace mutex_init() used across the driver with its device-managed
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

