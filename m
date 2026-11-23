Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435159;
	b=2b8tm/qMQZ4+hvkCwx/r3V2nLpIIIMrNfDeUAydJAyEcThzyPQLOIACoquS1HzfIXYJk
	 tjVDo9XjkwmtS+sHeo4EDukWtmIdyyfKjmTk2MamTOe8PGxA4syceg3iYOipqw97krC+D
	 al85rXzsCIGMLOrOeRjBk5SVQMhWa6R4mfsSK66in4PDccRhf9QlGJxydW+T3l0oMyxG4
	 dklPKuaL8bfBMcNcfDkdkXy/wv2aCkwkVGkKGHRKDAPNYCaKL8nPcPvLIyqDpmHoQm4FF
	 XuwbpRZ+AqXFPNTKUYDyiCO9sspMZFiHLIdgRZM4ikcvhae/KwEY5sjCRVlX/SWHtrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
	b=FKhSkfVypJryRtd1fnV+HjESf1Z7gFxNvkatuU7+oeAX95E2JnSS3d28h5eliPB7+W6o
	 BlxSMOy8WQjTDKyF+wbX7ZegvMxAdbs6Buh4pfrMixBWyMxqmYaX0drs50j5s1og5PzGT
	 6GFILVqFrZTO43dm+bubOx1vaFz3ipm7qXMRSjNCH7fdhwCaFoEeJqYUF/+rN5ujUDt+L
	 pSTKhaig2qlw0LH/bG2KpwaOR2P0sTuow2o4N6ovnDRZesrgQGH4/oT9SJfK25WJGMFl5
	 rp00a9zeyU3KkPoIoZlD3m0rrLyqHb4o/G+Zn8Ao0n2C5/qRzrgTmKkNQf/unjbFx9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnv4Ewzs;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E830606A327
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 11:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E830606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nnv4Ewzs
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c506a231b88so439753566b.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435157; x=1796039957; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=Nnv4Ewzsl0zbK9WqomGclwh/k39KgQeQgXBNc/AzfBbUyum1Jwvd/YbXnXg9n29OEj
         K9Ij0DC8CzyeIq0tVeeaApk4UfsTam5BGxnvw6s/ZKMk3jvL2FWONroxYavWmgOtsFl/
         pCH33OTHEcBp5Asq6l2vD3q6q2VMRCWAkBXRC3EjS07hdKBCdtwczs0pFbPIeKRuIxID
         xUNzibHvqo+wSbbF6Xz8MLTQWy4Q05WSCpzEyqo7+RmGC8MEsJ5zTaYWtaSTJqfEMPJ+
         ja4H8aB9k1bYTHo3T4iVJsVZEdnn8ZEPeUwM/HyD1ISEGSLI8D0lV/EVTsvmkC8x4VQw
         QwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435157; x=1796039957;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jrfyM8AKRsXsQr/mDzcRHfpMeGCqxxnp8QiMrGkGyA=;
        b=LC7qzdQKL0bNn9g5o+htML80vzKGOb3qK+Utyu7whtNymCn48dUw23Fas+hoEIYYcF
         nCqWv3tny/0bj6YLgiqBeVDMKW7JgPp+rZpOwStyLiWvcpob6p55UVWyO+sdVtzX/QTj
         TVd+LvbmI3Xih+mI4sNZ919FaX7wbzO3Dyt3u68Z5FTje8LaMXiGlN4ZI5LbnceGQyHb
         hKoAkfQ5K8lJI/anNGrq1Fb7Cf0Z4MMNk6KbbzIPQjjxdfF9FnkOD/5fbJbopPyzdoaj
         DHsYv5g2R7aNjTXfRxEd/4wKxgcmo5CIBvK7+e1E92/TVsSeopMSK6Uw4Z+aML/fcroc
         v40Q==
