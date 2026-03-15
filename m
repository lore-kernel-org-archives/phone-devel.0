Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA65373C18
	for <phone-devel@vger.kernel.org>; Sun, 15 Mar 2026 17:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773594449; cv=none; b=pq+2E8+lBP5WfSn9V9Iah4piAghK3MpSGlHCmc0X4RZeaOQEGmA2PLETL+bWXPjUIwDVDJe9UDTdVyDoXElg5TnVQXrpFdF4TTM3r6EDkQLZSrLgmxR+nhdXiWh9f1ziwXUYNNGAvPUSMAE8QirhhwXJM/t+GSIbENwN8sMhv7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773594449; c=relaxed/simple;
	bh=u7g/7fNCkIeTMCYO3iV/qfav7MuiFPpqrSVcnGrxMBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFfqDRxytz0P+z+Z6ArzyHuwxpLY4Wc6fUKL6PzS3pf7A3Wx2KSB6PtBG+vCqLtKeP+TEbSW6dNTULuRI64/GuTJecx5c1+yowNtkbY+qh+mpveYMjJmGv0wc0RknwhB534f8xZiu/PmLzKDOWfvvtyP3vhHae0umLoeggF2pwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXpCvxXD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXpCvxXD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97a0f18a3aso101497166b.1
        for <phone-devel@vger.kernel.org>; Sun, 15 Mar 2026 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773594446; x=1774199246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ups20uRnYGz6Ay3iT6SM4s0q/qm3+3T4sX9Egk3yWMY=;
        b=MXpCvxXD51aZGQlwIvOcLBBX4zRc8uF4mZx4CZLh+TOtPiF6PJcWVoV4u5fXXNuxDA
         5BKrczr5O0txyEDRwovSQzPzSbKpu29n0MXMyZDmtB4qxkIGUsVHSkHIBcRbLk8Jbnss
         HGdty24QuonvyMas0c3xTjfbxicr15PKq6NDLNdOcVpbjWvnktVgeUePdPbuQtm7U9x5
         j5jKKuYc2Ctvbh0c88OS8y3C/sum8y464jAjmLfv/4ZZgAX5LQPi5dkhl2WE/1+cgqjp
         kgH8e65UAoJiFHwS1hrhzClXvg9A1rgDuTQvS0kKgOyRYA9BGjuDboP+3m4bHJ6G2FlQ
         M5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773594446; x=1774199246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ups20uRnYGz6Ay3iT6SM4s0q/qm3+3T4sX9Egk3yWMY=;
        b=sVOWKl0rGdIMaV5SwO3icb4IWDKc+CjagJSxQPGNmNKRS5rr1wKhgGAQd06USwz3fv
         Iq9jdGUipRoPGDbxrkaXOhE/tlu2RWiUc/oLHx1oBag8E1nPGeDE8KDDnl2odtFSUX1f
         MLBzMgcqRBnD//bcIFpTArpgu4ri19tkiti8xu8GlRDOrrBICNhKvNsj+oDDJ+cxc7vq
         sA2a2C9da8KorKuYNX01kVwsGAGa8wRw3XiV91q76udP4AR1OyVmD9Y0uPgTBUH4QSp5
         SLE3DOiouh7Y199JqOfS/PxlAKAlM0CMKipJGkG3wYRQ6T7z7ugDToRD4VjJjR9yQCvy
         bDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtKYW93NYddk/Cg1tF6eZYD3K+QLiij6kNgTaNta/cpAd9XvK6+OMm0+yb2PIOvruBhHWO8f8K+fO4oA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6J2DI5dOXuN4MHtKjeWbO/bdBCqeB0Z7DtBt8w5tLBesZNQhY
	3OKqC1QyJqL6xFBVb93yDRsF0mnfc0JIQjTDg1fNq52DrU3vW8xgVp1b
X-Gm-Gg: ATEYQzzne1aNzXf+tkWVf6403oPzh1RoVlPBkWHNzPnbSXtZCMdnJd9NuVSc2FPzDwF
	nxzFwJADI7bW0S63H832PzPgSTy//87GmafcwfG8XAC2+57Kqfw/BJ0YHU8hkVo1DRQsJRaQIDj
	pblNEWTU0UThrQ93/OoaeZHo+9C5loPzJl30ACR5YQn3UzZ7os+m1F1ODJLPgzO4NeLvJAVPE6H
	FujuszL0sTGde3j0gyniCnjwDsnkEt0FMCONw+ftF5T36vWKaD9YIR++EtePMU4HKawWdkyzXdc
	LX7V2h0D8HyHASRllBe4efaD2jYapuvKW9y3wtU5IfaSIZaVICr4cweeGNwdo32Bwnoswy57vRG
	1/SzdNt4ZpmNnFrR8DUs8Zd2qJT0Q//guXfccW+2uEDg6aSz6EFTJXPTOa4F9y4hlwATdFISuPf
	lk8ITKI/nn97yMjdsmV88zBl+xBXpjSfwxenYg
X-Received: by 2002:a17:907:fd0f:b0:b87:1fe6:f223 with SMTP id a640c23a62f3a-b9765012d6cmr568157766b.6.1773594446007;
        Sun, 15 Mar 2026 10:07:26 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b5886sm399606066b.65.2026.03.15.10.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 10:07:25 -0700 (PDT)
Message-ID: <567e0d49-270a-4442-8416-a9625bbe98f5@gmail.com>
Date: Sun, 15 Mar 2026 19:07:24 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iio: light: vcnl4000: add regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
 <20260314-vcnl4000-regulators-v3-1-3c4a48d30676@gmail.com>
 <20260315-honest-debonair-oarfish-3a33ed@quoll>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <20260315-honest-debonair-oarfish-3a33ed@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/15/26 10:49 AM, Krzysztof Kozlowski wrote:
> On Sat, Mar 14, 2026 at 06:06:30PM +0200, Erikas Bitovtas wrote:
>> This commit adds supply properties for the sensor, I2C bus and IR LED
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
> 
>> anode supplies [1], which can be found in vcnl4000 ambient light and
> 
> So other devices do not have these supplies? Or have only some?
> 
> You already received that question, so I assume you checked. Then check
> again because 4040 has VDD.
> 

VLED is supposed to be the IR anode pin. Every model has one. It is pin
1 on vcnl4000, vcnl4010 and vcnl4020, pin 6 on vcnl4200 and pin 4 on
vcnl4040.
VDD pin is pin 7 on vcnl4000 and vcnl4010, pin 5 on vcnl4020 and pin 3
on vcnl4040 and vcnl4200.
VDDIO is an external supply to the I2C bus for the sensor.

> thus in
> that case 
> 
>> proximity sensors, to ensure the sensor is powered on before proceeding
>> with setup.
>>
>> [1] https://www.vishay.com/docs/84274/vcnl4040.pdf
>>
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
> 
> VCNL4000 does not have VDDIO and VLED pins.
> 
> Best regards,
> Krzysztof
> 

