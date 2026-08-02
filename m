Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF396242D6C
	for <phone-devel@vger.kernel.org>; Sun,  2 Aug 2026 22:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709051; cv=none; b=nlecvc+1EDVAID5OtxSAGIZf11pwA6s+WsO8N5jJqINaAhm3gQoq3bDio/ZL+4C62ufNb/hCphtAVRaIFMKUeXhdTFAnIo1P8/tNE3Baq7Yq46MPnXF2erT79BkdE6DqQcZoCEi9Gl0CDn73NR/aSimMGQ+CUJCVmbN7NuZD4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709051; c=relaxed/simple;
	bh=T8GIVGVx3IVGy3cz7RX/iIVlyqRH0fdXuqZLWkXg95I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5qKK8cJBc9vnnvjF/w39yoqBm4VaEw9H63GCLJHn8FPALNvJ8DG0m/BrEwH2NB33IEgKpftc9SWLPXEzGJUjvASpVuooUk967n/f8t1vjBUf0yFvtWLy7LYQ/RcUbEaV32t/tdnObQVdIJZ6vJ5K9tWFIpU+OeBBA4mkJ3X91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=l30D97X0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="l30D97X0"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so6472885e9.2
        for <phone-devel@vger.kernel.org>; Sun, 02 Aug 2026 15:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709048; x=1786313848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bsPGvzNC3Iop4WsfghniduLra8GHqGeExlE9Ii45fI=;
        b=l30D97X0haxplDJA1LQczHII77xXxIut2oUbt5aPYMTZ+cNYgj5AD3f6h+CjF2kS9M
         ME5VilM82USaF0Kc7kgaPRVwy+IhJgbLylvhiBu3k7s5SQss20MZqTGXwIcsKNrtfe9r
         tOfESoOpFErqibVvLhQZQi+5gWmFpA3roEh1D4kCxlk38fvV5zXevDQiPI+i4dCxTCRh
         +s97HbuKcFi3JLXCeVDWyNsYtLc8Y1kS6IBOX2ucWxzuvw0Bi5YYR+yYf2hYvOXZXjqn
         LfMe0R3KlIVeilGv2nFVxr3JF4IOapSkEL4VuIt2vAeo0WDpjEAKKQ0SAb9hqpf899bx
         uiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709048; x=1786313848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bsPGvzNC3Iop4WsfghniduLra8GHqGeExlE9Ii45fI=;
        b=Pol+Pqf4r5q9lHfPya+fDPuLDfR35li82yZjw3wI5ShdosLHi/HVdYEu+9iYuYfF9S
         K8XIW6IxvmDcXSilqLMcKkZ9i+Xv8ddZ3hSmv7zwfPLo9dKH5QoEyrQZX1c5pozANAwx
         KnnOTIOvTFDyB7dz65Ug5sL1BXKayD+8+WMzt/UblwoliRfVYtTBC1JOsqF3T7SPSaFd
         j/QixfDndA08+xWm6t4Bz94qFa/dM2jflyjcHDKn5zg1uRMraCBJZqusGnmzzdNo+CMd
         pEzfeJ3+z2QU1lqbko/z+q2gtmMSE1bbEnCwHfcyS9uqGLQZrtjKlCKUtUvYhSnAzH1M
         ZKJQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8MccRpW43iT6WygBmOUG3t3gm/U1vQ42ZrBwWjCaEwplFY4HIVGTWe+CA3sgR0hlGt2Sxy85pmeO+uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2TKDCkQJcKHJGLZnVq6LRb/ThTnN1XphZuJVVWCB9b0iSXD50
	fCGvj5PhGboCWlduMrkSYY/TnOsL+gQkWPZSlYngSb6VR/ah4EOBjt9T3MQU+5R3Nc0=
X-Gm-Gg: AR+sD12wO2+1CAo8aUHdlndUwO9MwvsM8X0M3Y3COYDpfisJsjXXf4WmKAlEkf7MDL5
	JSaoMeWpX/T93GAUlv9fUStVO07+GbN4ughwphr0BES9ggImoVwmrgTbhKvuaUGzY1BRfckzd0Y
	pswaUJRGWnZJwANsWsKY6J6FliWFQj/3XnsXAVEwgYdb/3rPFXBALfZl3N0GheHULKPvCCKKe/P
	ajNHYhoXh0D5HdtTib36VNUBl3eMjVkum0FY1VEFahQ6GW46w7apu72oYpU9r1j8YIqrn/RFrGG
	0dOrZNkf4rrtkYsp+Da3u4OgM4aeUekbSoa1CaEr/K5y/+L3PT5cf8q+lMKoA7ByROq5Pf6nmU/
	qzzRM7Oqn/eD6Z85RgakdTEep9H32J+ESI+q7nhIMbWwuTFWCZSEazzeQGAgvqIMHstxYKQN8lG
	lZo+O0JrKVQaOsqP/Bf+rON3rMkCDlu70yHnpFc4GRuWQnK8u4QqP3vyXIVaeUX+S2jA==
X-Received: by 2002:a7b:cd93:0:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4980c65ed1bmr126447945e9.16.1785709047703;
        Sun, 02 Aug 2026 15:17:27 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49807b5f0c3sm155072855e9.5.2026.08.02.15.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:17:26 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:17:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Heidelberg <david@ixit.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] ASoC: codecs: tfa98xx: add driver for TFA2
 amplifiers
Message-ID: <am_BahJARF9z0P0u@monoceros>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-2-4dd55cdd658a@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eissgc2t76naakqg"
Content-Disposition: inline
In-Reply-To: <20260802-tfa98xx-upstream-v1-2-4dd55cdd658a@ixit.cz>


--eissgc2t76naakqg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC 2/3] ASoC: codecs: tfa98xx: add driver for TFA2
 amplifiers
MIME-Version: 1.0

Hello,

On Sun, Aug 02, 2026 at 02:42:41PM +0200, David Heidelberg wrote:
> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>, that is going away soon.
Also <linux/i2c.h> already provides i2c_device_id and of_device_id
(ie. the two structures that used to be defined in
<linux/mod_devicetable.h> that you're using), so just drop the #include
for <mod_devicetable.h>.

> [...]
> +static const struct i2c_device_id tfa98xx_i2c_id[] = {
> +	{ "tfa9894", (kernel_ulong_t)&tfa9894_chip },

Please make this

	{ .name = "tfa9894", .driver_data = (kernel_ulong_t)&tfa9894_chip },

Best regards
Uwe

--eissgc2t76naakqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvwfEACgkQj4D7WH0S
/k5ofAf/fcXOQAhsDuQI1vXZjfYD+Nu2PG5sMkw/QbLri499oQfMbAfRG0JWATEF
QlWrFmVUB03381JLDXyXWtkO5evnjkldLr3bqGY7QevsfpxmOHDV9zLomJjfAqyL
RmIcbr5btKIh2FZJRZslqHYoKiG7SeNZJLyxeYU4lW8vZcohMMRHlPGSCEC7RoNI
sJdx+JMXR+ZHBOuwOrObZDxREbyQwdSnxD1gEEwmXEcpb0rZUWVIEZKXNekbV2XN
izdCJ/P/vwPVNl7yrZLjlzfD6t2AFmYBYIq4kLKM1vrAd8gxMcxwTQH+XKnFNaWC
RZQ+MsjqlG8Lw4wj970ztO4ky/yXFQ==
=/KIq
-----END PGP SIGNATURE-----

--eissgc2t76naakqg--
