Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C92128689A
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817484; cv=none; b=iZkNAxmSI2w2Dkg9j4dq/QqHcnCzy1srfS8kkdPS2+QHC1UajepTBh639D3CZ7bWzjQeHRLMND6zXgiA/aMDcbjGeAbLAWtIEdFbXAuof221cRKm4lzDceQInTw+TGV59+8MEdN24Wz4FAk93XyxcffpcvckPIlt9HIddZ3tYLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817484; c=relaxed/simple;
	bh=/11VEqhwGxvQVfEDWs9HDEyvesu4S7SCHh6a817GTv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKg0fF5Q3FoB6DEv208LaRWHVHN2f5X48bPmn3AswmhCSW83WZEnwLab8PyX7hwusdf/xp3j6f0OqD0Eu9tBSTTTl6/UYYdl4OSwQGqnXlhcB5sR8NkG78NNoRg6SRIq7f8xYnVIyzgayz5XdAcx0dzV7Gd8DKq6n1rBHlqJwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ammpMnLC; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ammpMnLC"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7963a209b97so20803027b3.2
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 05:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770817482; x=1771422282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esoqYJ+UQfCawlbPhicOHbgq8QCm1eQe//LmcmVz62g=;
        b=ammpMnLCDSU8/925KEqywCJQsTU16jSgPFdnt9mJ+k0L7rENtPUwofJwfXkTYTXuBk
         ZyBIjIgQUvchWUetpkvugpujW27MetLsO6Gu5NqODvFCgnLEUshW1CK+YrQK2BO6v6kB
         zhlpNbr0Txdtg8XZr6MAQ8UQLECHH3bBQ+nqVZqZ5sKO4RQ7b/EiTAgSJtV3TQ4zIJL6
         suflbg/YZcdbs7l1SfutiXetl8YNeyd/2I+1OBUWdx447R/iq5CaK1YAogAUhMZjKhQJ
         lc7Pl3dvvROCpIyK6LDt32eFqIycoMnx6pnJPLxQrHkmeuIoGAzJ3NN6BWcI0xBC/H20
         qFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770817482; x=1771422282;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esoqYJ+UQfCawlbPhicOHbgq8QCm1eQe//LmcmVz62g=;
        b=bbXwc59VGAXVgUXxI9eMDFN0KULd69+uzYG7LMRlufq+QijEDcgbrL4U6lTIllYolC
         MeBj/b0fvdME3WqDwD1pA/CFG8y2T/PhFRAe29LJnMKE7KEC154z4UpHjV87nGusfjz8
         xzsHEu1sDGWi4k/cVYrW0zcFGSXZhLAHQAm91sl0030MoojBkx8C6YVKlBV0UDRRIFdB
         +XzwUtOIhscHdcnYDhOYge5T2Gc0r1T9HHd+WAKDPgFqqXMkGdmeQ1Jbhu6dAd55zxeX
         bTAcWZgnmq0L/vu2J7a/8629BJ7WkD8MDCh09EZF/HXqcOs4rEhJppMJ7BzMCyyC/IqN
         sxiA==
X-Forwarded-Encrypted: i=1; AJvYcCVnexXxIaGfdRApk1My6kCX20eXL9SwjlbBiBcNaimMm0/CvXqml+7H2oI8BwsYaMY1C6HzIYUTHIueTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiMDAzvcHYkCRnjmdV6h1CsRDcDSrl7Ld+D9zAVRAeGwydHM//
	V+BNzbTnaDB8Bah1kRmVAbosRCgB+/ADp4ZSCUaSAMpsTbG4XyoQzHmP
