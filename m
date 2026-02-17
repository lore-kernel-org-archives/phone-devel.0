Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017D33971D
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330422; cv=none; b=W4Hx2eSAr5icjhULyeaui0soA6ej26WvshemisiUzGF6GCitEYAJp7C7I6B7ga3oVxs5QTbRZg+EiHw7hP1Mbbw1tN+igyp2+3sECBk21xEk0AleFKYw0Rd3xIjADN99+Kxg0LdD0pW3IJz6ty4P7pJP98tFC9I+pmobJbGxn2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330422; c=relaxed/simple;
	bh=YJwAdc9YN+Ork+lkKKTLcj/O0ofn3u7uG2j/EDfwnM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z73Iv1O1dlXIG+LSjc734GX0Rix26QddfBqe8EG5zxb9Kf1+7XaKyW0wKnm+5/jvotLAdkr16ruNLX+EDUOGEapU7JACJtGcKRt7gzxRdONAsIW+Atr6tDfkd4xx1aTDEciav2CLcUIElW/37EgQ0kyz5puApPU6iTDdTeBsq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBjhCn7m; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBjhCn7m"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-797de0727a4so9854307b3.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 04:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771330419; x=1771935219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnctnXD+vW2hwHaBIXjEArJKKlKzrQnCanQjG6cUX0E=;
        b=YBjhCn7mcDBt3F835kH3Nt9ts9UiHcI90dYZIGPVhgqQ8hC8LbV1vxdJi7IfR0ZZE9
         5i9bNkGyJFvTstxhHH7MZywNe4+hpEtLIoOOlmKwZPicyIRqFhtCULCJ5I3KfNSrA/+t
         dUavoZgOZFi0tUb2Dx+9386t/XhKJ8IiIKlXAGc1WAuU/Pm3B/A9hG2Plfh/OH4ot9un
         9r8FB+jislQH918hiVXReIh+T730BI0+FHqJnqjZoI7rNJtsEc2EM2MiSKCN5iPT6+Fl
         +R2w2p0GXVYFSlLgK4BM3+Aqnw08Pz1dNO87h7HhYJRF10CGipam7VpehyLVVHYDMY3A
         nt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771330419; x=1771935219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnctnXD+vW2hwHaBIXjEArJKKlKzrQnCanQjG6cUX0E=;
        b=tMMpghgY4XzhJK8aASfG3ydyoWqRRhVnavB2xrxTFkCbbILBmOHEgb9x5JclpOEee1
         0fRpVidunDOKIePGsnqVX9cPQeLu4b9snN7Tj+sb0AK8d+IOrC5YXRd6sKibOI+r3W3/
         GPfl4nvlx8EOkRFDXqoexRQIFOtEvy6Ckduc3O7ybyA+eCEneQtGrhzFmmrA7UB/iwcX
         4WuskCMCO7F/RIw63TsqLSqEqQFBkl9uPjIjIyt7UW2q4FCIofOL0lCFxCVYs6loeYHk
         6MRgOebXnYnCOqJgLQdAdiVOsQ9nUjb7K9ksUuDGDCnDizhGh3S0rcKtQ6trgBW96cgY
         Iagw==
X-Forwarded-Encrypted: i=1; AJvYcCUbczoo2P+uKvAjQrelqNZnMuXKtPdtKqYUgsG9X05JyF+JwksOW5D8qFFLKhLamMSKKSq6WKmycli30w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJahJDox/5pSAka0CdLj1KeTahU2ZQyUSmxXHQRH3So7dIb5Tf
	cw5CIZsmR9bwAehwZ59WfqBNNW5b9NAgpNtUoBb9x9EN1PTOJiOtiNAM
X-Gm-Gg: AZuq6aJYw8lSoFgnX3UsoJanNv9i51zIWddXm5uZaRdvdB6hbSQUEqRLikqGxOTdK7e
	Mj0ZAbt5Fi1mH5O3hk9c7XNnyKTYIH3hFCKj/YOnIBfkYHnFN4ZW6p7PnFY66cfn3pMhDzG+YPz
	YtIyJwT1UDUG9iwilEXW0lwyyYVTOwcat4xY0NbMaezrUyiqpSB4TI2GqUdl/jCd87gUu+S0jaY
	RrWAZK2KRfyUOYygqfQtwHsJ4pghQzw5EdTSnemg+ClZ43dsw5Jpw5z24D82VjlQax7lkabXUgJ
	+VUBzUyynhzxymDP+RcmhHFTlShlaarXnlQvBRIFg/5pfs5qRGoAqnd/ogoeFwdrVNJp86N7x1+
	xkYDkrMtt/cFIpq3c9cFsi20p1gRdFJHDANnTWVe+7sPMqSBABNVWbGqp/aQ6255VH0YR5amuMk
	5C5V+aPBfXXDBiOt/BlobxuVhmyw==
