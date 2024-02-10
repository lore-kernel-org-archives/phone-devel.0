Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E754E5CDE2
	for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707585525; cv=none; b=FrnlTkx1rYVDesDrAGaM8d3JiO+Pc9+NHDAezaDYOWiGmP7Y9bp7flK2RnQ8WIAepoE3J2wKReSTQ9Eu8TEPPpfuxXAHy1axFMJZRT2yClpt71f3dkiQfyDufAP+9ncSVRfY9VoaAXZBd6ZOIN/2QQZSUlzCXwEfJT2NvjFQkHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707585525; c=relaxed/simple;
	bh=JAYmqqUlV+QxewweztualGgfV2rRkfEND0wL/UjZvvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IM96udiZqoo5gS3c1riVrPlBcykN5tFWcIxvzt96J0X+0zAR/QFof/E6MLtqcLW/r5rsjmtNz3t5YP43f3cyzjMcj51ADT/6dlN8shn+TR2+Hz83z/R09R8eBTCYaiIrHvdCmpOh3azo5LuiXj2xeOL9aLAuehe86qi0RWOfQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrrsYBxb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrrsYBxb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so2554317a12.2
        for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 09:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707585522; x=1708190322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfZD70FpittmkoFLQlNJ0pZDsjHQjPXPSTMtZpBQCew=;
        b=mrrsYBxbUmZUr/35qjlvCYV0b+B63C1zZLfCBe1bafCQr5abzxvLDD90Wu0cbQUwfy
         1lz5oc6VhOIjmNF46LTLPS8QqYE/fvfqE+beT1l+OdH71dX5thAoEzRO0moKJ4hLg1gS
         7CJP9+RzCejEXWBoPaLaJfoSbOFa8/tsIMbrpakKAe4c6do2pNiWMqVMzgznAflq+9NT
         C3i5DKtwoR69nawmKeGi3RHPQca3cVRif9pr7TUAZVPd1GtVUysA4zCMpqqwOjBA0jp5
         84ZhtuJEUgIwgt3JrOKG+/vU9rfvvU8u6hQsTSq/hsHOUuUZBRtVyAN5k7X5Ur221y0H
         uQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707585522; x=1708190322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfZD70FpittmkoFLQlNJ0pZDsjHQjPXPSTMtZpBQCew=;
        b=uWOVSlWbeRmLBHZcgmRjPdho4PZXzRm5kp3Orr0Dn1JNd1vKVD8WLv5LrVpXIBitoY
         hppm8SyvVDoLTLmU4n/5dn/hKQ0eMU8ypjz7Eo5gkW2YxWDzz7RsHaFxl+4mcCGZapaK
         RRaqYis4hsxNkEggASMtM57g6AEZKkowPrs21t6Ot10/OQUiHqWhfDu6aP7f7RdGf86n
         HV7kSDROKrRvbnWZ+ASx3dneqMCR+EjwD33S5eExg1cr8tVUCcG5hjpasWiqIcK7G1Uo
         kc0U6dd+P+4CjH9mxOoyContgXIhext4oLaaTLIg+S86xI6EYeS4mL9wjBD5n3ihFmhZ
         /5sA==
X-Forwarded-Encrypted: i=1; AJvYcCXa7ZTRJaSIKJqbU5Jk1+RgXne46jHCjs23aN2G8iTZiY8s1vQFd7bQGPy9FXNPXj6S+zo7kLpm5WUHKw5LBPhi7LYHwT20BO6bh/8=
X-Gm-Message-State: AOJu0YzTYxpVGVUQmf13viWJ8uJBDBhGyBLH8K2XG8mu4fusjh4g/r3f
	2ono/qF2RdCuZY4UAKJvS+0YyvxRwc2irx/89rkRHPEDLq3u8M0p+vdpQzIEt2w=
X-Google-Smtp-Source: AGHT+IFGCtx04RXUILQm7OmnXO1o8h2vqVbwopH3Thr5IsJ5weeyaLzUa+uyPyFkHIzSofuPXgkRIA==
X-Received: by 2002:a17:906:4899:b0:a3c:3a84:8348 with SMTP id v25-20020a170906489900b00a3c3a848348mr974528ejq.16.1707585522040;
        Sat, 10 Feb 2024 09:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfNt4OjoeCRiRBfOyYy4qALpepYWHWTm79uHyfBBocjJdDgeGhFf5DJugPG04ycOPMvWQ+WCctKTjBZiesbNfnpJO+4s33CthifrIZ6BeKNB2eZz9BskqdRQgBBCMqXPB5ywVnhJREPyigvAFF/7DvTjGlDAbCLlgppouNo42+6C+J2jT1UosOLwtCWo5jKV3wKkbqDfIQUTM0AG1bqYVR8fxnxxWJOQYbm5aVgfxo/orfbYnVpsaS8mzJsIZ/r/CRwcA8aEOk1H9eCv3U+oyr+mhvpKuzNaf03itIXOUiLNi5aKri/1bLPWgeAo/2m2V0aCE+ySdvpPfTsSbWseLE2y5eBbPe7soOQOviA17YDNZzwqa2RKGpDrm791T9iz5MTrtw//COrksRJLdd8VhOaASNWESUH2E7SkPJ+4zsISkTzqXBkYSGbnGWPBDYqbirOw434CzLK+HlMOISWPn7tVV5EoaUfs0ZPnmLjE3Xrg==
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id ps7-20020a170906bf4700b00a3c5fa1052csm64186ejb.138.2024.02.10.09.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 09:18:41 -0800 (PST)
Message-ID: <a50913dd-44ec-4001-a1c9-11191f1ac5ec@linaro.org>
Date: Sat, 10 Feb 2024 18:18:39 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pmdomain: qcom: rpmpd: Add MSM8974+PM8841 power
 domains
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240210-msm8974-rpmpd-v2-0-595e2ff80ea1@z3ntu.xyz>
 <20240210-msm8974-rpmpd-v2-2-595e2ff80ea1@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240210-msm8974-rpmpd-v2-2-595e2ff80ea1@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/24 17:38, Luca Weiss wrote:
> Add the power domains CX & GFX found on devices with MSM8974 and PM8841.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
