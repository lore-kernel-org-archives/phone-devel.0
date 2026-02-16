Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491D2989BC
	for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230093; cv=none; b=UkWTNUfe+m+QFDhJSD4PlcDWX84wevxhrJgztMGNYLLHRYOAKXg47MQVdr8H8EDUaU4Gp3awmCMcO9z0kFmkikhjcZGc+OBuA+DDLp4DAq8rTlNFhpi2GMpD4w3Kt7+Vy0twHputMI2voc2zFyexBEZgG4UGQW53fSgGqINadbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230093; c=relaxed/simple;
	bh=LmoIiNsEzfLbIC3836JjpjSfjkTK72m98YA7I3RTuXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6JSXHI0H4K3pcy+XAHCLswrR3nnAz5oYYumLLMZ2g4RGzEHtGprhqxC4HnlQlo+3qVvOq5pwNTyp28VA2XDEkGJDAdiR2wPuoAQOm+/27fmq9U/DSdzr8OfmGupCT832ESCqhTLCtjEjMGr9izeLrUq25AIKCt4Xm254KZW72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT6IR6tG; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT6IR6tG"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso2712798d50.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771230090; x=1771834890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8E3oN62iqBuReJ1CGIN4gkipeARNhtk8Z1Vbrqmrh0=;
        b=BT6IR6tGhTXwoBLrh9b3w+qrgbMZBfSAe9QS4oPGoTlKZoqtCvoiPSa0he/CBSYdTz
         rDt0arxcIzRS5oMQCkyMflvJ3rkUv+aurSzLZ6j0dxbqt9PT4Ab8LVoPUdADhkiOg7bx
         AkP1NHPBG5TnIFr3w18GnSl1cp/jWxiTioNWT6ixvfLofFfwCjqE38d5BHt4aLMdYXBs
         RPteKQft05WF8kGoE7ZkG2A0T12s7oc1m7tkcZ391xQWZ0dwaRkONpe0O9rGEWUZ/nRd
         UK5dfDDludfoNYIYa9pI+yf4Q3qfLgkUpCWt3z/ojfwHz2pxU/14SISM57Q5PGmKq5Ua
         lPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230090; x=1771834890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8E3oN62iqBuReJ1CGIN4gkipeARNhtk8Z1Vbrqmrh0=;
        b=FVz3FJSfbZBl2OmpAywh/S/lCDvKTJeyrb2+Q6HdjjcwNxAHMCatOZ9/zUiofzAXva
         oxSB3mFMBKDvsm8P7fnWxZ8M0isT4NhJN5UdPIU00cNiTDZc0xl+x9vio50NfJ0gFrrx
         G/r9J/6LpyvfS0WOMy5GeYEPpyGhQ/5ZUmtQkuITYWTpW8vox0z1cxBt9U3S2zwPy2Zr
         1HYUvr+Il0OWkJ9S1kqHIQaZpekv+jBYX1vWafsvWHuAuXBpLkmZumyh/ZqRweUnEEyU
         T9gI/pdUlsEHYkP3bdt9Z7Sel10nvf3vnIX4iFlS4j8IwPUIxV8haijYRvNskUm8MdTW
         Bkhw==
X-Forwarded-Encrypted: i=1; AJvYcCU1wooSP3cKX1wcug5isVDXw6eQPZaOKchxIunjwtNhN8/kjdc2WU6+yBpn6sFbIUfak4E4rCtR7GGG9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRitslOGnnG3mmsYvwYy20hLiqIIjKvgetbS2TAfyAyP3NwlLM
	Hs0m/uTvTXM+55a0woAFiNp2/G+vEG9fspCw2JFrZYFTP8GzV02NwTVb
X-Gm-Gg: AZuq6aKOGvwwuUx4twpcd+iC7TNAT9OHCNb75e5tFbw0qc3QNTQGHCAW1XDCdxrsd9K
	9Zq6wWxxUe6hwKfjCNsqMior/1dv5RkHuhUerHTt81kqU7U+Y9nLibm7nL/UivLkkAu2fh6b+5X
	jqf/yS6cPOjV1LbdBJoZR/JplhTuNhGMkpzzP/z3AN4vyaJz7lfBk3BN2H4AYOGW3S/vyrE7ltA
	sDoHsC+iwmSWC8B15rRC9RaVAR6ANsn4rETK50jciFb48PI/4FVewcVmpY3YIfIBmCJ8mVNuSea
	QRbOqy9gs0HUYgjLBtYtZA5/JFa0exNk7PjliyB2Vb8s8BG/5wuzIm/nG7mg+0tKYyNdJBOXm++
	caicR1ducaCuUYZ21TqfY7jEKRZiHxZ7uObulbZ9IIScdPge8U3Sfms0Gxx1TlP7/IoGflj+xWP
	ecN/J1AHBJoOBTNwyUHo/ZNBm4FQ==
X-Received: by 2002:a05:690e:e8d:b0:649:b31e:8f54 with SMTP id 956f58d0204a3-64c197c7b08mr7964781d50.24.1771230090014;
        Mon, 16 Feb 2026 00:21:30 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22e936a7sm3079779d50.6.2026.02.16.00.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 00:21:28 -0800 (PST)
Message-ID: <ceb597ed-3380-4952-b159-36f3862bf2c2@gmail.com>
Date: Mon, 16 Feb 2026 10:21:23 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] iio: light: vcnl4000: add support for Capella
 CM36686 and CM36672P
To: Jonathan Cameron <jic23@kernel.org>
Cc: andy@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlechner@baylibre.com, krzk+dt@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, nuno.sa@analog.com,
 phone-devel@vger.kernel.org, pmeerw@pmeerw.net, robh@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20260215193114.2a1010a8@jic23-huawei>
 <20260215200628.53841-1-xerikasxx@gmail.com>
 <20260215215519.23126ef3@jic23-huawei>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <20260215215519.23126ef3@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/15/26 11:55 PM, Jonathan Cameron wrote:
