Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA31B3346A5
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 20:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756876; cv=pass; b=aT/+7vqyMTKxm6374QYM8CT4d59LRV/JnBW/4UA5MrNT43PGJwTew0HfilZn6IwsgZJjwCmrIeVe9SthOaHP42t1WU0AYYHdloMl3IRpH9Q9FpyaiU/CiTsGdvdoAZZ3HOjGFZtre4NyZuoyUXEMH2IAtNaif9grEXjeu1Sepv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756876; c=relaxed/simple;
	bh=q3FqIQvO8cvkl4nCC6YTH6him8mnQtv/Z9tzeCFgRWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBYLtGmnWYoPis6HSnH9HPXOii75U4mzfm2b0IDGhlVl4Rf4meBQyXb2nhbFKfr87s4fKI+MHlj7WjW6Is01Bi4lVq9T6gx9Pz5f4i9sd7qO9uUGi4+nvtK1QVKhnnQlbVI8nLLk0WqvHkENOUdwJvgwr1Fa3Z7iDceah6z2XTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3+wPWSa; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3+wPWSa"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8e9c8ada38so1009926666b.0
        for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 12:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770756873; cv=none;
        d=google.com; s=arc-20240605;
        b=UTD3oNf2yP9Ju4dMQ67xgRFtc0GLfTMfNqcstIpIq4rUjRKjC+ZYr6V4xeuhaRhvE4
         vlBb3P9ZNv6X15A0XIwTWv4DphoPetSJxT4cUGS2WE8y4euosw5Lj4tqRnk3v7BC8teP
         UBO7SctHCDZ1jMK84UD+jJOZVFHbr3wXwimae5jxGXAj9mzhnWlEeGc0hyal6kEbDNSL
         e291yWW3vHRJg3pKGg2XCBfdaZiYIN+nxdWWCigNZdh93j2/fxRoNnzKqQEVdIQSA2G0
         l40xE65eivA4CPI5vbtLx5o2exw8gwbUHLpLsIkCJc56CG6XdV4ZeMoO23IFTLYDQK0s
         aWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0+zRUlOfUnZOOssxXAVkmpFMr6RYTxI9SHoGCQOmoo=;
        fh=io9Fg1OtGf7KY1jMkasYQxysqy6lPSqJnjcEn7XSzaM=;
        b=P7bpDENVnvLgEWUB0wlKfiiBI3yksPx7Yaj0ZwT/9Fkee0RVnIiRkJk5/3H73s/TfL
         pLVh55vVZfHfJG3hSpQ8nWz8IdUq5kkPFYXu1SrkbtCz5kjptqdxG2mg0KencltZCs8P
         FpKZm7q3zAM9s/7kDRIpZUjcVxjPDjb6zhIh8b3dHYGoofwd7inKqW377NiYbDptw2u4
         oZluO9kH6QgINjEs7cx50qXsqU1/6x2F/11JIUHcR9QeSU4Hwl61LuXOt6QdOOvGItHp
         rVUW9tL1fj4OqgTlKGa6by1e2RnB/nr8VfGWk/6UJWyaOwdMx7ks01kKqs7lsv7dUCHT
         KWeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770756873; x=1771361673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0+zRUlOfUnZOOssxXAVkmpFMr6RYTxI9SHoGCQOmoo=;
        b=f3+wPWSayTc2E60IhSxm49E0QL/luMF3k7mjZP5vHil72zAKJ2vHTduHOaf7/+5wM/
         RCJtBd6y9rx/R7yQaDiecPU/emfu0T+RRwEGLYre128N9olNEyVhm3otiGL6MuqCFcbh
         g9kJkPxaKZvDIWA+8WSw06SXUuFdvYZmGmRuvZe7JAc2EpW5gKUB6cyDrbNQ74NVc17l
         62aqyLEeG0+8X+gsWKgcSmuKelUafIqRHWFLI5T97CbS0SzUMvgKZFc3quhlW2lgMUAM
         RvHvkwO0Utimskn0tsIGHyOpr3RuE6/TzTyCsVp28482R0UtRVXPGsM40UafunSNCjnb
         DxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770756873; x=1771361673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0+zRUlOfUnZOOssxXAVkmpFMr6RYTxI9SHoGCQOmoo=;
        b=rswoqPgykaLaE2Hr0scu1xgG9nd8rudqA4UzAHByS3gX1T9JfDttjdqfnW1QfCdNeO
         VXNcym8kQWOmBefSclJpuFMnc4ezqgUncgr9CsnAZS3SW0BjInJf80860qrWxV+g9X6T
         ZLpu5FuZG/UyJAzyOBW2sgXWyIGtDFmA4m80rIWb9ObqalAt7pWYf49dPTV6IaHon72b
         LEv9RhcI2ZojUOYr2jdtSj97Zirb0Vaj3rWZt+I6Hog9PvNJYHQHM4/E5VR+h6hljEF/
         yCQmPSB+blOZzAZwsruthZsoqX7mQdMx+bVERjQYb8lvJX+uAvyADcGR/NDAAmpTZHkj
         uD9A==
