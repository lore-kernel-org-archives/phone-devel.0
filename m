Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8D13957E
	for <phone-devel@vger.kernel.org>; Sat, 21 Feb 2026 20:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771704629; cv=none; b=T+esSuoTz7L9o+KPLR9GIRQHw8QD+JWWJnK1A0usZkuHhwGUMaHXnikW2vxBZ+ykNZ7dj2Q+52FP6UiDu8jlQbSs6ribf3zFAEN6VrtKMMILnLuFBYjzUZS4bGagmiO5ktgrd2/TzhVuI/l0FjHhCmO7p+S/EIPdkkLOROkkHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771704629; c=relaxed/simple;
	bh=W4DNk9r71mJ+v9GLHtIefKXoFQJxePhOYR03cikc760=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDWNBMZL3dPAhBlRARDMuvyodoESc0YUy65bzdLX0TKLJub/ewpuWZ/ORTGTGBJ7M0Y51jKstmCLvIIYDjkopg1u7qZe+oVAFYCO0W/Yp+cJ19dHTpUQ9EsKbDc/Ho89q4bGQ8QkoytDvzKMEoT+9NA5QbNRTZZSw5uluHDSuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FU7vuiF0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FU7vuiF0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso21171755e9.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Feb 2026 12:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771704627; x=1772309427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bC6JUj3zrICaEtjd4CMhHMahl5hK76o8+V2OCKkV3nk=;
        b=FU7vuiF0h5gcqyaLsONbLSUUZkLcYq3CGRWLG/vM575/TtvqWb1g3gpxwFkSH/MXvG
         NW4yeQxxPonncAE80p5EG9/Igq4p6bwZVbBiw8Z6JW6ap14a2m7/uRbdcypek/yR4nyL
         b0iWzZI1+LopnRjwcy3cc1oe08cPRCAhLemBDrr1vJA79z5YWfqduaI2s7ACOJ1zsv4n
         xk/68Wmj3n4tmcgRUWZ3/WRiSNgwZcaegCxrobgXkuJ2vGwFhOTKsF9zhvM00+PeUnGk
         /WN31XbN/egoqhpj6B98xIjEaqfMFrWmDSduC2OqEIjTLHfUOew30qMqW5i/oWRKh3nv
         PAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771704627; x=1772309427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bC6JUj3zrICaEtjd4CMhHMahl5hK76o8+V2OCKkV3nk=;
        b=lRGi2xwp2ipzbPJf6b2tNyyIJwQrtUhNmXcB39RE7Oi7orGZ8ni5fIHyBUyTJ+iqUp
         tNzIGNVg1MbnigscE0bpbLU5pYBV1+bMd9DfDrNx5UqwI6AtkYfe3AG6OxWLep8rOow/
         izq0oE+jw7av0hLojo1jJiYuCXeFU0ctOIYc933clWUnMxRS4n2vQt358Jaczv9kf+Ma
         WMJ4h/glsAU8F8FOuXNYKK58tGglUm5q3bThfTIiFRaVTHnDpV+Wbl17ZBlcpuyLaUqx
         Dmm4czr2Td3AQLNUYv9KCy6t2QddKIwzKM7CSwj8tzwJazkVE75JGNTFAS8nZ2LKU0dL
         U8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS6kIPPhQea2QcrDqBuRuo6JxW9b6DV4xAp3ekXjZ6LHp6EBrU75EiJMkB1g7LwVfjr3wsztA+46uETQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWrvZSOKz59cD994MzjtBeOlBBdycc4mDXgWS64typuyQ8JP2
	ur9kG+Umkdg7jD6yqSXEPQ97LRQO6hiuOgkcLL8pqgfOKVkSevH/UX1xNLElcm/HOS0=