> On Sun, 15 Feb 2026 22:06:28 +0200
> Erikas Bitovtas <xerikasxx@gmail.com> wrote:
> 
>> On 2/15/26 9:31 PM, Jonathan Cameron wrote:
>>> On Sun, 15 Feb 2026 19:28:56 +0200
>>> Erikas Bitovtas <xerikasxx@gmail.com> wrote:
>>>   
>>>> On 2/14/26 8:09 PM, Jonathan Cameron wrote:  
>>>>>> ---
>>>>>>  drivers/iio/light/vcnl4000.c | 40 ++++++++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 40 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
>>>>>> index a36c23813679..1f8f4e4586f4 100644
>>>>>> --- a/drivers/iio/light/vcnl4000.c
>>>>>> +++ b/drivers/iio/light/vcnl4000.c
>>>>>> @@ -185,6 +185,7 @@ static const int vcnl4040_ps_oversampling_ratio[] = {1, 2, 4, 8};
>>>>>>  #define VCNL4000_SLEEP_DELAY_MS	2000 /* before we enter pm_runtime_suspend */
>>>>>>  
>>>>>>  enum vcnl4000_device_ids {
>>>>>> +	CM36672P,
>>>>>>  	VCNL4000,
>>>>>>  	VCNL4010,
>>>>>>  	VCNL4040,
>>>>>> @@ -235,6 +236,8 @@ struct vcnl4000_chip_spec {
>>>>>>  };
>>>>>>  
>>>>>>  static const struct i2c_device_id vcnl4000_id[] = {
>>>>>> +	{ "cm36672p", CM36672P },
>>>>>> +	{ "cm36686", VCNL4040 },
>>>>>>  	{ "vcnl4000", VCNL4000 },
>>>>>>  	{ "vcnl4010", VCNL4010 },
>>>>>>  	{ "vcnl4020", VCNL4010 },
>>>>>> @@ -1842,6 +1845,22 @@ static const struct iio_chan_spec vcnl4040_channels[] = {
>>>>>>  	}
>>>>>>  };    
>>>>>
>>>>> ...
>>>>>     
>>>>>>  	[VCNL4000] = {
>>>>>>  		.prod = "VCNL4000",
>>>>>>  		.init = vcnl4000_init,
>>>>>> @@ -2033,6 +2065,14 @@ static int vcnl4000_probe(struct i2c_client *client)
>>>>>>  }
>>>>>>  
>>>>>>  static const struct of_device_id vcnl_4000_of_match[] = {
>>>>>> +	{
>>>>>> +		.compatible = "capella,cm36672p",
>>>>>> +		.data = (void *)CM36672P,
>>>>>> +	},
>>>>>> +	{
>>>>>> +		.compatible = "capella,cm36686",
>>>>>> +		.data = (void *)VCNL4040,    
>>>>>
>>>>> Is this necessary? I 'think' if you drop it we'll match instead
>>>>> on the vcnl4040 fallback and then the access to the data will be
>>>>> through the stripped name only bit of the compatible (first entry, not
>>>>> the fallback so cm36686 in this case). So you do need the cm36686
>>>>> entry in the i2c_device_id table above. Probably better to keep
>>>>> this here to avoid having to reason this out - but perhaps a
>>>>> comment to that affect would be useful (assuming you verify my
>>>>> reasoning).
>>>>>    
>>>> After I removed the entry for "capella,cm36686", I received the "Unable
>>>> to handle kernel NULL pointer dereference" error in dmesg. And at least
>>>> stk3310 driver includes a compatible entry both for the device (stk3013)
>>>> and for the fallback (stk3310). So my assumption is that this entry is
>>>> needed.
>>>> I could include a comment explaining that cm36686 is fully compatible
>>>> with vcnl4040, however, if that is necessary.  
>>>
>>> Thanks for checking.
>>>
>>> What did you get as the backtrace?  I'm hoping it'll explain what I'm
>>> misunderstanding!  The hacks around using the wrong table for compatible
>>> matches have tripped me up before.
>>>
>>> Jonathan
>>>   
>>
>> I am attaching a link to the dmesg. There were quite a lot of lines in
>> the stack trace and I am not sure what is the right way to post logs in
>> the mailing list.
>>
>> https://pastebin.com/QgeTdNEP
> 
> Thanks. only relevant bit is probably:
> 
> [   15.566076]  vcnl4000_probe+0x54/0x288 [vcnl4000] (P)
> [   15.566102]  i2c_device_probe+0x2b0/0x358
> [   15.566121]  really_probe+0x154/0x448
> 
> My guess is my understanding of i2c_client_get_device_id() is wrong and that
> is returning NULL.  That can only happen if client->name is not a match for
> anything the i2_device_id table.  If you have a chance, can you dump
> what client->name is in this case? I thought it ended up as
> cm36686 (stripped first entry in compatible) but seems I'm probably wrong on
> that :(
> 
> The path I thought worked was via info->type (which gets copied to client->name)
> set via of_alias_from_compatible() here.
> https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/i2c/i2c-core-of.c#L30
> Which should just return the first compatible without that vendor prefix.
> 
> Meh, this doesn't really matter anyway as once we refactor to actually use
> the data in the of_device_id table, we will need the entry and in the meantime
> it's sort of documentation.
> 
> J
> 

Apparently I just had commented out the i2c_device_id entry for cm36686
as well, when I had to comment out only of_device_id entry. After adding
i2c_device_id entry back, it works, just as you said.
I will submit a v5 with of_device_id entry removed if that is necessary.
