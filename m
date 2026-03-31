Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6C375ADF
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774981054; cv=none; b=r8MRkG32Qo6vWvTkml4k+SWf/8AjuPfvryS3bljRHhQeY/TnTHac0a5UUZN8duAScmCqXSSbK2xKXa+VeGdBWZeudxgtaOVmU/0hKa43j/BA+7+k41+7F6IdZ4PLnqETgbcgYgGYWpez6nRXYMDPzoUj/AG9cbxs6m6q2mKMx90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774981054; c=relaxed/simple;
	bh=5SfKtWMW/MTMKZvB2XBW+7ZIzP+paJSdBKtCWkXfuQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9wuKV+aW0UH2yL8m0Rp6dDob/nIeb3A7MIKRJEHPiOBfM9xrXGjaMwqNmOcoE3M//WeoK/HgXH06+Ofwb7HM7nNnFMu2cG+RG9IeziDPeOaRjomQ76moEPWerVB9K+bP+UPMBKpwwAZa6fuwfOn5aqCEY0HN3fY6w0PFTUjuiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=me/OxFfU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="me/OxFfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19189C2BCC4
	for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 18:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774981054;
	bh=5SfKtWMW/MTMKZvB2XBW+7ZIzP+paJSdBKtCWkXfuQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=me/OxFfUISMvykfhsnEp+wrFvLV35pI1c90khhHC9tV28mOWcbhwxFXO3x3N69ImG
	 qAO6HtLLxNjsh1iVi549Qlv8GIkxUxkJMjA8WwCutdxI5pDGx29osO63pdaMS+D+FO
	 xMiwJ1DfB2/50loYj8Bao2SjTl+2m+KW0ZGSxgE0OKrIHPA4AdV96H+B4khxMQPwj/
	 sLUQrVAh9fctU1onyWK3sFJwg3xiucEr9jdVKjFLnxvFVvd8/sxp0papS7IaY/+N9n
	 ZPDlP0TU/wgGoZIBJ9qbS74BAT8pXvHwgOuI5zrlYqJtFV0T8U0UYT1HxAZ6KNu4uV
	 jB0Mjl4Aermyg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79be0de8610so9465247b3.2
        for <phone-devel@vger.kernel.org>; Tue, 31 Mar 2026 11:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzHY7VtBsNz8fJnzjO2whXi/un0Nnm41qjD39tkjPsXxFwJqp11kXntwR5rRn+mR77NEsPI4GUUNpXng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MJ/UQPlXuWCP5XbNHNkpHnVotmSw7CFGZS9320TeTnd6wb+g
	tJXm9k/jdHiw8jtuIatFIeg+YjOIm7Hy5XZ8+Zx77uzKY3e3pRO5Sszav5dwXj3tDzceSJpS49D
	VJdXttM3YoGfHxNRy+VM1PaCjdq6CvDA=
X-Received: by 2002:a05:690c:84:b0:79a:4767:238b with SMTP id
 00721157ae682-7a20ffc58b5mr5096637b3.18.1774981053248; Tue, 31 Mar 2026
 11:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com> <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
In-Reply-To: <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 31 Mar 2026 20:17:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLmK2Pxw=Zj_8TsPm8vKcLWwGRjuFzXhHhFgq_ekYmmrzw@mail.gmail.com>
X-Gm-Features: AQROBzBYeESNwniyKl-C50INEHNyIKSVre4W_M1f7i-oE4ahJatHHOaELZwZf2Q
Message-ID: <CAD++jLmK2Pxw=Zj_8TsPm8vKcLWwGRjuFzXhHhFgq_ekYmmrzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:08=E2=80=AFPM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

> From: Rudraksha Gupta <guptarud@gmail.com>
>
> Extend the RT8515 driver to support flash ICs that use only a single
> GPIO for both flash and torch modes (no separate ENT pin), with an
> optional vin regulator that gates power to the flash IC.
>
> When vin-supply is provided, the driver enables the regulator before
> activating the LED and disables it when turning off.
>
> Make ent-gpios optional and validate at probe time that exactly one of
> ent-gpios or vin-supply is provided. When ent-gpios is absent, the
> driver uses enf-gpios for both flash and torch brightness control.
>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

Excellent this looks good to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
