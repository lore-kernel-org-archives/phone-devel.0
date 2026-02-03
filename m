Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C273D3019
	for <phone-devel@vger.kernel.org>; Tue,  3 Feb 2026 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136614; cv=none; b=Q3/iokWPggO1jYpE3T7cI1eRBsEn7hltBmCjjoubFc05xn1iZ9tX65Zr4zRCFzzuhY1Y9p4x/Egn7hKxELIS8pg8yAQOpwzttDI6lo4RIu5c9PkyD7sg21t0mVw5+92QDmfvZ91ndjLCyRUQELZ2y6l8oqv3v+p/bHzuiUi+OSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136614; c=relaxed/simple;
	bh=DmlvpbzDEq4IPSeR2r7sL20gZAslDIjjLsNOaO5v9XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2l0uPbH2my93oAK9pDjMFIGUC6hQ+st9wO+PI8d7uhjSqJe4fx91om+Qn62t8zcZjq/dGVk+5Q4bpeZGpzW5zxxM1o9OFUia5grOyImEk0yFGVo9WE2UyEq1Q4lUMdDa8U/aA7vyTLGpAgH5CBJ6AyfL9w7vwVSF/OLlXV/VJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qapDFiCL; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qapDFiCL"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40946982a78so1942403fac.2
        for <phone-devel@vger.kernel.org>; Tue, 03 Feb 2026 08:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770136611; x=1770741411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DhiJ2nzhxoH58/LPSL3akF68TqoZ8tdv8BmXMofsceo=;
        b=qapDFiCLn28srBWgtOrErna+DeSYdTC4UsTktUpYxxZLvjQ+fWqBzQc89fCDRzfJB1
         vV6kHWf7ah+aEemr7ZII9Irfqez+0KwQH84vBIG/5wumYre6MirCFz5JSdQZKK4hkYO1
         caC16hyALKnWchpkHnhzaXrYfLK0xD5hq2am+zL3jMvQEua5fhJejzmnLevLcp/VrDec
         iPu2Ui14cngqxgAAo9KWN7G9j78gRTXBrEloO8T5ge8hTjQvOkVpU2cbk/eVJMGXbWV4
         iAmWd+JSZEDwXhqa+HIbcYSflr/c6S2654Ow1IzS2a+qD3tk+6GzkfRlLe7ltY48GOPT
         RMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136611; x=1770741411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DhiJ2nzhxoH58/LPSL3akF68TqoZ8tdv8BmXMofsceo=;
        b=gPcac9dHvm7KjfwgnyjIJLEGuTYVWk6miWo8TNYEWpCGYgIkM6obOro59zLOfE1eLC
         lKcG2ypFfwl2FYVCK1h6qKCn5OSRgd5PcmqqCdeBDOjQ572wrNh7OuGo5evbtoyc0Y8N
         IZBlO9wKveJPNvBtCGUKmPwX3GESQoFcv97S2nKghHJnRLg1InMCyxyOmfQfj3T69+Sx
         dr4BWIr8VsbgGovV9DCaL4I7IIMtyyxUHOk/9FliEPjLFTybLsA1UoQ2zuOPcPs7n72V
         OPp/FcjuupuGVQHadUsCmH8s5smr9l8ocX6UMKsapsqv3t3lGJy7J7tjlpWMgA8/k7aW
         /GpA==
X-Forwarded-Encrypted: i=1; AJvYcCVAYECMj/Dlt4huogxLXylkvny1Val+DDLc/GLsgbWaRqf285wV2379vu/a+qCssktozkFmMK6Qm3YuKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+GUEHhM4jJHdXp7KdiT4rJ1TIQEpVESB69mGOAsdPhPMCE9w
	QD35oPzxNavPXxIheca5dOS849hUbpTTMl31UmJNASEApNj5KkqMGdb4Uapki88q9W0=
X-Gm-Gg: AZuq6aIdL/EIJwqzZiqeRBwC+cK/nFRZZ04vYWsr+Yjyv3yhXDPsClPTTKv8SzlN/Vu
	fZl32Wz27HX8e61435DnoKa5vCO50iYr8S2UScVEMVNz3yuZEtyN5sEEomMx+hH4XAUYEo+w7tS
	oqXHou5nF+0UFuIDlol5L/vPmEXb4TgWAo9LlZ1K9u4jhMLCa4kjmXcaow0gwKI2oOR2Hht0ANQ
	SDv54ygoiFkzNYcaTcy5nAvf94EAx9/1sVu3wGoG6tAQwBtmYc/ZNLICyOltT/xHd0ZvdjmPm0U
	u7FcuFjEGt0sX3khHnlRaRdcQpoIR4pz/Z4XBsjHNksxODj3S85MT7U+kaXacj6ytexTFy0292n
	eoAOBGRNEy7iS03jHRpZYCJ3fJ9YYKzRKuq9kS8fcGv8Gk1LCiGJE+OTrU0yrRxlo4K5rczoOab
	0MH/O3JdaFoHR4Cd0Kw9beJAXoXG/F0Hx7MqPFwcTvDqm0Lb1rHI7jczo=
X-Received: by 2002:a05:6870:3512:b0:3ec:48d5:5a50 with SMTP id 586e51a60fabf-409a6adfcf5mr7572564fac.19.1770136611130;
        Tue, 03 Feb 2026 08:36:51 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:8e13:880:992:e796? ([2600:8803:e7e4:500:8e13:880:992:e796])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-409570f63b4sm14278713fac.3.2026.02.03.08.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 08:36:50 -0800 (PST)
Message-ID: <0b001503-5882-446c-a0df-642a9f75e7e3@baylibre.com>
Date: Tue, 3 Feb 2026 10:36:49 -0600
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: light: Add support for Capella cm36686 and
 cm36672p sensors
To: Erikas Bitovtas <xerikasxx@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260201-cm36686-v1-0-4949a2a9ba63@gmail.com>
 <20260201-cm36686-v1-2-4949a2a9ba63@gmail.com>
 <eb922433-3951-409a-a397-b48efef57b7b@baylibre.com>
 <b133521f-434d-4972-82a3-6e7978e557bd@gmail.com>
 <086d6b35-8c19-4e92-9cd1-557b98991d35@baylibre.com>
 <372c9172-ea01-4a3a-b737-3f7f14519791@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <372c9172-ea01-4a3a-b737-3f7f14519791@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/26 9:41 AM, Erikas Bitovtas wrote:
>> Pro tip: when you reply, trim out the not relevant parts like this.
> 
> Noted.
>> We could start with hard-coding the als_trans_ratio in this driver for the
>> scale (and write comments explaining where it came from and what we know
>> and don't know). Then at least we would have a scale. And if anyone needs
>> something more accurate and reverse-engineers it we could fix it up later
>> with a DT property or something like that.
>>
> 
> In arch/arm/boot/dts/qcom/libra/common-proximity.dtsi Xiaomi sets this property
> to 16, and they set integration time in their driver to 160ms. Maybe
> als_trans_ratio has something to do with integration time? 

I assume you have the hardware and can do a test to confirm this. :-)

> In that case, we can
> calculate the scale from a formula, like this:
> scale = cm36686_als_it_times[index][1] / 10000 * 40000
> val = scale / 1000000
> val2 = scale % 1000000
> This would allow us to preserve lux value when changing integration time.

