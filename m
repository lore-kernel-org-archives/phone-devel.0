Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B52848A4
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888972; cv=none; b=s0wkfBMmEb9GuezhnBbhpjBZjKUqxzVJmY/2Wya7fyWb7YELW/mexeQNaGoWcnEI/chV8GG1iJuZNleNlNHNRI5oSADPVT4IC0gwF5SmWvcC32NmUQ3IFTOjnfqRqZsL6ELB+UH1ovByuLCyCO6OX/bfDSB24inAYwZ6iRKU+6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888972; c=relaxed/simple;
	bh=z7drQq9oG11iIvEhPO5abw7OdSmGhX1rnyrusld8MKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Du3QPRAknhKhSii1RhvcNWdfhIiFIHt0BEMtWng3AklWJ+Ni7jML6Igo0MAQpVVL1Y7328d7ez/Vm1iU8nbkSTdpeglbQzF8zoSyVgz0yoOQtuU5TAMn1fSxUsd/7HQRhH0yGd2nqqQwb+YULn9lxRl7CUwuUgwFNpRS3Qs/JGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ql2qRcso; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ql2qRcso"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cee045187so367732066b.0
        for <phone-devel@vger.kernel.org>; Thu, 08 Jan 2026 08:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767888970; x=1768493770; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhLNUAtS0RhnwQEHOv4yBPtPVxgThzVHKtKXAA9eNDw=;
        b=Ql2qRcsoGfa7ezoPTBULqHnuqK0/q0aVTf8wNOl+2UuFIyfL7SKE0V8oy8KHJGHI6n
         8G8vleGiJlcYp5V3/gO5szxgcXLawcGCgN5hOZkE7ZzXJgrn0UC1bq7X0NVRr7D+FljL
         C7495U/wB9THY00Rv5i/IeA5UKOUdAuZYK8rR9ZN4yke/qxsLLvndSSI5+wyC1gkIYfV
         aR0qYlvVEhjDjBRBjyw/G9MD2k7m4P0QPRP5zJyawQeG7zoyLtZ6ZPySz4zikVxm7ahF
         U2AlBx5xpoUf037HuA/DFlNNIzUr+x5m8yVNA62sGRUEFN7XmVC5E70dYMxZT6SmFtsQ
         tlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888970; x=1768493770;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhLNUAtS0RhnwQEHOv4yBPtPVxgThzVHKtKXAA9eNDw=;
        b=A8GXYlwXkPpxzqOoRAXNgYYbihU7z8d9e8HQPv0pqprNjKuBAQd8SVvUx/cZQKPl3H
         /0omybqbAvpNbLEKRWiP3Ryrs/a3wXkbUxfjsTuW1rVBca4CaPm3uz2QbUQ1W+HXmxoC
         eVPS2z7fMgDgZm/mV1KQ6UAXrFwZHapJYlB6jlVBr0fdrcV9GBUcW95t8XAtjwn4Xq4C
         3w2q89toy+CqCeqMkMLNRa68Y8YbAUxR+v0T85pihJDA8cm6hYb+4oep0CR5l7qeD2xQ
         P2pHqU6T0dPjumA06jCPZHoaTO9YP5yhvxGPryj455oXr8/8JltEpaH0xrddOf6QXzqm
         rkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqEgp3BTtf1GSRiZ/7nCcXuf1CnQhXujSq8D//Zfsg6dO1GsW2KW8XZHY5uCZ9itqnSxKfYaLgGwmezw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyE+Z5g113ni0EpiYkTWao30Ir1aD1c3didOSNsJ2AUHV4l+Qd
	6H3PcWQt7NGpRTIVleunacysA2GS+h9elY1vyYepk+Jnej5ocrYrpdmBHDQJmVshVDOcFkjfbYm
	cZSK8
X-Gm-Gg: AY/fxX7lCOwnv4qvAZtvibT+shED1qaHMMmPAc0b1X4zuTpkzn/QbhY+vhEHydV13vt
	6mLswh2RU1sGFj7MXwYV8GGLzqW0RJkPVHpiLj0vTaU/c12pRn2gNxSNkwelBa8I8nkbY+DXlLf
	XVJ7VmwaZknQHCl4Ket5FgTGhslbruVspb8hxMaTH8vqgnqzfILEAow2FSt9eXxmwJaOxdg6A8T
	G8HF309M2eeVD2r7H9vdKwRF5dzHNldEPpUNB6LryFiwVA9rwkwRKYC658X3pzgjoz3jbbOz2nw
	eXHKm/86bIJjXtPce8HtFNaWEw3ssIzz4/oswLvzS9h1fXfsr21lz/IgDTHVmUuq5ezG2ShNAtg
	ptnKCHqjAXMv2ROJeNRKLSL4VOcmc/SW0BjHonN18YI0iQmWyHtuvkbRp/9FzeQPIu3hQ0BGklT
	ByIuNHBzOJkrL2bvlwHCz5rnAdTW4uHKcNVttYGT2vo4lFu6qO+Xg=
X-Google-Smtp-Source: AGHT+IGiK7KhBOb1KkPTR1Rp+DTXsgnemuEjOCmzn3hNYx1944ssDp8hAr4VpNqT6x+0t46c/O+HAQ==
X-Received: by 2002:a17:907:3e1d:b0:b76:3d56:f666 with SMTP id a640c23a62f3a-b8429b129dbmr1061084166b.26.1767888969381;
        Thu, 08 Jan 2026 08:16:09 -0800 (PST)
Received: from [192.168.1.36] (p5b29e30b.dip0.t-ipconnect.de. [91.41.227.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118e1sm841712266b.54.2026.01.08.08.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 08:16:08 -0800 (PST)
Message-ID: <6098b93e-698d-4bd4-9114-a554f21c0bbd@linaro.org>
Date: Thu, 8 Jan 2026 17:16:07 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] configs: Add google-pixel fragment config for
 Pixel 3, 3 XL, 5
Content-Language: en-US
To: david@ixit.cz, Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io,
 u-boot@lists.denx.de, Petr Vorel <petr.vorel@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini
 <trini@konsulko.com>, Luca Weiss <luca.weiss@fairphone.com>,
 Simon Glass <sjg@chromium.org>, Petr Hodina <petr.hodina@protonmail.com>,
 Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org
References: <20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz>
 <20260107-pixel-config-v3-2-02a25e3fdcfa@ixit.cz>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20260107-pixel-config-v3-2-02a25e3fdcfa@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/01/2026 21:28, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Introduce a fragment config for the Pixel 3, Pixel 3 XL, Pixel 5.
> 
> On these devices, U-Boot is chainloaded via fastboot. However, due to
> additional requirements added by google, the image header must have
> a specific value for the text offset.
> This is solved by setting CONFIG_TEXT_OFFSET to 0x80000 in U-Boot.

But the patch itself sets TEXT_BASE?

Please update the description/patch as appropriate.

Kind regardss,>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  board/qualcomm/google-pixel.config | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/board/qualcomm/google-pixel.config b/board/qualcomm/google-pixel.config
> new file mode 100644
> index 00000000000..999d4e45268
> --- /dev/null
> +++ b/board/qualcomm/google-pixel.config
> @@ -0,0 +1,5 @@
> +# Enables chainloading of U-Boot on Google Pixel phones using
> +# newer bootloaders (Android Q/R)
> +# Use for following devices: Pixel 3 (blueline), Pixel 3 XL (crosshatch),
> +# Pixel 5 (redfin)...
> +CONFIG_TEXT_BASE=0x80080000
> 

-- 
// Casey (she/her)

