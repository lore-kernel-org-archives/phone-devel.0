Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2911A2398
	for <phone-devel@vger.kernel.org>; Wed, 29 Jan 2025 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738139008; cv=none; b=PAVIzHGEejkUMhQN67tUZxF62rZZ0kzQA/OdJUaXfVghRPWe5450fal6Ggiz3ABX7ZYh3WEPD3Evf08J1LNOgqE+eK7Y7Dkd4q38WPcJ1D+wi/5xcmT/9u9eWKIt3eQJr+BbPeIJo67kEDU9CgMcAtulOyQDcaRHBLQX1MMC0qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738139008; c=relaxed/simple;
	bh=uejUUST1opmqRaTR5XJy0DFI0pe4QxyBJmqR4mHNSN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D65LFfJ6jCeem6y7WO6e7Zzk7acEGz9E1zIOvL/gp15VSlOdE1D73AfzCTuEvrruYM9tn47H3KQiOtzYk8aYLIbWLPoOdb+YIpg6PDy+KAU+Sru0VsCxuZFUoBh16KUYhbyBg44VKjxQMeMmVDsGy6eQSomt2KkqM8CtS4AnzSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/7ianeD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/7ianeD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e06af753so3551011f8f.2
        for <phone-devel@vger.kernel.org>; Wed, 29 Jan 2025 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738139005; x=1738743805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=REiAgAPW11GrxLH23I9Y9SYOwDa72yoOUkYYYg9Uj6c=;
        b=x/7ianeDpTPoctFVpNkGhR5GGtRIbtERCrDIO7asEbMHW5oo5ZYnprYsa5NfBkRv8r
         SZ+ATQGaQmVchKPDC1OeUKidCtg8sAqHaN4Y1/XZGRlzOxrVJRlwLBQWgYLc938Iieyl
         0S1ADwW5hCTfN4g6J7D8yDjMxbgJ81fKU7fvDdNnqcHsICemTDRYdLc+2mN27/mEetsq
         ejYH0AJ+XOmTSzT6EjXFBKiUAvoQFUYnYUyhhkcxIztoG4t/XwL/ymdZxFpXwty6u2h+
         yjrfWP3ReouA3B267a3Hlu9XgMRatWspFSh+da/60nYlPtoyJ29+q3j/P6xJAVyjuQKr
         KLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738139005; x=1738743805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REiAgAPW11GrxLH23I9Y9SYOwDa72yoOUkYYYg9Uj6c=;
        b=afXNkpkfXdewelhQv1a1vr5cWCDc9WA0Tsg7m/cftiPHVPv0qulWGWUbGIzNPWTCyW
         xBVFC5v2QNbrg2ySgIF4er0pW3jSmp7UdGxzC0ruVHOxqQt6QpfWfU3i6o6Ltt9LTg9E
         J9KthMnaFlNVinNoydTizELy8Rmu0ZjTwR//nkI2G09DOZjbs3eYVMi1mbbF5gjC9+d9
         X+HMcNjAY7d3+1ty+p2fJZMLHzqK6FO0ETOK2XNyHSkppM9JYcgpEkppXBM3BDi9/jqN
         7EBjrkmXiPGtvqYK128iGEP2aTl48JFSqlD4geSYK01Fm58tZyYyCuwNiEg23g7fRlei
         /evg==
X-Forwarded-Encrypted: i=1; AJvYcCW485+fl++hFcSiN3fS6jRXwSpsuSRwiVw3U7yEv4TXApgYbAGwmA/iP73Nu8S/igDVNXLhtGx2zh/UUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPgYy732/kMBqQF0qvRg1OOpdTGny+C4kxi/JTBMQmuDHlXGxY
	sMyzZZy6Eu9U/q7WFMw6CDkZgWeC2p1wgxWO3h6OweNunqQgQymmkX5kF+l8f3Y=
X-Gm-Gg: ASbGncupRGG7T+HNhcC7jSNP38Y2P39wV82xfAUr7B6a6niYXKA6BW3ePZQff5Neo9H
	V6KYS/oOYkc8XotsRd+tDszTjz/ztCiB393GsYG6Ver/+aAxRiLjgkUudk8tkGxtqIYlHI1NHFp
	hF20U5W2tFdb6vgOR4RcLC5W7AoZVDRo0MAQBhQTTTZgLkEwfQ4ADPLQAYMkFjQnmAP8rbkTjPL
	Xq6SyFKyMGmbCLbH49HVoG4y3LzdvPZm9v8dwttV2fVG4LldjexH+VcZLcbK296FdJ84Lbzgcg/
	4WrvHfmaFROfS+CAN0HEsg==
X-Google-Smtp-Source: AGHT+IFfgVNZLk86gjY7HWPBeAQ2yJ5J2A4B5xehdoWawG9xRKTdLfChNruGhUqnheXhhsiFsS4cJA==
X-Received: by 2002:a5d:588c:0:b0:38a:8f77:4b with SMTP id ffacd0b85a97d-38c5193206dmr1538571f8f.5.1738139004561;
        Wed, 29 Jan 2025 00:23:24 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188673sm15954574f8f.46.2025.01.29.00.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:23:24 -0800 (PST)
Date: Wed, 29 Jan 2025 09:23:19 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/13] Modem support for MSM8226
Message-ID: <Z5nld1JiaqWgmlZ0@linaro.org>
References: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>

On Wed, Jan 29, 2025 at 12:35:32AM +0100, Luca Weiss wrote:
> This series adds support for modem remoteproc found on MSM8226.
> It also adds needed device tree nodes and enables modem used for
> location service on matisse-wifi.
> 
> Also bam-dmux node is added for mobile data which is used on
> 3G/4G-enabled devices.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v4:
> - Drop mx from .proxy_pd_names for msm8974 as it's always a regulator
>   @Stephan: Please check that one also since I still picked up your R-b

Sneaky! But yeah, since you drop mx from fallback_proxy_supply, you
should also drop it from proxy_pd_names, that makes sense. I didn't see
that.

Thanks,
Stephan
