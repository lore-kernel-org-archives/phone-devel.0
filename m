Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794999082;
	b=L/b49eubz0tfsI2MgdjYMsa8/N/FnCLoN9QQ4DiIAWrQhqwQEg+6YrnIq2DW2obqJ+Uy
	 W55Ma4aT47I179Oz1j9mPn7Lfw2PLRI0Geco7w0+K+vsSzJn9zU+3ATSx24rfx1PFNsjb
	 cEeGljoQnBjn88vB9QSizZHrHE73eowvslTOT8TF5mFy15sHl4KReEgzqwa4LnP7EUXQd
	 G5sVYbOp0WEuwLmTHcO4YTpCbvQ4dtfV1Gq50mZhkgrEHuWdkNdPfTTCXUonWFI7vnIhV
	 6AP/PES9xy4gTMCBTQcc4IaMDwKWZbxENiHCgHtX69HwHQuO6iyO0UcRXIcnm63GbCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
	b=aIR7tUtx6msY8A+Xet1PpeM1/jW3hwcgWPlduWPVpRD0xTWVMlBzIC8Da3w3y0Pxd+3o
	 NpFDgIDnDhwYlMORQf+ZLWknl9BX/iq5vKQ1sx3XM0mnO/eo1ug+dD/Pd2024bgVFO0Zy
	 5ssewEX+7v7tnI5c8pk2BX+AK4Sv4YBn3kq2akD9MJYfujgcGMwokJBA/hjIAhdWTx8b8
	 lPNi+RWOwXLjdMfaYcIInHbQYg2xMhWZklYNJbsr3eNADx0r/RwEtgL1Xr/wwviQGCffY
	 KRHelM2HqrfTl0NNEYe26niXMvBweZhli1GFLlXVIPAAUFb+SrQUf1+u75RO1sfX3fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890D0606A325
	for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 10:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890D0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzGy7acL
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso2270180a12.0
        for <phone-devel@vger.kernel.org>; Wed, 18 Nov 2026 02:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794999080; cv=none;
        d=google.com; s=arc-20260327;
        b=jNNAr83ePfdc2kysiEuXQbWAmKKofdwiIvfHxKOZiFGpUUO8tAHCWpp6nLqGr+0bqQ
         h9ohLrHNXtRw9mTqmg/6DuBmKSfgWYhHhClmRWEFd2XXHYLM6YnlGnjW8l+1ncK7vmQ+
         GN55XGSCdRrTnQZsrjGFKcPjKK830+3KPdQeNJkXN1JODRc49jKgPg3dEsm/CEkUPPDf
         0NiG+G/G+XUTH7BXT1JLVuGyjskA42ajFu1yto8lCrJ+ejWWva6njPK1qEzNoUydD+l4
         IYrTZ9K/Tt7oQEOatCQhzk4vCqpX07CtNx6VRyaONGmvtb5B5AByJNkY9NAZyHsEG47J
         vohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        fh=eUW6nCz/BYBHsnKiACzc0nRVfkDVrZEmQLjAjw4yatM=;
        b=nl68i0rsOqkziRp9FeoSlpHl7lhCjTGzj8C5PSyBP19ujtlLTDJK/S9Z/H7Qd84KSw
         vKYq0n2PrAZcayRbM6bLo8GaS3VcXpHZx6qlzXxyZxgKCnqxEm7yNvHYGEsNWVguN2mC
         iDjmEZCZQ4l8p5fqqtltykknmkB4eP84APFpSizaRml5ddSqrUeQC+T0vAvX5DyNVtew
         7iEb5+2AcSRQceHB3ASBWUU9wKlUIHAS7+ozWJTXyEUFmWZlGaz1uPHoZEGyefeUDVjH
         iD1Igdqsd70Eze4LjyjuKjQCBA6cmC0g0Qi674GYIQxVXdMfVla52fXgr6ClQ6zUnE5/
         bqWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794999080; x=1795603880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=uzGy7acL7JuuRoYHzLCV05CAVl256ema53eZwWGcIfsJ4ScGO3EcF4VCAxcAkoruNC
         wU6VGwNFXzYXBni75pukdRy1iA4xaO096szSWrf2aN6iDVGhs59LzMJwxxYbPhru7CJu
         9fzolDtFEd+ybxINOVJ/7oI48WxDFqdb8pw3SPTKyU0zBdypMFGcuGEo7kojCBQ0+OWV
         z4lftMdE3Tinu0jTJWiy8vAgPZEr1elRKk4fKNxpPDTdNow67v/0gQR/jezZDRDQSc18
         PEeioPSLmy14kn0e16zukPCiTWmvXsqU3wfSZHBU36kOatBY6iBDfcEgUVdwwHSQ7Ucw
         N04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999080; x=1795603880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NxBauOBs5u/lRY3weFSh8Hak/XwuA3xMwWhu9MLIEUI=;
        b=H3jrmnv1S58SSPkaqrdNqVX1O9JEsU+Y3iwVZXvNJI48pM01VhXYc4ngAPBHQ1BkyR
         i4sdUbNKSI5OUaxU2b10bf7LSQFZSDzCki/edI2/x1nf8+riZ3Jo0kAefiwMh8pygBf7
         xMS7SS5ryda4MO+boNog7Yqq0rq456vyvVN6u59tmZRUPpYSIc7Q5IxwD0VNSAO/+Z+W
         z+Wjoi++4iP7CDWtCDIRfi08BnxJMeXOL5pczA0Ktqcp0y1EAffN22pe3Z+yjGlSVd2N
         SCE7onUaIT0pdVbw5xuGC3+C17XxUbrxAW8geivD9b/HtxX0SXHf+qf0dtTHHqB76cIQ
         xGng==
