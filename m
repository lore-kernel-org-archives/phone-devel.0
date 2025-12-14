Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A32C9D
	for <phone-devel@vger.kernel.org>; Sun, 14 Dec 2025 00:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765670699; cv=none; b=ntOqvVnRyKMiqkS+uY5hCD24RI6Cd2ycPQi9nUXFAKw2u85F1UmGj4n9gmEjUykEgbdhfTwaeDmbH0hI/Tk8B9KQZWWUaGas6BvNqhNdHiXOE2JILapl+CVnvkA+hOLCsPpSQ4vK60P/f5gvKHtkjiJyf7LVEyb8YDnECHp3eEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765670699; c=relaxed/simple;
	bh=+zQAz+Rb/94sTj+jzifGC0Wl/VBMTW3fTEGmfxduBUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfhNK2P3viwzlvTdiEX5XztNLxOPo6bxzfpGyg2OKzsIxoRE3LQKGpi20ztwucLBQJ+62mIpkkJcsDAZkaCujg/gAhLLrjtgoFDujMIKMA27mPLvsU1GJWgK/r5KaNrH8tt71PS5lfgs7QIMaxAQe2tjPY82bZZNnYcbJHevmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNoA/bek; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNoA/bek"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37e8892d4e0so2435581fa.1
        for <phone-devel@vger.kernel.org>; Sat, 13 Dec 2025 16:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765670695; x=1766275495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BgboonVbxKrO9X8kRKN4BUW9psx0IkF2ipu6x5mfes=;
        b=iNoA/bekPHTxP1q3Nr2OzNojY8sy6H/d8k9YHmSPWix9gHriFGPYgqcX23fodFeet1
         OgIpuxYVeYK/hzPB6YQyyDCOJrMAQZqgwp1YvLu/43oq4+oe1ABoBMWzrLfh2b7/Kww6
         rOsiw9yETELqkwFxZfk2PCw63/W4ciQNm9HO5ckuLLz6CSc/iNyOG8+HVK+2gbZB2U3Y
         ORxlAn+cjwaDRICR/8cI7neCFXdXEqlv7PTFjiwNczwqAJVkJBkS7AsgbrCXZNx3fUrK
         7SfXVedYW2/KctJKCc5MO1T8+N+z/79T4IGVcznJ3dzYhupRzqoMJ/zX7HjXlv+B9oc3
         HpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765670695; x=1766275495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BgboonVbxKrO9X8kRKN4BUW9psx0IkF2ipu6x5mfes=;
        b=uB091pd9owD0z0cfShDcTTwEThLPijhQ6JrNoIeNl9c6axDH0ASgCb6gvtOyrxpXlJ
         R7V/5m8xKAQiFwSt1pbABt+wNSXfDK/weRCpP5dbRrp4WPCr9Y8LWPGa84lBTm5zpWzV
         Nzpqv7Pz0IGYvbe8dr6a6t4QON+/tdVir44+ti/nCWpr+aZrpAMzlaXU0GS1JTMCoY2w
         MTHkptsVmau5u7snazLJ/+S/bMAQaSinkV3chvhbrBF13vwwEIEn0anLgdkK3MAQr3WE
         1keY7Ej653koAMZFIoqWcADzKFb04A3gJ/IUCEisL5p0Bb5TnR0Xzt4/toxW49fiN7KL
         0Oug==
X-Forwarded-Encrypted: i=1; AJvYcCXERqdr0cIiwjj4Z4kdOdCt2duw+tDlHvI1itfDaYJUiidrXwjCfLSYfATSwQwN+2RHcYo4cAyjNXPeGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdqXrtAkBIvYNSJ8FrqwxPjIkaRt5stByVI2iH3mrIpYkqqcOc
	H+JG5Br1pJWnroe2MSuJRLn/36KRQ0SXRzL82GW5Rjv00jEgr8q/M604JjYZAnctmZqqe/BEAAT
	UyPDG
X-Gm-Gg: AY/fxX4TD2EQV3mA22QHuXTYKRFFcTlXHf0lne5OUdxt/HhhXdo/EHFtzjR/CzFL+vU
	UTU97sAaBvStLdf7r7IhAbaY+21AydRM706f5iZrYun+FA78IUnWUDRGEFltme9uaNIl/2n+thS
	kUsNwB/t4FH3ZkRsVhXlcFnsYBhA7c3Mt2e4xPnpO1AhqX4aDqi1Y4w0UIp8mgPRrP4+TNzDJdx
	egsjl7o4cUIVYXcY3CEy6CMA20taRSTQKHNlLxEh7pucfiM65PLnpr3iFKznheMUexQKxCIB8b0
	T7Ii73LLp04+VbGiy2w8hfzJA1KQcU0Ci4Wh+B2Cgpo9O5qXH+BuqGV25d66aqbzhrykIZl6ycx
	XTCuo5+TfReAyxiBaQkAX1fOCCzBVYneCru2Idj+7x6JxD33+LlQGvqX2nPseqOykepAzTq52Fx
	20joeB5IOiG0MZAd5lP7weI2S/yZVDphq49EY+1DxkqNRXxSbjmnM1wVaHBDH8Rhwf4l+iulZBE
	xrW
X-Google-Smtp-Source: AGHT+IG0gHywQrxKrfUQzEHRspDDk2UVqLJp4GZHTOJ02LFhlHAWCfdGIvRgbfMc4gVJJKA+2cbEpg==
X-Received: by 2002:a05:6512:b98:b0:594:93b8:88a0 with SMTP id 2adb3069b0e04-598faa8dc1fmr1251168e87.6.1765670694934;
        Sat, 13 Dec 2025 16:04:54 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598f3195e52sm3425805e87.84.2025.12.13.16.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 16:04:53 -0800 (PST)
Message-ID: <1e09a93a-d42f-4a23-b346-9f158a60d8aa@linaro.org>
Date: Sun, 14 Dec 2025 02:04:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: Correct camss VDDA PLL supply
 description
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/25 00:55, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Usually, the supply is around 1.2 V, not 1.8 V. Rather remove mention of
> voltage from the description.
> 
> Fixes: 849139d46d09 ("media: dt-bindings: media: camss: Fixup vdda regulator descriptions sdm845")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Added only Fixes tag for the initial commit, not all the copy-paste
> propagated ones.

Generally it should be possible to specify a list of Fixes: tags.

However, despite the change is the proper one, there is an opinion that Fixes
tags are not applicable to dt bindings with a given reason that only executed
code can be fixed. So you may be asked to remove even a single Fixes tag.

>   Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 2 +-
>   Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> index 019caa2b09c32..9009cfe993d75 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
> @@ -130,7 +130,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index ee35e3bc97ffd..cb922f90fe900 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -129,7 +129,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> index c99fe4106eee9..2231d7216f62a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
> @@ -268,7 +268,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> index 35c40fe223767..8e6ca94c88695 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
> @@ -95,7 +95,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index 82bf4689d3300..d50e096b900db 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -211,7 +211,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index ebf68ff4ab961..ccd2d024bfd10 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -300,7 +300,7 @@ properties:
>   
>     vdda-pll-supply:
>       description:
> -      Phandle to 1.8V regulator supply to PHY refclk pll block.
> +      Phandle to regulator supply to PHY refclk pll block.
>   
>   required:
>     - clock-names
> 

As for the change itself it is good, I'd prefer to get a correction
to 1.2V in the documentation rather than a complete removal though.

In any case,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
