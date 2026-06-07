Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9852356BE
	for <phone-devel@vger.kernel.org>; Sun,  7 Jun 2026 14:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780841985; cv=none; b=c20+gIzsF/KBFJypcO0mOTE9dCvoBG/bFdwfpR6rb4eNe2m+NvQnX/s9qlNoEYRjF61d5AajCJIxlWgdx4lvanK8Z3J5Wuj7U3iGycqqMZBkUQtkizreaLHKMDsgGPCxPssnhPU1566AHB+Kkthw/m7MOczlJXxECmiqaSMakfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780841985; c=relaxed/simple;
	bh=NR+DQBvQwShztSKjQQGmlzSCNsn0o36fqH265tpUDo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aPTFM7Ewz7ByHb4RjPaQnxFSRvBsKLItYLHj5EPixORwTX/vMf6eP1Vqy8mxooxWOOBm3foFNYjvbA5Cu/V3LpMoMjL04K1TiOi/GrESqVC7WD8mIMjaXtNjIlyZsIIh6Ls7UVoWPGRGSmt2AL4Sd9cHROayo0Rzv6r0S1omo6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDzlBLVJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDzlBLVJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso29388965e9.0
        for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 07:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780841983; x=1781446783; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EqnoCYSVmAs4yJkpYfyvmNPY6El36uKrPh+QUWUB0nc=;
        b=VDzlBLVJ0+3X5kghjLOXxLJMQMPVCLU5p1tU6KIr5ncZeupct6P4APBnnZi8IZ9w9Q
         MsMCUBOG9ybb6BJpW1HZ8MPwqEiB3bWjWpJv7QoJNlGnZWdjY8q2PuW+oza8nrC57ywk
         GI4oCZjQeVGU0cGYYa12PTNMZ7PnMqP5oQ5SaI/a+Kr99G/WCl46l1m2I6OhxjKCJIu8
         IcCYE7+wA9tTcm0sEDE0e5hWvDGCYfApQjunApml4MEFBM0jcF3PrZEFQm4ccTnPHv0d
         72wcKPpgtykLkECvbpJtO6asHr6gAqc9fgMthKr/k9ZbQ/RLBEHMaxpEIEYkCRMQILOp
         N58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780841983; x=1781446783;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqnoCYSVmAs4yJkpYfyvmNPY6El36uKrPh+QUWUB0nc=;
        b=l+mP5beWMQdzn+eLLePy2Wmjn1fruESEp/SrSoEggG8JEAZ4AC3ZzF+IjFUtvkYvCS
         1LucSHLEbCv/tt8QGMw77aHrKscEpX48S2iiz5DxNyl0oIZmXmFTXcrDOXVfo0+nYvec
         3rZ1G7PB/SaKN5VIoOcl2bjd3JgSGPjiVp5YXn2YpRUNxFdR3B3cYUu6L85hWDnvNnwi
         TGFEKJ1S3+Ookirm/T1qiXOx8a1nUkFlOOjiB1vD8tW/M0RzPOAS0qBsr8fh8n9rXcpe
         KJNZ42onI4yAikDnjLnn7HONYZ/lAqEFdcUCWNXRKnoi+qtprsJr7R0USAWT8u2D8otd
         WPJw==
X-Forwarded-Encrypted: i=1; AFNElJ/vGb0QS+tr+RpV1mIxHqJM9zfsASfADWVz19XH1MD5YcZEgAjqqeaYwJ+MwzRZ2ulC2BFTEQsOR3FeRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6wgLeyAIE1+4kqyrvQugdSqdbNWjlb1PBkacC/6M9AD7wpIgM
	WKYie5gZvyVmH8L2RCGhK15ZbfavhRHA6iWMxf7k3jvIrDGMQy/MdIfzYSAQ5h8a
