Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042753939B5
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032682; cv=none; b=P6foEVNKRgM3i4VEvEJEjPGkI0abBtIBBerKsvTkrNPS3V31CyvhFEylpEKedUYJnf6OakK0k0p297qS9RZRMPrOvJPSXSySJnQR8Od8X0Kr0G5Krg4+7y+HqA7t3Q0aZN7OuQYi8/x2hyAaLh+kuP3sVb1FaGN8LG+NDysalyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032682; c=relaxed/simple;
	bh=B8I4yikU+NXuSEW/XgDJSCcfrf0nd87qDy9j71SJckc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RapznoXIMU7okNwRfCyLQrm2sJJ0d1aQLYM9oo1+v59QcVXsCTyy0b0ZYfpH7nLol5uNpNvPtdQh+OMd0Gvj6bCNJEsIzw0WQL8CfIO1/UzdJgCyVQUxrwS7ht7JBKb/wMIf3lKiB2xVVUTKwK4rzIjAFs6mZnPsq6dLql5pxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9tFyAQL; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9tFyAQL"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so13046810eec.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032680; x=1775637480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nfYASLH7ozZo7u+Nlu8ufwQ22D1dNhEzAgYthYuO2cU=;
        b=T9tFyAQLceqhj1pVO3dKpfWrIue4qYzoojdy9sCWCsvcU6DYwDrqIdxsE7i84psWT0
         ar7mYx8LAaaD2/xcq7S6Hoi/9xCj3R61f2AdOR9R+b7VorIwFVVUnHnmFRhBQ05Anj50
         8MV0BhedbPLcHpXHBsI9fEWUlk6coTfvKR8lrtLsmvhU3zVeaiKsEvu1GwCdYofraLsZ
         2WlEi5wKJ0f0vZ+319B4d8zWXuHKbnz4VfZP2nTTKtDYVqLSxP7LRF5pfaTNUUm9qwt7
         DWWNM1BgZxsGodg4M8zbR+kI1TCgBdAnsCNUDE5mJiGOss8QudiYcHo6agu+5d7+mS04
         A6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032680; x=1775637480;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfYASLH7ozZo7u+Nlu8ufwQ22D1dNhEzAgYthYuO2cU=;
        b=KArmB+k20jOYVDPLa2NYizjANZHCMsvBHA5gJAPcJyQYnc+l6wAKA6uDAruAaDNu91
         AZDoDlTRQAj2qw4Gykv3A1pgBQEQhQm0km+jw0CGhpf2cohgEJCQA04vTeSWwuuBzW4P
         UQaUnvow6oL6XT5XuTltAHQ/mV3yJu3bwEJHkx5ghW6GtBew73tU2KitWWa9tO+GBddY
         abhJ7TOJN30RRqKHGUepl2jFkpomA/pJNzEjxeLEEDKbIWmahdnFVb/a06lMJJmg4AVD
         LL09AbzVATmKqvQAMtnBZo/lO0cA670WpLgnPTpc0KX2eLJEGMuYiq3VhKKy2pGFzQET
         t90A==
X-Forwarded-Encrypted: i=1; AJvYcCVCgpjmYQgbxKtB0/85QTwsriUCQalGx2Q85gvZg9vuqTnqBYt5QwTvvjzRKncEcOPJSHCfdMPcgA2lyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWD/zc63sTGv5CxYbuhfDgTPp6h1k9U1GnG0XVuFD9h5VW1lqg
	dnCocj7FpC78rJzgy8BIVl6wN3jmVs6PJmQDcksom/IOrTt/rGJrRnbB
X-Gm-Gg: ATEYQzwMdrRVnhsYnbZzyumfKs3xsqiKXBOPgjw9/bQa1ryXbQoMJJK+VaZ95QYfKKr
	ChfgLSiegsLG+lHiEiCJb7jqx9PGdASmje5oFL2/qpAbdh7REfRGufDbNyNFAcl6NX4K8ELp9C7
	vPu1gSwY5v06fhlBahAd/b3MSUF8d6dD0t9YdnbKdAhtbF4tBfuEnKztwZngJ+40pF5Luw366X7
	oM9yUTMGm2N2n3soF2re8EXV7tss1SDMSjqkoW74qbRd/EgNcsC9PeL95EUHSrkcA73FUXA3lox
	pJzN42GiBvOnQ2ml35t8mgivD1gTAqUrZz3V4mA52S6OVRqbmNmu5I3kGbQv1OYyO1vW+Ie69a1
	YTz49eZsuqmysPSCW/8bjs5uQSLCSQ9NB0KhmsFF9xCNWTAEMM2zoLIpXGUKcrTzKbg+xxBLoyS
	e0H/U+fkhzKijd2OfDOcCtImDVO14CtqT759bKNXxKavlKuEMxw8QkorEPtkIiq1K/s9Co7a02z
	S9pIQ==
X-Received: by 2002:a05:7301:fa0d:b0:2c4:4276:709f with SMTP id 5a478bee46e88-2c930c7652cmr1518985eec.1.1775032680036;
        Wed, 01 Apr 2026 01:38:00 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm12175823eec.5.2026.04.01.01.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:37:58 -0700 (PDT)
Message-ID: <d4fb2b66-85ae-4de4-b3dd-54260c73fd06@gmail.com>
Date: Wed, 1 Apr 2026 01:37:54 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
From: Rudraksha Gupta <guptarud@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
 <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
 <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Content-Language: en-US
In-Reply-To: <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Dmitry,

>>> +    vreg_flash: regulator-flash {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "VREG_FLASH_3P3";
>>> +        regulator-min-microvolt = <3300000>;
>>> +        regulator-max-microvolt = <3300000>;
>>> +        gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>>> +        enable-active-high;
>>> +        pinctrl-0 = <&flash_led_unlock>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +
>>> +    led-controller {
>> It looks like the nodes are not sorted. Could you please make sure that
>> they are sorted alphanumerically (if there is no node address)?
>
> Thanks for your feedback! Could I request this comment/change be noted 
> in 
> https://lore.kernel.org/all/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com/ 
> instead? As this seems to be the only comment remaining, it will be 
> easier for me to reorganize the DTS in the fuel gauge patch series 
> rather than this one, as the fuel gauge patch series depends on this 
> one. It also won't spam others in the mailing list who don't care 
> about the reorganization of the DTS.
>
I have made the changes here: 
https://lore.kernel.org/all/20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com/


> Thanks,
>
> Rudraksha
>
