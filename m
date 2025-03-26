Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF61B4139
	for <phone-devel@vger.kernel.org>; Wed, 26 Mar 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742984773; cv=none; b=mSDoQeAg9pQPFZ/VCXZ7JfOwhLJ9NbNs5E9J8KGyZ/839mRRClz7tlGnKhBG+biOg2t5ZXRU7fXz8X6UjjWgNsTQTKzauYezoKMsMLcwsGwn3gCuUMNE7pVlBEiiR+ndZoX0OXdWoq7Nagj971+NpcUG7LbA55x+zuSV2Qst8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742984773; c=relaxed/simple;
	bh=VmZW3dYOkE+WcIdW+rTFDYurYECcNeudvlHZ1LESI8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8yfRXNY5udPZQv7MIR+AwOy7L7off+vda4eA/tvSYl48x7ATiOBzyiIwCpz0behMwarEQuou7h1ezC5Q0DZ9p1MkB28H1c+wL3WufEoWwIuNdWq3qMZTxvU9nIUVCOSbRNdFCfbu+xA2PxUVPxayvVyIB7xJPKKl6x9aipGhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPPhUaHM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPPhUaHM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so46304185e9.0
        for <phone-devel@vger.kernel.org>; Wed, 26 Mar 2025 03:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742984769; x=1743589569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=98hcAito2MMtQTY1iL6KWHxMYRyo687ywiMmqIh+p7A=;
        b=XPPhUaHMMHildxl7E/pGbg3LqEdcenwWvdjeuLPj1f8OT7a6BYtjs2bu24XtbAnFFY
         s9+jVhzzy9BFkI3JMO+QBwfdpCUz6XYuPUqDbZPhh1GKp+3K27W5+fCppeyI/7od9GV5
         scsDjSsDhiRkFPWlWeter1dzRKgY0BJ24tX0Zakn7d3gRB/jl78ONFJba5+ry4db+fqB
         w+6iIB3FLjU3RMJ99bkzWnP317J2KjottjvJYV3+hj66I0kjq40id1xBzpo5I2EkX5wd
         w/9qMcNz3WXfeWm2gcUcFe6Pwo2OXAUJ2wzYK+dfZXPPfP1ln1vMQLy1bUed15eH795l
         DSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742984769; x=1743589569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98hcAito2MMtQTY1iL6KWHxMYRyo687ywiMmqIh+p7A=;
        b=Pyx9PfIVG17tyq3H2CsKHSgxzbxJXbsF7Ixvy/YsEbd5PNI2DFWIKn4q28rgDrp1lI
         YZczWTrD5PpolehCL+s6sRM1r/di6zyWNBoIko2rYSLsvgSa1ZMOL2y3UfINRvmLmWnn
         FA1FVt6mhh0ShxYcEEL6b4jmRgn46yQcaz92oLAEX5AkSC11nbBE73Znvrjg3B7Ofv4t
         G9ArY53vxU+tPwtPIB1NLk/P4qIx0dGJxXRc40Caci0Xul7nypk8ro6/+GIuPWDdqVgM
         sspEqcIW2i5DJ0pK6h+fhNYRjm+AmBl42dNEubd959zY7UV3dIQk2JWm6X7mafUj+f2U
         hm5g==
X-Forwarded-Encrypted: i=1; AJvYcCVCL+7SzBjrPFfpzJDsr7BGrG3SaBurIe6+SPBdFsLfEx4NTHnP0bOPCZK72vwplRqdjwrF6qA2hMzMyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7XhhSkr0tpIn/vMG8i4MKrElzwrTbslJj40tmbYuw7LCq/25
	93FuGk1UibiYF3IxmudyzQD8/vD0IVphav9UVWPsnxm9eE85Vp0ioRdcW5hHW+c=