X-Received: by 2002:a05:690c:318:b0:797:ef49:a48c with SMTP id 00721157ae682-797ef49a9bdmr5077777b3.36.1771330419207;
        Tue, 17 Feb 2026 04:13:39 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c16eb07sm115610727b3.7.2026.02.17.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:13:38 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 17 Feb 2026 14:13:16 +0200
Subject: [PATCH v5 2/2] iio: light: vcnl4000: add support for Capella
 CM36686 and CM36672P
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-cm36686-v5-2-63c2de9709d8@gmail.com>
References: <20260217-cm36686-v5-0-63c2de9709d8@gmail.com>
In-Reply-To: <20260217-cm36686-v5-0-63c2de9709d8@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.3

Add support for Capella's CM36686 and CM36672P sensors. Capella
CM36686 is an ambient light and proximity sensor that is fully
compatible with VCNL4040 and can be used as is.
CM36672P is partially compatible with VCNL4040 - it uses the same
register fields for proximity sensing, but the ambient light registers
are reserved. For CM36672P, we reuse vcnl4040_channels, but remove the
IIO_LIGHT channel and ambient light integration time.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index a36c23813679..5e03c3d8874b 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -185,6 +185,7 @@ static const int vcnl4040_ps_oversampling_ratio[] = {1, 2, 4, 8};
 #define VCNL4000_SLEEP_DELAY_MS	2000 /* before we enter pm_runtime_suspend */
 
 enum vcnl4000_device_ids {
+	CM36672P,
 	VCNL4000,
 	VCNL4010,
 	VCNL4040,
@@ -235,6 +236,8 @@ struct vcnl4000_chip_spec {
 };
 
 static const struct i2c_device_id vcnl4000_id[] = {
+	{ "cm36672p", CM36672P },
+	{ "cm36686", VCNL4040 },
 	{ "vcnl4000", VCNL4000 },
 	{ "vcnl4010", VCNL4010 },
 	{ "vcnl4020", VCNL4010 },
@@ -1842,6 +1845,22 @@ static const struct iio_chan_spec vcnl4040_channels[] = {
 	}
 };
 
+static const struct iio_chan_spec cm36672p_channels[] = {
+	{
+		.type = IIO_PROXIMITY,
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
+			BIT(IIO_CHAN_INFO_INT_TIME) |
+			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
+			BIT(IIO_CHAN_INFO_CALIBBIAS),
+		.info_mask_separate_available = BIT(IIO_CHAN_INFO_INT_TIME) |
+			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
+			BIT(IIO_CHAN_INFO_CALIBBIAS),
+		.ext_info = vcnl4000_ext_info,
+		.event_spec = vcnl4040_event_spec,
+		.num_event_specs = ARRAY_SIZE(vcnl4040_event_spec),
+	},
+};
+
 static const struct iio_info vcnl4000_info = {
 	.read_raw = vcnl4000_read_raw,
 };
@@ -1867,6 +1886,19 @@ static const struct iio_info vcnl4040_info = {
 };
 
 static const struct vcnl4000_chip_spec vcnl4000_chip_spec_cfg[] = {
+	[CM36672P] = {
+		.prod = "CM36672P",
+		.init = vcnl4200_init,
+		.measure_proximity = vcnl4200_measure_proximity,
+		.set_power_state = vcnl4200_set_power_state,
+		.channels = cm36672p_channels,
+		.num_channels = ARRAY_SIZE(cm36672p_channels),
+		.info = &vcnl4040_info,
+		.irq_thread = vcnl4040_irq_thread,
+		.int_reg = VCNL4040_INT_FLAGS,
+		.ps_it_times = &vcnl4040_ps_it_times,
+		.num_ps_it_times = ARRAY_SIZE(vcnl4040_ps_it_times),
+	},
 	[VCNL4000] = {
 		.prod = "VCNL4000",
 		.init = vcnl4000_init,
@@ -2033,6 +2065,15 @@ static int vcnl4000_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id vcnl_4000_of_match[] = {
+	{
+		.compatible = "capella,cm36672p",
+		.data = (void *)CM36672P,
+	},
+	/* Capella CM36686 is fully compatible with Vishay VCNL4040 */
+	{
+		.compatible = "capella,cm36686",
+		.data = (void *)VCNL4040,
+	},
 	{
 		.compatible = "vishay,vcnl4000",
 		.data = (void *)VCNL4000,

-- 
2.53.0

