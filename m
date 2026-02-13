Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5032C326
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 08:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971351; cv=none; b=X731dwKOARqdrO4ERUPI7KttEVkBoq1KXdq8rvkuW+eu2OrO7ZgC2/t1kYvgW7ovbXCggXs3L5xjTJH8r4z4cju3y09PXtDa7CpZRLOwd9W05bddbSBEtFfkTwWR7EQDsqDC9Tr73xAL6xqRzG4izzcBtGEue779qm0zgr9M/HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971351; c=relaxed/simple;
	bh=zvgY37ZQjsQkz5/m86ybqaE+gQvu4wV1jaVZs1RK1Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFYpI2NIeVkBzm8cVnwwUaWWJcNcFKe6eLJJ7Bi+HQjnBsxA15Ki/BF5nj0ZO8934bQV6Pu1ic6bvRhzVzLW1vvvtvS7hixy4c9xPVGBeHEE/LWBgZWfqcBwNPBQx/ZyNbUCDf3a1xhn3+ovwOpNr+7nsHW6zPkBLCZO6yR/dxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUH/sthl; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUH/sthl"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7966d821baaso7767577b3.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 00:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770971348; x=1771576148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eb9SMDXx3XqEdbaMIOBwU3P2hDpL6y884kxQ2eGE+V0=;
        b=LUH/sthltK7mdMPmTGL23mil49iTOSK39JeJJz0oPrCtjEfHzeuyC3SS2YicDeHoK/
         3lAN4qUDX0eHnWBOJnPbEmQvXn8FymgTb3nDSDqdvQvYBOgR3okiDmzdda4vXOvl00i9
         Q4Ko1cJRYXtANJX34C/HTDbP+t8PrzWnuJKWsSf9xyE0rHcDToOfv6jrQPjAVu3rcWW8
         vaPAQqJ6I/Utr6yTTRHqgg+qNU+D9YiuBgh5f/fO0+2wCJieSUFtrT8sKQLck3u2Xkke
         GI1JJaljMOWtal098eVwPi/e/mUiYZ0CL5w1+I0uNVAeVVK78bAfEuiTaVNoemnIA0x9
         uAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770971348; x=1771576148;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb9SMDXx3XqEdbaMIOBwU3P2hDpL6y884kxQ2eGE+V0=;
        b=OxEzi8XQX/XihqAPfCIwl+we+ZQ+sz+rvH8z6oZofjdma+bCR/tGxbG/4wecRa69t+
         V2euN8pOCX2tB1pEv8h6lkaw4S3ytFlrYYCen6RFrV7t7W475ijTtHjMVUVpmV9XN+Fs
         i4B9H+ApCk8DtOj7ut6If5Ar6fcJbT0xVZPb7dVU6Lf9QwrQ/aYDQ/ta44nqpPTvy7WT
         gId6a/oVbL3cBwKUl/JUePSHpT7WzvayN4Tzq7gctMqbSaStVznYIW5dS1tVNGH2vhQ1
         /OZKPB9/fPgLdSm5tEbg6hkNdfNxGNnM2bdg0uo6ommjmsNZqALQSi02+PMcjl3Fk+jT
         UbBg==
X-Forwarded-Encrypted: i=1; AJvYcCXmvzwSeiGpt/BNANXAFt/BpfB0yUETI/7G5Y4QoUoIZ6MGYbgo3w6xS+36HaTwB62YLcvDafS34wGMTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qy4+c1mJQ/A8/Qp3VEEgdeVEdZ3nLbCacqjUn739PranVNHv
	tFw8MgOWR3RzpJ8Jbvd8m3lRUqH+N9EVkcx5h8PnHP5PxCqIDWL+ce9v
X-Gm-Gg: AZuq6aIiT75N6I8bErW/OYUwWHHu/IKNmNArDck70/1vLZrrEusmrIXjNrklJ1Um3HZ
	gheHpzQC+nVukEpd/OiQwoP28gLwoXc3UayHsajYA15JmLD4Y/rn3UtKfYUrRLTH2yriwA7oz+t
	nq/Ek+DubMJQrKa7rbn/B+twaEDx2vSurZ+ZNEdcye5rwjQAU8gjUZVjPbGs7c1cj7OibE0qD8K
	M96ywofTUhMYM5OKs0sb5vRplQqrXdhjOK+0A+4EMh46QiTRxOLW3BCs/LtyS4rF0DkjIgiQoNE
	UAO04xG5W+jdXlMNg2vGcpPdkaiouLUKM/Q0THtlyeuqMtTfOa8/bzPag7V1t+7uMyUsoXj5J+R
	0lJkHFqu7TXJW3/beZMeGwbjjGXymVEtjqa+bVgiRyVd/pjdh8iHyMcrcL9ncnv0+c5Jp4gHF9Q
	NimGxLabhIR2isIP7SpDWlh6GEYQ==
X-Received: by 2002:a05:690c:6306:b0:78a:859c:63b2 with SMTP id 00721157ae682-797a0c22868mr8571517b3.30.1770971348077;
        Fri, 13 Feb 2026 00:29:08 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c254d1esm64369077b3.41.2026.02.13.00.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 00:29:07 -0800 (PST)
Message-ID: <3a20c906-647c-458f-a118-c7927495e7ef@gmail.com>
Date: Fri, 13 Feb 2026 10:29:02 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: light: vcnl4000: add Capella
 CM36686 and CM36672P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260212-cm36686-v4-0-8f587d4a72bf@gmail.com>
 <20260212-cm36686-v4-1-8f587d4a72bf@gmail.com>
 <20260213-unyielding-pistachio-ape-deda74@quoll>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260213-unyielding-pistachio-ape-deda74@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/13/26 9:54 AM, Krzysztof Kozlowski wrote:
> On Thu, Feb 12, 2026 at 04:42:47PM +0200, Erikas Bitovtas wrote:
>> Capella CM36686 is an ambient light and proximity sensor developed by
>> Capella Microsystems, now a subsidiary of Vishay Intertechnology Inc. It
>> has an I2C address of 0x60 and is fully compatible with an existing
>> driver for VCNL4040.
> 
> I wonder why and how...

VCNL4040 shares the same digital interface as CM36686. All the registers
and their fields are the same. It is most likely Vishay just reused the
CM36686 design for VCNL4040.
> 
>> Capella CM36672P is a proximity-only sensor that
>> is fully compatible with CM36686, and therefore with VCNL4040. Add
>> compatibles for cm36672p and cm36686, with a fallback for cm36686 of
>> vcnl4040.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  .../devicetree/bindings/iio/light/vishay,vcnl4000.yaml  | 17 +++++++++++------
>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> index 4d1a225e8868..2ba4d5de4ec4 100644
>> --- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> @@ -18,12 +18,17 @@ allOf:
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - vishay,vcnl4000
>> -      - vishay,vcnl4010
>> -      - vishay,vcnl4020
>> -      - vishay,vcnl4040
>> -      - vishay,vcnl4200
>> +    oneOf:
>> +      - enum:
>> +          - capella,cm36672p
> 
> CM36672P is compatible with CM36686, but this is not expressed.
> Confusing commit msg and code. 

For CM36672P we create a dedicated compatible because it is a
proximity-only sensor which has the same proximity sensor configuration,
but ambient light sensor registers are missing (reserved).
>> +          - vishay,vcnl4000
>> +          - vishay,vcnl4010
>> +          - vishay,vcnl4020
>> +          - vishay,vcnl4040
> 
> Best regards,
> Krzysztof
> 

