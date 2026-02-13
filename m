Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012A534A794
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 08:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973020; cv=none; b=EvqVpcrWirXxR5XkIq/a9//pU14KofdWlDaNEC6G0Lely2U2GuMN9pV9nFIGqvkDc0901NRtB8yJekTBWbUybaTYtVxYr6jcvwIefa39c78XwjlCLqHFtWt5RcMg/Ei5QrmqQdpvKEr/lSucBZA5THAxUSyKJBJAf229/ra5in4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973020; c=relaxed/simple;
	bh=Usvq3+GYA4VQwXiEk4EQAYwzenht0eLbQUxTReVkrXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIWIzMVXFgx/9RshaqkArhpswOnOIwsexhyUiEADGe7i4xuj/d25haMRrjS6jE3bOeoP9KslXqHOSvtutY0ZWWR9vpqbUemtUU4LNe6Nfg/1jEwESzEvlrqbduW+7+RE1P4FSVED6675NaT2Od8xd9HmQAyLQrFO/vlyXoCImkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI1eSFhC; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI1eSFhC"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-794911acb04so8496817b3.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770973018; x=1771577818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fS+ISWa72W+g6JkqlchkqQ6Ii61m95nh1ydzb82hfZg=;
        b=GI1eSFhCDTfNO3ptIdDOiXWxDZlevyXw0ejtCxvgCmWswn6fmCmVYBPPm55NfjNYrL
         LsweHu6/VhSkRISEjNPgvH3f81R89vR0DQHkYM+tEaUR5X/sb8gBQDyBJCIoPpGBrIIs
         hooBvF+uzvgK2kpGjlDRTp0+nFw0zeQu5O3gim7ChivK5u/5M1TzWU0mKSwAf1s9medo
         pVxOaxZVXJBfEdArRHV9kE73w5XM4slcns172NmfXsgUCY5xaD5HwRGG/ENsCr7P1YrP
         HleJYAqQmUW0/qp++OCL3Mw2YHVOtomicKUi3dD3GYNgFZtawr6FSTvQqEO/Wp+fZySU
         nSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770973018; x=1771577818;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fS+ISWa72W+g6JkqlchkqQ6Ii61m95nh1ydzb82hfZg=;
        b=M96+tNSecYJPiEq9+Ig1qAb772C0OVjsaOuTm6z4tKuCAtRcDpIai6OHmKhl5klqP8
         1mleGv4SlcpEWxYE9yhGrF8ElnQkgYoASyvjBvAMdrLEbPoNr1mt3S1kBigVeH1FBnfJ
         wdKSBtFyD699C9tifGDQ0fNYywAwoyEyu9sEdzh85v9mhbHLtEYpdW9Laaz90SjdNXLd
         il0AeSKPXlm1YEe0r893JYBgwgJHRyPf3ehm2tniUkLuEHSvuCnuodU9Lp1gAE83sHzp
         9kbubkt+fr71cCG6/1fDN3CEHVstUnTqgYSGx0ePEAY5pFsnjUSQKwtkuG2N4teuEox5
         slcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMK60sgnKcu0O3gWCe385f26ZICBglnjIi86BHwau2S36RbiR+fnts1kcJOX+q82OCz1IMfBJP3UtiKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKWEqmXOko+jRiCNiJhoJrqdXG1s60wrbl10AJVzaUxnVfcLW
	pvfTOuxnHrF8hIDgRkDHq3Uh7rmnKNo5U7+4S44gSFqIQZ0vwHMzkfix
X-Gm-Gg: AZuq6aLgWdubYnjYnq04MhHM3Tf/fEs0JQ2XMA7nSK2Ql+RWPfCytXK0gDOlcHZ0py6
	xK+ArZb1HGpWtPnDv7sYKjCO27uETER4svlW7IlESS154noyJWfSAsSfRFFEb9T93tcQsVyqT7l
	whWxaTi+9Zo9+V1+I4CZzD5XsHdKeESd/V+vSXC0u7cDmQ+F0P0I1KU6w2fPC2/C7J0jto1MlTh
	MJwh00nVTVi1b10wPYcrJe5jIml5s6GfmnWAGVBFJ7hOdMuWfGiqmXWwn5GMTRh+SMh+h4padaI
	gZwMuRa3lNpJdU+OnZM+UdlFYQLgmMtu94H0foalOF9Nmr9hYiUqDzeL0aPhARrzKksRqnCOhrF
	XczW+qYptaHeTwnv5pestyhcxn2ey+2Uoso0XCVNDgjc6/RnBt0xePCVECd6c8rzpLFS/ZxW18f
	poIUtEXiIzQ2OANW7dUAWBu8hPMQ==
X-Received: by 2002:a53:d014:0:b0:64a:dcb3:732 with SMTP id 956f58d0204a3-64c19b2ec54mr554017d50.60.1770973017911;
        Fri, 13 Feb 2026 00:56:57 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc83fa7esm6670723d50.1.2026.02.13.00.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 00:56:57 -0800 (PST)
Message-ID: <f014078c-6e4d-48b0-a814-45898b005c44@gmail.com>
Date: Fri, 13 Feb 2026 10:56:52 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: iio: light: vcnl4000: add Capella
 CM36686 and CM36672P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260212-cm36686-v4-0-8f587d4a72bf@gmail.com>
 <20260212-cm36686-v4-1-8f587d4a72bf@gmail.com>
 <20260213-unyielding-pistachio-ape-deda74@quoll>
 <3a20c906-647c-458f-a118-c7927495e7ef@gmail.com>
 <8fb27a7a-82dc-443b-bcc4-21007783fc54@kernel.org>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <8fb27a7a-82dc-443b-bcc4-21007783fc54@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/13/26 10:51 AM, Krzysztof Kozlowski wrote:
> On 13/02/2026 09:29, Erikas Bitovtas wrote:
>>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/iio/light/vishay,vcnl4000.yaml  | 17 +++++++++++------
>>>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>>>> index 4d1a225e8868..2ba4d5de4ec4 100644
>>>> --- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>>>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>>>> @@ -18,12 +18,17 @@ allOf:
>>>>  
>>>>  properties:
>>>>    compatible:
>>>> -    enum:
>>>> -      - vishay,vcnl4000
>>>> -      - vishay,vcnl4010
>>>> -      - vishay,vcnl4020
>>>> -      - vishay,vcnl4040
>>>> -      - vishay,vcnl4200
>>>> +    oneOf:
>>>> +      - enum:
>>>> +          - capella,cm36672p
>>>
>>> CM36672P is compatible with CM36686, but this is not expressed.
>>> Confusing commit msg and code. 
>>
>> For CM36672P we create a dedicated compatible because it is a
>> proximity-only sensor which has the same proximity sensor configuration,
>> but ambient light sensor registers are missing (reserved).
> 
> I don't understand this. You just wrote "fully compatible with CM36686"
> and now you imply that not.
> 
> Decide.
> 
It is not. CM36672P supports only a subset of CM36686 features, in
particular the proximity sensor. That is what I meant initially.
I am sorry if the previous phrasing caused any confusion.
> Best regards,
> Krzysztof

