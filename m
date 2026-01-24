Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE825F995
	for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 20:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769287100; cv=none; b=KH8f+OcGQiIEESM67/1LJq2eykjfBByixgQFfdqxdkScvdrkSngZmW/yCMEy4oslWobN2wIZPZTMYCqf+NsO0IKyFrb99LFzAcpQUM4yDoaixYYUe+Jv1cizhp9Ae1D7Ub/Q79WO+E28O4QR0h+9XcESKAUX1NusBfyFYDpBNKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769287100; c=relaxed/simple;
	bh=5TwcK1cHSHxshCcEuJXkjDecpL+iJouL9MEuobqZHj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHw6sHq2v8hT9IYGGjk1rH5n009vXCUgqi6zcs4n9QAD/XQgdXpqDrIZ4ATTJ3VpGKi/PrY05+xi50sR4S2yuuWt0SsGhTfysHfPq0PDJrzyYBLBpzowS0xznRqa7QfSmfKgl9SYyyyqEC/twxs9pFFfxyqHQYTNhn+gZ2Paeno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3m5yext; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3m5yext"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8860d6251bso250432466b.3
        for <phone-devel@vger.kernel.org>; Sat, 24 Jan 2026 12:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769287097; x=1769891897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ks7werMcRLWScIDwchKyMn4ZfUa1coG8Di8dX4xc64=;
        b=W3m5yextXKNLngHi4UDVuKyHUiNzNkqAtpJExe6JVl13I5tNwUP68FcCGaTKO/7nuH
         BVSsY+hrRiY4y5I35jBn8Rt8D3S6uIKSRMMEPQile9kWBb7mgHaHLwOBaynS75EHgcWa
         t4ZvuOLSFExFtBTbfdvJPM52xB2ZqF/sBUfPaRSntGDi1ITMRClNNd5zGSbh8ogfg4qu
         vUkhJEjArR9ByjjCDWviTNMOJZh+7y1c8vfFoC6pmz65GWXSaDpq4UZs6ljDOb3j6pzj
         qI1ViXegWssQEVr4s7GEMZ2OUYvMOgXWV2Ff3SQ7Vbx7LesmTtYp6eGV+a4aDGassepY
         zJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769287097; x=1769891897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ks7werMcRLWScIDwchKyMn4ZfUa1coG8Di8dX4xc64=;
        b=d7srpd74zAcSeufClRXQ/HNNdZKDoGxfNP8j+G478cOJD26Be5Z+zYiNFBnnXigQza
         IP8BbSHGu6lPC+5xIxBpopbAhPtHpeDne7gh0LmV/03sMmXtm6zCHAgklSyW4w7TP9cI
         F+mOtM+fAZ2P+7mj5qxrBGhNf0gG3UIge6vLXrmsX7J7IypOeUWMvh2pJfqPxzQtaz5r
         CPaqpLMih7ETQTT5OOnRcd8jW1tMH75iLNAlAxe/arLkcw5HkEoJAzPoYyJY+CLMUG4J
         NSgX+zCuV9qplhgicR19x7QDDJmZGCO43Yenkn2CE4wxDZl2dsOWuEHqG2W1OP/y6fQc
         Onvg==
X-Forwarded-Encrypted: i=1; AJvYcCXMhSfkurESHfvjIGVhNKkWllcwxUM5LjPxWrr79Njm1X87PqKNA03X7hhwzjMKca3jwYgf6Ml4yh4HIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsLVVnzvScxBnVD0egRu8/X5N5fIdzhj1pUmXC7LQ3MUpyH/90
	pvFVFIgWCpwKtg5G2GbNEqEx1UUWOGEY8vamA9EaVzxs/ESIkexcyTQu
X-Gm-Gg: AZuq6aIH9sIyNi7qjxF+xBKyY7xkwcEkXhKhk2pjWU+2adDTMGoEGeNefnlF4sZR621
	kBR4W+Zbbz2JXrX3aYpBpwMlvBKSdrQYGr3LPqRHRvnt1tE1kcD+PKH4TqP6iRpkttn5bYITSY8
	7ms7Wz9Z1R7vcQHKdC4/3lohY8gzQcrE9GdmWBAmgcFe8mUSSbVZrwUASud8LPGu0MRtWoFfD+B
	/PA4m5QfNA6YXtWoxRT8QFMfw6pUurOAjIHKMkG2aXNfQVAh/vhZ+EeFjklPmWLKOL+y78P1IsG
	BOVvDl0ZcCllWJ9KZaJy8GHZcAEYYJL4T6guDAYYf4llL+uxmQ5vJKmVOi4REX7smyYqPXc84Li
	0jlcTs1G16XqoSVkBV7+0qTgIHUR0LQyaNRCvEYARLHkYCMDAopAD+4CAue4ax02oJhgwiE1vyv
	gdRpurQvcEdMdHIH6WQgbsd020wHV7QiRuf7ARr0r/pCJxdx/IfDcN6r3nNVOfADQqSHxVOMtXG
	TaAsf6OEPatwgInCUSCVcwTO+QeO41KBYyysFPOg+PQaEKRWoWq0g30lkbKzTYYfOzZ8sWNo//F
	3XjdxF2VZg==