X-Forwarded-Encrypted: i=1; AJvYcCX+IzpcFh174VntXYCgAEH+hEmEkKg4g6psBnvd6PB8xAX0qiJLtKgbjnhi0ttD68D+eEvtQjURw44Aag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhTbc+aA6fWNWXipziaDb9WNdugYpvo7f5cJ0W77P07Ix8e81N
	9ZPDOP49GKGyk35cpRvYZIsHUWsZblWy567OU0VPV8aoAvNI8pjyHdVeLAn/hT7KKfY/3PXB7yA
	v8ROcfrUqtM/Luv3hyyuuApuCEJ6hPyc=
X-Gm-Gg: AZuq6aK2Sw+0oA8BzqTHTJVlYAaqR+sEfgaTOt5ewAOHxQV9jNu0lbWiS+R/E+jH/5y
	ARQHxn7Tp5VpSZa/uNuIwILIziRsLPknZL5HTOrUXwSaRYp7vg6rAheuW0nALGl2TYfV/WF3H8x
	i5iFjFvVse2/T52/KkuiLdOkhzo9iMyU0TThIRsdY0mO59Ra1U4rLhYKpauqaBg5iu6FOfN/z4L
	PpSrBecyhNBx9rPxJVHlh6iILg5phDLUDo9pf39ZJD2K/ljUHOmBa1h1lwzjnDIUgwAfYQdlJrd
	mqfyaVZZWiOj4qk89ztqVJlkQ5Vvb/20ccL/nl/uUaGkqjYiW+/yrqrAFethf+CizmfSF4dke1V
	MZVx6vKw=
X-Received: by 2002:a17:906:478b:b0:b73:5e4d:fac4 with SMTP id
 a640c23a62f3a-b8edf17c3d0mr872130166b.7.1770756872908; Tue, 10 Feb 2026
 12:54:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210-cm36686-v1-0-aef68dd46ad4@gmail.com> <20260210-cm36686-v1-2-aef68dd46ad4@gmail.com>
In-Reply-To: <20260210-cm36686-v1-2-aef68dd46ad4@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Feb 2026 22:53:56 +0200
X-Gm-Features: AZwV_QiJ4Iw7UcJSk9ruANiayx_rurPPFTMjvoK7bffS_WbsRrm1pZ3P06rt0sE
Message-ID: <CAHp75Veczn--S=G0iEyUOnVYZ5rT+F_Sw1=6YOo=ynPiKPHF6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: vcnl4000: add support for Capella CM36686
 and CM36672P
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:46=E2=80=AFPM Erikas Bitovtas <xerikasxx@gmail.c=
om> wrote:
>
> Add support for Capella's CM36686 and CM36672P sensors. Capella
> CM36686 is an ambient light and proximity sensor that is fully
> compatible with VCNL4040 and can be used as is. For CM36672P, which is
> a proximity-only sensor, also remove the IIO_LIGHT channel.

A couple of nit-picks, otherwise LGTM (much better than the first
version!), thanks.

...

>         { "vcnl4020", VCNL4010 },
>         { "vcnl4040", VCNL4040 },
>         { "vcnl4200", VCNL4200 },
> +       { "cm36672p", CM36672P },
> +       { "cm36686", VCNL4040 },

Keep it ordered by device name (string literal).

...

> +static const struct iio_chan_spec cm36672p_channels[] =3D {
> +       {
> +               .type =3D IIO_PROXIMITY,
> +               .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +                       BIT(IIO_CHAN_INFO_INT_TIME) |
> +                       BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
> +                       BIT(IIO_CHAN_INFO_CALIBBIAS),
> +               .info_mask_separate_available =3D BIT(IIO_CHAN_INFO_INT_T=
IME) |
> +                       BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
> +                       BIT(IIO_CHAN_INFO_CALIBBIAS),
> +               .ext_info =3D vcnl4000_ext_info,
> +               .event_spec =3D vcnl4040_event_spec,
> +               .num_event_specs =3D ARRAY_SIZE(vcnl4040_event_spec),

> +       }

Keep trailing comma when it's not a terminator entry.

> +};

--=20
With Best Regards,
Andy Shevchenko