X-Gm-Gg: Acq92OE/5ZaeHvfT7OIf6MxztCn0lC7z8HN7jkIUKIN5XZRStcjGDd2zPM1NDlYrdMA
	6Rh9I4GIj47HfY1RZ9ZE1nHqzPHxEy2o2SnbUJj/tniC5V+knZLuOPsibEdZLE8aYPy1/YW8V1a
	97HF7y0CVaDQXK991WfQBp5Vsr/m5DTkN/6/YcZBSetCaUtpVh87o7k98Nr6HxnWRd5kv/XpDR/
	sMjA+cpzXIT4T2Zs2jXemZFxHOvmzDDBoldOzTsh3cP+E6wQiplaNgCxkRkjQwhl5kg6EjXFbV4
	kLSAsBZ7UOxE71eWOrb75kmA9Kez2Gm2Hod6AW8C6zFOHijGNyo4QI1MIOfoJKTMDcJl5FCH9Tl
	AJC5V6b12EuTebdzHFV7XVJlkAk2a3jD2eiMO8ggMxjcOmR+49R/LO4begEHobvf+DpDEll9/5c
	fKsOUkpgHauICdmsbV9QhpySYC3wDyFnHS582QP3p8Uttdl+gcgHUHahfMJ07Ix5Ibzvyc33ILk
	hYrAkJajqGnwMfatgCiJDeHcEv06toiaUrirgQQaFaQlffuS8Krh2Fd
X-Received: by 2002:a05:600c:8010:b0:490:b4a8:e031 with SMTP id 5b1f17b1804b1-490c2cba8e7mr152181225e9.4.1780841982669;
        Sun, 07 Jun 2026 07:19:42 -0700 (PDT)
Received: from radijator.localnet (93-140-232-240.adsl.net.t-com.hr. [93.140.232.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm365115795e9.1.2026.06.07.07.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:19:42 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Karel Balej <balejk@matfyz.cz>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: 88pm886: Initialize battery page
Date: Sun, 07 Jun 2026 16:19:40 +0200
Message-ID: <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com>
In-Reply-To: <DJ2QONQXFUDK.22S5350HOO2N6@matfyz.cz>
References:
 <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-2-f2bd1fd3c19e@dujemihanovic.xyz>
 <DJ2QONQXFUDK.22S5350HOO2N6@matfyz.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday, 7 June 2026 12:19:21 Central European Summer Time Karel Balej=20
wrote:
> Duje Mihanovi=C4=87, 2026-05-26T21:14:48+02:00:

[...]

> > @@ -88,7 +94,8 @@ static int pm886_probe(struct i2c_client *client)
> >=20
> >  	struct regmap_irq_chip_data *irq_data;
> >  	struct device *dev =3D &client->dev;
> >  	struct pm886_chip *chip;
> >=20
> > -	struct regmap *regmap;
> > +	struct regmap *regmap, *regmap_battery;
> > +	struct i2c_client *battery_page;
>=20
> Not sure if this should be reordered to preserve the "reverse Christmas
> tree", but maybe it's fine if checkpatch didn't complain.

I opted not to move the declarations around in this case as IMO it would=20
present noise in the diff, but on second thought it may have been the bette=
r=20
choice.

Lee, do you by chance know how to proceed here?

[...]

> > +	battery_page =3D devm_i2c_new_dummy_device(dev, client->adapter,
> > +						 client->addr +=20
PM886_PAGE_OFFSET_BATTERY);
> > +	if (IS_ERR(battery_page))
> > +		return dev_err_probe(dev, PTR_ERR(battery_page),
> > +				     "Failed to initialize battery=20
page\n");
> > +
> > +	regmap_battery =3D devm_regmap_init_i2c(battery_page,
> > &pm886_regmap_battery_config); +	if (IS_ERR(regmap_battery))
> > +		return dev_err_probe(dev, PTR_ERR(regmap_battery),
> > +				     "Failed to initialize battery=20
regmap\n");
> > +	chip->regmap_battery =3D regmap_battery;
> > +
>=20
> Nit: maybe this could go below the chip ID check so that it's not
> executed if the check subsequently fails?

Good catch, I'll do that in v2.

> Also, I think the error messages are missing either a definite article
> or an underscore. Same in the commit message title.

I agree for the commit message, but adding one to the error messages would =
IMO=20
make them inconsistent with the existing ones.

[...]

Regards,
=2D-
Duje



