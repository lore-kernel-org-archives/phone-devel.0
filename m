Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430174E9C28
	for <phone-devel@vger.kernel.org>; Mon, 28 Sep 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610856; cv=none; b=kafXGB15YvsyGFTdAEklzGkbWkURYNv3B+6sbUuyxUU0RPjB9b/cz3GrE861VhuPy8a9iirRqoNkcd0v2iElD2k0mY0fx60rLY0woSwqodxlnTjqB2egRmhyLkqv3Y/sfchQ9aBCu15PxnekOXWeIYBqiA74qhpUl3k8ZdJP6iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610856; c=relaxed/simple;
	bh=btGCnFhlcQ9Tjp2kCrPOIBm9c9H5F/PoS4B9XE+7z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXISDQ3rum1zX//JPL8d0r0F11KirUhu9nxd58aV+TrfdEAykb9f+Fsdxqa3qHdPF0EXnylOIKaBAKuttm0W9hWi1TSBNrSGe3lhQNyQjPPE16So+hBi7xSoCR53kkbMace/lDAH/BNUwzZ9GNhrVTTtlAQC73EFB5SaOJQ6zps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXEIvKXy; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXEIvKXy"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887d06c669so2481806f8f.3
        for <phone-devel@vger.kernel.org>; Mon, 28 Sep 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790610850; x=1791215650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=SXEIvKXyIXNyFGjC9wAfQ0wy7KpcoEEft6qj2cHLHzkCiGslmRG/3MdJuJAd4Cq9FR
         MR6kMsItepCIZ2L5cZwnwFJgaV7Y7mEdsqQqfm9bFETjH5tE0Rvym9wtjWuJwxKMKA0R
         Ics/VBsilEY3UVL8fhPLv7ao9FTAQt5fVmpE0FSIoW7LYDRgdf2vp8fwuA8f1QkZRmIE
         OKDsGnEFRR+5bFfat3vOBfeLWQ+WumxqfImwIH41Ma4PWOOQfGSCTz/hghhCh/mo4b9K
         vrcZ9L++fhIGc0KcglADhiqx/8qkPL/lgvDuZ6fZXQRbNntavrUqMoW4yHhVdqDKXces
         gNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610850; x=1791215650;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZXqqboH9bZP57KAcRjQkDCBUvfiHeVgKVSx3nYEKBI=;
        b=rvdFOZrKGfjd3CLaeLJ8fhH3Yuaxce68XEF453TEb700ljpEGUqpDzZFzYVMGk4rPP
         AfBLaIfzRwgcWE54WdlNVQas/1qu7Xp+/oLfzEI/IjRr9GuX3IdKOyQ5+51sZML5ycot
         NpALN0QwVO3hWIHl2OtLcv6M7H5KLxvLVUowLBrqnx77MJOQbFNeYXUDuyqZkRLA035b
         zKwPJ/NMZVGXMmYopo5TptwRieo8n6C5a2CcgFvte5zJ2SNTbnKxro0qL1TUjxqwqOrY
         nsiZ7CWuAeW+KYfyNKn9Wmahb9y+BZywvECzZGivqk+gx/EQlBSsEWcJV76l86sy8Ffc
         hazQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4FE9n0dgSQW8POpBKS1rSsdm+aMvjK71+cTRjZYWRYoWAH9oLfnjV7OJcJ3dfMVO1GgqF7fBgCmgIzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQg1Me48QtaZDfbMB4bw52Qg1vuk4APsWC4pLx3+tmL+4YBKr2
	SmwMEcFYYFAg01/mK4N+Phpwd99BkiVhKuM3fJlZASywm6jN00L4hoQtvDoePupJbCk=
X-Gm-Gg: AYBFou2vD883peDhnzGVjoz3lJt+qXfGMIfsMO2gXTC6BNkISNLNCUzDauyfwdJ5g3g
	twTwtAJhue3JYioh5QO81KgmAJLqus2yhDUMAeNtyb6uwJ53ZKlN+iiAtIFHHx6cofn4IO0oPO+
	nl/QEwCiliMgWhXSVcM8NXGCryGxROSxNwz+0i65Goyg6V9G5mzkiLyLQn/zDmeaYA8MTtvdafv
	Tww3JPLOTJW5UYJ79jo+2u0+OEzwLzdIULV9odlO4bnWkK1DiJvVeHI746TnrBA2lsMgmMoBqe3
	5oowBNJcnSehnlkW7w0KJhu9blKMbT2cNk7ofacXRCZpc7y/cT8onqcpEOM37f0bMrDrLwv3Q7J
	2PJw4OedhjuiVDPmp7q40eMIUI/6Sf2PT/u99f2ZfXMpnHffGO50jZWTiQbHp5LXsPDluLDpX21
	uodD1jcxtL6Fb8bk2OwG6vQBco1xVJLUM60/ofMvXk2AbgmGPHqvJYTdyFyOb85hLbWnYblpAG0
	u7FB3SOXnLW3CCyLxM+e2I=
X-Received: by 2002:a05:6000:2608:b0:488:84ba:ae2e with SMTP id ffacd0b85a97d-48884baaf4emr13756148f8f.0.1790610850114;
        Mon, 28 Sep 2026 08:54:10 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.243.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-489bd7b1df0sm7993153f8f.31.2026.09.28.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:54:09 -0700 (PDT)
Message-ID: <5c41ef43-a065-46e3-9522-faaf3884b487@linaro.org>
Date: Mon, 28 Sep 2026 16:54:08 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] Qualcomm Type-C support for 1st generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <voc4ie6fcegr3thk5n6dib4pkdxmracch4hhgjdih6pxrq2bfm@lq7mx4flowqk>
 <f85cdfb7-b797-4b4b-9937-670c6dfe52c3@ixit.cz>
 <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <zb3s4fmwx7vu3kcqigensacbgdqoaqnipfn4ntx4dh7ahrfr42@hvdw36dqb3qn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2026 17:33, Dmitry Baryshkov wrote:
>>> One major comment. As we see, on SMB2 PMICs parts of the Type-C
>>> functionality are provided by the charger / FG device. I guess that on
>>> SMB5 PMICs we will get the same problem once somebody tries to implement
>>> additional charger features. Would it make sense to rework the PMIC TCPM
>>> driver to be a composite driver, taking several components via the
>>> existing Linux interface?
>> As this gets decided from the QCOM side, I'm fine with whatever suits the
>> hardware best.
> Bryan, as you are a maintainer of the PMIC-TCPM? Would the use of
> components be fine?

I mean maybe. Would it not make more sense to land the TCPM 
functionality and then look into adding charging moving then ?

i.e. finish off adding this piece first

---
bod
