Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E4153582
	for <phone-devel@vger.kernel.org>; Tue, 23 Jul 2024 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741519; cv=none; b=a4lO8M+IN8+bQwADvjXTTmWtOS8yJnEXso9lS3YXAXbATC9/nT/evXK7ZnURQcnKCVt/oiaN458dj6+9XoxuafQ2kpywaqeMbtAq33shBzD3NTZHGOo2H6/rMMWMOHpTEle4l9vvd/PSAfzd6CedECKS05DNkPdbBFF300gpCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741519; c=relaxed/simple;
	bh=zCNh2P0/DBwn/kKY0pffdHi0nOLku+i55hHluL8cx5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gN3forlCdFM8OFxf8pLvvtXZKp54aaca2QKaiM9VKyOeQrGJNy7AOnCtfIK2FZIqZ4vixAQc6zfqQHkp3q+vPj8np6WAWWkat6Wplm6FZxcGY5T9Bw61B9HLXhSU7AJqi5T6vqyZgTOL9rw7RvgqB9yV16KD5ItMKcVRNzcOG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZmcCcI1; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZmcCcI1"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5a10835480bso4834524a12.2
        for <phone-devel@vger.kernel.org>; Tue, 23 Jul 2024 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721741516; x=1722346316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8nrhlbIH0Tksi46Uegy0RJi7Yrw8vhJlUCiFl/oSgs=;
        b=mZmcCcI10DmEixeMdcYIQyguQCQ6wunSVXnioK/nE8+I53+L+P2HyO275IsMPDGxVD
         Gqo15XoRY0nK49ZsxFTvW0HyaImqxxC8CJYqZDTPvhsKYnLNRluLWm/0ulX4VeMpcPBB
         vZdxh/ZSLXEbxMUerpxgDenX+CBymhrJS63/N1RVr2PqIFNNrKmUVkFp5YqUgez0Qq26
         NyxQ547zSrFDVJofzEjsjPHG77DTiM704q0ZNoilGRQUnjksGBd1TYFHPtVDvv2ENc0j
         L3jhEokiEzPen70bpf/gjopZrPFrifyukGeFlIac+8+QAnCOJoXDaDfCPAezPpLppXlb
         hTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741516; x=1722346316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8nrhlbIH0Tksi46Uegy0RJi7Yrw8vhJlUCiFl/oSgs=;
        b=Zhgpoo8GAwlEFCOnRLpGfhL96eRGDSC1tSpFb6KdiYwvt3cG1r2TYSDpwXQUbGpWlm
         c4qk2QgVB5dAGtILL++xWl0dZT6c16cXcxqznpE0OpPKrApjILN/w7oN7lc6VLNRlhlI
         DmIG7Jf2HEF230CggrR9q64ACEFYyM+56RR2npRMZvCRDn4ucBp0VP3G4WmA32Z+Olfm
         thgy3BvSqoKJGHvZg18cO34+GYRzZ0qUUERd3Y1WsCq6BWQKL23XJZyl8FgFFI93jHmQ
         EB0wUYgkZL+O6em6XoKf2YIdn24340eCVZP0AzXmt8QXzMBI9hXzNBhlHG/rSV7Fb3gb
         RwUA==
X-Forwarded-Encrypted: i=1; AJvYcCXYcIP3U7Em+FHh4qB7YSl0rYUIZ4Zy9FzpyK48D6r0oUWuBX22jC1q9Iifb7WPTGmZ9x2vxmxXGh8qAKTjtK2TP0lR/bTXvKBxxiI=
X-Gm-Message-State: AOJu0Yzc9ga8faANG05o/a9RkHW5+CnF3UH838vBMyCu8mrINMmhPjja
	D/TINFoql4JZ8/RFQjkr+nX/TSbXuVnm8k/gvKjINGuRS4iGtRxEXCIeFsZKBes=
X-Google-Smtp-Source: AGHT+IEGNsf51enIuYh1jt7A5JhSN5f+kZKDQoJB+h6ulLScI7FnKYtzzx7GixXw9yc3mCNJZDOkKg==
X-Received: by 2002:a50:99dd:0:b0:5a0:e62c:61c8 with SMTP id 4fb4d7f45d1cf-5a47bd7c796mr5991436a12.29.1721741515455;
        Tue, 23 Jul 2024 06:31:55 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f8c1bsm7530029a12.60.2024.07.23.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 06:31:55 -0700 (PDT)
Message-ID: <5d448aeb-e57e-4203-a1d8-ef298fce097f@linaro.org>
Date: Tue, 23 Jul 2024 15:31:52 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-rossa: Add touchscreen
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240723131441.1764-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240723131441.1764-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 3:15 PM, Raymond Hackley wrote:
> Core Prime uses an Imagis IST3038 touchscreen that is connected to
> blsp_i2c5. Add it to the device tree.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
