Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A73D524A
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681603; cv=none; b=ukI/Cx0CDwxjz4uecqiU7CgaIffZ+sU2DmySAyriqdDVdfT1kOdmPLlsFFBcOp4zFeDDNYtF0n/PCrzviiaeGy8+AglSk9/S1iw/DXxaYrfOaWpTzWeEWtY5Fzac40uNSYESm3xfa4K0PAxKnLga/Xg+JoQ/JKJt9JuFKbsAs6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681603; c=relaxed/simple;
	bh=IU0IBscarTUHstHmwSwIa08PL60ws1VZKbiLKVlW0Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TM6y01JE4h2LjzM38k03aGjmKHbc35dJ4x7fCNGnk4bCQZkfm8cRU3Xx4oKy0Ycpb7Z14NrksVfTuzEga8UScVPmmSZ2yjVXAGdjcU0+RtY4bn6ptWs5UPZRDdGgM2mnzxcKiDt+M2cTSRIb72RAeKbWfDP/E6zKfdDgVY12tak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goVsI22c; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goVsI22c"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9358bc9c50so597559866b.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773681599; x=1774286399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvZUSKnnGPiJWJPl2Ub4VP/4FdncxUtageJMqGG/QlU=;
        b=goVsI22cRBccBY1QhKM3ZgHopz2avwnvc6FgW70gB9AewxC9933tQbDjq4q/p7JGkV
         Aku/W6wDs+iJcapBKHozLHDIqFCLneLT+W0sQuf1GhPYEaJbeyX8wy1ZqXVU4pp14v8R
         vzwSsww5144oJi38W/n0xjg/2J5/nuHsrVw7DLplJdQ+ujCfTBc4mFBc6421iO6elFI/
         D7O/1U28rKrit68DA981T1xPM78M/AR228laQcKIoXPqhg2ahSyCWnbQDC3QzBEbc+jJ
         KEHLadNU2MuHr4XlFN8aF56wQBxvNqhXzX0xkmqGCnHEpB7M9IDN1S3WbvcBStvDlS/b
         fuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681599; x=1774286399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LvZUSKnnGPiJWJPl2Ub4VP/4FdncxUtageJMqGG/QlU=;
        b=PTe3ybP0OzMdyCdgYNyftVbSWGD56il5FweULCWowPnPYvBKnpX/2p18yRUJSry72O
         SBI3TX+SjFfLkVgZA8hoz8vjLnEymYmB52zxUp54+mGzHQmrItRjFBe8gJEdkilfcmaD
         2Gu8JPZmWs++ldvKU55kLssFD1ZFi2cbIqJZMh0SgQ1ZCGVRB3P9nFhB3sD1OfmH+Sk5
         nRLop8Eyg++UBgVfQKqs7NMaByjzHdz3efUX5yPGURnvNB+3v6lonVgsnvFPRLxUjQIe
         pbnM6ZeaHp3F/XDzKdBLpAZLWfbWkzf8bPn+dc1qDODqar6rd4EC8jxHfHkNwKhobqfI
         e3qA==
X-Forwarded-Encrypted: i=1; AJvYcCUETmS4OeAoBiBOm2a5tMs2ou+VYx7GvfUNUVJjyDb3wZzQE0dK5L99erPWnBB1dEsmLlMSiqg+QEdbdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBuR8CXTd1NHFF7uCUW0iM7ZtNv1h7fxgKC+oFbCx+5XwKb6K
	a324JavdJs76X77Ec7t9Z1SYgdnzUiOJV0lqSeNcLBMd7Imw/oc+d7y6
X-Gm-Gg: ATEYQzx2Dh1wf6Ly2nGdufjgSJrskJzQgWss+0bYZrEhTrhJmegzuZ1Q8m+u3wqZCYn
	/TVVa0RcCAkKCzaaYLlg6pP7tqtd5OBuppVHyjqYY1wo4k3HzAxLiIvuXAKeQk8xegBETq2C1Vn
	H3+T50hgUz5TC4+7TrJKTDcV2Ztr8ReNYr5C5IuaKCA1nm/If9JD6h+GmcS9cMijFPEw/QTo16S
	IdBlTR9w5KRT+s92fEAtzzFB8hZn7G1m12ZJYmKkSBtOkmmgOY4/dk/rNHIy0NGlL4oJ34ENdtc
	o/7JmOYdSUhUteGeMOmmuQOj97l/DGGt7cYAfqLutFNWalrZ+dICYAPE5U5MyX1W1sbgo/zureO
	dJvDtch/u1rZWNUuKLFpL1cvrLdfVKEdEBRP8VJpb3gGmE9JhyKKCQRu/HnA9Gheb0TbmWgqmVO
	IdrMDF0saVao+yHF2yvRhp6aRkxw==
X-Received: by 2002:a17:907:d2e1:b0:b93:56a4:d6bc with SMTP id a640c23a62f3a-b976537e217mr764917466b.49.1773681599374;
        Mon, 16 Mar 2026 10:19:59 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97846174cfsm505940266b.22.2026.03.16.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:19:59 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 16 Mar 2026 19:19:51 +0200
Subject: [PATCH v4 7/7] iio: light: vcnl4000: add support for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-vcnl4000-regulators-v4-7-854fc2eaf54b@gmail.com>
References: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
In-Reply-To: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
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
index 0a4d82679cfe..5d1408aca562 100644
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
+	const char * const regulator_names[] = { "vdd", "vddio", "vled" };
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

