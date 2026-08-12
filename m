Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56937A84F
	for <phone-devel@vger.kernel.org>; Wed, 12 Aug 2026 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544976; cv=none; b=EcwiZ4CKYgfhrn8noe1uFk/YZAvFxrwBwIjF5kGHxhYvR6FyKOku86ijMatdv2ahgYods2JRcFvaZBURG7vX5f5PGBf0attFZ7WzTtBPE7pWsMRQsofs5Zxickrf5mxI61S2+oyqEw0jBl+dV5qekXb6DMvqg4QFbjD3iOpa8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544976; c=relaxed/simple;
	bh=l1y/hP/v8YjYLSBjz4kCY8PWRHPRi2EvnVME0qPzVts=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sFWwlqz86FoVRUf0ogsbQa8bzF7YGVZ7q/W4nYe3p99NiKVA6lG8h6yIP2nKNhzsunpxscuLR4fcs4SGmtEVOmk/pqgzkuZGt1m4/zvfu34/VlnZW/BS0mHepfg2iicDi+KjLU96raAqlB6I018an3YrFloqNNLQzZ3+R7kdJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ET5x3qNl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ET5x3qNl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so1655604a12.1
        for <phone-devel@vger.kernel.org>; Wed, 12 Aug 2026 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786544973; x=1787149773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+cbmPdbcBrwM/0lJhhHJdcg2osH6Rj2q1mNv8GJOas=;
        b=ET5x3qNl7AyrgggaxBGpQm++Y2A/Ko9FvqrbQ+s/4cq8mjkHKG8cvSGBRpabarMH7S
         76++7K+ZyUSmDDE3wJnXvRfmCW/eousr2U1bZ/8H+6m7+eJBznwmnfyj6cQmwyCS4rMb
         tqcNAzbURFNAXOjeWlaWa3iMetDWd4Ommzkxc4X8Ah+y9OPrAIuwRdSem1a/2mD9+x4E
         mNjhkeOLtScXKJmpDqk/d5NEDHFteaiwTkwHt1Of2qeWXEk5GUzlY6E8jZ/j6CQqPSJu
         KdGjaOSYRQrRoOakPGOTZw9osC9xUKryyjrAOyImHDC/MDJFLov6Iu4zVxitIFCssrza
         7x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544973; x=1787149773;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1+cbmPdbcBrwM/0lJhhHJdcg2osH6Rj2q1mNv8GJOas=;
        b=T1bWYOjTJHzmkB3UpdJI9uIYmLrTJODWLb8T+Ya2b29CxG/62NojkyLTK2wDStEXfF
         +zHqVROHccI2jgi8ml20ClB1svjMefblrkRfWFGCGgu4Os4UgoxyOC/fefODp1E07yiO
         ZVIxOhyXdh8CA4/Yx9pXMl0ar2MY2/gVVY0TUIanooShDFmVCKWaJ8nRHJASi2w9DIEe
         Jd1K/xUEUtklHB65kDCBzqmqvhiJgSaK0DOoRbflQCBOyQNjft/7EMF32croeR6OvD6f
         Qi41JLq7LLXUY7RjgGVL18hpRhhd/pfllyxB9gBhbQVNdB+bcKIf8St8Os6BJrIhqHlv
         hxQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxyZGCz2FikqDLsOIK3ksPZOyYDkLvOsalZiQyKl92X2YzDhRa7WWBjuy9o4CS5f5u38kXlV4Ige0EZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Bt1cr3jc5hB5U7P1rsX6DlWQymCZfo3KxRNJTVSO6blUnmZS
	ntIh9WCG8zah4iBu53nAkUEQTELAm/N5peYuulKIaEWqFVU0DdbIM1jmHHntFYGk2+U=
X-Gm-Gg: AR+sD11ySohujUbVjjdbsd0z1eo782mTREzSP3FPnVzUxHksTlgXMg7/CD1wgMd2F1Y
	urbv8akM7qbtuI2oqpgiQa7XldVru2zu2JsXO7wkIk8mvv79GUZ3aUuPd9LiM39Qo0GpT1jf9PE
	l/4TNxyEgh6YMiN0pH3QwPXOVX0wcyHbgZAgTxU/Iw2SndexgxDz2PkLuBiKm5VfwNRdEqXxJDm
	F2vPOfFP0eL65ROVTSIhpzFpxUagjJrrN3E7PCQ/tI/4on+YFQ/M4nn4IMGViRugXJGLhCAJOR6
	2c1OtKvEYTSxplhHhsYqerYeypWGyZNDTBuwBEOPP/bX9c2Pl7vlaTbiE/l/Vhzneu1fNPB7UM/
	1BMlGOiEkmQN+CIuQce8x3A9i+ypZfBx9bDG2RJx8e4RuoPGi7A7do9x/hhSrgRsN5GFe1LrBpx
	MWWEhVQ1+mGgmE23e3C53NJ9UuxKDDL246VDFK1MBMjtWXS8m/W5jjLpXGvK3afWGlF41c7Phs7
	m78wdA2KfM6UTNnwVy+91zW71ozcN0yM4H01ncnYmfB
