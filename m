Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D49285C90
	for <phone-devel@vger.kernel.org>; Mon, 25 Aug 2025 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756151491; cv=none; b=K6sjjW8exQCvYeOXMK/sUF3Y46cx352f7jhgYWyC8JXbGM5kluGDIEz98qS3Oxq3B++5FEWY/duUCLI1nDr8TcvtY6CAh6qpRY8Mz/uj5qE0IfXC/WhpxL7QtxJiOmf2lOgfBV9IdvitssaoH4DNtTwp7KnNhM9seDebIL9MXKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756151491; c=relaxed/simple;
	bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7zWmqdX10OUvBcMvtd6RSsliUB7jnt9CAr3YD27cQ/dGwL6D3/0zvs+25ymA6fDLSpRtMD9VuGEZ0vo4KBO40UGPp0dUWovhCkS2rNroHWkOnpmo+ilBARnvTHJAZpU0+l/qzTPLLa62m8V0xcvJoKnAnK4xEHaWjnpUcpagHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HaGKZuLE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HaGKZuLE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f42e4c3ebso1522858e87.3
        for <phone-devel@vger.kernel.org>; Mon, 25 Aug 2025 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756151488; x=1756756288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
        b=HaGKZuLE6ZJf5NweBqUmIuGwifT6BYS2i4BLg5mx+ZgR+ON4KD3FyeG291qmjdDpfJ
         +RoEEvKdCiiXxd6ubXNVO2mpJWzfELIb9KZAOMAKunk8HTjxaguQ2pyzhtaDrTWU91n4
         ZswiXHqVFhmkzU+40FgYuatK/oVikkgvdgbL9jh6kuZvumDtxLQUAXwRiokdo5M9ItHA
         d/SLxabybgDP2HfHgo6lu/P7iyEMaQr5wvx4VOtw3BczFU0LG/NHP0YKpuJwkYF4P3gg
         uweGCHAom57JbmfDHLpB/xFQLaFR/hRk5IkNdaoxBhAXINddVrPKkf/6U6VqwrmahyqY
         tdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756151488; x=1756756288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y79/LUE75+gAdZKPm7Wiii17xZyHOsbF+TjITNREJtA=;
        b=N4BWqaowC5UxEJM+XZpSpvpFLqRYyOVUsgpJnQfxAIlO41G62dCP1pu8N752NKqv4R
         unZK6ZTM6nJwjNkR9CU77wE9RP4o8+GJrEKMXzLRZGZJHzANumeZNGe6pkAPubxwa5aa
         bNFzUBN07gxReFNfzi/PlLZkhsSucps2A2gp1cLnNt4EoCHix7STc2Hf6MWP4u/bqE0+
         TaXB9Ad85LAmJAV37UnvVSC3VcToFfDh+/67l9Hb8vYiYUFcDIPx1xC1Cd4g6POyjeTT
         sVclEymhoKlEd2k70PvU/OMVtpeDh8JwHnLIBoFwgCsi0mS2KlM3OIoKjrgL5rdkV94/
         vo0w==
X-Forwarded-Encrypted: i=1; AJvYcCWrUlPVvFVBNKViUCG++y9hJZvk7VBkkTaKuWZbv3e0esIpcV5aL9590kwzj7VDU9HJHCGsDgAnx7PIyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy488lH37N92Mw+qQn6pRjRU7BRt6FnGlkjcoqBzLqV+B5X+j/F
	ycuyO1wL0BogXpQbN2udqL1pdF0mEESFI3/+OVMmSGBjcKycaaB8RhLed2CGw/UtfXB3+qzA60b
	vObfjtYGxvioa86jWwN/fCdI5kSimHsaCuBdgECPbRw==
X-Gm-Gg: ASbGncv7989FXbDad+zVUaKafN2XRdVBIgqlnVbbF6ZJ5nah2K9VFH/G6UAozud2PsQ
	Pi8Lu9lqgn7Xa02wlUdPn8HhqOFWQyyEjlo8yBft1GB3OcaZpbYfoio5enAqIz5HNQyIexZIo6B
	IGu1QOpOE/N1C61fsizVI/+rs06Z2S+vHGkEORla9Zgj7nKT0YM4JZIQk8yKxP5OXpwVFkKr8Jg
	UFoMaTmC8rOULoCwIW9rFcLeYLUBPH5g8co
X-Google-Smtp-Source: AGHT+IHCixJ3swy46ayk8UZ8ky9sJlMNCw4ccH8gYjaEf6aBpjGfhfoC4qmGYIEYeYDaVuoFN7bhmFqiGNvLwJvOuWM=
X-Received: by 2002:a05:6512:440e:b0:55f:42ca:cc03 with SMTP id
 2adb3069b0e04-55f42cacd56mr2238491e87.56.1756151487746; Mon, 25 Aug 2025
 12:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-3-e83f104cabfc@lucaweiss.eu> <20250818155103.GA1272375-robh@kernel.org>
 <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
In-Reply-To: <d6159eb6-7777-478a-8bb0-298bfa607c06@lucaweiss.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 21:51:16 +0200
X-Gm-Features: Ac12FXzo7Xcs_f8LKjnis--6Fc7OlBNtr01kDZozGbXhIE3-aXJaLXGWXFJlZYg
Message-ID: <CAMRc=Mf5+3KvKKrVJhx9_CmQ-tN69cahkHgjVgL5M7XCZHuNSg@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Rob Herring <robh@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 7:46=E2=80=AFPM Luca Weiss <luca@lucaweiss.eu> wrot=
e:
>
> Hi Rob,
>
> On 18-08-2025 5:51 p.m., Rob Herring wrote:
> > On Sun, Aug 10, 2025 at 05:37:54PM +0200, Luca Weiss wrote:
> >> Add the compatible for an 64Kb EEPROM from Belling.
> >
> > It is generally not required to add a compatible here assuming
> > "atmel,24c64" is enough to identify the specific device (i.e. read the
> > device's ID registers). If it is not sufficient, then some details here
> > about why would be useful.
>
> I thought DT was meant to describe the hardware, and this specific
> EEPROM on the device is a Belling BL24S64, and it's software-compatible
> to this generic atmel compatible.
> That's why we have compatible =3D "belling,bl24s64", "atmel,24c64";
>
> Am I missing something, or misunderstanding how DT is meant to be written=
?
>

Right, this is what we've been doing historically which is evident by
the number of compatibles we have in the schema that are never
mentioned in the driver C code.

Bartosz