X-Gm-Gg: ASbGncud/Lqd3SwluwREONtNnIgI7Ggxw1ACD6LBd7mMnmBbmz5O7ADCGcL/j+LNrQB
	yH5JSkUtMmK1UhyMs5gw88aG2j1Kug5yOWFwjJDLV9iGSFjcZ2s5I7ng7/muT/1QrxMyhXNyQc4
	WsAODJeKptenAf3f+HUJZwLA1f+NS4G9jhzkmtfb6uoXNda4OVtV4b6/IHMnkLLu2qqmGtN4eKe
	4vlFfovkrDgqyUHlI77dEnbveVk8B0t1sL36v4NZFpSEhke5+lCtEC4DFKpOhWCI9J6cI5pUafC
	RR9ye6ygU2Uf6AACZ1ysbB0eeCAzE1E1hGriz1VEE4bTz2uOvRTdfiaU1zxJCROBxAQLxxO8JIo
	=
X-Google-Smtp-Source: AGHT+IFNIgbM5SxndZJ31+RxAuvmVblk7zrUQEK1IUI9dhFX9c6aTpE7fdxiqMV2lHxT/eOf35nkUw==
X-Received: by 2002:a05:600c:c0d:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-43d50a33d03mr154416225e9.27.1742984768921;
        Wed, 26 Mar 2025 03:26:08 -0700 (PDT)
Received: from [192.168.1.38] (i5E863BED.versanet.de. [94.134.59.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm16436745f8f.75.2025.03.26.03.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 03:26:08 -0700 (PDT)
Message-ID: <5060c248-3160-4d52-81ec-8e06bbd246bf@linaro.org>
Date: Wed, 26 Mar 2025 11:26:06 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <20250308-synaptics-rmi4-v3-1-215d3e7289a2@ixit.cz>
 <20250310-hissing-vagabond-pegasus-cc8aed@krzk-bin>
 <3c5e12fc-eb91-46e8-a558-9896f0bdcab4@ixit.cz>
 <b3a5ec89-0125-4b01-8cca-69b9985b6089@kernel.org>
 <48bb62eb-8aa9-465c-9e77-c0b375df0c9f@linaro.org>
 <492da0ab-3a5c-4ee9-bc37-d66b007ffd81@kernel.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <492da0ab-3a5c-4ee9-bc37-d66b007ffd81@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/26/25 07:57, Krzysztof Kozlowski wrote:
> On 25/03/2025 14:23, Caleb Connolly wrote:
>>
>>
>> On 3/25/25 08:36, Krzysztof Kozlowski wrote:
>>> On 24/03/2025 19:00, David Heidelberg wrote:
>>>> On 10/03/2025 10:45, Krzysztof Kozlowski wrote:
>>>>> On Sat, Mar 08, 2025 at 03:08:37PM +0100, David Heidelberg wrote:
>>>>>> From: Caleb Connolly <caleb.connolly@linaro.org>
>>>>>>
>>>>>> This new property allows devices to specify some register values which
>>>>>> are missing on units with third party replacement displays. These
>>>>>> displays use unofficial touch ICs which only implement a subset of the
>>>>>> RMI4 specification.
>>>>>
>>>>> These are different ICs, so they have their own compatibles. Why this
>>>>> cannot be deduced from the compatible?
>>>>
>>>> Yes, but these identify as the originals.
>>>
>>>
>>> It does not matter how they identify. You have the compatible for them.
>>> If you cannot add compatible for them, how can you add dedicated
>>> property for them?
>>
>> Hi Krzysztof,
>>
>> There are an unknown number of knock-off RMI4 chips which are sold in
>> cheap replacement display panels from multiple vendors. We suspect
>> there's more than one implementation.
>>
>> A new compatible string wouldn't help us, since we use the same DTB on
>> fully original hardware as on hardware with replacement parts.
>>
>> The proposed new property describes configuration registers which are
>> present on original RMI4 chips but missing on the third party ones, the
>> contents of the registers is static.
> 
> 
> So you want to add redundant information for existing compatible, while
> claiming you cannot deduce it from that existing compatible... Well,
> no.. you cannot be sure that only chosen boards will have touchscreens
> replaced, thus you will have to add this property to every board using
> this compatible making it equal to the compatible and we are back at my
> original comment. This is deducible from the compatible. If not the new
> one, then from old one.

hmm I see, so instead we should add a compatible for the specific 
variant (S3320 or something) of RMI4 in this device and handle this in 
the driver? I think that makes sense.

> 
> Best regards,
> Krzysztof

-- 
Caleb (they/them)

