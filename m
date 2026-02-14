Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34262C21C1
	for <phone-devel@vger.kernel.org>; Sat, 14 Feb 2026 16:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771087468; cv=none; b=F2GFmRkXMoB4t0g+vdJDSgVV2BisWDgpzWmAq4GHcD6ABA0Q+ABbvRwp06r7w1h/gIK/dGz8dvChUYcv87/Jh6UDTwrHzs1L29ZyFBU8bYK5WJONkMF2flykqV5OsvAzSUiOJ3oduFAkwTOmsqRDlCKd6qmVU5KzG8QX5N3XfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771087468; c=relaxed/simple;
	bh=5M74aqtSckhkCFRe9Mo0Ybki6y+La8FS64rrC4ZViZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6s7taaj94qO/YT5gtD97/lA02T0SNZAwNNG5LavjW2CtdSDSD3Vdt+FS5mc6CcZPamGdmwUdKyD/nzDGHMBQhsQdFzvOxUG3WKxwDm+vcdrlV4vS5p3WaDIskecFoQf8RnLENHgQIHpHqGlV6vVkiVnBHOuA++c67kP8YfNvwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cD+VED4p; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cD+VED4p"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d18f80b5c2so1701276a34.3
        for <phone-devel@vger.kernel.org>; Sat, 14 Feb 2026 08:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771087465; x=1771692265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f3FaAfJ8qGEhkE04fqgomCWXCa7hwpoZ04n55k5H08=;
        b=cD+VED4p1ADwFS8CCrEPkxelQtcgzzhxX4PQdh9iGp2MtE2TNrl8m++Qp7VPjzha18
         0kUpoHj2G48U7JmUGfGlDcztDmfm3S4nJBnAQl2dxqhI/jMjuUk6aY0VJpYnMsTjrSAX
         fZmQICX/572P8q8xP2BXloOasMscfHNgGKtdiZnJfoqDqBME4ps6T+K2VgO/kz62maKS
         QwI1lb5A/HGNps3KTTJzX6PbqAGDAMUha1mjoIWjbmUxFy+URY9fGg8LVea1e8q/PJAP
         yu2km6QKfhWXJL+EIRlGN1C3Z6KW+z13xPDFfmlL7znozugc4k19GtQrmUtONZpOmIKx
         9sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771087465; x=1771692265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1f3FaAfJ8qGEhkE04fqgomCWXCa7hwpoZ04n55k5H08=;
        b=SabvK2Pe6fF4ICIv83cClN6/m7OV3KXFR8ahuZ6kkZhUDHrJsW1HzCwnR6Eo1SEl3N
         BWQRA9fV0nAAzAcag90U3LwaIGo6n0xYNgjGoMpjeJZdgb9DjZqJD5a4bOjPd3p5M396
         q0yQuWqDLJfT0rKR5124x0TQzAeKpjqNewUuGu4UUExqjSzQU0c2jm1Nz2rRyioLPZac
         YR+Z7OZER9IPWIfbyXeELtwVhx8hTVHonwe04Br/lS8boEiM+Lw5q5hzGsXxB8rucVI9
         EKEA00Ghh/ndEMDcHqdLe4a3epBe9IzL5anx0lJU4E6/RmxDUL/9SkpNH6MHqG3F+BgX
         NFrw==
X-Forwarded-Encrypted: i=1; AJvYcCUWKICYEkAUbT8Tg61ow7jwhziSYzTtwY7+1Ks9jXYiridHLdly0ctsxnlg9uK4VssU52CK9RtS3xC5Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq3dKFiJvYXhlAm/Bf2PCPXQd8bHZPfWjVs6xnfPDQCQEPYyIQ
	aFAz7kPgC9R9J5/MxOABjUr9eW5MT5NxxiuR0h/LpjM2MWDJQGaamTg+YZ+kt9gJNqg=