X-Received: by 2002:a17:907:5c6:b0:b7a:1bde:1222 with SMTP id a640c23a62f3a-b885aec05ecmr492950666b.63.1769287097314;
        Sat, 24 Jan 2026 12:38:17 -0800 (PST)
Received: from ?IPV6:2a01:114f:470e:6200:4c6a:9244:66ab:7c8e? (2a01-114f-470e-6200-4c6a-9244-66ab-7c8e.ea.ipv6.supernova.orange.pl. [2a01:114f:470e:6200:4c6a:9244:66ab:7c8e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbc85sm328824766b.1.2026.01.24.12.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jan 2026 12:38:17 -0800 (PST)
Message-ID: <3ccdc769-4730-42de-9bb6-1d6322111fac@gmail.com>
Date: Sat, 24 Jan 2026 21:38:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mfd: bcm590xx: Add support for interrupt handling
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Stanislav Jakubek <stano.jakubek@gmail.com>
References: <20251013-bcm590xx-irq-v3-1-0ceb060d2ee8@gmail.com>
 <20251023130335.GM475031@google.com>
 <b0cffa2f-6ad2-40a3-a5ee-5df6b2918524@gmail.com>
 <20251113132648.GG1949330@google.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20251113132648.GG1949330@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.11.2025 14:26, Lee Jones wrote:
> On Wed, 29 Oct 2025, Artur Weber wrote:
> 
>> On 23.10.2025 15:03, Lee Jones wrote:
>>> On Mon, 13 Oct 2025, Artur Weber wrote:
>>>
>>>> The BCM590XX supports up to 128 internal interrupts, which are used by
>>>> various parts of the chip. Add regmap_irq-based interrupt handling and
>>>> helper functions to allow subdevice drivers to easily use the interrupts.
>>>>
>>>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>>>>
>>>> (...)>>
>>>> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
>>>> index 5a8456bbd63f..fb6afe277ebf 100644
>>>> --- a/drivers/mfd/bcm590xx.c
>>>> +++ b/drivers/mfd/bcm590xx.c
>>>> @@ -26,16 +26,29 @@
>>>>    #define BCM590XX_PMUREV_ANA_MASK	0xF0
>>>>    #define BCM590XX_PMUREV_ANA_SHIFT	4
>>>> +#define BCM590XX_REG_IRQ1		0x20
>>>> +#define BCM590XX_REG_IRQ1MASK		0x30
>>>
>>> This isn't better.
>>>
>>> And now the nomenclature is inconsistent with the one above.
>>>
>>> What is a mask register?  I don't understand.
>>
>> The IRQxMASK registers store the interrupt masks for each interrupt. To
>> explain this more clearly:
>>
>> The BCM590xx chips have up to 128 internal interrupts (the exact number
>> is different between the BCM59054 and BCM59056, but both reserve the
>> exact same amount of registers for them).
>>
>> The status of each interrupt is stored in the IRQx registers
>> (0x20-0x2f), and each bit represents a single interrupt.
>>
>> The interrupt masks (that is, whether the interrupt is enabled or
>> disabled) are stored in the IRQx_MASK registers (0x30-0x3f), and each
>> bit represents the mask for a single interrupt, in the same order as the
>> IRQx registers. (...would IRQMASKx be more consistent?)
>>
>> Each register stores 8 bits of data, meaning the {status, mask} for 8
>> interrupts can fit into one {status, mask} register.
> 
> Okay, so the "MASK" thing is just silly naming by the H/W designers?
> 
> STATUS or ENABLE sounds like it would be better, since a "mask" to me is
> a software term which describes the methods for manipulating these kinds
> of groups of bits.
> 

As far as I can tell, "interrupt masking" is the standard term for 
enabling/disabling interrupts[1]. It's even consistent with regmap_irq 
setup code - if you scroll down to the part where this register gets 
used, it's passed to the struct "regmap_irq_chip" to the field ".mask_base":

 > +static const struct regmap_irq_chip bcm59054_irq_chip = {
 > +	.name = "bcm59054-irq",
 > +	.irqs = bcm59054_regmap_irqs,
 > +	.num_irqs = BCM59054_IRQ_MAX,
 > +	.num_regs = 16,
 > +	.status_base = BCM590XX_REG_IRQ1,
 > +	.mask_base = BCM590XX_REG_IRQ1MASK,
 > +	.clear_on_unmask = true,
 > +};

I find it a bit reductive to just call it "silly naming by the H/W 
designers"...

...but I won't waste any more of your time about it :). I'll rename it 
to IRQENABLE in the next version (though I do have mixed feelings about 
completely changing a hw register's name...)

[1] https://en.wikipedia.org/wiki/Interrupt#Masking

Best regards
Artur
