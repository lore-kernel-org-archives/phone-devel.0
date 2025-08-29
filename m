Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7793277B1
	for <phone-devel@vger.kernel.org>; Fri, 29 Aug 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756482757; cv=none; b=iCqROVCw614q+LOSOVFha1+wPqVtNr562lKpdfA5W5/MzwZ1kAlYq+HWR3I1hcw56m2loYnCUYxD8K0Hy0fY1pkBb22rweE8jknnbnO98HLdiechcvfnq7zvlOojTCuTJnhVbUaUs5y2FVA25LPlZa48AvDT9PC6w2fHF7hkzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756482757; c=relaxed/simple;
	bh=5Ym/jwTYuBac6qN/bi6EC8idQbMmFWSlyiT3FprCvsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnHWqrgctQlYIJGCGNKv8sygyrmrHoC2ozap36ogUMgjxPwtRqZ+L9F+1McrvdQtRxRO1Rtq7B2Et1e11c0Ym9+eBADz0Pq5CbPhgWgqtzL5paL2zKZ/LwHwWKei4f62HtA+JLHFeSmrc7QAmykOLorQgo/mm6tKKeMBpypOjKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bnJl5F14; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bnJl5F14"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-74382025891so1712035a34.3
        for <phone-devel@vger.kernel.org>; Fri, 29 Aug 2025 08:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756482755; x=1757087555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+23BJPCKtGorADDC890VMTVjWSuA//k7zazsu5ZdqXU=;
        b=bnJl5F14HpVRdVjNzcgeaOWTEPn3joHTxD4OBFMS+NtSkqpX0mNowq2qQ23e+D6PKF
         xK4BU4OOzUbIYf+sXLQ14p3/9rIvd7E7Nv65CT/yJ3+3MAWbwRyf5cbUJdO1SeCS5wOq
         y9jcafCdq7kpcOCXVsfFXsNocNcTNMDA6OalA/pC2QfSmvJWCV3jaW27wSqZvi/JmPib
         0Z7TknDHnkWjLLukCWIhavuLBz4f6HYPk7n+UdLC00wFmgFMiRqQWnGm7I3DZ+8VAkVX
         1W8hCKWtGGnzPOi7IoEZfZGIStiRIE/oRyHXjjXyN9XCGdNKXKl7ZiXg/dKBdBzd0+L4
         UpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756482755; x=1757087555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+23BJPCKtGorADDC890VMTVjWSuA//k7zazsu5ZdqXU=;
        b=caMTEKp65uEV0fpp/dcaVo1oFQNZ+hl0Hyi0XCYqP3/iznGk5qB6ZT7/EOaPxaIjg4
         a4rGLDyH/u1EOEOaSLOtc+bPwrM23pMQUIchCQ1LCUzFdpNdboAdrJkArM/xqa/TkcVS
         tdTC0cCtUSkJKcz3DOPi2Hfk5foNNv63tfCLXs/XTyYZsESOjPrgkCvi6qW4iRsFoTJZ
         EQt69RK2w4BacLuS/7jRtKWdenXECoiDYegRVqH7FNNAX5vfdXg5Pz5Y0nztsVJaG9n8
         Fz2w7ShAethcU7lDC7sfHKt0GYQIXXYogsdIV4Z0vmX/kIOctUYcLEBQsaxwI2+6yXsM
         s2IA==
X-Forwarded-Encrypted: i=1; AJvYcCUkdfP45OyZePBarzqJk6l9iGmPzH8VHLO1WTSaqb6tnM9oeSjSslRyoKW2XX2rvHm8JoJvs5ZSIZaC3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xWdH+0j23It7aqNRmYI9XcPp7tYaeNiM04KClaF9dDVQgCP6
	o+gtAAVwzrEMQq3T+2MRGRFaqGTGyCpqH9MVq3VPd4GpSA+Tu2MuFtacebeB5tDBTac=
X-Gm-Gg: ASbGncuqGEGDX245ldfWMPL1u+RSbomLPGGj5WmIEK/snJPusXIYRyclkbXT8ySPvXR
	aPSRQoLtQneWwQZTG2x4lgtRS08TWJT/ATy2JDeW/wbwtDRY4JVgIXypRUkR+I9XCDrlWJMzrbe
	L+7jJyCOkWw57SwiLRNYyAEqJZJsArVGjZRelI54uVAe5gcWIwVdmlFydCa6ruEd95hUv0NI1bu
	43Qu08wgHORTY47gihYbQCQUCeMYRNxQKgu8azhbCh4GbrsQ5z2Eb5IhVI1660eGT8015FM/47R
	f38jqSzBGGHRiLIYnw0iuZH9aU4fXKyZOHqAGUp+utFASVtU48hRRX2zS773akt5V2VboidGSfY
	6notfNT6mv0Q2nBH9CZxtvToT7kmZfgOeK/0a40NDXTMFpDNqoEbSVjTKOKu6tM0GG7akxca4Xu
	q9NITff7svuo/5+gFc2BeC
X-Google-Smtp-Source: AGHT+IEXWYEKh1DA738p/y0oOalJucxmoKHVU9lI6MvOI7wGYxwoLUOBIB8PEz52I2MRTw1eKDB1JA==
X-Received: by 2002:a05:6808:81d3:b0:437:aedd:f87 with SMTP id 5614622812f47-437aedd13admr7644840b6e.41.1756482754716;
        Fri, 29 Aug 2025 08:52:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:8d0a:2553:5881:1318? ([2600:8803:e7e4:1d00:8d0a:2553:5881:1318])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437f41765fasm21636b6e.8.2025.08.29.08.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 08:52:33 -0700 (PDT)
Message-ID: <960b23ff-827f-4ac6-a951-c61a0fec0c11@baylibre.com>
Date: Fri, 29 Aug 2025 10:52:32 -0500
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: Add driver for Marvell 88PM886 PMIC ADC
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>,
 David Wronek <david@mainlining.org>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20250829-88pm886-gpadc-v1-0-f60262266fea@dujemihanovic.xyz>
 <20250829-88pm886-gpadc-v1-1-f60262266fea@dujemihanovic.xyz>
 <4f93d53a-3dfa-4b9f-8c09-73703888d263@baylibre.com>
 <2250556.Mh6RI2rZIc@radijator>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <2250556.Mh6RI2rZIc@radijator>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/29/25 10:20 AM, Duje Mihanović wrote:
> On Friday, 29 August 2025 01:40:56 Central European Summer Time David Lechner wrote:

...

>>> +		*val = raw;
>>> +		dev_dbg(&iio->dev, "chan: %d, raw: %d\n", chan->channel, *val);
>>> +		ret = IIO_VAL_INT;
>>> +		break;
>>> +	case IIO_CHAN_INFO_PROCESSED: {
>>
>> Unusual to have both raw and processed. What is the motivation?
> 
> I was following what ab8500-gpadc does, no particular motivation.
> Considering the above, to me it makes the most sense to limit it to
> processed.
> 

In IIO, we generally prefer do the least amount of processing on
the value from the hardware, so IIO_CHAN_INFO_RAW is mostly used
and processed is only used in cases where there isn't linear scaling
or some other unusually thing going on.

So in this driver, processed probably makes sense for the resistance
channels since we have to do some calculation anyway, but for the
voltage channels, raw would be preferred.
