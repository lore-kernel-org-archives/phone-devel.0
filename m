Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298339446D
	for <phone-devel@vger.kernel.org>; Tue, 17 Mar 2026 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734866; cv=none; b=IdTFGP08eu9ZBVFDq0DWmeot3bOl1+zytvKSaXvtFHngjnBdhvT9ICmLLRrEzZD/3HSsQk4th6SaDgMtR6o1hXKzL1HXEySMu2LNgh/695oXl2Z6lB96mmm4BA9QTV1s5eljNxAJTzPqXCkz5xMgnC24Cdl8ll/dC3SqL29VApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734866; c=relaxed/simple;
	bh=xjMI3kWLb004RFGciwvvZcxiwmFj4VVzpHoNLJgITKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V599DjbnhgwqEF7OKUx4g23j7zHt2QF+RlbqkTbC0HrJUuUdYwWr8KPXhqMCN3Ud9iCESU4CcPHvo87DSgW4CcCdSHLskUfTiIthEK2/eUj2Q7iiCqgsp5sPky+z6wHmhvo7c5pylBZHpMZOsoJOxtVymH9Nxdy5hIJ/tgbnZZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yr/HjY3i; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yr/HjY3i"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b886fc047d5so906644266b.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Mar 2026 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773734863; x=1774339663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zH58nQVPnaeEnUw730ASGfF9l+ejJ6sv9p1FAkERXbs=;
        b=Yr/HjY3i0z05NXV2n+9u2rLpjSTAQA6C5n5F6bXf5kuhRPunLI+fR5ENlF8X2e/2qY
         aiE547oHcpobbrStQkqGCvT2OdzmG5jogJYsVCyd356eEWLhVy9wvxlPMOKyeLpJy1JC
         FKWklfEzrseRM97NkJ8573zCuA4bUaZnokqkXtwOQ+9X6uj3jMM7o5elCcEcSS8pAV2h
         k/hiqVNqkXSidFLyq4ZgLQYEOfTnnbr2gL2KDmFAFIjh+7zEcrFcJeGQqsW0nqwDZxya
         H0CGYEBuohgoLOZKwRiJXTRvPewVLChYCHwc/7n/lKI5w+Xq0W+ajSb+K0A/lD/Ntr08
         TZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734863; x=1774339663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zH58nQVPnaeEnUw730ASGfF9l+ejJ6sv9p1FAkERXbs=;
        b=Bo97LqngIcQ5hHozqTbn5rw7l//7k0cTRI1tXaq32DyMJF6i2cPRTnPdiBozl/kblY
         H3eb99rG6ROtwEcR9xGKH82YkjgmUl/GslnDc3PjDaN+SqLdR8jZlw3GgGX7ozGDhLoX
         l3lLQ2sf+RyNqhIHS1SYEb57OXKjOnw4+dhb6JMV14ZcXrurIHvRUgWFo7LhU840v5cG
         R8luRij548PSiVCScrjepg8k34/yyQZ+Vcv+O7WfUUj1Nidy06DLnH20etGmRFJZjT/d
         MTxNCadLCrphNSTILDEfxtCnERjjfNi3LOJO1oaI2bdZ6KMktbRNCUQ/Gt1yVf4MS38j
         sgGw==
X-Forwarded-Encrypted: i=1; AJvYcCVbt5ssjKQ3wkftfTDBLCyiKWFxLX1D/YLl6MR+0bWgtzZGmlJQoxndOzSw6bV8pWrm5qWJ3d1qKj2Mwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhljkwrEUnBQxbdXbt3jVGEkmkn8P3QKUHyqJhaFR4+zwXH2H
	872p3jisWEfo8q11p2vzKv0A6SuqRjDowTYG+LbWOyGnXPRYOusxKC5k
X-Gm-Gg: ATEYQzw22gChmR51zYncbPrxrGujB2VHc21xxIs3t3v3TcUtsXNiDUHnTVngIN06Bgi
	I6zqxfeo8HXjO9HflTO4gWGytvaEoZHAdRGLxuRxxTtaTkv1fjKaZ4ZIxD3UQDfr+UUUZOTbgrY
	rleJWf8BtNZ8lMoGuHe3iGE94tDvi+jBOy4g22kDTNKS4QNaUkyTYlj1cZC0HU5tghUgpATP1RB
	UnuFKzS3gbUrfIGncOtRLEwomDAjVZH1ylU+tGk3MPe4flC9SUb5XMzoh0WVkXz7cL0JeyKOw+f
	cX1fjopal/s1IIlFsXyVwz10KAPX6ToJ5bIGLjjIdlVpQas+TgDPTKrIcD6EKqDcbPMcmPfXdKx
	GqRAtFc6skTC/ggGCRjhJ8TGgLbWlJs25mhFeoEqxJ9AK/znRDnN5aQLnrPOYZIJfPfbghKUD7f
	6F3Nac14DEybhhK+9WkyrTxNW0J06WpsfnBUO5
X-Received: by 2002:a17:907:6d05:b0:b97:b378:62ba with SMTP id a640c23a62f3a-b97b3786658mr484917966b.33.1773734862942;
        Tue, 17 Mar 2026 01:07:42 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb47fasm666212966b.43.2026.03.17.01.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:07:42 -0700 (PDT)
Message-ID: <da9850da-af27-48d9-9e5e-2d187c35d262@gmail.com>
Date: Tue, 17 Mar 2026 10:07:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <20260317-tricky-pony-of-assurance-7a8cac@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/17/26 9:20 AM, Krzysztof Kozlowski wrote:
> On Mon, Mar 16, 2026 at 07:19:45PM +0200, Erikas Bitovtas wrote:
>> These sensors can accept 2 supplies - one for the sensor and one for IR
>> LED [1]. Add supply properties for the sensor - 2 for the sensors and
>> one external, for their I2C bus, to ensure the sensor is powered on
>> before proceeding with setup.
>>
>> [1] https://www.vishay.com/docs/84274/vcnl4040.pdf
>>
>> Reviewed-by: David Lechner <dlechner@baylibre.com>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> index 2ba4d5de4ec4..a1b4c02db246 100644
>> --- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> @@ -33,6 +33,10 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  vdd-supply: true
>> +  vddio-supply: true
>> +  vled-supply: true
> 
> Same comments as before, I do not see improvements.
> 
> Best regards,
> Krzysztof
> 

I explained why in v3. The message can be found here:
https://lore.kernel.org/linux-iio/cb92bb47-9078-475d-b242-71e3f9181a72@baylibre.com/T/#m6da277894cf5c2b473fbeebd4b7bafc7519ebc26
