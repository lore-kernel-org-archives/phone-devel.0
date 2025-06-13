Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602442DA762
	for <phone-devel@vger.kernel.org>; Fri, 13 Jun 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802003; cv=none; b=DnFSMLXaLKXeQ6abtu5EMXZhxdpnr8YQo4ZnIAcoPk3l9GQrVue07lCqpKnHzUaZCLK8C/6siqoYwex6r9upZ1YQsSOEWpqhTxZV5rekOrVBclM7jiLpIeLCLbubBLaIapVQ7MIY0+pXrIDGBG820q5IlvtZFRytg3RSw5er5Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802003; c=relaxed/simple;
	bh=SS6GUy7+iSGrMAI8Lio5hdVZyVEhieiGp9O0m4ddPPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HA0n2zjchwhll3DoCydy6Y+9bsD5ShVFfpK/Wlexv7EE+tQrbwyFSZVz1ZiZjBnPDvv7wMZui2HwVsrGImHpTY1qV4OJ9+rMqYvz8ZM7aVOC3usTZa/Wxi5cPPsz7J/k5Na37nJdsZt5ysSJe6nQelz2ZUre15KoFh9/nqriDJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EsU2OSJH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EsU2OSJH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so15049095e9.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Jun 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749802000; x=1750406800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkqDFUZXCEB8bR8DaJ2XDhGAG8e6Iv9Jz4tCnxztU5U=;
        b=EsU2OSJH8aW92PaxpbLI9nQ0uktIgs64bW6Q/7YE+yj5YTwjEP5wr/44RSb4s4PT9Z
         i0JrxeE95LjFUAm84dOodnUN2O47ha1oJV5BDUm7TboIxCel4kdWE1AZ148oqQYVNV0X
         V35e42BUX38VqqzxxlLSAsxopnYvwsHKlyWO8Uy9D1KkE6c95rJLKjqLwZbnyFyBpqWT
         XCA0PbRQz0tnDtigC25LeOxgVoCmZ5Es11wBvWvH5W+finrYiZA7fqCSsKsQzzpU4rF/
         qcs3DgYtWDqR0j2Ec+HTfRTHI7+gjxzs5CItLEYzeFuhX3pVXiTR4EOo2BFh8lcu7H3v
         25/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749802000; x=1750406800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkqDFUZXCEB8bR8DaJ2XDhGAG8e6Iv9Jz4tCnxztU5U=;
        b=OLVwrXFc2wc2y0IydAPvDE2NKsoWF1ENUCUqkF/qWYRsNq/0FaFafK8H+1lGk+c8c2
         b14DiyabYD/3fxsDlPdJK+iOQe4173ZaF7yqpaSkjmeKSzco/Ij+LUPDZl1NFnPqoZed
         IvMVnW4LDgyeDoUv71qsIdBdjoJeJjpVh+KpkSmSPPDfRj2fQ5qsPk3B2DllVdHgOkBK
         66dCS7LccGzf7GrnTV7kFSgsjKl3tIcNr0hZRbT1P9TzIwEkqOmAQbCHxiosZCIQda2Z
         XFdLzAXh0a+lR+e3C4YXvVkdQ7wEtMzlPSK5U73sZXhL0e3q5i9Sa764HJaH3Rl2upRb
         7soQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOXDb9Q1SlhEfhoMCFFGmzCDekn1rKOTgBohPArebRY1kMPyyuCt5K4anNv7bOU/1+oTW8zAvUI+3SgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRx0eEj0Lk8TSS3vBF+AQFQJUXgZLC1Jnl9OypmrABiR0KHHd
	A2l6HZGmZM9LSNOofTPsLtFMQpYb20Z4rIJAg1a7TL7WvY3mc8m8PTF1/Jwj9Bg5Xe8=
X-Gm-Gg: ASbGnctMoAb9dTI8tEiD9gyC9MYwAQ/wxqzvC00zOCNQcKG2GaRr8s6KVztIaOub4a2
	5ZbnX7/lica1BFQzfvU3rj61ciXeW9XseYcCNBeOX91DGttBzXgn1m3S7WbC/5yakQHIzqIZ+3U
	bk6jwR68Aks4Nw4UrGNF2YXrWFzZ0OCiYwbPBqYhTVCFcSQDZ4dCiW8F9hJK/Bu6s39Gia9GKUD
	3YcA0bNhbkohSXcB8ZJGgU74wkmiKoUEDYF21pxydfXBQ0n/2ebeZIKJ3gl1/kTJueseUiJR9oQ
	3EQn01Vi+gmOnBvcu2Bdr+EFtlnwShpx/4ylqClqCc/OTdC0rAU78v58C7l8JhN85CQWQbpqMlh
	Lns7KeNdvfALdpEWK/cgJFlEuaEk=
X-Google-Smtp-Source: AGHT+IG/O5UhDJVykXf2VjbwfD0QSNx5aG0GPegjXalhCDoQfY+0ubOtvsqOybm9J5xA3EHEjqAziQ==
X-Received: by 2002:a05:6000:3103:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a56871e167mr1902935f8f.56.1749801999608;
        Fri, 13 Jun 2025 01:06:39 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4ba58sm1540669f8f.84.2025.06.13.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:06:39 -0700 (PDT)
Message-ID: <03f54bb4-ddbb-4be8-9f9b-8328fdb98443@linaro.org>
Date: Fri, 13 Jun 2025 09:06:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
To: Vincent Knecht <vincent.knecht@mailoo.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
 <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
 <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/06/2025 22:43, Vincent Knecht wrote:
> Le vendredi 06 juin 2025 à 13:59 +0300, Vladimir Zapolskiy a écrit :
>> Hello Vincent.
>>
>> On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
>>> From: Vincent Knecht <vincent.knecht@mailoo.org>
>>>
>>> The camera subsystem for the MSM8939 is the same as MSM8916 except with
>>> 3 CSID instead of 2, and some higher clock rates.
>>>
>>> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
>>> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
>>> This fixes black stripes across sensor and garbage in CSID TPG outputs.
>>>
>>> Add support for the MSM8939 camera subsystem.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
>>
>> There was a preceding and partially reviewed changeset published on
>> linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
>> due to a merge conflict this platform changeset should be rebased IMHO.
>>
>> [1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/
>>
>> --
>> Best wishes,
>> Vladimir
> 
> Thank you, I'll look into it
> 
> 

I think I will take 8939, plus any of the other now 3 SoCs waiting to be 
merged with RBs.

Bindings consistent with the last 10 years can go ahead. Its not 
reasonable or in the interests of the community and developers to gate 
any further.

---
bod
