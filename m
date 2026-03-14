Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED43793D4
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504405; cv=none; b=tns9+71/0PazyWNjZ/0GanV2n5lXRxn3OXqDsL0/DMWcWxmLeEVtKEtRhaXmKplG6oeJL/dRO7lOXzpPBOGElwalgm0C2k/aBtbcKi36aMMh3YyhuEemZJlBbbjcrvXi7YqCRXYByyBhYrwdU9K3RgSQciDnZGOpdq5WqEEqEKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504405; c=relaxed/simple;
	bh=j6qWWe6QEp4AZVAT6HIO6TViQIm6aoaS6Zal4S7e85c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdXKM3ws+WhuxaLOPV0xfxfVa//025gLJbPcpBAG5G2tjfboUzxKKxNL65zRqvHlP9tfEDDKTmH7ORz98gec4HRh05BOUW3ec/lXS0wGCn+Dj14e/Zyf/fT6e1OM+jvNDMgrlvGNzK6QLhBoX2lrGGe0vmJBnEgfMT9jZ6TDD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwhUlJB4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwhUlJB4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b955351e0a6so514081166b.3
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504402; x=1774109202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgQ8nZvVLHmAMjTgF6dNW3MLBAIvM4glDSXsOvEDdCg=;
        b=YwhUlJB445tKoZ1CRAnYSeqWBXS+3hEiTngSSs/xWTb3T7+c68p1aulsxcX9mPdXyR
         ctxFO6wv/0+7kx4/I2XnLsONDbwb2sfT95VsaRN2Du9JTfEEnx9jiJ7ZQug4hzxihLYx
         f/grZjcT8kh1qcWDn1wcC+JSzbLTLI+xj36RKbalY//glNcz2yQDDWRF4Z4kQV4bKE15
         ULyciwpr3nokbwnPEQvWngxpZ6gBnWmOJ4/6+cM0kjfSDDg4qPoBNIfEeNJ2V/wgD44Q
         2Nx9UFeeXmiF1dHWNXY3R7uHeYUTJwLuWtwnZmBCYRY+R7OiGLvFeIZIW3AwajUuaAJn
         kaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504402; x=1774109202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgQ8nZvVLHmAMjTgF6dNW3MLBAIvM4glDSXsOvEDdCg=;
        b=Jgql2XT7f2aEDapIyIO7DqOeLEdWInOCOAJgFmOvovgU0tnvIKBjAv7QHdRwjqFtJ/
         luoiAmuxPXmfbUWbMqUGqd6qw5LDn81hiB95JU70xPOPUztP+nMdozGVZTOx+nr33bvR
         4pUQvobrMCWvJfTiogTyxfXw7fxxMYMBazNfhTCjGo/BoBjgjel12hHnzZm0FwHp9JBl
         HB0mdBAvUHX1AQkJjA5/0VALBVhOSM5r+Zq9mo3L2nODZnHbkrKu20tLEROmLTo3Z3I7
         VG2/WeDaUNpcj+g40LaKIA+kDZjUekTmowPhqgayuqYO9/arICxlHJ4y0p9ePaflryyR
         YSLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqRPPKAB0wIHkiaW6fPW66lGLhqeqrsr26to6lH8Gkizhmtd9dQ0osH3uCABxAgIzZuuyTgJnHesR8Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwARlQl7FyPQCEJS4iYEHJEXtVctDM9TyZe4Gkv8K46QnOWuoZV
	Z1SNE844Q07F8Bj33atb/6qfHNn/Ck14/XiSDrMTd8cUrq4Y+DV/I6uF
X-Gm-Gg: ATEYQzyhvoa0raZgIsR8FL7BWwDIBBSoKvuICtJ0xTP/TiR2CtedefVRNoo8VOyZfyn
	BNWL8Xr8x2o1KgQN1Exml8fMheqSoZ/+XZD8cYbiidSQDqZ6kSWNlP7H6s3bZLQvkTfrNoo0O1L
	V5VILWe5eJJtHrW14gi7ZhA3/NEDjpO/MzL+EFt2FlbNSrkH7BQcWlVX+LW6XlfhoZVgAlqXoH/
	3zXvUH9mp43pySfPNGGBPgXHsbgaetNIe/Zk6X3rYFJvKPx22keM3F7GegkJc91tOrdJYXgobZv
	Tv51/aIe41IBIdzDmWDYpSoH5TA35nuFNGMoTj0fSiOstdjONw90ncspFp073I3HBvzia/otI9q
	eu7CP51dOHmZeOpVDBW/IXc4z+eRE67SUKMSfMzaYIG7oswA/la2MhN9+ce+SZK6mRZi6iW8M5U
	cqtt7QbfEWGXc7OJ++FHLkX0zRUw==
X-Received: by 2002:a17:906:e96:b0:b8f:7aa8:d9a4 with SMTP id a640c23a62f3a-b9764fc9c3dmr278758466b.20.1773504401926;
        Sat, 14 Mar 2026 09:06:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm151722366b.52.2026.03.14.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:06:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 14 Mar 2026 18:06:33 +0200
Subject: [PATCH v3 4/6] iio: light: vcnl4000: add support for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-vcnl4000-regulators-v3-4-3c4a48d30676@gmail.com>
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
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Raymond Hackley <raymondhackley@protonmail.com>
X-Mailer: b4 0.14.3

Add supply, I2C and cathode voltage regulators to the sensor and enable
them. This keeps the sensor powered on even after its only supply shared
by another device shuts down.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
Reported-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 drivers/iio/light/vcnl4000.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 0ee307fc5ab7..e501db7249d7 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -24,6 +24,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/units.h>
 
 #include <linux/iio/buffer.h>
@@ -1991,6 +1992,7 @@ static int vcnl4010_probe_trigger(struct iio_dev *indio_dev)
 static int vcnl4000_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const char * const regulator_names[] = { "vdd", "vddio", "vled" };
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
 	struct device *dev = &client->dev;
@@ -2006,6 +2008,12 @@ static int vcnl4000_probe(struct i2c_client *client)
 	data->id = id->driver_data;
 	data->chip_spec = &vcnl4000_chip_spec_cfg[data->id];
 
+	ret = devm_regulator_bulk_get_enable(dev,
+				      ARRAY_SIZE(regulator_names),
+				      regulator_names);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_mutex_init(dev, &data->vcnl4000_lock);
 	if (ret < 0)
 		return ret;

-- 
2.53.0