X-Gm-Gg: AZuq6aK9sOtmIO6kFfCpSHYtZGRaaCaZo0x/TO0VVZS8tCGVXqyJ9ujXT+fQ6dRoxO7
	98vzfA6RMxcvQXuZtvH6bv8aATfegzodvd3S5CF0e2tQbigE8HCmE8yPLtGvobBwgCfTxUJ8gCU
	xO5aUFKE1cuThShI9zxWHzdmiGpL/vQLjvbldodjrIkKQVnVWkLasOHlnrICrv5EAr9a9SbaFjb
	m5imDbETqnijKn+8Z4H2ncVVPvSvj9LaWrCIwbXegUyumxXw/1rfCcVIfidNn4AwWBBt9uvVHZL
	WpujUOy96MrcGUu8DGjc8MfrzMxaRLL5crN5/+qYU1fnxi2tug/1lQZ6Uplw+Ba/06rrUWNRYis
	n8WJCyYYqhJsLJy7pnu5GWG1eBelDzkrNB4z/VwcQQwYHuvN5QcvRW7RfUFgzm0IKBwynDr0WBy
	v+DkV/IBWCqET7FUXTlbwGDmVBy/WfDAx3H+kpiRKwp1tHkGhTKLec5A3BTxsTmeQ+2dXsSGAFQ
	Q==
X-Received: by 2002:a05:600c:6487:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-483a94d2fb5mr70957475e9.14.1771704626747;
        Sat, 21 Feb 2026 12:10:26 -0800 (PST)
Received: from ?IPV6:2a01:170:117e:fc:801b:3248:8888:6772? ([2a01:170:117e:fc:801b:3248:8888:6772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3db3369sm70222935e9.0.2026.02.21.12.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 12:10:26 -0800 (PST)
Message-ID: <cef3b382-7b11-4295-b441-4859b10a522f@linaro.org>
Date: Sat, 21 Feb 2026 21:10:24 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mach-snapdragon: allocate memory for DT overlays
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
 Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io,
 u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Day <me@samcday.com>,
 Sughosh Ganu <sughosh.ganu@arm.com>, George Chan <gchan9527@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, phone-devel@vger.kernel.org
References: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20260217-qcom-fdt-overlay-v1-1-d0fa0e70d738@smankusors.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/17/26 09:51, Antony Kurniawan Soemardi wrote:
> Allocate a 1 MiB LMB region for fdtoverlay_addr_r when
> CONFIG_OF_LIBFDT_OVERLAY is enabled, allowing runtime application of
> DT overlays on Snapdragon platforms.
> 
> This is useful for Android-based boot flows where the final DT passed
> to the kernel must contain modified /firmware/android/fstab entries.
> One use case is redirecting system and vendor partitions to microSD
> storage instead of internal eMMC without rebuilding the base DTB.
> 
> The allocation is conditional on CONFIG_OF_LIBFDT_OVERLAY and has no
> effect on boards that do not enable overlay support.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Reviewed-by: Casey Connolly <casey.connolly@linaro.org>

> ---
>   arch/arm/mach-snapdragon/board.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/mach-snapdragon/board.c b/arch/arm/mach-snapdragon/board.c
> index 5fb3240acc5a6dd23d93515029a596b5f77ebfa3..829a0109ac7807d692e127178f76d8822d5da5e2 100644
> --- a/arch/arm/mach-snapdragon/board.c
> +++ b/arch/arm/mach-snapdragon/board.c
> @@ -555,6 +555,11 @@ int board_late_init(void)
>   	fdt_status |= !lmb_alloc(SZ_2M, &addr) ?
>   		env_set_hex("fdt_addr_r", addr) : 1;
>   
> +	if (IS_ENABLED(CONFIG_OF_LIBFDT_OVERLAY)) {
> +		status |= !lmb_alloc(SZ_1M, &addr) ?
> +			env_set_hex("fdtoverlay_addr_r", addr) : 1;
> +	}
> +
>   	if (status || fdt_status)
>   		log_warning("%s: Failed to set run time variables\n", __func__);
>   
> 
> ---
> base-commit: f9ffeec4bdcf1da655a0ffea482062adde78fee8
> change-id: 20260215-qcom-fdt-overlay-ec6b8d9d2a1b
> 
> Best regards,
> --
> Antony Kurniawan Soemardi <linux@smankusors.com>
> 

