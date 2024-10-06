Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E353A8F0
	for <phone-devel@vger.kernel.org>; Sun,  6 Oct 2024 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728246396; cv=none; b=UkEKuCByzwsTTSgE27A5UGA9NMEYw2iSmQbTmqB9izUCZkmszW7cwX3668Wi0JlUXGUHecXHRu0+Aip9Iz9x6gQEX1E4Ywu9cFYd31kie7Zdo3i1bMjls4t2+nvMDo2/ji61+Bj4lhFZtIamnbHcNL2rp/jbCbNfs1N/8iQpTTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728246396; c=relaxed/simple;
	bh=i1HSlcfG6Gk/k+UqtSwJNp1NND5qicT3kFk53HYZUe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJpYZ8FOK1hZWOgoDNdk3WSSuF3wsbraNT/kkOxyn4LKCr+iq2Da++gTPehUYCcEzM5qsJvim5ur3b/0dnItB8fqcjVw1FgTTGhhmvIzv6Pnnipu3jYH2AwLp6ft5zS9bAdx0eJVSO7uzQP0df0UlNHdy99h9aXF6aPsyeUkJj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7hCGmKv; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7hCGmKv"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad5024b8dso41340581fa.1
        for <phone-devel@vger.kernel.org>; Sun, 06 Oct 2024 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728246392; x=1728851192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBuPk8VD/ExsghxOi7SybSYIm/8sA+XnlePRO8akAWg=;
        b=d7hCGmKvqcaYbXke9FlfQ9E+9EcrwGRTml1Z2N+3RK6hqeFsFr58iSCDT+qkrX6IIG
         tnx4AD46SGeTadjAZe+MgAFCxDt1T/qR72R/NQV6ctDiTfqSlXkO94gQHslzt1yPY4De
         AFOJ267G6c/hVI7C3Bt/Yj/MmITxSktYArh6yFd2JUQ8uvqz+F+vMkM2zARnzwwUNVgC
         neaBIpuwbNDtonld4K4Tt9GMsJ+aoT4caagv6T5uML1W8meKHxAEpCiNcKKPGpLSnSVV
         PJDsIahJZ6Sy6D4kJ+4bI9YMGAYAmu2K2ZY1mKF8yQiUoXSoInxPItGovsEE2iXEFQzG
         zjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728246392; x=1728851192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBuPk8VD/ExsghxOi7SybSYIm/8sA+XnlePRO8akAWg=;
        b=aADod4nXvUYMKcP7l9MHcrz6rJg1LNYnufmDoyT7WkELxrSxE+8as6E2NMlseHlEBd
         O+pqqliVGDLWhoOTUyUIEf//Row1oWAokwAyOr9Sb3HQL4Z30xRtgN5e2C9jwDIHa9N5
         XBa8gJdkdli/xp8AJfOCRm/hyRqiiEfyztLDStqfOmq7YlM6EpEO0g9QVRA26hPPufNZ
         4ug3Mz1JqZV93lqEZ4gU0KmSUpHHi1DMoUTYUYgh5vJx3K0tXZHZv0pAEzHHAQV68oqe
         WWNNhWmfqoXqtt3OsBWxkYz5EqltChgLh8avfNP/KbKjivT29kgVpYDY8UNPEOLJCuc8
         /9fA==
X-Forwarded-Encrypted: i=1; AJvYcCX+gQVRRb7BesCH7gDjijEadB9PwyrhoHhXiSPSJhbbuFNxr57GELm1AQ/8xtdXrgg5M7/bSE0KzFAOWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4l9GQpa3K4rQzKDspKrq1V+VFUNMHVY+uxHzTwfiFoPOV7jhU
	55m5/c18kZLIlYAIhc/Ujt9/IpsvOTmGORq4u5rWTmbzSj/eyi/lBF3W90kp7VqHWGVgFKauR5H
	zHG42Lanf
X-Google-Smtp-Source: AGHT+IFWMqbwIyqjBvX1et2WcBrUvnbXH6lIH+e+p5RToYoqEH6r+OtkMZyvqhjPIOtHuKw7nRa7mw==
X-Received: by 2002:a05:6512:3d10:b0:533:4522:7409 with SMTP id 2adb3069b0e04-539ab8c2165mr4593871e87.53.1728246392322;
        Sun, 06 Oct 2024 13:26:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8b66sm602501e87.119.2024.10.06.13.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:26:31 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:26:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor
 for UFS/RAM
Message-ID: <fshhw6lknar4z36rc2sjjcgkiixpp7hak7gq3j373mjvbokax3@7s7kmzlmtjal>
References: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>

On Wed, Oct 02, 2024 at 03:01:08PM GMT, Luca Weiss wrote:
> Configure the ADC and thermal zone for the thermistor next to the
> UFS+RAM chip which is connected to GPIO_12 of PM7250B. It is used to
> measure the temperature of that area of the PCB.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 8ab30c01712e0b7c0cc1b403e0fe01650315b9e2..fdc62f1b1c5a398abaa71818fdf2858fdc445d28 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -207,6 +207,20 @@ active-config0 {
>  			};
>  		};
>  
> +		mem-thermal {
> +			polling-delay-passive = <0>;
> +
> +			thermal-sensors = <&pm7250b_adc_tm 2>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";

Is it really just "passive"? Especially with no cooling devices it
sounds more like "critical". LGTM otherwise.

> +				};
> +			};
> +		};
> +
>  		pm8008-thermal {
>  			polling-delay-passive = <100>;
>  			thermal-sensors = <&pm8008>;

-- 
With best wishes
Dmitry