X-Forwarded-Encrypted: i=1; AL+hErF6y1GVPQ9c62xJEsNix9TjFpfvGKyKtXwP86pw6hpbYs9DVnEDfihDQOcaGKxlKKeIuKrXudijpk2KQg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Br0YUj0ePmjXGJTzZmYx1QxpxCtPPgGtcbvyjTNI8V48GrVhQ
	V30afNPswLkgrdDWz48rKqJ1kle84oglSjTon4q8wBS2NV0MJTjUiORk
X-Gm-Gg: AZFdTZchsscOtjU04vOFh4GBfRtWazXbpY29r0NYRjN3XWD3rFSCok3U97BGDJYA5NP
	1y6bOYBwcVD5y2DHRwwJItZIwFNWelKtvpGzRVvxQH2vI4wt7AK0YVNhgj1EMKTxnkiM4P4ss9S
	Y3fyvCUqtUC6yX0RsP6fGaMbGmE4Ph/uZprkylovLbUS8zDe3S41WcD9tUdDMODO+W5UY0/jJCm
	gkhDRtwvfHZWBIxbHbAhvz/yxw7xEsACQUoDXH1R2ZVRGa/1u1UD4rHWq/rESBjpU5GSHqeOvFQ
	yYQtJFi7qZlPZYQkK7soYUmt6af+G1XpE5AtqULdilU7hYcZD8ZA2FalTsYs8Rxh2JURxe1qFpH
	0jIea3tXLpzOjCWQTKuU6mDJejNm74RVaU37FpdkXJ7EKfn1geLu9YBWC4gQY72vT9fth7udZ8y
	senCSLesGlmwkr4D2xO1qKMYgX7AG7yrgiBOivzidtUtmaYoNhLEau3KEyHKfd2iXuXBPZWcpmy
	8wkX6CxsgFqcMaLpGJ1faS/TPDMKoeU8Uv724Nq0c6la0QSs92a5yVh4Uge6TsM5m19w6hqkjMn
	Wj19LwmrX+hnQKAiJ/dx6oLQ/t+LAoXpv7uwp6iUxjYGb8r3WqvvnH9g
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id a640c23a62f3a-c513a5da8d0mr870341966b.12.1795435157410;
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68a9asm395946466b.30.2026.11.23.03.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:59:17 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:59:13 +0300
Message-Id: <DN2KN6PFHOXG.1EWK1XUHY7IKK@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Conor Dooley"
 <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi
 Poco X4 GT support
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>, "Alexander Letuchiy"
 <asalde.le1@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>
In-Reply-To: <ckJZtdZ4-fPzsa3vkozNyEYYUbG9qd134hYb0hHEuq2nL8WMAR1PS87OpDfXrkU-E-85rsG1I4V99_M41j6-ewkD_41XPguDel3z8z0lmMk=@protonmail.com>

Hi Roman,

On Mon Nov 23, 2026 at 2:41 PM MSK, Roman Vivchar wrote:
> > Bootloader dependency
> > ---------------------
> > This was tested with a modified LK bootloader that is not public.
>=20
> How are other xaga users supposed to boot the kernel? You might want to
> port uniLoader instead, or if you're on an old enough security patch you
> can even replace stock LK with U-Boot. U-Boot chainloading is also
> possible.

Right now I am replacing the stock LK with a modified one that knows
how to handle mainline DTs without expecting downstream Android nodes.

In an ideal world, I would like to replace LK directly with U-Boot as
you suggested, though U-Boot chainloading or uniLoader are also valid
options. Luckily, the security patch level isn't really a concern here =E2=
=80=94
xaga is already EOL and hasn't received official firmware updates for a
while, so LK replacement works across the final stock builds. I
definitely plan to look into a proper open bootloader setup for other
users in the future.

> > Firmware behaviour
> > ------------------
> > Two things in the stock TF-A affect what the DT describes, but not the
> > DT itself:
> >=20
> >  - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
> >    The vendor kernel lifts this earlier with a SiP call, so with this
> >    series the idle states only start to be used after that time.
>=20
> It might be worth porting upstream TF-A too.

Agreed, upstreaming TF-A support for MT6895 is also something I plan to
look into eventually, which would let us drop the reliance on the stock
TF-A quirks altogether.

Best regards,
Alexander
