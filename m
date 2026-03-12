Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE36399362
	for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 11:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316404; cv=none; b=kqYESjd/jpgMshhsYj1f/kHiQ36f+/etOJAyhlGsPuwyuvW8klmgX9lrdQYt5zfquRz6+PVwebzPyO7atEE1UfnBfqqkiXBgspYCaBvEE798cSSdE4s4ucyZDWcZZ+y1higs/IT5Ra6bH7hf80ilCwjHDOjegqupHWn2dFHwWNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316404; c=relaxed/simple;
	bh=8Xyy00oxH9BoglqKEOMhdKaA9OWY9AsQ82hA9RGRF9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoJuws6qbZzpdmPyE6U7u3okfcYTYyfPson8BNZVOB1BegCGk4S+bXnsy+0W+9KaDHjbSSJWtiVTt1ypmK6JAJrl3LarZXOYOZ40E/o51Cgg4ojgESaWuaQ/FxRgxGOgNON+HtxwQ31FTwsuCM0HVsO+viZqBnxJg3ieeDOeyOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OT+8NL6Q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OT+8NL6Q"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so4853095e9.0
        for <phone-devel@vger.kernel.org>; Thu, 12 Mar 2026 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316401; x=1773921201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksNpMcFOkdRuvwTL39BI4yY5vtgJD4Unsj/0RB7GtmA=;
        b=OT+8NL6Q+xa9qHCGj2CVJkyOoECqJ1v9JHMe8rCzCj5LCZih+hJlyYbntbXByED7nE
         C//0CInB9fYLGmnx12w+C1dSKVGW8/0XzJ4vb5dO8c2XilB4SV6C3J9pvWXRJvQJsXgk
         SaDoyC68C7wOAbLbDfXQ+GrlZUP5y/kqvRqI3q8yFlnD1KZ0ZfaVspztCJyPGXUfKzR8
         MWt+cQFFEFCkZg5txBi45OKQMhbSyUTuW9kthysNYCiZZFVbZsX5mtsC5TcbccJY0Pod
         bDo0viXRzkYjnmQBNchN6r/yQrqNdR/fyka2UrAadBl4zMvZ5eh6t8urKVPn0X2XWZFQ
         A41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316401; x=1773921201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ksNpMcFOkdRuvwTL39BI4yY5vtgJD4Unsj/0RB7GtmA=;
        b=R2WhqOIDcV9ZzioRA444+wtSrKrx9UdMsMzEhAM0nOPtjKIsGrGR9qUdKNMr7NKPdi
         maakIt+J6eD7HjSgBKu6hxtSZaHLx9yN40IMutlRNwqqVe3YBPo8hGQu5ml+x5Lg8i1l
         UDYDMkG5GyC2ZXX0hU5K+bfoptTpwOfaSp/u33pX4O+QM6MoxI6oLRAn5j6rwJkp8Kye
         IWtt+TMnrXbERv/It2TaDu9HXJ+FObQhXP+lRViQfLi3K0IjXVv+jjbLJmOmwCMppWNd
         nyGT+fsTJUjGMLeS8oeVSC8KDjKvG7VsEj/Dctw6C0x2seoLd7PnFUUHKZoqr8+M2yPF
         oesg==
X-Forwarded-Encrypted: i=1; AJvYcCUpyF9OvBq/sR8mhKP9yYx+mJq+MgW4UvAsJMbQ2kwkpMw3WvCLs7j/n2/qfV5cJfci980D7VQ2oYElfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UR6qZOP3mg5Xkefdmeiecdgz+76+PXa6M4O3CN0f/0HTQa97
	zSCJjmttme2ODQqDVoT78k7ar/mjqqQynZfT2A15yDlOiggs8PxaY4sU
X-Gm-Gg: ATEYQzzU+VRg9/ik3WUR5NtNhyb3L6HP0z+YFjf1abODC0/3Ufuiyr0Zbf4oYoWM4yP
	bvOwVShHvE6JFAhntPEgX+YXZiY1satfhC5ulZmQ4f93sClHVLzN14mYvg2dZNY6Pg8hO9OAXbK
	zW9gZhxlRNDRnM2682sYOHySycTJznrg/ntv+TeFkuv9uTXr565LOKRzm6UICMU2HUX7L8O5YZZ
	FD28j/c0egqfRHOI28ZuLY3dVghJ7SMjGnlCiAEZzGHFfovf87oXP2XCCPVz8gVxWnM9hyZkhxt
	iYbND/nRqcwXJZAHPETty1QgaHmKxwSiT+0Xhl/09AfVgy+bSZMbDvgdvvdoca0iBA/Yk9OOwy6
	hE76lkE0u/3b/bgeHLbp3HZ8yOcXjbk24+XxtI4NPtso3ZIY7GvuIn/jPTicuJLAQ7w7hy1ZrJF
	S8uGfTZeuTIhRBehtN6n3keN12tQ==
X-Received: by 2002:a05:600c:630f:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4854b0c7c1cmr116758785e9.13.1773316401185;
        Thu, 12 Mar 2026 04:53:21 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7044960f8f.31.2026.03.12.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:53:20 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Mar 2026 13:53:13 +0200
Subject: [PATCH v2 2/3] iio: light: vcnl4000: add support for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-vcnl4000-regulators-v2-2-2bdebbcbb58a@gmail.com>
References: <20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com>
In-Reply-To: <20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com>
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
This bug was reported outside of LKML, so no Closes: tag can be
attached.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
Reported-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 drivers/iio/light/vcnl4000.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 5e03c3d8874b..04bde498aec4 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -18,12 +18,13 @@
  */
 
 #include <linux/bitfield.h>
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/err.h>
 #include <linux/delay.h>
-#include <linux/pm_runtime.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/units.h>
 
 #include <linux/iio/buffer.h>
@@ -1983,6 +1984,7 @@ static int vcnl4010_probe_trigger(struct iio_dev *indio_dev)
 static int vcnl4000_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const char * const regulator_names[] = { "vdd", "vddio", "vled" };
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
 	int ret;
@@ -1997,6 +1999,12 @@ static int vcnl4000_probe(struct i2c_client *client)
 	data->id = id->driver_data;
 	data->chip_spec = &vcnl4000_chip_spec_cfg[data->id];
 
+	ret = devm_regulator_bulk_get_enable(&client->dev,
+				      ARRAY_SIZE(regulator_names),
+				      regulator_names);
+	if (ret < 0)
+		return ret;
+
 	mutex_init(&data->vcnl4000_lock);
 
 	ret = data->chip_spec->init(data);

-- 
2.53.0

