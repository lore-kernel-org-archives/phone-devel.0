Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB237F743
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773517916; cv=none; b=ZfikKBgrZUYxOIflYYsF9pNesZxPKj+4j9HSZ0b/KmigBChN0a0qmfvgEBeu+vuq0rlzWCNfJSw5xOZfYtQgNf6nYm+HuYJPu8rOPm5ZcG82sVbOtXd2/hK2PfI9FxWuBFqzQa1kzS/2VlU/M6sBPzZQMxLyFsU3dqrtzWX+NF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773517916; c=relaxed/simple;
	bh=PN/ebOVkl3Ch2oEl48DSbiQkNWOJst/IpNNfFU9a8WU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/4PceeI+LGM9urD27Mi9s06rwoFNDHpbuwA5I50Jf9rfECThhSkdHq0Q/oSAT7KjWdUqhEwXdSuxS86uBg6/h+hX1mbRnyEt2LtpYUB96//Pb758xq9F3lh0ubed33THNAy97kZ9G4MYuCqpquUKC+QQaR19rhcqh55Oqu9yVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=flEhqgR4; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="flEhqgR4"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d73e0e0a36so1456137a34.1
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773517912; x=1774122712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8F1aqi6Qy869M29EukxOGNGMVc3+0t8hXdBRfmiktU=;
        b=flEhqgR4mKUaS/olngJFGDWd7v8oKAo/r6t+CEfnMQiKnG5qCpDOL995SiGRCr0zBK
         sKxyTS3Ub3Iv7xo3TC7eHJa/MAR9afA9ED0Tglx2nhiyoXafAS4Cihpk0mccsb35QWo4
         LFfkpEmMu3X1qPnNXkgUvkm1zYqgmvEjWZB9ADQWnXaf49MCtBYJdMCjntroQJ5+83Av
         djvi2uf/U2gZGvAHigYZGPYafgsofKJZ34BsgR+blnB71FYqZNonOWFdpmuhd1IdvxLC
         6JKOTTTUNrwp6H6br5xZcdhMmLBgL+nF5TWXAoHdkzrjRQ01oqtPS6J0Hz5Fj4EO9a9L
         A4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773517912; x=1774122712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8F1aqi6Qy869M29EukxOGNGMVc3+0t8hXdBRfmiktU=;
        b=Nl7HjmyGi5PhOl/qhixzv/AafwtHSYp50uuA3zLOBk65xFOuk8moeXObMCQtvpNi/e
         BqxeLP9GXq/us+RkTC4FT34ytXpGMMLTLHGgfHYzVLWvRifuHMsjl0TW7Pd8Ye9yVnFC
         MFBs7F/zUREWXrd8DwBZa4HVEMXjgDQpJRO0gv8UsigDzkMeHEe2Xzd1vsYIrRiCCh81
         waWY2768eStZ+Q7Gy3iE1L6V7ixWq9MrIgK61RJwAZwxC29x9rGG9ypfWcZclOga5eqH
         WL1gQTw1tvAITCl1IE+/EXEKRp2co+Epdn3C8s7t1c2qMIXFiAnfwXRaaHfAUDHARwY4
         ZE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOiJtXznpPSpXyGKgh+BMgsvcNVHJ1g9VgAvH3ojG0UVeDpwh5J/2012AbFVSX+3wJPfu1c3msvj5xIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJCXVLn2fTRrOCZV2dgfS5lICjk7s/8bZPCUNOynXgxRKz51f
	+zKpi9eUDD2ZEnrSKQjMwBvJD86EKz2r2M21SynijAA9S/DXCW4oqqnWGKwpzpbkq+k=
X-Gm-Gg: ATEYQzxExQTZolESUP0s0oXZUWPhkSVJnofmuItwAVkxXg3CmZLGntQ4OhTEuIJksEh
	0tMZSNVpDvh3556aeb8NE5sWg/kIHJ/TaeFEQoOZpp6W8PDZbk3OSVBXjqtR2CwTWG8n8eUM32q
	YkrOCnZz4Ik44nYtCKazEb4vquBk30Uarjxxqn/iH/0xfPufZEfoAklidbz0Ny5XUddoZVs1IrO
	00bswT6NENBIvefTjDPGNna4MzOilTSSG4lN9P7JqpJxcHAkWhN2EU6z5tfpqKGnc6OEXPAIPtW
	PsVU2lT6ZQo5L42AV1oJY3HpuBE9rre9Aww8cEqZGSxho5LUrxMdSRVP0xReAR3LyOynT/xg+YR
	trk28smt9r4pBziOWOoePqnGxRtUNyyxAdkXoChpjgc0t2czGbzpQriCxCcYivckK7gildBSIE1
	YjtaT5mBu8yK03flLNIDJHbbMleDbFS9kQxnYDu7rFsJXckOVNWoQRBcJQuc42h0mNJRByO/ceO
	A==
X-Received: by 2002:a05:6830:828d:b0:7c7:63b6:89d3 with SMTP id 46e09a7af769-7d782510f72mr5089963a34.19.1773517912188;
        Sat, 14 Mar 2026 12:51:52 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:14a9:db6c:e65a:4287? ([2600:8803:e7e4:500:14a9:db6c:e65a:4287])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76aebc9d3sm9157746a34.24.2026.03.14.12.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 12:51:51 -0700 (PDT)
Message-ID: <cde8cef8-1bfa-47e0-8ebb-6c295f31f497@baylibre.com>
Date: Sat, 14 Mar 2026 14:51:50 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] iio: light: vcnl4000: replace mutex_init with
 devm_mutex_init
To: Erikas Bitovtas <xerikasxx@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
 <20260314-vcnl4000-regulators-v3-3-3c4a48d30676@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260314-vcnl4000-regulators-v3-3-3c4a48d30676@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 11:06 AM, Erikas Bitovtas wrote:
> Replace mutex_init used across driver with its device-managed
> counterpart, so all assigned mutexes get destroyed.
> 

...

> @@ -1985,6 +1993,7 @@ static int vcnl4000_probe(struct i2c_client *client)
>  	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct vcnl4000_data *data;
>  	struct iio_dev *indio_dev;
> +	struct device *dev = &client->dev;

Purely cosmetic, but I would have put this two lines up (right after
*id) to keep assignments and longer lines together.

No need to v4 though, everything else look good.

>  	int ret;
>  
>  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
