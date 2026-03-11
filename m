Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B683DDDD3
	for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 11:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229107; cv=none; b=JpixatuQhIvtUB7sYDD5oZQ2fqNgyy4/zht34pyYApkBZfJVHxYKP+/b67H3U5svVBMn6eCN06SR6E26676M5OIfmcJosFY3xMiAGpOi/VCgxBTlQD4wKP/d8dz/Tz2RJuj7G9zxqFayVWDoA7JXu0Y6tgvg2y/vbgRFaCgFrYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229107; c=relaxed/simple;
	bh=vIOc3szKuAs6MKztBvppxGhHIOg85470ENNPXOdUN/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rO7B2BrXvMPePYc+TUb0I0AmMlpBV84yaxU7WwqyhYGxfaOCXCMmBTM4oqvLsYNeGscwcZtxXY5rNzdl0gp/apwwa0oWxWngk2wKBnARM+dPAIJd9ygiN298tTX6b56gS8hD6Z57/ZjOryyRYqQkuUl8l8c2D+irSX2AE6QajmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr6q6dl2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr6q6dl2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso5839811f8f.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Mar 2026 04:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773229105; x=1773833905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojRYufuVUErs9SrvfS/o2JtWS0LCRbBp7UX0FlqvdXA=;
        b=Nr6q6dl2Gzb3DS2/0VgsT30voL/Kdw1sTIzZx6Y78rR98arrtmvNH6JuEwygihyMDl
         pfIfyMNMCPng+Ocgy78lfbH55ziqcfHm9jURe2CfZ/Td5VD6gP/AwaqaffHhrl9QmtZG
         RLcvCZtWibmLTDWfqfg8xXU+nP2F2rD1wkDicb8QjhuZ2rq83ieyFopAJzfsLmmttL+R
         sXao+dUuzRv82h1ccxz+9hnpuXULDqfne2R4aUVDuhJOU1NAMBAv9/ZOK3aaqIuTNwnK
         Ixgv7JPOuMkVl/JVu9C4hV9/Y1qP3x3lnbJU/iKSENgRtLPfWCoQ9D8QJk3dX4X3rNtg
         5OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773229105; x=1773833905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ojRYufuVUErs9SrvfS/o2JtWS0LCRbBp7UX0FlqvdXA=;
        b=HAI8SIHWTEMEFmXEh2mVhYQLMGxPtPzMLwzTQG7gTlc5sbDRSTJVVkxiMBDM66F9dz
         bp128BXYSawVf46CPdPIWAoZjyNj3+FKmB/O6OgBSWP04SY1C63eSKymHsrD4aqKIN9Y
         aedL2otmf5yguWpD5xjurC1JA7xMlRg4EokfwROuefBgfjnV22x5d1NcOda1sXZ6xpDh
         93g6XpZ9aDHLfmyBw4CdO/cPHhLOw9VYqmwbCpVgLaJftOWEH7R45IQ3U2/ojJNNAlxi
         O6zYMFz1u++bT03fNyVBvPfAAuR/qtUK69tZZN5Nu1XaXvj13VcY52O88+tzZlcR626E
         og1w==
X-Forwarded-Encrypted: i=1; AJvYcCVvyn//PTRDjFPFzo1W0GvWR3ZZtjvLWqc/B1Obuo8nNashwl8j+VTGOiEx23Dwpu6PF12PNRhDfn1c7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YydvCtKTTbRrw4AbI6Qk2OQz75KA6/gRxpw7jrnUCxj7I0yd+y6
	cdTldjNws76zbIlRvLrrZse1+Tp+GlrBp54WZqUBZ6cz/V2+P+ZcjvNsVxEDN2yA
X-Gm-Gg: ATEYQzxcXhveTEqKeZtZHcOKjfxknDbVFHprYWnPzQYiLTSn1A1Ynatqx7jv+lWQcic
	KChHVycrCmQdnsdb3lytqk7scyo9FEdwrF4T1oMcmPDfoPKMCg07Q/5xbqgiyd4cDhyfIiDsakW
	T6oz1EhGuWI2mJoPTZ8UJeh9ltZtmYOyaejGP95FGc/VPKZARJ0CLqraqJSERYE2Qk0DQvnLffK
	e/iAaykAYUMjXnbWhDKHO9ee6JU22fVHF4CCHL5KvsVewlIleoieufi27s4U1gG66xgcll+tK2c
	yIx96aI1IEVNFS5MRLLZvC0wJ8c/Bujm6BkNgrZHAjd8dfA7wHeonq4IW0UDLS+X5VupRMz12ti
	SpRklupkLfmtOtlOZ0d275Lg3mLD3UncnJv9L3GEpK4UGN/4l3NhgOQm63+Yw7AowXnSolNZh06
	+mB0mGenczOMQersLMnpPrJn8ogw==
X-Received: by 2002:a05:600c:4693:b0:485:3f17:410 with SMTP id 5b1f17b1804b1-4854b100db9mr33547225e9.16.1773229104383;
        Wed, 11 Mar 2026 04:38:24 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm188681855e9.9.2026.03.11.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:38:24 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 11 Mar 2026 13:38:03 +0200
Subject: [PATCH 2/2] iio: light: vcnl4000: add regulator support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-vcnl4000-regulators-v1-2-66b6038ce563@gmail.com>
References: <20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com>
In-Reply-To: <20260311-vcnl4000-regulators-v1-0-66b6038ce563@gmail.com>
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
index 5e03c3d8874b..967589d5f246 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -17,6 +17,8 @@
  *   interrupts (VCNL4040, VCNL4200)
  */
 
+#include "linux/array_size.h"
+#include "linux/regulator/consumer.h"
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
@@ -1983,6 +1985,7 @@ static int vcnl4010_probe_trigger(struct iio_dev *indio_dev)
 static int vcnl4000_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const char * const regulator_names[] = { "vdd", "vddio", "vled" };
 	struct vcnl4000_data *data;
 	struct iio_dev *indio_dev;
 	int ret;
@@ -1998,6 +2001,11 @@ static int vcnl4000_probe(struct i2c_client *client)
 	data->chip_spec = &vcnl4000_chip_spec_cfg[data->id];
 
 	mutex_init(&data->vcnl4000_lock);
+	ret = devm_regulator_bulk_get_enable(&client->dev,
+				      ARRAY_SIZE(regulator_names),
+				      regulator_names);
+	if (ret < 0)
+		return ret;
 
 	ret = data->chip_spec->init(data);
 	if (ret < 0)

-- 
2.53.0