X-Forwarded-Encrypted: i=1; AL+hErGdjrna+OzaBtFQx7iceomwop+Fg1nmW8DOqYvazG4UmSH/2x4H+d1caJ0qbwTirKAkSksibXm+DDAreg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8D9VMaEBqZcIZzobQD7Wojjbsekk3KwCOGWxAh6AJwLJvuLcjJ
	xnDGxsfmrAWaxqSkhnVNBGOM/JDA357HTJHfOZCF/k/PR4DDA5nbTasQGuOCoJb4fiyOjenKV+9
	wqLD6sfcbfmEppx3mcHIK8b4XTz0pqxUPBK4lVHRzdw==
X-Gm-Gg: AYBFou3ykIE9gy1o5mt0KoCV3Ia06C5W2Q1k4Zd1pI+ScjYb84kSjH58GcrGp7euGju
	42I+dYW5zvt3MeiTkUf4OLEQx3oh+7YlV5B60rKEL/LQb+OPLlNRGNw3urmBrDZpTBs3Z/gi7u5
	FyhGzNoshN0SZM1bPiqQoy9eBa/zNMsm4UYtR93Sya9Klj2IE5wAlSUFlUzrfdTohBuW+4Tl5Qf
	IhT0uH3bYuFrpdCSCmQw3k9ZPDY/fgbdTH6YTC9vriYPPp+OcZ+bwlv9BFBxkmUQh4BXdUwVuZH
	FpTbz357c3f5WDQ7N7mMT3xSL8HVQL/AOCt0wfUTlLBcj9ZondjTU9YEkIK7BAGM9rlDdpTtdUC
	UbJ8W6pLXZGEJN09H0pqvrq5UPde/lb8oU0rqreRETrKv9NBH9G7uMU9leMfZI5smdbJGgqk=
X-Received: by 2002:a05:6402:a513:20b0:6b7:a647:d6ec with SMTP id
 4fb4d7f45d1cf-6b887f0d11amr1156171a12.5.1794999079857; Wed, 18 Nov 2026
 02:51:19 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
In-Reply-To: <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Nov 2026 10:51:07 +0000
X-Gm-Features: AclHuK-Y9_U7OVUZSj7mMfHViEYJaBBmRFeKE5RJI3gsS9G5CebJQE_OwkvnRns
Message-ID: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for
 Samsung Galaxy Note8
To: =?UTF-8?B?VHLhuqduIFRydW5nIE5ow6Ju?= <nhan.094.vn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tr=E1=BA=A7n,

On Wed, 18 Nov 2026 at 08:43, Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gma=
il.com> wrote:
>
> Samsung Galaxy Note8 (SM-N950N), codenamed greatlte, is a mobile phone
> from 2017. It features 6GB RAM, 64GB, 128GB or 256GB UFS 2.1, Exynos
> 8895 SoC and a 1440x2960 Super AMOLED display.
>
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
>
> Signed-off-by: Tr=E1=BA=A7n Trung Nh=C3=A2n <nhan.094.vn@gmail.com>
> ---

[..]

> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x0 0x80000000 0x3c800000>,
> +                     <0x0 0xc0000000 0x40000000>,
> +                     <0x8 0x80000000 0x80000000>,
> +                     <0x9 0x00000000 0x80000000>;
> +       };

Does the Samsung bootloader not pass a correctly populated memory node
for the device? Or is this required because UniLoader doesn't pass
along the memory node it received from the previous stage bootloader?

Peter.