X-Received: by 2002:a05:6402:504c:b0:698:8847:e2f8 with SMTP id 4fb4d7f45d1cf-6a375f37606mr2110314a12.15.1786544972353;
        Wed, 12 Aug 2026 07:29:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:405d:735d:801e:de34? ([2a01:e0a:106d:1080:405d:735d:801e:de34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3768b8f76sm793147a12.7.2026.08.12.07.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:29:31 -0700 (PDT)
Message-ID: <58dd571c-502f-4f06-b648-4692f86817db@linaro.org>
Date: Wed, 12 Aug 2026 16:29:30 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Novatek
 NT37703
To: David Heidelberg <david@ixit.cz>, Esteban Urrutia <esteuwu@proton.me>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me>
 <20260811-nt37703-bup-v1-1-34ad42b064a3@proton.me>
 <8c3e9384-7964-4d03-a3a9-de15d26de822@ixit.cz>
 <58d7ddd4-1488-4c34-be85-6345138aa238@proton.me>
 <7097b617-90be-492d-9637-4a2a101379e0@ixit.cz>
 <05d2ad33-a681-41e4-87f7-e3aaeb5428a8@linaro.org>
 <803e354d-55b9-4904-a4a0-9eeefa0c6ffd@ixit.cz>
 <19e120fc-4b60-4188-86d8-cb3705a5fd33@linaro.org>
 <e2b1c037-fd3a-4c0a-912f-fccc2c5ab843@ixit.cz>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <e2b1c037-fd3a-4c0a-912f-fccc2c5ab843@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/26 14:53, David Heidelberg wrote:
> On 12/08/2026 14:22, Neil Armstrong wrote:
>> On 8/12/26 14:15, David Heidelberg wrote:
>>> On 12/08/2026 13:52, Neil Armstrong wrote:
>>>> On 8/12/26 10:46, David Heidelberg wrote:
>>>>> On 12/08/2026 07:21, Esteban Urrutia wrote:
>>>>>> On 8/11/26 9:05 AM, David Heidelberg wrote:
>>>>>>> Hi Esteban,
>>>>>>>
>>>>>>> Usually the used pattern is vendor,ddic+panel-model
>>>>>>>
>>>>>>> novatek,nt37703-motorola-bronco
>>>>>>>
>>>>>>> ...but motorola bronco isn't the model of the panel.
>>>>>>>
>>>>>>> My recommendation - look at some video of screen replacement, stop at moment
>>>>>>> when FLEX cable from panel is visible and that's where the panel model usually is.
>>>>>>
>>>>>>
>>>>>> I somewhat doubt the panel model would be located in the FPC cable.
>>>>>> I did search anyway but didn't find anything of interest. And I'm not
>>>>>> willing to risk damaging the display flex or the battery of my
>>>>>> development device just for a possibility either.
>>>>>
>>>>> No-one asks you to disassemble the device :)
>>>>> Sadly, I haven't found any video doing display replacement either.
>>>>> In worst case such as this I assume it make sense keep the phone model in the compatible until panel codename is found.
>>>>>
>>>>>> For the compatible pattern I used the implemented pattern for the
>>>>>> NT36523 TDDI, which is also used for other ICs such as the RM69380.
>>>>>>
>>>>>> So, I believe it should be okay to leave the compatible as is.
>>>>>
>>>>> I would like to hear a word from Neil first. In similar cases like this would make sense to have one way defining these compatible strings used in phones.
>>>>>
>>>>>
>>>>> bit I missed in the review the part:
>>>>>
>>>>> +            compatible = "motorola,bronco-tianma-v2-nt37703", "novatek,nt37703";
>>>>>
>>>>> Unless the driver is able to auto-detect the connected panel (unlikely), novatek,nt37703 doesn't make sense. The DDIC without the panel is useless.
>>>>>
>>>>> For example, in sdm845-oneplus-fajita and enchilada, we have the generic compatible because it was introduced before, so it's kept for compatibility reasons. There is no need to do that here.
>>>>
>>>> Yeah today the norm is to add the ddic as second compatible entry so the first compatible just describes the pane, so here it should be:
>>>>
>>>> compatible = "motorola,bronco-tianma-v2", "novatek,nt37703";
>>>
>>> So let's me present a situation which can happen, let say I'll be upstreaming:
>>>
>>> DDIC (novatek,nt37700) + panel (samsung,amb630qy).
>>>
>>> For the example I choose samsung,amb630qy because here the panel has phone model in it, which avoids the possible issue I'll be describing with this schema.
>>>
>>> Vendor can pair this panel with different DDIC. Thus it would be
>>>
>>> compatible = "samsung,amb630qy", "novatek,nt37700"; // new one
>>> compatible = "samsung,amb630qy", "novatek,nt37703"; // existing
>>>
>>> The reality the driver picks only the first compatible, and that's all causing to load wrong driver now.
>>
>> No, the core will pick the first compatible that matches, so...
>>
>>>
>>> Solution here would be differentiate between
>>>
>>> a) DDIC + panel
>>> b) module name (consisting DDIC + panel).
>>>
>>> We could say module is motorola,bronco-tianma-v2 and contains [ DDIC + unknown panel ], which doesn't even have to be mentioned in device-tree.
>>>
>>> While it may seems I overthinking, in this case it doesn't matter that much, I already have patchsets for DDIC which can be combined with three types of panels (and using different schema) and I would like to have good solution for longterm contributions and development.
>>
>> ... in theory we could have:
>>
>> compatible = "samsung,amb630qy", "novatek,nt37700"; // new one
>> compatible = "samsung,amb630qy", "novatek,nt37703"; // existing
>>
>> and drivers would only have:
>>
>> "novatek,nt37700"
>>
>> and
>>
>> "novatek,nt37703"
>>
>> as compatible and then a separate match table with :
>>
>> "samsung,amb630qy" and "samsung,amb630qy" which associates with the panel data.
>>
>> If it doesn't match, return -ENODEV and it would work like before,
>>
>> I mean it's valid, it's a matter of implementation, if the same module can have
>> different DDIC then it should be described like that.
>>
>> In this case, the bindings should be for the module and not for the DDIC.
> 
> Definitely make sense in the context. This would mean I'll need to adapt my patchset to-be-sent :)
> 
> Btw the disccusion slowly mentally gets me closer to the Camera module model, where you have multiple components such as
> 
> module (sunny-XY) -> camera (sony,imx519)
>                    -> focus (dongwoon,dw9714)
>                    -> OIS
>                    -> fixed components as optics
> 
> where as we have here only
> 
> "module" (motorola-bronco-tianma-v2) -> DDIC (nt37703)
>                                              ↕
>                                       -> panel (unknown)
>                                       -> touchscreen (sometimes, depend on the
>                                                       phone build)
> 
> Sometimes init sequences and stuff depends on each other, thus touchscreen is part of the module in some cases.
> 
> Would it make sense to somehow model this into DT?
> 
> Since we doing all the stuff in the panel node, it could be something like
> 
> display@0 {
>      compatible = "novatek,nt37703"; // first thing we interact with here
>      module = "motorola-bronco-tianma-v2"; // DDIC driver picks the module data
> 
>      vddio-supply = "...";
>      backlight = <&pmi8998_wled>;
>      ...
> 
>      // I already have combination where two panels has different supplies
>      // Samsung S9 vs Pixel 3 XL. One wiring is over DDIC it seems, second
>      // directly to the panel
>      panel { // REAL panel node
>          compatible = "samsung,ams622xy" // maybe as a docs?
>          vddneg-supply = <&lab>;
>          vddpos-supply = <&ibb>;
>      }
> }
> 
> Just dumping my brain, feel free to ignore if it's complete nonsense.

Ultimately, we should describe everything, if we can, most of the time we
can't as we don't have the DDIC and only timings and a bunch of DSI
commands. So we need to keep the good ol' model for a while.

But yeah perhaps it would nice to experiment and implement a full DDIC
support modeled as a DRM bridge which has a panel subnode handled by
a panel-simple with only the panel resources (timings, regulators,
backlight regulator if not handled by DDIC).

Feel free to experiment and throw some RFC so we can discuss.

BTW I'll be hosting 2 BoFs about modern supports of DRM panels at the next
Linux Plumbers and Embedded Linux Conferences in Prague, and this is one
of the subject I'll speak about.

Neil

> 
> 
> David
> 
> 
> 
>>
>> Neil
>>
>>>
>>> What do you think?
>>> David
>>>
>>>
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> Thanks
>>>>> David
>>>>>
>>>>>>
>>>>>>> David Heidelberg
>>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Esteban
>>>>>>
>>>>
>>>
>>
> 

