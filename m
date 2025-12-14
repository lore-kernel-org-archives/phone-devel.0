Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B792F513
	for <phone-devel@vger.kernel.org>; Sun, 14 Dec 2025 00:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765671184; cv=none; b=aMlC08/7djdN3TX+5syceF9Ut1f8BU9Z3UAOKmohMf/qjAd7XiuN2LcrAu0zm2TgTj7Hh/XB1FcdHOL1b0ZpuRMtwuBs6doooxCpbP0ok/WA3zeHUdYYVMCFYeA7TbZvJcvYdOvF7gametMXylhRQZCY2AI34H/subzB+bAgMEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765671184; c=relaxed/simple;
	bh=vsvgbqhg3tSK6U4XQECKskE/ov7KmsHhac+n5VQ3Udw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JU672UOgBF01HLS1w9IsAoQwvjQQkImVnNd3O824rkjkoJSsYGwgmAb9/QqOZ04PT5p2uMRSqzWc/fFV/cgPctERVI/OYfBpBeqBy2EEi6mlpfpEW/Ijy+f5drZPRbk70Gf8hnwg7pmFXw9v+ujy7lEfE7p6sKePhj2m0HUwrNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5dDYa6i; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5dDYa6i"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b8f270a3dso2528241fa.3
        for <phone-devel@vger.kernel.org>; Sat, 13 Dec 2025 16:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765671179; x=1766275979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cs2594TMmAznKRH01WTgorColGdcHW47FTc8OPu5Ls=;
        b=V5dDYa6i22+s70n2bX4cGfZ697Gk4PcK1t58VlXHk/7F5/GYcN9QAh7ZBc4GdO9z5s
         wl7V9lYKCMNv5uPtfQ7Fe2Noi3xyx8PKCB2/EwJVhKuXPsYZSiFtm37rtNmISmLeEYTv
         UyOxkGnO/TcKYR7bjozjYJMTBu56FHHdK0KwziKS9u3X7YIhhftYiNrkVCp61LYB3rWK
         am/OPBs2jM98tyq1aNnPgSNj5f34UGBNB5yjvyT+l+9+a3+ZoI4uzJqyrCga93Pwnj7O
         ozTMnZqtOiSKjfT284/yKSt8sdg2PVj51UJ6yvvYPGzNiFsbHO3kkvnrw0kfWylMw1dw
         48ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765671179; x=1766275979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cs2594TMmAznKRH01WTgorColGdcHW47FTc8OPu5Ls=;
        b=gs4hYOYMuqN40Iyj0F/0VJEpMlNx8EOaMjhlLvXbltkfDtewrCbGeSI3IaSboPnMws
         wzmqrfzpk2R/1uK8hZCjm7tUYKyCizAI2pgdZYptph4dgiOlfDjUyMLI0K8iYn+R+UdW
         HQQVt6yvACl/JdrBknUe+RcrGQPQawEQkfevD/AxHxx64khbfTj7RUEk/27VpyD7Hnrb
         M+gDUsDjilekbWamuW3yH7Rn0IraikGpqu/j+TdaQJEE+zlg+ui8q3rN3LY/ULfFcUZ2
         qURX2NQWEj7QdIg7CO3rF7b5b7odY/X2G1doNv5lNJvG+C3u1rl/VZ2RRVFs9z/SS2py
         H/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC+suBF2Pih4Xzug0fIi+rj5iiALtF1RIjjpZXdDSBHzx/K6ITZo8UH/aZ8VWjzSC1l+ZtOmGSoaGCtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4AVeOcSrV5/6djpc+HrRjWYm71zVv2r/I8iP0ADwBqK7i42G0
	qxpLJA0kZ/Y7SlCnY6LcjsFGZAfkEs+YirrNUWxe7GxLvTA9/UshHhhEQXQXD4SSCao=
X-Gm-Gg: AY/fxX5TL6E0Ktb3OHYijZ1ZpkEYK+llvF/2RgJ7coPJUvnHYB6NA09SwaoMZR2eHBs
	DRXMmiYwLINc7TnPa68VV+yDCbiwaE09Ol94TyWBtE4D2pS3nlX16Vbg6mhpYc1dFFUM8GaOcv4
	SG7uvYNt5cd+mcStfPcXP0RqakHmq95VS3bwf6RTaGHxF5YcXqZ3NWWgvQR+4CfvgN1T+cFXas4
	v/f7ut6FC5JZQ6Ga06u6f7uH00SkTJvUDN+JHbxHJzi0fZCF+vJHoyJSav+XtF6dsRjZ0G7mKOj
	WLRLyorJWolkhcOYVndgUB/dU+1lYkc4pbEU/NKsWZj45fSeEdNGbEFfWR9gQ/DrynNW00Jj002
	39LYkze1QuaVHSzP9frOYIgLG+Vnhr9aStVlWfdJ+c4O/F6lqoeqHL+hzJ5Jey+5HZwqER5NZtK
	PerMEVZ7vAxH0fT3kpOuH2nuthlsS6bAXd7yB1iSxJC2eYOYNBMYPIrWoj0DYMwMFCp+WAToYUX
	djsbP53OMyf7EA=
X-Google-Smtp-Source: AGHT+IFm4BJTCDjreUh2T7xgcVbVJ0wHXDQMXAZTqYS6BUidZybUDCLVjfay5BiQaCQll7cj358FCw==
X-Received: by 2002:a05:6512:ea3:b0:595:83c6:2228 with SMTP id 2adb3069b0e04-598fa9dd15bmr1086116e87.0.1765671179251;
        Sat, 13 Dec 2025 16:12:59 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3194dbcsm3466519e87.78.2025.12.13.16.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:12:57 -0800 (PST)
Message-ID: <bac65324-6049-40d1-b196-6aeafd37366b@linaro.org>
Date: Sun, 14 Dec 2025 02:12:55 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-db845c: Use introduced
 platform wide cam_mclk0_default
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz>
 <20251213-sdm845-mclk-v1-2-197bc947d4c6@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251213-sdm845-mclk-v1-2-197bc947d4c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 14:00, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> All Snapdragon 845 platform has same controls GPIOs.

It's a bit clumsy and not very informative commit message, and MCLK is
not a "control GPIO", it's a pad function.

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 2 +-
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts                       | 8 --------
>   2 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> index dbe1911d8e470..f6c2c98970d76 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> @@ -40,7 +40,7 @@ camera@10 {
>   		/* CAM0_RST_N */
>   		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
>   		pinctrl-names = "default";
> -		pinctrl-0 = <&cam0_default>;
> +		pinctrl-0 = <&cam0_default &cam_mclk0_default>;
>   
>   		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
>   		clock-names = "xvclk";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ce23f87e0316b..981d19c20fa1f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -877,14 +877,6 @@ rst-pins {
>   			drive-strength = <16>;
>   			bias-disable;
>   		};
> -
> -		mclk0-pins {
> -			pins = "gpio13";
> -			function = "cam_mclk";
> -
> -			drive-strength = <16>;
> -			bias-disable;
> -		};
>   	};
>   
>   	cam3_default: cam3-default-state {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
