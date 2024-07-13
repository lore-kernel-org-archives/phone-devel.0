Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE94963F
	for <phone-devel@vger.kernel.org>; Sat, 13 Jul 2024 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720894928; cv=none; b=HVI8VRtBdLRbfFavzVZq9M5hPz6RlnlXMUKdg5m5Ey+CviPq+8MKfDlVDR1cQQdqGrj/WmSucXIySvC3oTXTC17aGkdMdDMzVJbdTHst1G8anQ4F2oh37/3qhB9+dSsjC/9JrucaX52SwmBwQZCD52ptJQV/4ToAQgdqrtJ9yag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720894928; c=relaxed/simple;
	bh=wK225UtK9kULJZqIO8UH+sthg1ntv0kXHyAI+XYzS04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYun+EBxdNuJa7oUPwVYvZ/RgociNgpY9BPf9Ojj96/onaYofgkGIrNAxnv7lFKRsN7djRi7Jvlqf7eQwXtWrCmHg3Vkz5fBW89Z5DjoZUmPW3lZ9f6A+l63glpinSFcjyECHmHazOxFs++6xeI1guHrM32N9h7KkIJrZylOv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbP6E3Vy; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbP6E3Vy"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-654cf0a069eso26085587b3.1
        for <phone-devel@vger.kernel.org>; Sat, 13 Jul 2024 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720894925; x=1721499725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Akd7PvYX49ssVnM7IV++4JO2xnx3E7OhyZAKQW51cYQ=;
        b=PbP6E3Vy1paO7eXsMLM517BNtjLJKcXW42q0Pt4RuwD8L5DWWm+bakcYNSfxhIY2WL
         UU1phzs+kZCBhpzi3Hof9BJl2cF27hK8d8vhCL+NUMvJJJPgPKLK7440bvC1pwzHUszo
         zz0jVbzpa15gNG1/ljbhlHX22UPUhB+X4RzvfJo+V2RT/YJ13sBcu1vzoBRYHlskWdek
         VO7xek+wLf9zQaOoB74lIRr7mJUuFBM9wTphava6TF+MCE5+nU0JB61ipWB4xmuKCRmV
         w2yCmIvRsKi0OYQAE7iZUFQiuEbjw+dLV66XzVUb03ZJxgi+UgBlpjHz1y3jEHguEI7f
         Du4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894925; x=1721499725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Akd7PvYX49ssVnM7IV++4JO2xnx3E7OhyZAKQW51cYQ=;
        b=bWNAPdpcYt/IfYlUhgKOPHbwlQEXQOh6JYhGHx9hm04Mk+tO9qR9v2JSHMzeBtArwL
         VnGPfoBmZscrAW0sQDiQCfbSUP41vYdj3zTZnXFMQbDoGy7mqcDO8K/V+85emA4xpvA5
         xxJaJI5UgliubXDX3AW6mSWyAjRemenE9hAkd3vPweBfDjbKbK3waPuk0/qzUU44uLnR
         5846HVXsgNCooVTVJTabIEkrWy+CvYkbknd4iMdHqQ3XFc+fMhi1V3CGqAVwaetodNQZ
         b0TtkWLGRKanBX8vmgNXEV1Cy/iru9I/k6ctpLaUZP2FfzjNO13eaGZ+6F/cRZuF8yYG
         Wolg==
X-Gm-Message-State: AOJu0Yy7Krb5e3YHwOOx2MpeWGMDXCOz48q100ry+kSojo09O+AIt317
	sH3G1zDSmdl6PZt5AIU1y7ckA4xUYy7oHtkW1LkGZ/mcQnGAwUGorIJEYx1NfpjW2GHdGRj41nR
	dBcrcubpkqvsKja+3LYz96gCcCM/Z+fO6Bn9nHw==
X-Google-Smtp-Source: AGHT+IF7EMeFiP/0SrTpXb2U5NKFBozXUrANl7EuTHc+/YdpAaGakABMFnFuzd0mAN5AT73VZN70QaHdsJw+9r4Kllo=
X-Received: by 2002:a81:a552:0:b0:65f:dfd9:b672 with SMTP id
 00721157ae682-65fdfd9b925mr17814317b3.11.1720894924969; Sat, 13 Jul 2024
 11:22:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240713180607.147942-3-virag.david003@gmail.com>
In-Reply-To: <20240713180607.147942-3-virag.david003@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 13 Jul 2024 13:21:54 -0500
Message-ID: <CAPLW+4=G=U24jw+KNCibqPQUVFkOp4Rk8AtM3mnJ89+ShW+G0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: exynos7885-jackpotlte: Correct RAM
 amount to 4GB
To: David Virag <virag.david003@gmail.com>
Cc: phone-devel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 13, 2024 at 1:08=E2=80=AFPM David Virag <virag.david003@gmail.c=
om> wrote:
>
> All known jackpotlte variants have 4GB of RAM, let's use it all.
> RAM was set to 3GB from a mistake in the vendor provided DTS file.
>
> Fixes: 06874015327b ("arm64: dts: exynos: Add initial device tree support=
 for Exynos7885 SoC")
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/=
arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> index ed2925b4715f..0d5c26a197d8 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
> @@ -57,7 +57,7 @@ memory@80000000 {
>                 device_type =3D "memory";
>                 reg =3D <0x0 0x80000000 0x3da00000>,
>                       <0x0 0xc0000000 0x40000000>,
> -                     <0x8 0x80000000 0x40000000>;
> +                     <0x8 0x80000000 0x80000000>;
>         };
>
>         gpio-keys {
> --
> 2.45.2
>
