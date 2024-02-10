Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7981E5D464
	for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707585775; cv=none; b=kwnZOh/wx9gPmZIcaK9ku1uVcZeoQKJhoiMse19p5QLCmeo0/I0ISsa9chE4ktH3qW+PzT4KAR3UtZbRa7iAL0p/J16GOuEH3pdz7mN+WtDc7SXPJ3TD3Sx/3mM6NS6R6c4oHHl4vO/5YTpEmqIljGbpsYMvT3206O942SwR+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707585775; c=relaxed/simple;
	bh=yXq0eQN0IMkM9OvgeuQdLA51FwQpaGpF9u82EJZYeYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3d2uGlA6Jzsmyjiz706HbC/09DrnJF29NMyCWNqccZnqTjwQ/roFLsEa+pu7PO45hW+ovAlRfFe7JSF7oqe3e6OrULNSlWfV/oSUWld+ZBBCYZ8pSFauPBVEsrhYoSbZv0lMOYbcO8gq2/8gUMuBz+MFWur6Jzl2ZA61Xu6MMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i6f7HItU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i6f7HItU"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5605c7b1f32so2598299a12.0
        for <phone-devel@vger.kernel.org>; Sat, 10 Feb 2024 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707585772; x=1708190572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nbVwA3r2T4XIvj2MIMw96k+rlz8R9spHjVGSs/k39Oc=;
        b=i6f7HItU+0DN046QP45gt4uMVRhXO0IetetSq5eCVraBremVnNQPYhSXOimLVnw6Mb
         vFJ0Ofc8/37pSQXUHKVf9+D4uugL7fkUEDkE1p3LADOvUmdTvI88ToxGDLc1bx7nuGeZ
         rxVZPof//9V6OacIs1+9j6qgWp7+3JBy7R97JjJTPLsyPuMOfR0pK7lamUdRjRmVv+Hf
         eLWR51RAqmjsfcAl5AlD6rDIUOc8gN/iOWRXHl7xY7HXZ/GWbTuV2hu/7HQ/jNiC//TY
         8pGgbk5eW58LWPWtgMrGHwOFTaLxMOrRohze7xLSvaDIO7cr4lwCMhqAsSEmuUcy8wJl
         rKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707585772; x=1708190572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nbVwA3r2T4XIvj2MIMw96k+rlz8R9spHjVGSs/k39Oc=;
        b=G+2HQcfJHol3tuVICj1Bn4Iaam4VQUA4TUqYtiSbfxEZ47ReOnBSxH2bgf+o2IB2ju
         4JZ1uGq319ZlcRp9a3RSZEPaS3/RaOJmZtK6o6hvQZ/B8PtL5QEQULS71fC75Zvyq0+o
         IE1KDQBDIPxQGpbGR+ovEIBJtdam9bITNLuZ5kBPl6A4MgF4Y/FoinKAnkL+Iji+by9u
         5rONw07FTwA9MCVUMTGif5v8rune98gx9APLTTekdRCOio4odr8eg1YJMLqlY2eZSRK7
         U5zz0G3oXqQYwZe71msOIzAJBMYExkJ6/NSR2GGzUMUA5FMzRFLxbmJV81vDYvSg8XSa
         kGWA==
X-Forwarded-Encrypted: i=1; AJvYcCV4OYK+EdKd27vXNRCBQv9KtP4DiO2zx1jds085jljjO0v9MIguvQYtF3pdHKTFuViFLeu1uooURXKYWx1mRY06iBiO43AAY3Mqp/g=
X-Gm-Message-State: AOJu0YwTXinFaWW1qwY42cizROQz64JROaJO4SgEIBAYLL/MjbxM+nnK
	WorlaoBBJ/Czvdl+y8YoF+NZzX57c89FBJfFQ7dqugwdoxbl8VyLaOVBliTPdUY=
X-Google-Smtp-Source: AGHT+IGjoZvwR/m5KuFRcY0hOSai9+AEivTeOhkS5ox7CXsFR1jLXzf0c93cLSctabNSd6vaZ6PMqA==
X-Received: by 2002:aa7:d60c:0:b0:561:b28:e61 with SMTP id c12-20020aa7d60c000000b005610b280e61mr1685777edr.31.1707585771786;
        Sat, 10 Feb 2024 09:22:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQ6Yzt65ip2g8FNsleIQBI8vTw+gpSs7VD4tpfkofMR/vl1KFjfdrfMPnCkB9feLjhvH2AzFXfKMGiNoEhhQASy2iQRWeMBDDqXqLx4f1ls19KQ6M7q63LqgfPgW/UHajaBHeHh0kqvozVFXJEOZdId5ZSrmDJGG3dJ+tS9E5Wz9lSo5GyDAl3JwROeg3kG6Gu79dJUEla55Ej6Al1Yl6jn4tfnMuE2W3luEYyDCiKSHe8uTsUUsWoZzoAcEaqwwdkVlyi4KOSycGVoKISNujC7+3LyRql9j2B0t0ip1r/fM2MJcoz/ROsfeGBt2rcTSI85+E2h9EENBm/BB8G/SJ4rTyuWYIp8tuXkkXih/tTLi63ABxf6Gg5UbWVyNXE5OjXd6S/c4ocjBPdZdlZ2ttHQ1Fe1l3kcBhJCtvwHhcl
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id dk21-20020a0564021d9500b0055c85e6d75dsm922314edb.87.2024.02.10.09.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 09:22:51 -0800 (PST)
Message-ID: <d0c8fdcc-bf1b-47cb-9d34-337c069cbd2c@linaro.org>
Date: Sat, 10 Feb 2024 18:22:49 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8226: Add CPU and SAW/ACC nodes
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20240210-msm8226-cpu-v2-0-5d9cb4c35204@z3ntu.xyz>
 <20240210-msm8226-cpu-v2-3-5d9cb4c35204@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240210-msm8226-cpu-v2-3-5d9cb4c35204@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/24 17:28, Luca Weiss wrote:
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> 
> Add CPU and SAW/ACC nodes to enable SMP on MSM8226.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> [luca: update some nodes to fix dtbs_check errors, reorder, cleanup]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
