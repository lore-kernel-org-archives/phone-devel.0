Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F03E120A
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025157; cv=none; b=QOyRFqCYhkxqotreRL58zNA7LW1GKpXprFzhqWbiuPt44UkFDro58fPjEHOlhOZNADPBjFUnI+mUL4iSsAoOHZBOFBHdCoBV1dh0XKzYm4spu6+U2VFyazbGnqd946JJ7NT6zYMuXUJ4QJYhBIv7xd0QcLdlsUAlTpnzRekm3SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025157; c=relaxed/simple;
	bh=TzB0TDBcyModHlhscKkRyhu+DntXkSWYAGvIUGrcGVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFt5dOZmAbYixgzH+g1iePbJzf1nMuUqu1qFXx6kY51/8zVFK64SrdW6fqXLfJ97RK1zRdF9ogJ5JOOt6oOw3OoUMeoEKL0M89T1nCwxoSiW9Qq7BvzvaCtNkxkQDGi2jK4T30eFtKOmXhjs+bQCQO217wZ9StEhxwTba6qI1d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlUWndON; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlUWndON"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b980785a0bfso333293966b.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 09:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025153; x=1774629953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUcQHeprPMeRllf18ooNN99GRIW3qgL3Mo3SFM1oI1s=;
        b=YlUWndONzOoH252UuKR4mPrWecWzZbY3hEXU3k4sXXZk6zyzicZPwNbhM3fvPZO0ER
         t0qt0VnOpFRqKPjMxftLTD+UEwncaZjI3m938uV1P9wiDmQv5+cY0V9rhR9cGTUPyRwy
         ei7C6/i/Sng9dWcvH9ASMfBkRjMllw3TKyVYAbrtVzHGhWXsCk904zNxfkQz9r7zB/fd
         aVd5Olcm/wAWqAD8EL0FYaERCfN9IVBGQVBdS+wzUwFXpIUar/a/xz8mdtUFBpbR4v5r
         xATi+IGhyt96biURW19ijTc2SaDiZp/MdSwjIgHcBbaEo+1peQoynkzXiv7OFwto8C2R
         V//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025153; x=1774629953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WUcQHeprPMeRllf18ooNN99GRIW3qgL3Mo3SFM1oI1s=;
        b=g/gM+We4RjomMOD/FzyqEUM9iyPM+P4nQbKlnLQIodcrvWmLfdxi9gofHMf89n3Z94
         t53jBMa2K0X4fUrGgBiTrnA4Hjz9wtfTSOjkGDn8iIlVFKDpTVPSDq5NWQ5vhUINGbfb
         RIG/yOeLDTwMq+j2lNvrEv+j8bLXlalLTDuA0N5kUnQKQBzRZRg09taV4THSigYE6j/o
         Tg/gTFeUBsNUAt/RDK9VWJYrbhzM36bUN3wClRtdOf09dOkd3rN8nvAAFDLceOLdtDzb
         Ks/iZNg5w3PHzaxc46srWBWzdmvPhg/l9WGG1BY9m7venQhplA3cwBFpphdWYmAz/qzd
         KdbA==
X-Forwarded-Encrypted: i=1; AJvYcCU3viaJQ/3SlbI4CXyOc74YJ86K4t1W7rMv+TT1TCOU2tAGkD5B+FNhSXu7c5sGU31EOcdtc5c4LbpPow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKubRr7QRMq3YucF1rvzwumnEVVcr4rzbk6784jaOBUGJj5omC
	n/7d+Y16eblaF43fLcpmvuq25581xFJZ9HZt3Kt+v2kagPAPJRKVzV9JDhP5xRt3
X-Gm-Gg: ATEYQzzKXSiNVNs1O4TWkWyqp9wvNAO9MeDHpBDhFc2PTxqPkcXFbvAkCI2uMQDocsf
	h6cAf17lrWMlfO9urGppH2yzaqOPbMDZrv/FUFJlBip/J57oH44kZihfTfAXlgO5w0g/YAJyf8v
	X63c0BY030qx9hjZ/mgZFGl71cVKKmE7nB360k9ueBHCpOG2STBqW6Nj7ZOn8bm2CpvkE7N7xna
	fxRqTGOqI7iJEOGqjRY2dJBLuuJD7qSpQUXdYx42NLRh/mpwF0lIz19LU++eEJAAk5dBI1FHXQP
	2oSuvLNSDBbgLXlAsSfEdxIOMEXdJSvBI2+KY6cTh0y/09yGrxqXHB/1nCfk/I4Megv+vMBSnY/
	0vu8vaxs82IFmepPxOxWFmnPBuMEd7ytViibgpT6Znuye6mJK886UQ8/k8kDyA4BJazjpRURMu5
	VQh9bYp1LOgkRUMfvI6YJ4O7VwShaeeJIUnLYD
X-Received: by 2002:a17:906:2092:b0:b96:eb74:3152 with SMTP id a640c23a62f3a-b982f21d50dmr180531966b.22.1774025153243;
        Fri, 20 Mar 2026 09:45:53 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm176730466b.33.2026.03.20.09.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:45:52 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 20 Mar 2026 18:45:43 +0200
Subject: [PATCH v6 8/8] iio: light: vcnl4000: add support for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-vcnl4000-regulators-v6-8-0d24d20b1a5b@gmail.com>
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

