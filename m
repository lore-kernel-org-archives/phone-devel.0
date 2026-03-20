Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F553DE45A
	for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025155; cv=none; b=aacJyStskFZ3JcfGWmQpboIS7xhJCcoWh5LHgfxVi3L32Reib0fbH5Wqdg5ArJT7rjUe4nYY0o9H+o7g6uzlVi8c51gKpgvgmvjB2oYxpPrM2utB6N1vjrEOH6SAb8jc+rAiLmmXb0+QMyMr2xDNyXUsZPNSjXQrKFgyV2E9OsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025155; c=relaxed/simple;
	bh=w5xtoSN57Gl+VyOZOhDTahGIJ0RwHfPPzLNAzvBUd4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVK3o9q7Rn7qskuSgyZdN9RFdSQmbbAoF9adHO6zJw4N8NQMP1wd3fUYgvT9XNtWfEBQzkxj08IVXexEG1d4kQn8wd4c+DcaIb1cgAkTurtyR2d1Hs1MjKuZAYp1fCktYjlaVvNYpHSlnBdqlRoNznK0f17oRL+ggG7abfl6n4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lc4SFqw3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lc4SFqw3"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9825ba7f9dso203103366b.0
        for <phone-devel@vger.kernel.org>; Fri, 20 Mar 2026 09:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025152; x=1774629952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0qPqA1xbNhE1Dv/S7BEHSx+8WdubNnnHdrMlRxqcOc=;
        b=lc4SFqw3tDDgj3o9HCXTb7+nXRJFpX4ZaiwTkJpTpIP/+Ly0xmWWzSbAZ1Xig3TD4t
         6fz15OCBUoZRTO1YoKS/2eV42poQDniH+6bW49c5eb6C5xcPlSXkNgBEoUVMoqa8GApK
         IZMHdvOCpZT69AgQTztYkQwk5UBqM5umYZMhc2cu8t7bRofWimKcDo56KS/Mz9le7856
         rQB7YsvAfS4T9hQds7rVBP3b5IACItFBDFix2ixAZMMLHygmb3KxgtasvuNh39MbRftT
         9endyul2xwRpjC+2GLPaK2eBgY/F6gr7o5EUtyAtmT56xaCutbn7YPnj9JJi0PhWq/E4
         uH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025152; x=1774629952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0qPqA1xbNhE1Dv/S7BEHSx+8WdubNnnHdrMlRxqcOc=;
        b=MIvUXjUqxHpaBstRTsF8vdU6bue2k/5hn9zLN0sh2n/LIuv7dibElVhGAjdRKCDw5w
         iGcMQnQTd2MsVyY30BqpFqwCpq3nmWcL3L5LxWN6u8Jzx/BfhHRwQrBDR7r+cpJcda3h
         dfvCdJdIYeLZ91NJFh3QvwBUIUWuXTdjeSXUImALAy/O/ci0p+CzvKfjPqg2y4wrcKEG
         BEHNi+zxHCCxPWg2JFYAH7Y+ZHyL41trXuHLvEOU0y7qDKRqq0SHI5qJpGI3ZPpmfn2c
         jkSgFF1wbqCkJwuWyFLU2oF5zEViO8TBENDWCTWLqjpyXzF3Ip1LBD3ckGCGuG859lSF
         tF4w==
X-Forwarded-Encrypted: i=1; AJvYcCXL5gu4M96RfLekHVbn5mnRNXaGhBXTyLEUptbKVexT00RQUMpRBBg0J8snU7LNlMHy31Tl5snk6d3PgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLUhSZeAEwdPk9aFFSVnjwhGcHN8pGCfog30koLHJHmTm91npm
	gXKGFP2ycj0xrz/REAEelCw5E0PLl5wea8mqkt0GpE75/ceWfdcYX4vn
X-Gm-Gg: ATEYQzwUW4yGXNpqaOBV5l8Fe8nH9WC6JF7n9dIgaRkckfWEySMuocpaupGmG0uwlWK
	ZNfEwDWF0usVA6a2s6oBNfE6LB/IGGfuXRabF7t0FwcarCiJee477DOIWtQhreGWp111nWvJyl4
	+EPX9DNFrvGDbpv0K0XmStVrOg352xy4GbvOjsji//0oinTE3DtBiitJytGrr5LlfFLJQSr9sbR
	AFUcuMc+aPN3XtGKjgKxtuFbw182zeKznwKDyX3ChLfzVmByheAiJL1jfixgaI7JYsymXMVYDM9
	/8BksDb5wbEzwzj7iLCWOuX/4haEYGBn8Q0wGakcUQ0ZZVkmOUVIsYkGFLRi4NlEK4vCg7JGEHQ
	qgwra+fhkwYcnfbPjTaT1wtaqnyos+JPdeDjsiTL1LgriMkT7nKyYihucY31JYsLaS/jW5GqzCP
	0/7tLJL3+5zNZnfQDMnYJmMmwdVIP2JTNx1YKU
X-Received: by 2002:a17:906:174f:b0:b98:42de:3700 with SMTP id a640c23a62f3a-b9842de3755mr92361166b.17.1774025151974;
        Fri, 20 Mar 2026 09:45:51 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335f1747sm176730466b.33.2026.03.20.09.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:45:51 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 20 Mar 2026 18:45:42 +0200
Subject: [PATCH v6 7/8] iio: light: vcnl4000: remove redundant check for
 proximity-near-level
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-vcnl4000-regulators-v6-7-0d24d20b1a5b@gmail.com>
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

The data->near_level variable is already assigned 0 during
devm_kzalloc(), therefore checking if the property is present and then
assigning it 0 is redundant. Remove the check for device tree property
and let it fail silently if it is missing or invalid.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index 34b52725aff6..0a4d82679cfe 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -2015,9 +2015,7 @@ static int vcnl4000_probe(struct i2c_client *client)
 	dev_dbg(dev, "%s Ambient light/proximity sensor, Rev: %02x\n",
 		data->chip_spec->prod, data->rev);
 
-	if (device_property_read_u32(&client->dev, "proximity-near-level",
-				     &data->near_level))
-		data->near_level = 0;
+	device_property_read_u32(dev, "proximity-near-level", &data->near_level);
 
 	indio_dev->info = data->chip_spec->info;
 	indio_dev->channels = data->chip_spec->channels;

-- 
2.53.0

