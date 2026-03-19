Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE47D3D093F
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921559; cv=none; b=C0SudxS4w/sYz4FO4e94Vr0PmsLjmuWryx16rm0J5dXek6np1NQ17ysLB8IeULQaxQjFX1DdDUReLSoWV9ZzMMj13nWaNxQL9ei/vQ9/etpbUIoM9ONsyWhZ7l+RqRpUtsIGqIWDdrC/hroJUJBwqUt3uPfzze84ewhRurdlGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921559; c=relaxed/simple;
	bh=F8JhpNRtISwTJCZ0mFH9huui70rVNKoYVUHt0NiS600=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uV6bqK68EwKFDtS4KyXQ2HoPMi5mQky6B8ic3W3Z2TUh13Ut/xzqoxn7g4iaZXl8B7JvL2ZCysk/pS5SXaMcnOYzunHw9lT+Tbaj0bPL5D2i81g7o9hslA1M/H+aReh08cCBhnnVsiJIFb9vje0s8LAJ2dpmBYd/wIRaxyGDp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7rH3nYs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7rH3nYs"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66732a99928so947763a12.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 04:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921554; x=1774526354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwqEwLydPXTJh37lAhGuKLAvUQ1T9VTG2r0Fov0v/5k=;
        b=M7rH3nYsa/1bYKGY4Vf71pP3ixR4qLr4GhC1P0jTJIjtx5qT/eBaAehYKmQkQpG9eZ
         mSx71J0pmLip0//UK3SM+JCNP0myN2WkeWAIIyDM+x2YwDsybMPOsNzin9I9nln5x3JH
         gCqNDVuhtPNxMJpyxdoPX4GPLjlxX0neoyfVKBBdJoSZrTsWcC+qWQggc8GPqGU0x4Oi
         zGu0Cug4cI2MHvrPqlTOvq5RsjaP1s+ve5agb3g7ksc3chx8JLpeNe9/XSThTO+v63rV
         jcnhnafRbxBpc5ak9DJGUeLTk+ByWl8KXah7ZAmyGCCAZ1KEGmYIePNoDOLH0VOahtnD
         1Alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921554; x=1774526354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NwqEwLydPXTJh37lAhGuKLAvUQ1T9VTG2r0Fov0v/5k=;
        b=Iw9o+SnbY2SQ3eBYT+x1c/CyLOgzY3PYFyqqQDURnguuOdvIUsWw4qQXsNPbGa+qpM
         pbL4Frx8WoTA0/n0NS+M9HBEB5+PZ//8xjE1DdQo65qiKPApzwFN8FyvUzqCV3Z+mKim
         H4wxya15t9SBLNoTcljZto7+x+awayo07oke2vEI2XFqHsgGvK+Cc8I5164qcuxzWWWd
         TwB0XyQFTk1teAKEKuqdN35R8sD4wBWrRrB8goHDawDhk7NtF6KdChrwbQLkEa/SFZR0
         FLwrQqFtnOT1YkoYa5xAlk36ljSc0EO99CO450Man9oy2HpJF3zMhj0bQnWXkKlvZ+T2
         mnmA==
X-Forwarded-Encrypted: i=1; AJvYcCUgnDbZxBbMluZhw8Rz0qYnx9n0cXiL+gwtvmpqk33qSfVcCfkTa3XDYqBlJKk0DY3hiSX8FFBH2+fPyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61VRtkbrhdGDUhMHqRQNMqyIUUBqwaWoCIThUIsXulOWg05KB
	EKSVus7CqiSAVMA7ukJMj9Zh4hnkT5+4Kz03SND2Ix+3lPeaDFfGITM8mNe1e72y
X-Gm-Gg: ATEYQzwjr+gRkXonff55tNR+zVNttkyrgsFu9Nsg9VP+K2FguA2ERPuUusottF4cmmm
	6VGRA/Z6ZwTUBlcRDthyRkDGW/lJzmg5QA4XrY6hB0tI0ntjpMvxYAl/MJlzsTBp0WcZ8Ugvf4V
	lrr6H9g+8j7ciSljI2tNUtvlZ0/uFyxXmevpHBQwv/L+ZGTCEzRbiXRz4hMkGsXVt200tBy3JUi
	lNviztmX+jdiBPlQu4pohmv02fxsySkMMkB5YzA4spKUCl1vN8xza+s0yACl9GZQT43RARk2cB+
	4+i5XC0kj1XVv6H4dyEAFTp1QJLHlGLEG5OezHsfwY7B9MCs2Ub5q1LcHgqx3QF2H3WLSNw6vOE
	ucZjFbHxCsl2AXh1UUN+R6vbZcPuScElI2lwTdUzodfE5kduBlTY74VVlH/yxVr1+mYvf/b/aBd
	sZ5Qt0Cnz5EVME23HiCAllIT8yAA==
X-Received: by 2002:a17:907:3d4a:b0:b96:f329:e66 with SMTP id a640c23a62f3a-b97f4b010b0mr492191266b.51.1773921553701;
        Thu, 19 Mar 2026 04:59:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm461399166b.42.2026.03.19.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:59:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 19 Mar 2026 13:58:43 +0200
Subject: [PATCH v5 5/8] iio: light: vcnl4000: remove error messages for
 trigger and irq
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-vcnl4000-regulators-v5-5-a025d3332805@gmail.com>
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

The error code is available in the log after return. In our case,
attaching a triggered buffer can only fail if we are out of memory, as
no other buffer is being attached. Remove duplicate error messages to
reduce noise in dmesg.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/iio/light/vcnl4000.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
index cd7e6ee42cc5..76aee16d479b 100644
--- a/drivers/iio/light/vcnl4000.c
+++ b/drivers/iio/light/vcnl4000.c
@@ -2033,11 +2033,8 @@ static int vcnl4000_probe(struct i2c_client *client)
 						      NULL,
 						      data->chip_spec->trig_buffer_func,
 						      data->chip_spec->buffer_setup_ops);
-		if (ret < 0) {
-			dev_err(&client->dev,
-				"unable to setup iio triggered buffer\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	if (client->irq && data->chip_spec->irq_thread) {
@@ -2047,10 +2044,8 @@ static int vcnl4000_probe(struct i2c_client *client)
 						IRQF_ONESHOT,
 						"vcnl4000_irq",
 						indio_dev);
-		if (ret < 0) {
-			dev_err(&client->dev, "irq request failed\n");
+		if (ret < 0)
 			return ret;
-		}
 
 		ret = vcnl4010_probe_trigger(indio_dev);
 		if (ret < 0)

-- 
2.53.0