X-Gm-Gg: AZuq6aLrQ7Z+ZflmVmweUIHKp/6+EvtDn7tIMXGmqoCzqPTT4/c5JFwyobJ5nssp8ZI
	eumKttWA3zS26XJ43/+23mnmlVuRKWw22JBz9UTGzepatLQTqjFLXyCfsSfR9/63n1NR0KsuQuO
	dbsgZnonX8GNmq/BcmpQ8YJEC9Ob+7X2aYEi/wcGBCmYhygZ4lRhOOKlsd5Td7W5yeXuOvow7SW
	DZQrehROAjwNu//iEFKjNZiCgETICEuWwLM9YOnhpbTkdlq1ip8liauluJkbkd83GtbwX++Uvyb
	j8YCJlIp1cCSAc96UJyJ3YKwKDmUowwM/q+wK7/kDUb0ROeBFhX7i8b2J9LOe9kmIDYlCxLju43
	YsFnFzqBy+iaxWXfx60x9bqNtlkrnrMnZMhJXouRR2OJ2oawNNia06DdH0EiRzQvO5SWd+5ltHH
	g5Ae3leTrre12a2RjB5+BSDRwrv9qoXD0Xo1MwROynbH0oYuV7WxNOrW+xYNskxxFfzcmTCX8kE
	aXOiFIp
X-Received: by 2002:a05:6830:2682:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d4c4a3becbmr3507186a34.14.1771087464786;
        Sat, 14 Feb 2026 08:44:24 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:109:393c:254e:962e? ([2600:8803:e7e4:500:109:393c:254e:962e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a75309bcsm8641964a34.1.2026.02.14.08.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 08:44:24 -0800 (PST)
Message-ID: <880ddcad-a92e-43bb-ad5c-d6f2f353d182@baylibre.com>
Date: Sat, 14 Feb 2026 10:44:23 -0600
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: light: vcnl4000: add Capella
 CM36686 and CM36672P
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260212-cm36686-v4-0-8f587d4a72bf@gmail.com>
 <20260212-cm36686-v4-1-8f587d4a72bf@gmail.com>
 <20260213-unyielding-pistachio-ape-deda74@quoll>
 <3a20c906-647c-458f-a118-c7927495e7ef@gmail.com>
 <8fb27a7a-82dc-443b-bcc4-21007783fc54@kernel.org>
 <f014078c-6e4d-48b0-a814-45898b005c44@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <f014078c-6e4d-48b0-a814-45898b005c44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/26 2:56 AM, Erikas Bitovtas wrote:
> 
> 
> On 2/13/26 10:51 AM, Krzysztof Kozlowski wrote:
>> On 13/02/2026 09:29, Erikas Bitovtas wrote:
>>>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>>>> ---
>>>>>  .../devicetree/bindings/iio/light/vishay,vcnl4000.yaml  | 17 +++++++++++------
>>>>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>>>>> index 4d1a225e8868..2ba4d5de4ec4 100644
>>>>> --- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>>>>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>>>>> @@ -18,12 +18,17 @@ allOf:
>>>>>  
>>>>>  properties:
>>>>>    compatible:
>>>>> -    enum:
>>>>> -      - vishay,vcnl4000
>>>>> -      - vishay,vcnl4010
>>>>> -      - vishay,vcnl4020
>>>>> -      - vishay,vcnl4040
>>>>> -      - vishay,vcnl4200
>>>>> +    oneOf:
>>>>> +      - enum:
>>>>> +          - capella,cm36672p
>>>>
>>>> CM36672P is compatible with CM36686, but this is not expressed.
>>>> Confusing commit msg and code. 
>>>
>>> For CM36672P we create a dedicated compatible because it is a
>>> proximity-only sensor which has the same proximity sensor configuration,
>>> but ambient light sensor registers are missing (reserved).
>>
>> I don't understand this. You just wrote "fully compatible with CM36686"
>> and now you imply that not.
>>
>> Decide.
>>
> It is not. CM36672P supports only a subset of CM36686 features, in
> particular the proximity sensor. That is what I meant initially.
> I am sorry if the previous phrasing caused any confusion.

But CM36686 is fully compatible with CM36672P, right?

So this would make sense?

      - items:
          - const: capella,cm36686
          - const: vishay,vcnl4040
          - const: capella,cm36686p


