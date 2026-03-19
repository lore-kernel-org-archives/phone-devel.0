Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815273CE4BD
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921556; cv=none; b=HX4beXV93XUSRHfSvxuD+alUXdJbVVHABmyGjVuczr0EZoL3sPblH22g534l+hRnzA7tk/7900VYLy+mhFHpFaBkjRE8fH6gEIbSKvfFrGQv7uoo59q/Pe58bMYXSmHva9BS0spA4UD7V6s9t0aSuJTlg8ZNLYL7jHzj1KonW+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921556; c=relaxed/simple;
	bh=fwyYVczkGGhNbbtuDw6wb0iPQK79Hav8hEBxFnyoihs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZoMk5Kl3J9xPXGY6EXCLVzQne07gpNCFLijhD1+Ww081+vPwrgMo5ZApojYWl4R1SU75Ha3N7BMRAgDqI6dYeL1VUEY++GGciL9Awdv2agYbPrHKBIZyr3461TDlVOEzEPfcxDfYIc/B6bWik9CwYPTbfEBpftV8fFYPL6BnmEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJ+p+LcP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJ+p+LcP"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so99655166b.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921551; x=1774526351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5lDxPgHMLUWf4KOAgcF/BaGDb9kL4QT6S8GOy/ie+w=;
        b=KJ+p+LcPAg6rX4yzoY8TJmHJ6WFt4qPQuZi50EsAg4tC6I/tiap+lBopao4J5I0hBB
         30HNCZoDi35A/yyPYWSqXkgdGXHccs+Sp06tub5I0Wh2Z9ZpFKHa6/Ichi5NFJKL9aFl
         Tv50VE1zLX1tPmY8jVcsXRZ5/YhCVqIkxUgfGnTHfYhXgNLb9WnehyeKBqiCWyyc6Elb
         uTajEnR85h8uJXZeDYaGo1EapgZZSSl/6DRmkscE2NTPclDG0ZEouL6vr8SXfC3q0C6f
         HjNwttD4NXBmWYdCzKz9rmfRvMyRYVLCwvUxNE1AfoWOBEulgm7frtrZtKJAy2ea6P1j
         bEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921551; x=1774526351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5lDxPgHMLUWf4KOAgcF/BaGDb9kL4QT6S8GOy/ie+w=;
        b=FvnRGKV4BmhnkTWJqgmSgu0QCLN8M90YSK4vp+zQ/tbnQnYYKcU6fbLZyEHvk6n2LW
         HI/r2miYDLBVccnvgoCB4b2sIPrCLnfaSreu3TNaQG1Rz/i39F8lffpSX3FuLoFjRAg3
         3+cORDH6aUpEQoo1UcQwy0QwGYb4J3ST8CPNwDoxE43GXS5n2bRNSQwajebSxJZ3Qi8o
         +FdCSl02GlxLhMK+2rRJ5o3EIcGXa3UEtARCs2E4qDnZnc+hWaymBbt8/c1dKTLQkZ+h
         nbizJGYuksYq+DuawXzfsNRHi2coDsC21cPI+eEQ0y0IZ3373jTVyNXyQK9hk5jZhs3+
         SX0A==
X-Forwarded-Encrypted: i=1; AJvYcCXx7iTCj1SQZ5bJVMAlrHiKDj8Q1bbOs8Qt7ztd8Ei7YhiieZbxmbPLHoXrYdPsQtlARUmW8Yb49JfwiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfTcxS9sszBTp+PRQdnefBKbAM36NSJXKd6eITalY5BGr9Ayd
	Uci6HRXNGJyenMkYgPZ9JfOvxwaXNysSxWgeRSskfxpHH4mQxW1mnnee
X-Gm-Gg: ATEYQzzaVnXBgEEdJTWOKSe9LThkfdQxrVPhm41xswkmBWx+72O/E13g1yW+ckm5qR/
	+DfCse33tYsQGwbTynaGMRimpjKDwzthSa0PwxbdOVnyhpmNjmM4O+I08w9G0eQvRu9spFUpA5L
	WW8QcPY0LzDATb3ezNd5lWdIDpC0pbd+RBRoe3jd47arsCtCWziTEasjs7c/ZP8u5cQ70GaSOfo
	Xw8w5OY0qwtRql3hbWUI8Vrc/oFYB+q4H5qzUMVfcoL5ewwWRWwvIdeVcnn8icxEaTGrcKUZDWj
	Olgl6Fjkx7pbkFusxfy6I2kiGpMQmkTrJ2XaU4MJOXk2RSgefd2FNpSfXOOIqcoQnyDoQqCPmzc
	UDgMnIYdKvXAJX7X2DYAgqcgnZ2IHMr+L/Gy4I/oRfV6tx/iF0SoIF0lOUH36ZeR72+LvXD9FrC
	4fJv2s102cgjaNjappBTB4r7RxNw==
X-Received: by 2002:a17:907:869f:b0:b93:89cd:2bbc with SMTP id a640c23a62f3a-b97f4b83175mr487536366b.56.1773921550571;
        Thu, 19 Mar 2026 04:59:10 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm461399166b.42.2026.03.19.04.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:59:10 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 19 Mar 2026 13:58:41 +0200
Subject: [PATCH v5 3/8] iio: light: vcnl4000: move power enablement from
 init to probe
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-vcnl4000-regulators-v5-3-a025d3332805@gmail.com>
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

Given both vcnl4000_init and vcnl4200_init end with
dev->chip_spec->set_power_state(), they can be called once from the
probe to enable the sensors. Move the set_power_state function from init
and call it after init function in probe.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 939ff2d65105..287ccd89cfb2 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -280,7 +280,7 @@ static int vcnl4000_init(struct vcnl4000_data *data)
 	data->rev = ret & 0xf;
 	data->al_scale = 250000;
 
-	return data->chip_spec->set_power_state(data, true);
+	return 0;
 };
 
 static ssize_t vcnl4000_write_als_enable(struct vcnl4000_data *data, bool en)
@@ -425,10 +425,6 @@ static int vcnl4200_init(struct vcnl4000_data *data)
 	if (ret < 0)
 		return ret;
 
-	ret = data->chip_spec->set_power_state(data, true);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 };
 
@@ -2003,6 +1999,10 @@ static int vcnl4000_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = data->chip_spec->set_power_state(data, true);
+	if (ret)
+		return ret;
+
 	dev_dbg(&client->dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
 		data->chip_spec->prod, data->rev);
 

-- 
2.53.0

