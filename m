Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCF025C82B
	for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768440; cv=none; b=n3jaJoUoMGhTgu5Jf6Bci6sh+sWuZu87vLQfaSjy8SMaz64R/k1m8QjKgDXLPenPVlnTzeZgBxZS0l02NBRavjU0BluK7i2eKF/mvZettu8gAcJI4/Jmh02C+NgQ5iom1lDXX7Tll7cIOXGJh8sYVHD8A9gpw4WqBgdsGWUOQL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768440; c=relaxed/simple;
	bh=Gg/5+OCk/JudsRhzmSzNzSjmr7paX/t9QtRcjJ+oG1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFDCi4Q5bojU++2j9rg9x8c+knoJc8wDbUc7EddTCoxmCddTivW6hilPyP4WwSdDabW9q8b2b0/r2HBOWjGPfUSIN6X3vwBBWGsYk0JI9jtSKbv+6YIg9DoUArUIFGcI5okppeJX/exFL/JxbpTabOW8iukhkxbLSzPaJAD+kQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjyEKmom; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjyEKmom"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442f9043f56so33248925e9.0
        for <phone-devel@vger.kernel.org>; Tue, 20 May 2025 12:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747768437; x=1748373237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2ItjY+ppg/pynow7rBGAmh3XSiTvHkJttkVqK8jN38=;
        b=rjyEKmomrbo9OLuE8V3A/iyAW4qPfEdpJpzRZBgxbQgf96I1Q5Ckpcq26xPSMUZ9hi
         KJOB3c5DHS7zMoKbKd2rPmzNg1Grui8zZl86gQJRvz8VGh/pLabYqmHGX9GULd6cy63F
         tmlRNVO8CgFLNKAPPKDemwOf0Dip6i1zDswMSK9fmbTf9Pqg8opklyOtGqcCzERyFl0E
         OGVy9UJib0cF7N9131E2K/0PktyAP6FSv8A1pWLhfOQ00BGOhTLTuxPoAeQo1x2vaC3Y
         7C4dXUKwQcK3rzdXtzk7efdzTwP+4TcETOoF7VnsSXsTiR+/fHsWcAZS98ifUw4gExze
         JOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768437; x=1748373237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2ItjY+ppg/pynow7rBGAmh3XSiTvHkJttkVqK8jN38=;
        b=aV+gkLu8eIy+KmzaKTWBivjiBMr1oy4Q+/NwUuZTAlaHMTS6QwL2kmSCvZtbwnBcFv
         wo5mSp3HHIYIsMY2Lo68XpTxapwI4GEv1hGYDW8cU5GyBIICt9gj4sXi6tC8GMd1TlEn
         frFk5zLA2ZkKDYSACqDQmCY4ggovjha5keRTIwyqQzJM5wuJklL5cm78joLhhtIDsS8E
         Y7qjpa6c12FeMsssuB55E7N/26v9ky5yw+u6cdeH/Ky9LIuoG8BXfQ59UlKKJECfC6LJ
         Ah9jfF9IE237u/ZO0P65SDBeS2ejv4istxXPjXqv78BiMU1hbEVRvO3Zo3mLMccRSYGL
         sG7w==
X-Forwarded-Encrypted: i=1; AJvYcCXl116JzSlYi25vhbZBm/771NzUahuprB5mSO53pvyTgGI07ENuA9o9qETnY7coK57K3uYJ+Yo08eVKfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LBXo7oK7z8SThXgiFedKMfnDiWnESPuyVJu6JGCekHSDgsIR
	J4yB8JXpKFRHr7gTKGvjGuq68yB8hzeZSLYi7Tof1hdx4wi/bbntFtcBdEFSv8UWdpY=
X-Gm-Gg: ASbGncvlWnd7cbYqG2RpjryjsbpGihA7KSJCCx8Y3s1go5Ot1hxQWje8RxaWgA5YEII
	2+tKQ1zPHpkh54FhXfcLnXs8LbArbNtGQfScBwz11nYd058+ATpkCwDF0dM9Iox89ddfFs3JCYJ
	fRZ9H0mqh3LjCd+h+EU+m247tEHH/aEBVfTjui/oALBK/mdO/+geHbLkqrvb4tapQqQfCbza+6C
	8u2hAIZK9C/MF/K86Ol8vwTqoRfQGpIbeTaUo2pD4w8N2PullBEnUL1eq1+QIAyUFDmVWejhggR
	VhczShIWilcZUVHjqAUxqoGnas2xrsT32LtagSnxX74FvEAg49Nf2Ggy69a+X2wukU2J/ovmMte
	oCtqTLgl3Ws7p3/FcSqWsHmj36UM=
X-Google-Smtp-Source: AGHT+IGcrcIy9jaEUMKlVB1MmWkeb0LtHs9wFmRKy8FWnDAUbDIjQBgUB938Lg+/2PJo87PETkuX7g==
X-Received: by 2002:a05:600c:c0d2:20b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442fda2e7d3mr96042025e9.27.1747768436961;
        Tue, 20 May 2025 12:13:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0554fsm40830215e9.9.2025.05.20.12.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 12:13:56 -0700 (PDT)
Message-ID: <f658468d-1780-4995-b9df-96dc0203e045@linaro.org>
Date: Tue, 20 May 2025 20:13:55 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: qcom: camss: Add support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250520-camss-8x39-vbif-v1-2-a12cd6006af9@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> +static const struct camss_subdev_resources csiphy_res_8x39[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = {},

Regulators should be declared with the PHY not the CSID.

---
bod
