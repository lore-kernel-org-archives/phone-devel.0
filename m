Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0291374C3
	for <phone-devel@vger.kernel.org>; Fri, 21 Jun 2024 21:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719003672; cv=none; b=GBPJv2U47JeuimDvM1XNPYc2zf0JNvXgTgXzgiqnRugICZYKRq0sP1XG0vksytZ0UxYYUQwApJ2dEM9Qq/8dq2pH+U7ETi1euO2/YXFsuppiJDzr10hmBf57Mz7Ma96V3BeW6Df41Ajc3IWojMDL/Q0rcqcO/oH/da4vbrEkY1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719003672; c=relaxed/simple;
	bh=r1NowRJipfzB30i47UKAvLVjWIfE1kpajQsXNuqHCzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nojwOpTyl4rYmok5ba+akxhCDaVf7M9FM5vLT/4sD/bEmOBkvIFdVqRRZWFM+yvVliigSRm2aXaqJ7+Q3UZ1g0/OkD678szQH9250kBoHuKTzwG5Ce4dEAttbywoBX2lhG7uv5V1VHfgktMU80GzHKpxTk18Vn829lPDtGj7qwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsIx0lbm; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsIx0lbm"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so1113019e87.1
        for <phone-devel@vger.kernel.org>; Fri, 21 Jun 2024 14:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719003669; x=1719608469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MR0pq37AFaUSgmvqO3ZUjRvaH0Q8OniBl660xU6Kqts=;
        b=LsIx0lbm3GldOWpV5zcGt4iMMjm5jnNypwcWCJZ0FX7XFmyo9DY5PiBf8FjBLpcS6Q
         JamSA8v+D8P8b35xgvlkR3iVyrzwApTjhJwyDF0i7Bv1a9mLEjHOpMiEwlOHEwuoP50k
         AkUOTCUdJ26yNWKngwaEEemHWvKjWGkA8bYdVHjJICPRgI5GX3a1HuChNtqIanxTtD8Z
         y3bEgrfKFokwh3TESrn1OO05rHZsgG4ufOCC8K8kwUIYTn+kdWzTaXw1TyhyOmC40lET
         /5rnWuN4P9cD4t14R9bkIgleckqdemfiB+48EnisyA0C+HRY8L47/Hdblf/Oiks8mZL7
         KLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719003669; x=1719608469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR0pq37AFaUSgmvqO3ZUjRvaH0Q8OniBl660xU6Kqts=;
        b=Fpaof+qX/VWGADxTCIlwhg4Nrqz1GHnsbRg1OGNaVgjI1Kslj5EfxUOap4ytL1oIpw
         mwJ2rEJ2UYj7aQLqaA7lDyJYYnUkr0+CJ5ZF9Pwv2ISeyTbErf23GH3m32pafiV3L6wc
         BemAa5el+7gCOQOR/izelGasRt+dp9rwSr/Vtn2xPs+cE3EBZ7owoHyyRQn8OiLGk1qG
         0l6nHLCJnh7jbCiYozHm+1yNZFS0BRsI9AwGGCqqKHrJsbN+NiBUuGO5dhlhQaOnDxmm
         HOFwnIRTi30kw3wq/BrpPNWGvqDM3m2kVQo80Qv/aUEGe0cuS4HLAHChsvrUzU6SQu/r
         TAyA==
X-Forwarded-Encrypted: i=1; AJvYcCWTzCJBscLGnNNI+JBv4CQ/6yfv8LkBofzhlkTzh8xE/YPuSqa8QVBVENVle9BGbDWskPIUmjycTmzCKDhdnK9omJwbCqmwRqQWwMo=
X-Gm-Message-State: AOJu0Yy8kj6/t0yK7q9obK3XHuGyZgpB3r1q5SRaEYYt95a7sey5qv40
	wukW4Ns5QXrHAbWyHiEK/Qt/+rhTfD8h4C+0xueNn+g3f6m3AVZpMlT9dEW4cfs=
X-Google-Smtp-Source: AGHT+IEEW5ijUuPiugCxz/kwSbiittcMaFfgfc/yQbBM7kgngVvBeI7F/QcSaPHdfkNWuZnR0+uuOw==
X-Received: by 2002:a19:2d4c:0:b0:52c:d96d:7b4f with SMTP id 2adb3069b0e04-52cd96d7cfemr1352156e87.40.1719003669028;
        Fri, 21 Jun 2024 14:01:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cdb4a7215sm170809e87.171.2024.06.21.14.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 14:01:08 -0700 (PDT)
Date: Sat, 22 Jun 2024 00:01:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Valeriy Klimin <vdos63@gmail.com>
Cc: ~postmarketos/upstreaming <~postmarketos/upstreaming@lists.sr.ht>, 
	phone-devel <phone-devel@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: qcom: Add Sony Xperia Z3 Compact smartphone
Message-ID: <4zpqdpeulfejfbnkp5prxvznohoqmdxcomztbbl6e3mazxdew2@tppmtxqxxpkk>
References: <20240621-sony-aries-v1-0-bcf96876980e@gmail.com>
 <20240621-sony-aries-v1-1-bcf96876980e@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621-sony-aries-v1-1-bcf96876980e@gmail.com>

On Fri, Jun 21, 2024 at 11:14:46AM GMT, Valeriy Klimin wrote:
> Add the dts for the Z3 Compact. This is currently almost the same
> as the plain Z3 as they share almost the same hardware and
> nothing device-specific is currently supported.
> 
> Signed-off-by: Valeriy Klimin <vdos63@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |  1 +
>  .../qcom-msm8974pro-sony-xperia-shinano-aries.dts  | 44 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
