Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0663F1DB540
	for <phone-devel@vger.kernel.org>; Mon,  2 Dec 2024 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733169645; cv=none; b=KgOK0kKfMJEJHUTWUasZkBI9nVt3798bsRk1LGXb5o6KVJn2eKw3xtC6/Dxc8QTCuetdN0G7QI6bujN09dEMjdfFwzyUJ26hXZTn6zIldbho6lTSqq5TUwRkam3WJKRX4NWkgEgEPDcFOP1wI0dqlJKTIGG+fkK+IyrHt1wit18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733169645; c=relaxed/simple;
	bh=ZwT9XETIGPRtoz06e9/Bz1xnjU0UUFwfd1/wc/ZJOT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljqEagcDJHFHi+t6UxmiTwqH3J/xT4p/lJN09+EtNEmRL6NLqCNlQ+GBjARaFFNkBQ1dfHdFjRmoeSGbLMrC2DgBi8hhjzWm0FF0b1u50yXeFU7KmAko3X7d/DAG6mh5pDG4/X7wMQdHbYSekZfqOV54pLW5/cVakQE68GYkhCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eLoILcxR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eLoILcxR"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df119675dso5664417e87.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Dec 2024 12:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733169642; x=1733774442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAhtq60I6waVpW/O2JwlPsYrhNNVeFfaONkbV0wS/U=;
        b=eLoILcxRM3AmrUCxOGkNENSkBe1t/WhBa7Srj5s2SrXQoKOshUxRyDoap0Rmn9IuNk
         0RNMdwzGZkwbcPANhyF5bzB4a9dHHtE/Mb/VJh9a7ovFx7YmWrcHXxEQuUlrMxtK9gF5
         Fee6fVsy1niD5nt3VedUCT2slYSrdlLskoF5WTKJfO/YEQgnpYWrKV5PY3tr+PMu+/Uq
         VkYj4SerPwlc1jKuZ1QosIGA08QfQ6BlRiPKtahnopZQ3pAPbDW2vOCV8JVe8pE1KfoM
         K5Bfd9U3d4NB7w0nRUQVKyYrnnS5O8PMdtfKYsWOACxb2ad5y+4jUatNJSY8XP/KLlh7
         km2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733169642; x=1733774442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXAhtq60I6waVpW/O2JwlPsYrhNNVeFfaONkbV0wS/U=;
        b=FchC6dKbQl1HU5lv3W2n08y+ADEAhk9dFozxJ1ix1v0ZjAXXe25+rpcBeRJfkKheD9
         vqp1AYKx/j8yW8jNN4FuumxUnPHHkLO9A9keWDtTlG4aGR356TJb0KHGZt9Rg3MeqKty
         rebYPESEojKzG/eec/XXyGWbg00hFgotNzwqX5OLZcUzrhMwT/15aAaMK6VYoIFqAIG3
         a7r9yneEPCZm1wcItiShIsMk8UoOB8mooFMrHIOE2TZZOjSc4zZYNMcRM8X7e3uLcqxr
         MP7zCkpYGtEd9VcXY6lKWP1WvzVTwuy3A4lRCfXJ+PKDY7JEtvq5Q+nhF5vEnB8Bqh5+
         y3aw==
X-Forwarded-Encrypted: i=1; AJvYcCUgML82RbYi8gAI2k2pOqAwT4JUxobuIvploOXL2TqgqAyoCOXNIe0kvRyQQMZJ4kVE3dEOulnvHLeDCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZx7S+toVod/dS1INC4UlJt8tCl8vLzL2MMzAD7v5JHtUgjKTB
	pgvjF63mCwpID/sclzHtqTGh9vTKlnI1o8JEGWtXRQjVEaCeiWcf0T34HzA4Qww=
X-Gm-Gg: ASbGncsgajvUGwdlZi086uhX7xgf+WyRkkaIRp1W2ApTt2oY9YSK7iCVotcItP0EGN5
	i01jGLrRwtbJHuG4qBoMcaAuXiTVeusUQMrQbwQ8V16LUNGclabspF0iZaTefbiHB//minNpLtA
	SqbsMUQyUcsp99lSimK7dApBWIADWamO9WGXZHMBL8xM5cHKaUwxMQKgk4nTEoknoR2mERGADFL
	04oZcXdTv8oio+Uyy2u7H7JgmTw9D8K+0jgfn64Mc3ngf2TXDgaY15jlH4fF42asFnTs0kH928R
	84XMZhTcM0hF3R6Ti5PVIvaJaoF25w==
X-Google-Smtp-Source: AGHT+IHlBla2bkS939rzD6EaoiaSpmSshKV9IUflTjWZle/0CJSDrrxy8jwAJY6npjQNBvZiqQHQNA==
X-Received: by 2002:a05:6512:1286:b0:53d:e88b:eb4 with SMTP id 2adb3069b0e04-53df00d1ba7mr12812129e87.21.1733169642056;
        Mon, 02 Dec 2024 12:00:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f136sm1550171e87.166.2024.12.02.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 12:00:40 -0800 (PST)
Date: Mon, 2 Dec 2024 22:00:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
Message-ID: <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>

On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> During an earlier commit, the comment from SM6350 was copied without
> modifying. Adjust the comment to reflect the defines.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Fixes tag, please.

> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -65,7 +65,7 @@
>  #define SM6350_MSS	4
>  #define SM6350_MX	5
>  
> -/* SM6350 Power Domain Indexes */
> +/* SM6375 Power Domain Indexes */
>  #define SM6375_VDDCX		0
>  #define SM6375_VDDCX_AO	1
>  #define SM6375_VDDCX_VFL	2
> 
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241202-rpmpd-sm6375-06582e126d7f
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry
