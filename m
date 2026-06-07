Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE3537B015
	for <phone-devel@vger.kernel.org>; Sun,  7 Jun 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840934; cv=none; b=Ff8TM05mbUV9IZHR+MuAVXwmOxZfsOE9NTy6Qb3PynwfedCHoz3YXy/7KEOaqpX3vMvW+n4zWYzxsNrJ2nJXun3FInUuSXQDquWdP/es3HYsRE6FLHiJt0U3qsM8FOwf4DKPVhEpfDfPViVW3RBtVOIwtAqC2OKXRsU+rRHI7oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840934; c=relaxed/simple;
	bh=dztEsTWxmH2haAYHQs1wZXsZ1TJJ1TM6oh4YtQz6xLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5H0hAgK6SeHPNH+oJYldhgdEBzlfDnKqK/en+DgH+QDiQXv23CN6paDm5E/lWrgAAAEQF8zgQ4j3zfWstEx0TrzR+/88qKdCMaBeO0TvJKjEQ3kvquhMYrfczXET6zeBFvBVj3tgKVqDF1BM+5ahCpK9vMPk9HBTjA4HP+q2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRbmxDSP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRbmxDSP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so22117455e9.0
        for <phone-devel@vger.kernel.org>; Sun, 07 Jun 2026 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780840932; x=1781445732; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t6VglNTovUYCDn8ZP7dcNe/GS5KXZ47ukCjoUu64dW8=;
        b=SRbmxDSPJIIPclqUc8DZdFSHJ4e93XqE+B/xyowt4JJf21b2H0WbTYo20G9gb9pUAL
         wO2/Dln2FuRXCokDI/od2Py5JiP0NthCmLSsWGm7sVf+xYZ17FcXoU20EcVdZn1N0IAD
         UP20D0ceLWKIOlwKr7WPz0e3n8Bi3wsOegtdx3qJmxfpllaZ/ElMrg44aRVXXN1zwsaF
         w6Gh/+yvf1d27flEz7ABwWbDsqveCkb9mv55G882a4ZjHDfHIJ3zWo1x64PLyQf/+Cfk
         HbWIqJGH2UHyq6UEVac8TOWF1eY5dVri+8ZZHj4ruyRbObFlrObn74Bw3yECyHa2YeBP
         ocSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840932; x=1781445732;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6VglNTovUYCDn8ZP7dcNe/GS5KXZ47ukCjoUu64dW8=;
        b=dsJ/MmWYeC0sdZgB00oOvplPiELLGZPq8DI908RQF7ZsNsVyLjxNKPIj/snFu0ZRPZ
         UGVPC39KW9EhQ0JBE32xtEmqJGDg7NEA3i23w+q6DJ6jVidJGmeRepV/TYY5+0NB0wHx
         627pWpBSnzgSKQnQaB/CbU/oYhv0+rSQXc5fMkM7khf3UB5LBfKde53E3NWP7neQfAMm
         jyld02S2y/hD3Jb4pEERbiGe1KkCHbJP+RWaITWe/E+MqJNznqk2UwzMyWZoOVD8VP12
         uTI69F4+Y+mU7CNx5ad5fz3tjkb0NiOsYWfMaYGXCyVjM4P5TLeUi2EIqEq0YDrYzLjy
         RQ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ+yWAsshYVQWKCnc9hpf3BYdKowlSnrKgsCP1GrgXRQCX7V5uSnHYT9BnLHKARIdd8ckK7Ut8ctMe7i/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YysRkrsx4xQCzBWO+DIbJOrhTy0DOH30t3zbW+LniDa+7ZRbR/K
	cYw5c0vlIUQhsvAkx6XrgNY4abLQFlquE9ZIhEMdWUjyaND1QTxaNAT3
X-Gm-Gg: Acq92OFhax6TQV9jwx5Eqoy8kH8mI6ayNEb+PC0PxAxusxOwPkKV7kInzDu587PIkl5
	fYj0PT3UxCzfS/zBH3/E0m2+lnheAf4tWYWsgr5sV6aseP8zLxpAUUmd2odMgQYawDCdX2O/Kcw
	MnfAQsabP9baYeYVDPr7/s1tTNviJ42ER755wcDb0+K8cF6d3VUjvlEuPbLRft7gS5KKje/Y70U
	+/+RSSltRGSdlw244IhltCpcKZ9XdL+d0GEAcubtClUbE8K7zBeKMP7qfRiz6essTy7qYKfNBFQ
	ZGrOnt5GHfnKOJQ+dIAV8dSDQNzak+ICUsTWW0kbY1EjfdyzkZMs+VuEsQvpK3pVYkI2T3gtS9E
	Qe3iDUVO0JV1NnhrzCngg+bIqu6fvhOAhbOcFVJcK5OL83BWvDXuPn8wCcbJ/bwBZ53+y5szh9/
	UCzYZGDkhly80bIev0qBr+6DR/TsK41UMSEFYDSX5sEQb2aO/T0PBZrwezoryPPp1RootEJSGKg
	WkpPM68V/m/BrYI0cv3mNz+FSZArt5kIYpoX4wGBE4yVw==
X-Received: by 2002:a05:600c:190b:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490c25ff35dmr203817205e9.23.1780840931356;
        Sun, 07 Jun 2026 07:02:11 -0700 (PDT)
Received: from radijator.localnet (93-140-232-240.adsl.net.t-com.hr. [93.140.232.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm44141055f8f.33.2026.06.07.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:02:10 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Karel Balej <balejk@matfyz.cz>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] regulator: 88pm886: Add Vbus regulator
Date: Sun, 07 Jun 2026 16:02:08 +0200
Message-ID: <DRas3NvTRJi7jDZJc8QqTA@gmail.com>
In-Reply-To: <DJ2R7MRPNO5X.2WPLSEDZFAJ3G@matfyz.cz>
References:
 <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
 <DJ2R7MRPNO5X.2WPLSEDZFAJ3G@matfyz.cz>
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

On Sunday, 7 June 2026 12:44:08 Central European Summer Time Karel Balej=20
wrote:
> Duje Mihanovi=C4=87, 2026-05-26T21:14:49+02:00:
> > From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> >=20
> > Add support for the PMIC's Vbus regulator. This regulator is mandatory
> > for USB OTG support on boards using the PMIC.
> >=20
> > Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> > ---
> >=20
> >  drivers/regulator/88pm886-regulator.c | 27 +++++++++++++++++++++++++++
> >  include/linux/mfd/88pm886.h           |  7 +++++++
> >  2 files changed, 34 insertions(+)
> >=20
> > diff --git a/drivers/regulator/88pm886-regulator.c
> > b/drivers/regulator/88pm886-regulator.c index a38bd4f312b7..039822e86ec8
> > 100644
> > --- a/drivers/regulator/88pm886-regulator.c
> > +++ b/drivers/regulator/88pm886-regulator.c
> > @@ -4,6 +4,7 @@
> >=20
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/driver.h>
> >=20
> > +#include <linux/units.h>
>=20
> What is this for?

Leftover from a WIP version, I'll drop it in v2.

Regards,
=2D-
Duje


