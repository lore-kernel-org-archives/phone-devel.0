Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8D7280329
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838076; cv=none; b=Nqev38GrFQDVnBfBpuyCTTrlanWD3ZRKh8J/3xfJ1LmBWbK3a9PwJRsduwsycdUC72OuXG1zvIp4qZcnGtSFR9lltp8GYu/jArAhEUo/jFzq1QL5Yj+i4k8BROCphpJo1wyeTaxLA6boNE7b6TQpkjHYYvMfHkBle9GF5qXXcX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838076; c=relaxed/simple;
	bh=haKwnk7LAe5088Nk51Nv4mgC1HQ0jAtSjW0cfHLTAUo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oEw4qPyqe9BMjKBcAt3Rrll12v5I0xLufQ0JaEk0HW1TV4JuHYtep88qN6vLCW3OfAzwBNLfzm97mKcwnMmNad1zV+Vh77E2G7p2Cp+6mzq4lfl9MIfF+A+7BG+rx6s2fYbUaPe9HY0t3iAKYqmmeUh2qf/BTVO3qyxau9fMHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1m12cZ7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1m12cZ7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97e6e48b24so262522466b.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773838074; x=1774442874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kPUTFEDRHwDnSlS2VHUl2pguJOQjDAxKt4qh2+1uSEo=;
        b=m1m12cZ70ooiaStxdugJP38CgunagyuOhZ6l2WB7RTD8EhQiBzTzv9gohjaEjC6L0v
         WaFATQSkko2vfgsYyHhHoQpeDubUO/sLEq2EFR9xEtgg3WFqhOYpCEMoRk1DZOJCA4AM
         vSbiXFxjyH+DzGaf7R8kI6SqzCHqyf/ihIxa6jkiM0orpIa2euKDSArwJw3xPt26HPWK
         JS+EgV+qd6bNCnWtZpeMPsFcouWwL39U1dDgiljUkeaFTqh+N1F/VKee6+31T+yh+JR+
         hMofokjPD8PXm4xTCpumXYRHV/ySZU5lzpOqgNmNhfqzlR4z/x1Cyu/UmLOQ0BP6wCDN
         p74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773838074; x=1774442874;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPUTFEDRHwDnSlS2VHUl2pguJOQjDAxKt4qh2+1uSEo=;
        b=VQ8sYr8RkB7AUmBWETH9ESwP0cBUFa70UZwP7erXof+l89cDFpNfY5n7e3yd2izErt
         UIH5MICaP+MtQvxGNETNKTR7MqlYJR1kV5YObnXuvadMsnj7gmnrkwgbJcnIQ2qpKYka
         /LxRXPVgUn+672oNDfJmGIy3LXv7q22hgynQYDDQ7DVGJlo7f7MpAeYkLlm8t72vhKCB
         Q05/EQkZfTKByISmEOmtUj24OeHxqekA+sDbOOXrRo0DrjY+56YRlE6fx0U9S1fO194o
         gaQDpQtxJQRxRMTl7pOVYNPErSjZq9BUdi0okVPX8jarBSlX9glgbZu+uv110jPzi/ub
         HWpw==
X-Forwarded-Encrypted: i=1; AJvYcCVFlIPhaA61ZfhS5E/5+s8TvChmYZUNx5f+DvWpngS6qeLcx6Nb8y0NU+ByxV61p5F9VoxX8iow2TqAlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUP3NsRawLa+pVdIRoY6j+JV2RikU7FYx1/BtI6Ic5ZhrHVwR7
	8BHA+QaRK9A8mDhpUXwIwZ+qMaznPk8dWaqyy94ASAQDcBBlDITnpHX0
X-Gm-Gg: ATEYQzwmfvGyERRTMcaEMIKjppfn4M6pNUGvv2f3t3R2qFc+ns0PIv28nYqTEfnnhkY
	Ua8SvLqoGU1Lx2d5PY2q1UuklaztumNv6W+O2Gtfc1Hq6GUCTOSWcI2DbYdN1z/W/RWKXyxRJ0I
	8fpswSjp8chwOjhDV9ef0oyJhSgnQaTVsa1QeJvjamA96Sfri1oECbycRT+wvkVePLzMfvtmCC3
	SesbL0aQcuOHzr7zWDw/zdLonviE70DN9eEAcGxmXmkLsJfnAkWv87xcyQnBpjIEMxHDiqAV1Kt
	Vt4R9wAKNZmX8PLiDh9/Yq8oCyTxPzabgltI83DCY4TJ15vbeGrq5KypjBKGuOoAi/7dV/inW1p
	1609KFLcabUpJBzCnevDeh63Wpq2Nlqnj6WY2V7Q0rCHVIg30zW3P2hfvh9Um+YQeEsspRjLzJ1
	w7ipUD2uZm6rmO90PkwYuk6kjGDw==
X-Received: by 2002:a17:907:e115:b0:b97:94b8:f450 with SMTP id a640c23a62f3a-b97f47979aamr155736566b.5.1773838073330;
        Wed, 18 Mar 2026 05:47:53 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1689be2sm192663466b.34.2026.03.18.05.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 05:47:53 -0700 (PDT)
Message-ID: <f740d1e0-551d-43c0-9681-6011d9cb702f@gmail.com>
Date: Wed, 18 Mar 2026 14:47:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: iio: light: vcnl4000: add regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
 <20260316-vcnl4000-regulators-v4-1-854fc2eaf54b@gmail.com>
 <20260317-tricky-pony-of-assurance-7a8cac@quoll>
 <da9850da-af27-48d9-9e5e-2d187c35d262@gmail.com>
 <16b3eabc-ab88-418b-9eb3-367076a8bcce@kernel.org>
Content-Language: en-US
In-Reply-To: <16b3eabc-ab88-418b-9eb3-367076a8bcce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/17/26 5:42 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 09:07, Erikas Bitovtas wrote:
>>>> +  vdd-supply: true
>>>> +  vddio-supply: true
>>>> +  vled-supply: true
>>>
>>> Same comments as before, I do not see improvements.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> I explained why in v3. The message can be found here:
>> https://lore.kernel.org/linux-iio/cb92bb47-9078-475d-b242-71e3f9181a72@baylibre.com/T/#m6da277894cf5c2b473fbeebd4b7bafc7519ebc26
> 
> Apologies, I missed that. VDD and VLED are fine, but I2C bus supply is a
> property of the I2C controller, not the device, therefore please drop VDDIO.
> 
> Best regards,
> Krzysztof

VDDIO supply is needed for the pull-up resistors for the open drain I2C
and interrupt lines. Without them, the device will send spurious
interrupts. Such cases are already present in mainline, for example
Awinic AW2013 led driver [1]:
> there is usually more than just the I2C I/O lines. For AW2013 there is
> at least also the open-drain interrupt line. On other ICs there could
> also be arbitrary GPIO lines that are used in open-drain mode. Those
> are completely unrelated to the I2C controller.
>
> Do you have any suggestions how to handle the power supply for those?

From the looks of it, it was agreed upon to rename the supply from VDDIO
to VIO. Has anything changed since then and now there is a better way to
represent this relationship?

[1]: https://lore.kernel.org/all/ZBoR0DPQ+AufzKHk@gerhold.net/#t
