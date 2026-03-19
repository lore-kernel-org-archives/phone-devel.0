Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA633D1708
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921565; cv=none; b=jjk3f3lyVXk8yp4kz776C0V9CmaRG+h9M+PlWonoQdE4mGCpGxeuASYSI9+10wuslKRrbAfiwBYDX0mP46eumb6rd2pdEVglJJeqzcPWOiDbvCZvFzhP4CKUiqHgZJuU3DZ2yx/qRaNh35F6k+vqwEUwwoS54ZSL8LUtdXAel9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921565; c=relaxed/simple;
	bh=w5xtoSN57Gl+VyOZOhDTahGIJ0RwHfPPzLNAzvBUd4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GTwirnfymFYotQyd3+P74Oq61H+N3NZsPNRPWAVNJUOvPR0lv+3EP7zmCi7CIDMj+ybewkP9R4wEFZ+Gdu8sac3IN1YBsmdJ6iKsuyfDUqisZe9gDyTvE+7TqE4kFWQQwzVLZaoWcNE+ZepJvVeoW0GM13uuLCAOOXeTZHEbN9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zvu8xG6r; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zvu8xG6r"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b98069e41b0so135354466b.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921556; x=1774526356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0qPqA1xbNhE1Dv/S7BEHSx+8WdubNnnHdrMlRxqcOc=;
        b=Zvu8xG6rcyOuEEd2lpOn5kftwGlhOXPHnSb9o2l+mee9JE4OOS/qZoa76kImD2Fp0G
         kxj2D446KnYb2Sgtow6s5GHVmKzi4ye62m+SaO8t4X2gS2JRl2WyYp2JXLcBAUU4ADxe
         Kutq6A8q8D44EpmqC+Ea5CjE288WYX7q8VOXM7eoUjNVI3xs9/x7FoqxS6hrWgF6lqmH
         Wb6P0Gf+gbsYf5mYU1g8PlI9M2z3cForTawzKAD9fBQ3uD42T8uQGe0w/kTex+NMEhDM
         LCTTfVCo3fNV3/QrGw/nuzo3kpJf0PLc1TA6ZCrW1F27D+cCaiIYrKqNG1I5qXxraPFj
         yGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921556; x=1774526356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j0qPqA1xbNhE1Dv/S7BEHSx+8WdubNnnHdrMlRxqcOc=;
        b=frJ7d6vVTT9yyWDGSdTG3kLD68il1WOBJd9beV6By/NMLLMjNyfoFJQjvgI15US4rD
         i/D39TBJjXOX00fWG9Q7rf5j9+UyykBecBWi+2+EODXq752uiQv7eVcV+SmEHORtZd8i
         BbSnLEiL75h3ELTwv7/pjsxLZe5VAJz3PwBP8NpYrOffBEuT8TmGxMZ6qzG9SRiZVJIa
         Acr5vwawlqZHgEv+TBK0I4/qpXvSS9i7GUXflZSb9NinSPufqCAbt30e5qQ9d49sSmfR
         KTioe/9rPsLmgbuCLSdiosdpQnTNyitLZXvP6DUxvAvWNIE4mJWjrthYgnmEePTP25G+
         h/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCULf8TlTPCPVcu70NpwR7Ko0Clb4PL9pfxtU2Ug8r4Aa4N5hp4wmarg6mq6wvxX0/AqpKfxEe0hvYE+Ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxTM8PlCJVVk9UTWQmr0+zLy5KKv3wWmGD35vQ/ZwgBLEhzTEr
	WpOS2TqVRccTz4eUCz2R5g8/T0W0AWcxOI79Rh2J8rDbTwgLYaQ9Qr7f
X-Gm-Gg: ATEYQzxprPrtwN70C/Hyvlu9DHpoUIa874t9firKQjbxJV2pd18f7+lZjWLixn+STmn
	8jVX1x/GsbAAdkCfHliAodMWl62b8DkIAQEinFBiheDYDaxaCXzO+t+u9/UCPLA/jCXiDbsLUZ1
	MhcmZjAuHA6WdVgUkU4Ne2YZtUdsMsXZVn2DjgLKOAll4t9g63SY//QcnQk7SeQP+WMANQjnW2X
	WMdJLbgul4gu+WfKfWA5P/XwjoDd61cg9vBbkw7UuPXTC2KDSTPGUr6mmJza4nIpDWktkwDdNoC
	6z/TG/1szQ/ZIW7WcTP9lrOTkzqfBAmdohZioKPfI6WXGo+dLmQzB5onxMXIBbX9bLa4lOztUoO
	5JBtmpEcoRVBlGbRtaQpRI/NeN2WUZorVXtV13fuHubPOYq/SFWbfwAXpvgU6K2Sa6QlgM9lchW
	WkG8vfnNvwbNXuqTa2sdH+85Wzcw==
X-Received: by 2002:a17:906:c102:b0:b96:f4f6:2a02 with SMTP id a640c23a62f3a-b980faad336mr197971066b.25.1773921556389;
        Thu, 19 Mar 2026 04:59:16 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm461399166b.42.2026.03.19.04.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:59:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 19 Mar 2026 13:58:45 +0200
Subject: [PATCH v5 7/8] iio: light: vcnl4000: remove redundant check for
 proximity-near-level
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-vcnl4000-regulators-v5-7-a025d3332805@gmail.com>
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