X-Gm-Gg: AZuq6aIw2RwlSA3vax6i1HxepWl6zOrFo0UEbNAYpxRTzDZs5TNhYJY9huRiXgO2tFw
	i7ktoE8dEyBj2N1WT10vQC0bPLIgforIpEMAKgCZ0GVptZCbuaOrfNjXNQcwgV1bDQ1m3LwjvbO
	n+LvDhiAtS2xJpZwdaHd4caO2iDOeHv9SudXCt0ReWD8TIPQQncWX6dNUXNxOedl1IfbBjaT3jk
	MhVnFzdrvka+ZfmbDlraxt3P0nekzEZg6xBxHxQQxV6DZUhfCB0L82gq4PeO6ko0oGsplw1QWPJ
	fwQHbcBBOh/fY4lP+hWwHCTAKzGrsG0kqYyEHFN37nkJ/VDwe5b0WVkxNG9WtfY2/jhIZp5UtZK
	QasrxbZvQBGOiZ5ljwTtlFN0i1252Az421859ORUBal/nEdWpYD6vZLSD8VW6FgAVld9bCMvKRq
	+yvgpQ/N43ZrJ3BOatjl5L0t8kMQ==
X-Received: by 2002:a05:690c:9b01:b0:794:71b7:2adb with SMTP id 00721157ae682-7952ab24f48mr346147957b3.38.1770817482271;
        Wed, 11 Feb 2026 05:44:42 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18bd49sm16215487b3.16.2026.02.11.05.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 05:44:41 -0800 (PST)
Message-ID: <59d12283-28c0-446e-b591-a7c3d022f50e@gmail.com>
Date: Wed, 11 Feb 2026 15:44:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: light: vcnl4000: add Capella
 CM36686 and CM36672P
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260210-cm36686-v1-0-aef68dd46ad4@gmail.com>
 <20260210-cm36686-v1-1-aef68dd46ad4@gmail.com>
 <20260211-sceptical-frog-of-revolution-fc3cf4@quoll>
 <b95d7a49-6191-4d85-b725-4a941505b40d@gmail.com>
 <6f97c68d-0236-4d04-8199-768ecee7c4dd@kernel.org>
 <242d5502-bf58-4e25-8258-8a6c75ff3623@gmail.com>
 <aYyGIPNeHWpluaoF@smile.fi.intel.com>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <aYyGIPNeHWpluaoF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/26 3:37 PM, Andy Shevchenko wrote:
> On Wed, Feb 11, 2026 at 03:32:41PM +0200, Erikas Bitovtas wrote:
> 
>>>>> Please implement previous feedback.
>>>>
>>>> Since I am making changes to the existing driver instead of creating a new one,
>>>> I introduced a new patch series. As I mentioned in the cover letter, cm36686 is
>>>> fully compatible with vcnl4040, so instead of creating a new binding, I create a
>>>> fallback compatible for the device. I probably should have named this patch
>>>> series something else.
>>>
>>> That's fine, but that's v3 of previous patches. Your work was to add
>>> CM36686 support. How you do it, evolves, but patchset/work is one
>>> continuous work. When you rework approach next time, you also start from
>>> v1? And then you go back to previous solution of new driver it will jump
>>> from v1 to v3?
>>>
>>
>> There has been a misunderstanding. I assumed that since I will no longer
>> be developing that driver, this warrants a new patch series. I apologize
>> for this.
>> Here is the changelog since v2:
>> - Remove the previous unnecessary proposed driver and bindings.
>> - Add a fallback compatible for cm36686 of vcnl4040.
>> - Add a new compatible for cm36672p.
>> - Add channel info for cm36672p.
>> - Remove redundant information in the dt-bindings commit message.
>> Here is the link to v2:
>> https://lore.kernel.org/linux-iio/20260209182432.00006c3c@huawei.com/
>>
>> I have received some feedback regarding the changes I made to the
>> existing vcnl4000 driver. Shall I submit the implementation of it as a
>> v3 to that series of patches?
> 
> I guess v4 would be better as this is assumed misversioned v3, if I got
> the situation correctly.
> 

Yes, I started a new patch series when I should have continued previous
one. I will submit an implementation of your feedback as a v4 to the
patch series I started initially. Thank you!
