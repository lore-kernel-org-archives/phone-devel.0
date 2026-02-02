Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2CB356A17
	for <phone-devel@vger.kernel.org>; Mon,  2 Feb 2026 22:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770072520; cv=none; b=pi0fJ6gQPJMWd18zMHaLsb7LXxFLzlXx4FH4yuj+LM9GUUbQh4bsLIGJChalgjz+g/iOm+9hdw0l3dQKaCc4tESVsLTpxBsiDiGjtX4ZAa5hB18JnloL1O+uilf0ArKjFsxVVuoWglsSj4ORM4rcLxO6Qn4rRw1lqLzL9j4GM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770072520; c=relaxed/simple;
	bh=o3Bn8QuqwePy51tzC7oXfrEiDa31Kqfqd3Ab1p5UScU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/W8PqWY2SieSS+CKiTGITchJmP+JIXYwvSykQijuWDG9LnmpJn2p1dDTmBDnLW1eyj6X7Q3BT3Qz/1nGRt8fOvxgo7fJ3FLMHKwZA4vl4lxlFbNjR6SLERXhiiIPAbuz5q3toziSdo6e3ZNZ2JsFWxEaJIqFbP9QCFrBadEbQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qEindJno; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qEindJno"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-45f10d7eb81so2060757b6e.3
        for <phone-devel@vger.kernel.org>; Mon, 02 Feb 2026 14:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770072517; x=1770677317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSAtrL+Y9tqEZj9ofXU44Yu8l9qg/1Ym7mvkc+EsokY=;
        b=qEindJnoB18ZPd1pxdTXOjRog7jNXPfBKyYS8XoNguHmuM/X01H5ZsdhhOQ5do0/96
         WGtR8omuW3XkEutgE4JHcZ4IktXcht0YfTsQbTrg0pSsvTilP8ay/Mw/aDvhHOENug9E
         4q1XoAcnay7QoRfbtRfWPD1Rz+ZspNm85jZ1nAS0fIzr6QpSE2qHR+NCRq4PakSIIxg/
         nFmaWNPdYA/G3sTnfK8o1UbQt4t1HsdmMWdWnA9bePWH4gDPANlySzBLY58l/bbTDg7V
         /KO75u2bLzKAHg77233mFhwXaC0WANl7inhYAGwCYmsyMxii1XjLFYQZQzybUOL1AUHg
         sdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770072517; x=1770677317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSAtrL+Y9tqEZj9ofXU44Yu8l9qg/1Ym7mvkc+EsokY=;
        b=vsmqHhrgHImB1ZhZBpogGbMMcFwmlKe3LxITT8uuU8k7fB9I6n4UPi+iyz9nCYieu/
         SOGnB3a1ppUoAkm5xoWmyHKmB0UE9/eakPNGQ30gBdkrIMllgCL6xiHn/fijd7ymhSrs
         NVZiVFi8ss5DaGQ/sGHqlZ+NnUco071FoyEglTdf8kekSiTY2zrxoIIzCgL2tX5pyblD
         m8KRbRFk0bAttCi+VFQ/Wodk96tAKNpB2hrmeo65YvKaM9mvAeLkVrLTrsdagMC9jgh0
         5X7KXtB47nH63CLvgysNM3Rbc4KOTFnD+rgxmTzWEjZd/PR2umYMdoi0arAyO20q6j4u
         RHBw==
X-Forwarded-Encrypted: i=1; AJvYcCVLx66pATMuBz1DjWvkTBNX97UyFBAn/sBqzDshHBIibkOzCu2nE/WDH9/Q5v5HMafKKyThMMWwC98x9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2B2dAQeds8GE933+9K4chd5IUXrF53qcI8G8d8wpuZadfeVAS
	dWjIvFhAXWrPrWdoKM1U9W8wr8+Q6FL8NYQ061v9D+d/Xm1I5VGE+N+vW1LoWj1L4I0+holIDEQ
	rHAq4
X-Gm-Gg: AZuq6aL8RkA256JCMpsX1F3uhQUa93YHuPFi2gVn6m//tFTKrH6O+CcnXhnTDTnihDU
	FwHtOxHaSS/u7Jwv0Q7+ptxJEQbTsUl0Tr/1RO1HO6Ix0VLyeh1eWvHq8SO/03/zRBDl+L4jnTO
	0l9an/aEWnDjQtgpYv+MzJEeKQsr3Gss8tIUdBG7nbAI0YOnpwe0CmIr1nHxq4ItiQ9Ua2ipF+J
	lkVFvhDyULGeIIBUcfUMdhUfJqO61akdU2HBYp8NXVv3o8kZCtu8t5L1KBLmabrOqHOJ62AH5hW
	yeXQ71VS6PwfsuZ3vE3cEUsINOZym1eLW6icLzIjekBz0IHXhcSoRtj/HUry7JwJh3KqPhwGKmt
	3jrm3Hn4W0KSDjItFWGUY4X0WWOgzMY1QGXKsgq0KZwfXS09lQm+w/MwkFMt6Ko3NTA2sWy7i5v
	dPHwkOrgTp1sXS9CFK+ZZmZlpVXbULAluR6qAMPHldmR+cX1989rJNJ1rOdF2l
X-Received: by 2002:a05:6808:5391:b0:450:caf8:eba2 with SMTP id 5614622812f47-45f34d405e0mr5752387b6e.57.1770072517226;
        Mon, 02 Feb 2026 14:48:37 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08f22826sm9856970b6e.11.2026.02.02.14.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 14:48:36 -0800 (PST)
Message-ID: <086d6b35-8c19-4e92-9cd1-557b98991d35@baylibre.com>
Date: Mon, 2 Feb 2026 16:48:34 -0600
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b133521f-434d-4972-82a3-6e7978e557bd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 6:04 AM, Erikas Bitovtas wrote:
> 
> 
> On 2/1/26 8:45 PM, David Lechner wrote:
>> On 2/1/26 11:03 AM, Erikas Bitovtas wrote:

Pro tip: when you reply, trim out the not relevant parts like this.
It was hard to find your actual reply.

...

>>> +static const struct iio_chan_spec cm36686_channels[] = {
>>> +	{
>>> +		.type = IIO_LIGHT,
>>> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
>>
>> IIO_LIGHT should have IIO_CHAN_INFO_SCALE to convert raw to convert the
>> raw value to lux. If we don't have that info due to lack of documentation,
>> then we should add a comment to explain that. Or maybe we can make an
>> educated guess?
> No documentation on this is available, but we know that ASUS in their driver for
> cm36686 use 160ms integration time for light and, after applying their custom
> calibration functions, divide received raw value by 25 if the device is cm36686,
> or by 20 if it's cm36283. Maybe from there we can extrapolate the lux value like
> this:
> 80ms -> raw / 12.5
> 160ms -> raw / 25
> 320ms -> raw / 50
> 640ms -> raw / 100
> Not sure how accurate that would be, however.
> Xiaomi gets IIO_CHAN_INFO_SCALE by multiplying a value retrieved from a device
> tree property called "als_trans_ratio", which is not documented anywhere.
The ASUS driver is an input driver, not IIO, so not sure that helps.

We could start with hard-coding the als_trans_ratio in this driver for the
scale (and write comments explaining where it came from and what we know
and don't know). Then at least we would have a scale. And if anyone needs
something more accurate and reverse-engineers it we could fix it up later
with a DT property or something like that.

