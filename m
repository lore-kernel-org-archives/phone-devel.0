Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C41FDA7A
	for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737971065; cv=none; b=BVqpWcEty5HgZyERNegLbhItGhbmcvMS6TLFm2YlcGAXxqMy9Nr/mIcLmlTqrod75wiB+XSfVjGZXU4bjTPYkkoox0+w/5qqPf4O1gI7mpyNm2Lc8FDKRmWp2hRhyqn+cLaufHMKqxkrVWz4MKxa+ZIkyr1FFaBOu9S8gr/oqwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737971065; c=relaxed/simple;
	bh=9jJZyeUyg0zikH4UtIlg5nWLIpseFqe533l5KP1qBOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcBoHOfbTC47iHcVfhF/Of6lf1FNFLqdtqDqVWQymzBMY6Z2eG7O6RamlytJ4qVQEZ1AbsD7HCDFPdcGHBJlfSw6KguKXHcLZvAluqWPJQQOktu0+G+kcPB3DL7Jy0gVIXZuoglj1Pfy2mI1W1kqX8AgYLV9ZYOhVgA0SY69J1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxs1J9uH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxs1J9uH"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so675917266b.1
        for <phone-devel@vger.kernel.org>; Mon, 27 Jan 2025 01:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737971062; x=1738575862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+g42ZZsF9uGOWVqjqCc38LCDEOFw2n1iiO+fEJtZ9qs=;
        b=oxs1J9uH0IVQoHJLkYHDlqMJIoofT6NLaOvnxREbuLRyh2SqtlSmHmHapfriyEXK1/
         ihUHtVNfTFrYBWoCDMtIvaBmVhmprvrXiL040FNxbFkz7ONi/zna4EhA+xvDPYnG2Isn
         5daFUTCTpPDWp7XRe2CjeZVEe1l0DgSOxh2bVT0HWNes6u+CKSSuboj14sFQg3ABBnCZ
         Dl0BbJjS0USAQ89xn8Iaccgwvl4Ut6s7qBwEBSpnZc367FfQY5vROIuIZYY5RugzpG0Y
         3BxE7q9Lsa1+ojPraFqmkJ3GSRTelkWv2UOq+C84XNOXqR4qmBQpdkJs+sFgElNzXbR8
         Tzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737971062; x=1738575862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g42ZZsF9uGOWVqjqCc38LCDEOFw2n1iiO+fEJtZ9qs=;
        b=Ovi61W0A/qr56gdvwuKds1jWDvTG42NrHacoeCwuj9XwRIK1h4o12vGNegEBd/qWSs
         IKZO2VpVdL8Y/zhsUYu2DTNIUbKDXTTgelqpK7oCFMmBZBhE0sFJ61foiJQdVcq2NHsY
         +yDS8Agix9tGI3ew5Ii/HkgERmdCWLXn8zQrqggZWtYHrYwBcH849sca4XW+69Xk7sXO
         NWN4A7sC4ldBnA8LuLG+HAt8CnIZPGckmf38I613vZE7SKK3dkBsVRfFGRfQyFwO7cTV
         BrD5y73eqXQORsYxsgl6Drs8mwAM4IL0n6W8u63hvln60FHmDP6jvMr+jJhGFD10oPZj
         mj8g==
X-Forwarded-Encrypted: i=1; AJvYcCUdcodE90fHGNA0mX/W4iz4gTJojunL6D4eJxYl8p/mHvcb/+RX7hkvK/jr16ksLazDYBQtdK2jUbPzeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP30a9pD441tZtt+tyON23dNJ7O2sfMCFK7WF3Db/i6ZB9t7oR
	smj6PnjoRj0kOIVwpxXT9qUMKRxctlDbDxEyySHPb2IV1m2tm0gfIX8quXEuK1Q=
X-Gm-Gg: ASbGncvGjn8MZkuzsAopnGtndj0/R9LqIHV2zUhWbGOitZPLEC9wFN5zu5FlOLnvA/w
	bTAbb6DmzI3W/eYa0k/1cJDCoMhHnuxMAxPwjQP2od2P0AFMeEswvZ+bOSkd5mWaQojZPCucGiy
	2qiq0tDCQmXTL68OgK+zsXXGbcugE23+211zJwYlfCtih0R81ZITd2AABGcpWv3hJwp3Ls43+yL
	isyw1gFcMJ2Qh3OEsH3nV0IeXglF3ZLfu6P/qRPeJX/ItG9LGDxV7BP3FWgVE8a5174Zr60+pVy
	nr8y0evAd7zkRjkG
X-Google-Smtp-Source: AGHT+IGSnkZoIxf5l4DY7TrfG+TC93Dg72qOcjfSrizHd0Z/5y8zaPbCHfMSy2ZUXYKHJebPCxzUHA==
X-Received: by 2002:a17:907:d1b:b0:aab:cd45:5d3c with SMTP id a640c23a62f3a-ab38b3c7729mr3974838666b.50.1737971062028;
        Mon, 27 Jan 2025 01:44:22 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e67814sm551424566b.74.2025.01.27.01.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:44:21 -0800 (PST)
Date: Mon, 27 Jan 2025 10:44:19 +0100
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] ARM: dts: qcom: msm8226-samsung-matisse-common:
 Enable modem
Message-ID: <Z5dVc9yTynAsPDcZ@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-9-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:28PM +0100, Luca Weiss wrote:
> From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Enable modem remoteproc on samsung,matisse-wifi & matisselte.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index fbd568c7d6b7415d240aa1a2329d07cf9135274c..4155bfb2136022f2a85d69451c34f06ed2a700ac 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -225,6 +225,13 @@ &blsp1_uart3 {
>  	status = "okay";
>  };
>  
> +&modem {
> +	mx-supply = <&pm8226_l3>;
> +	pll-supply = <&pm8226_l8>;

Hmmmmm, so I was looking at msm8926.dtsi downstream and it seems to
override the msm8226.dtsi modem/mss definition [1]:

 1. ext-bhs-reg is dropped
 2. vdd_mss-supply is added

This common include seems to cover both apq8026 (matissewifi) and
msm8926 (matisselte).

Do we need to handle this difference?

First time I see such a difference between variants of a single SoC.
Looking at all the overrides in msm8926.dtsi, it seems like they made
quite some rework for the "LTE variant".

Thanks,
Stephan

[1]: https://github.com/GalaxyTab4/android_kernel_samsung_matissewifi/blob/45f97bab323176fead18c8ddc20dc57d979904a3/arch/arm/boot/dts/msm8226/msm8926.dtsi#L32-L40
