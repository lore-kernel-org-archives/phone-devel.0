Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9FF38E124
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658253; cv=none; b=T4Qh3xsbxwp8GqYUNkNkCENCYg/6O0Asr8h1KEPVnO5H0AZazu2evIIJzNuUsidBkjExj753z4OJNFQbJ+qQS5KJLWG2YaQXXRMxp3yX/mWkBdcBZlUKuM4olECrjRyR6sRVNAwJnqhESTviqkdNs1fXZAg/knOoRLcQCeiHjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658253; c=relaxed/simple;
	bh=WuphdEG5WMxLm6CNAhSgSsU6b0QIPWdhcGxytQxDhYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMRsU7pXdP0c92rW2VAKcJd2gUDpug331djI2So+T4ADuleWHBjK5051yi3GdpszHtHKcrFRa9gWZbSLI9bLvMBKxUb2yCBUxeuVDwOYuSVwNd4WUKGpgSjllZPdLX969HU8FGWkAf4t5bd2VBJE/3B5BVkLuzpNEaBT/jN7OwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6KzD6Pw; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6KzD6Pw"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97b7e0368eso123216966b.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 03:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773658251; x=1774263051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zX8fXT4dHsVZo0l5cubooJwv9HgtnAM6ONAUv7CG/fA=;
        b=M6KzD6PwcDBQIurPbir85r8pKHXKRKvTDPGiys1DP+DpQdsRT6jxbKM5lN5Uo1d0mC
         qEfWaP5s2QyE74wXIWEbmxVI+eC7y0SDlPNqhP8eZ+fXcvpFrOzJtEVao0MyjsTXMpzf
         Hhtehg10NKPFwzClLdoS8Vh+ifarA0vS8ijxz5Rs/VtiFmGKtQP0YWifeiX1MnajLoIt
         VE2qrswvd3SGB/bld90gl9GNBxN5CNs2G0FWkHmUWh/vHiqc18OXYzlVnQLVGLIgsrZf
         nLjscrbhwt248WYCrqfQ9TRtz/X6BcsVZYJTMBCxPZ0HcN++1n4vF1ZJrUbw17aHwMtt
         dwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658251; x=1774263051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zX8fXT4dHsVZo0l5cubooJwv9HgtnAM6ONAUv7CG/fA=;
        b=Tub6H94vaVf+LR8MAe3mlocUqULlZSK7l2hotzcJWXKGvghZ2dLlFId3Pp0w2ILu5j
         oyXzxhJ7/QDCUrs4MMM8S2sZmgza65Vpzd4H/ifBYXTI/jfIbpQhNYKYwREyaVc43m6R
         p6ZAgsKz/jBpoA2pNwVMmkfvYDZGi8V2nkIWQEdeb/8kd9Dral8phFE6E47qACKiOcCC
         6DFYKizyA9mQ0slfJ8UYWucwc+EUT6YvH0TP5+ZC/8kFgODPih/wrMde+HePygT1SPij
         Kwc4Oa4gV7XLzzUowp+51NGdJZ9jN+MWczBHw2sGk56yLIdE8cXLwH0pi6Yec12tOi7e
         D73g==
X-Forwarded-Encrypted: i=1; AJvYcCXt+jvCwlWd8k3ClZaU3sWaSKXAtX7ynlWQWP18XMjPjDcAjhdlGPpA59bAwUUGQ/HgTK0grfervPLmRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybE+3M+lYDoKoNa8RPe8qd4x9dnPKmbVKdyZRLM4Eqe216PQl8
	zLSGCrb6lr2CxaozZoRgU3bgzhstgnPPZMgREGDblxbGsLFYcD4oPekSPbFXCNHG
X-Gm-Gg: ATEYQzxHeb412M6W+Q11DkTvqwGPwK8996/DPgDEVjH90IDaJI3L1hgH8jCGsh2pypF
	9t7pupnIrZ2bzjCb3znRVz/A/YpdvHE94U6d3l+yx/IQ6Gn4i4yh4UsN64zX0b10XSnDCWxHcHX
	gBDoYXqlig9hBBtCCqLcNEwjkIUVDuJZn0Iw75mGwmZIptvX7Od8Yr5fXqRIMcUSDkZfbwkPN1W
	rlP9RQskJ7qTp1oIMe4CKVN0/CSBhZqQME8ZLpF6g3s0G8ftgXywlVm1u7bcIwyC4HBMTG07ZLz
	648nB1m05EniXOEzW7TQCH/iAc6lcEgPP3Gvo6BpztFy9u7IorMdahtdr+pNuqGA/CKQrPLnjhj
	yATPvntY8+7xc+R9Hg0G0DXjMxHc/442XYLVsGDCUzCGFtY76MrDG0wzwJyRyQhck8YfIIvmr4C
	PJs69KGh3/B0Rlq517xLXJ7jyl7g==
X-Received: by 2002:a17:906:3554:b0:b97:1009:7536 with SMTP id a640c23a62f3a-b9765052b4fmr564364966b.15.1773658250384;
        Mon, 16 Mar 2026 03:50:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb49a5sm539384566b.31.2026.03.16.03.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:50:50 -0700 (PDT)
Message-ID: <6cc8f5ab-2671-4975-b24c-b17d4aab656d@gmail.com>
Date: Mon, 16 Mar 2026 12:50:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] iio: light: vcnl4000: use variables for I2C client
 and device instances
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
 <20260314-vcnl4000-regulators-v3-6-3c4a48d30676@gmail.com>
 <abfd5pLsCuPK4lV3@ashevche-desk.local>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <abfd5pLsCuPK4lV3@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/16/26 12:39 PM, Andy Shevchenko wrote:
> On Sat, Mar 14, 2026 at 06:06:35PM +0200, Erikas Bitovtas wrote:
>> After moving data->client and client->dev into variables of their own,
>> replace all instances of data->client and client->dev being used in
>> vcnl4200_init and vcnl4000_probe by the said variables to reduce
>> clutter.
> 
> ...
> 
>> -	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF1,
>> +	ret = i2c_smbus_write_word_data(client, VCNL4200_PS_CONF1,
>>  					regval);
> 
> Now it's perfectly a single line.
> 
> 	ret = i2c_smbus_write_word_data(client, VCNL4200_PS_CONF1, regval);
> 
>>  	if (ret < 0)
>>  		return ret;
> 
> ...
> 
>>  	regval = ret | VCNL4040_CONF3_PS_SAMPLE_16BITS;
>> -	ret = i2c_smbus_write_word_data(data->client, VCNL4200_PS_CONF3,
>> +	ret = i2c_smbus_write_word_data(client, VCNL4200_PS_CONF3,
>>  					regval);
> 
> Ditto.
> 
>>  	if (ret < 0)
>>  		return ret;
> 
>> -	if (device_property_read_u32(&client->dev, "proximity-near-level",
>> +	if (device_property_read_u32(dev, "proximity-near-level",
>>  				     &data->near_level))
>>  		data->near_level = 0;
> 
> The 'if' is redundant, I think you can drop it at some point, probably to avoid
> churn in the follow up
> 
>  -	if (device_property_read_u32(&client->dev, "proximity-near-level",
>  -		data->near_level = 0;
>  +	device_property_read_u32(dev, "proximity-near-level", &data->near_level);
> 

device_property_read_u32() throws an error if a property is missing.
Would data->near_level be left without an assigned default value in that
case?

