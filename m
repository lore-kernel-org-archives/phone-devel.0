Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8525D2356DE
	for <phone-devel@vger.kernel.org>; Mon, 17 Mar 2025 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208714; cv=none; b=h/gmzhfuQaBf900OVOEogM1quz6RKxsJgxtFV2iqSvl6iXebjwdhRuSUFeUmP6ZVlnJXpmYvjqBmTZqeoMYZeBOWs5bBlvBj5YE9W5PTMc6zHt4a9Ip4sydMThWbNC00fG2zI4C8HjHVEGzxUtCgMdJnMC6Kq9yP52KHJ5PdOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208714; c=relaxed/simple;
	bh=SSJphfXCG2zCHPK6zCaKsC/SKYxjclRr36SEoRuzCYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvf//4qzGW6KjyuoAh+Xx5YQEUI/IlXQpmbGmXS13tj68aRjZpTIjYUmhMM2GEG+TpQvPStVNPRyYhbjk3GUbyy/m50P2/ZPhQDtxIm/LEC2zZwW0U+qlA8G04SREpxwYLiW/i8cFlMFfXgEj219ga86fE9uNdEE0E4JkXv8WpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzjFmyQN; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzjFmyQN"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f6c90b51c3so44106207b3.2
        for <phone-devel@vger.kernel.org>; Mon, 17 Mar 2025 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208710; x=1742813510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yzwXCamUoTIUofZgcVBDy5XB48d1gyjHMwR9usrTvc=;
        b=UzjFmyQNl8zWD2AFanI+KJNP+74g6g45uUuY4j9T+ddntv3g65ypV2RizBC9GwBMyT
         CE8Jko3KpcGB/MtVucLma1lHCEOI25m+KoXYz+TwIDUxjzdzZT9VlhlICnCAECYUTEVX
         JbhXy9oxr20DoEpkHKXeB9o+5wWFQdHqC4cFry8GRsc/nGQ/yQodcTpTeMitU3Bknpmr
         e/QbCS+Kwemj+5ZapkSAAXQZoVvWSmvaR9lYTZZT7+vmY+NbtXXw9hwq45A0p/otbdvX
         euYMzQ84w0gITmXBbGGiy3wXopEOacIlfTVXeHClClpVmz7nE5/G2i8ual4gMRpQI/d8
         ShMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208710; x=1742813510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yzwXCamUoTIUofZgcVBDy5XB48d1gyjHMwR9usrTvc=;
        b=vXuMHb1deGlq4Q0D4K/OdcB1Ht3YVdkKj1of7cGtg98HOdFw3C17MHhk11RB20VMzT
         KBcmy/rOASdFMajc+UiXQEICT5TrnF7ZErhSK4xXEte23R4jgPWmYHWtVpZN2esRKTWp
         wVXUWXAd5jtF0n16Hi8XVEHEpbPK0o8FyWDrQhlg8TL6ZaZOMHtAj4w+dgmRxvs+tA5q
         juawPSQu3YijI6KwULVROp41QtXq0PQNtp48gFRiQDrRZ1RH8vajx3ZwlPGhwkUib/SE
         JCMP1g/TyGAHS9yJDhE4NGNpJ3dUeLPt8geDisV7Jw+MtARsXSIPfyAkDmf32NDWRBwB
         uiPg==
X-Forwarded-Encrypted: i=1; AJvYcCWISr906Yo0qEYIBM+scDVgcedh17DBhOKDTRO4fiYZvgyQfbCnsGqrOW07/4/QucqjpOB+mTgy2xZ8TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzovmhEtM7+04SHyp4vIqWPKi2K6Y1pEPkselTms0mP91H4QF+Q
	Wx1XdKVdcAAxg74YNOXgScU1+b2FdalW+l72zk0522Pq92ToXKq7LYzE9CyQ2equS32Slf8MhMZ
	GR9PSDRnJbUqFOinzMGt8ichigSCH/aHP8Adssg==
X-Gm-Gg: ASbGncvyncQc7aJLrYQFbRbDJylOkhGWMcfi0QNH/SKJ043C9hnoFynqyf7oz+B6LvZ
	sqCED8iIqhtnPOyavMDTHFi3E2bkSMwKdSpYkMX31XGddhABIiL6DtgnL+pvFG4PVGYcqtnifHD
	2v61ci9T4LWy+C8C82DmOpGjMh53U=
X-Google-Smtp-Source: AGHT+IHrpsNOZG0XVeApLlEX5Asu2hMQi9J2yKqum00y7qSmPZ38e0cxpvS/V3TQKrtP/AMHKZMhNpxTHaPPWWrkxLA=
X-Received: by 2002:a05:690c:61c4:b0:6fb:9bbf:d53b with SMTP id
 00721157ae682-6ff460db0c7mr152934337b3.36.1742208710230; Mon, 17 Mar 2025
 03:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310140707.23459-1-balejk@matfyz.cz>
In-Reply-To: <20250310140707.23459-1-balejk@matfyz.cz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Mar 2025 11:51:14 +0100
X-Gm-Features: AQ5f1JpZXdl7aZ24okiADw3I1eeMD-rDqu62KRWTaTVzBq0hjnVagCd7gLvyRJ8
Message-ID: <CAPDyKFp+dZUuif4b0rH9G8NkksgQrVDeHWzWfeRz2TY_9j_gyA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: sdhci-pxav3: set NEED_RSP_BUSY capability
To: Karel Balej <balejk@matfyz.cz>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	"open list:SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI...), linux-kernel@vger.kernel.org (open list)" <linux-mmc@vger.kernel.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 10 Mar 2025 at 15:11, Karel Balej <balejk@matfyz.cz> wrote:
>
> Set the MMC_CAP_NEED_RSP_BUSY capability for the sdhci-pxav3 host to
> prevent conversion of R1B responses to R1. Without this, the eMMC card
> in the samsung,coreprimevelte smartphone using the Marvell PXA1908 SoC
> with this mmc host doesn't probe with the ETIMEDOUT error originating in
> __mmc_poll_for_busy.
>
> Note that the other issues reported for this phone and host, namely
> floods of "Tuning failed, falling back to fixed sampling clock" dmesg
> messages for the eMMC and unstable SDIO are not mitigated by this
> change.
>
> Link: https://lore.kernel.org/r/20200310153340.5593-1-ulf.hansson@linaro.=
org/
> Link: https://lore.kernel.org/r/D7204PWIGQGI.1FRFQPPIEE2P9@matfyz.cz/
> Link: https://lore.kernel.org/r/20250115-pxa1908-lkml-v14-0-847d24f3665a@=
skole.hr/
> Cc: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> Cc: stable@vger.kernel.org
> Signed-off-by: Karel Balej <balejk@matfyz.cz>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-pxav3.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav=
3.c
> index 990723a008ae..3fb56face3d8 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -399,6 +399,7 @@ static int sdhci_pxav3_probe(struct platform_device *=
pdev)
>         if (!IS_ERR(pxa->clk_core))
>                 clk_prepare_enable(pxa->clk_core);
>
> +       host->mmc->caps |=3D MMC_CAP_NEED_RSP_BUSY;
>         /* enable 1/8V DDR capable */
>         host->mmc->caps |=3D MMC_CAP_1_8V_DDR;
>
> --
> 2.48.1
>
