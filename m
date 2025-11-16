Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8114B30ACF1
	for <phone-devel@vger.kernel.org>; Sun, 16 Nov 2025 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301338; cv=none; b=oLdILmow6S9ANWxEb5nRozlUyaYeKNKHW+g6MAMztACOxxwatc97mb4zQcKjOKp1FefTWeUT5fWOyYtz48A8J9hQZqNrBU09B1824ttFqTw+s+cEAyNzgMUlD79TXuQou6p9+flmMaRD223PiQn797Odpwh/z4EwxTLWPOLTWHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301338; c=relaxed/simple;
	bh=FMGplgNJzN/pBx0afIYEUB+527NtkSI5GGeIgMmBILg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YyyM8juVr/g53LLq5SPIIeWsQtWeUUjeTpE2ykVXk68ysTyggLZd0zFTCTAaDqD13mwKUCoEZOw48aQR3l8w4MZlVdEYAhO5QhY+UvGk7m3l2Az8R1A2OGXHOHzfLMGabhfiU06gGjdhwdDZ50cCZ2iB0oa2TYfgY8uWKqY7aks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyybtAKY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyybtAKY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775638d819so19524525e9.1
        for <phone-devel@vger.kernel.org>; Sun, 16 Nov 2025 05:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301331; x=1763906131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqaGRJ1GY2x6l8dXoAfBLP7/ee6T2P1cW9IpZWUq/iA=;
        b=dyybtAKYugn55tSdk0ejJ5x/CPbkHH0TpHuUIMeesN2v01un2BHFcRRcpt/KfQCuu/
         xJL68JC5nQc8fkOIP5TQ3n38Vj5Md5usePN5bSF4yc+FNJxwxXakH59yQW9B40EMQweq
         KwwOK7r8Z4bNn8BbWUEpw1YvcDvH2SdSp/tLvjWclv5ZUjGDRW5mGIDakS57YT72hPTC
         lzqODhASxpVxaAF/Z58A0hVZGBoSwu4tvItt7vFxrQo2+p3S0wNqkX349MC82reXZQwJ
         AA4nLPYLj3r0JhyDj0BkyYrp2lTkh+i1DXyb+8018UTsJWzfu4DueV2WJD8A7nxk22Hr
         Dl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301331; x=1763906131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqaGRJ1GY2x6l8dXoAfBLP7/ee6T2P1cW9IpZWUq/iA=;
        b=utu/BSy2K6HuY4wR0iE/v+2ueh0VEWRO0AQX+7yDcxJ4ebPbiz+FD5UUvwqwLdgXHW
         ltmwMaWPySx3q4XPCeWXUbBzLSOiHVo0pmYqKy1LekBQSDsRxmhDKV/z6o5fca/6Xz+G
         noUSDMzlqb53oZzx1TMmT5CGroxKqRrapodMfL8jNIBwrK1xL3lMd41E7i0H1v5zFuqM
         GynI5pEFyIjx3m+jX/6ygBtJaVYQQf48AL+pTULDG5q6MBxUu/kyx+MP+NoLuYrT+3EY
         rjRrST43Z3gT/NP/Oe9FTmYlLvozilVaxjS7PJl/cBJkcrPPhZDxJOFM6tQHoddqPwva
         weLg==
X-Forwarded-Encrypted: i=1; AJvYcCVm+fUIZObT+mZIi47KN1OsSNLyUBNifFWj52rDpimnDv/bCgP3K22Ug1srlu/LwyY+Sr/lbpvQFf48Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgzZ1mOTFwAIQ3ILyQYYIvGqxMXBWvwx6rRQ9ygib/O+MoGQp
	P/EOAIhHrwoJX6b+A0152fDT0aWK3xY8Y842rvo0Jn9cy0ULH2cZft0mewzNFHgiPpY=
X-Gm-Gg: ASbGncu7jy9AGsSiV8Jlsfl0M8dvaYeQbinhzdiVY523XZyE2zu1NKmXrF4yQFq3SMI
	+UKlQ8NrrxMhK7hRpf3f694Yn5YTnyOpg34OTBS8+4Xx1WWnLExpInQnJXYrhwyHjOQZC/5tpa3
	IHATlpIHUz8S7jbrzvYpR43K89ddjDGRyTXf9FmYqc0SI+cdVa+PytgpIwlyDoArntYoQ3GgaFE
	Tn5ybvujBY8mpI/EyN5IT4SV6WX2Ejl+z6WHThgWBVYfDTvKJLxiEVlJbPwXSS8CD9T0tCqU3Kf
	2+LGF7+Hfef57RLP5M754dzklwhUpkxWQkOF+uugf/GM5Usa8oyXyfkM0rmFHZzw1Yjh6M0d8AR
	DKOZ2e+UgoXAWovyGkAOtKU/vdS/PFwvutGIfeLhSffij/XlO1AqrKGvS0I8NJmKJatqft478AN
	RlInyNb3D9iLRBW8D2znboR547Oy1ejpT4gRZbsVRBZGw+
X-Google-Smtp-Source: AGHT+IEUk3DdqvvTuoPw2svj7P8n3jQB7qQ0jl0BLgq51a3AoZNXsza4PugKS3KBfdWLmwJrvek4kA==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr84649915e9.29.1763301331148;
        Sun, 16 Nov 2025 05:55:31 -0800 (PST)
Received: from [192.168.1.160] (p4fc3ddd7.dip0.t-ipconnect.de. [79.195.221.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm94835955e9.13.2025.11.16.05.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 05:55:30 -0800 (PST)
Message-ID: <9ef0e4f9-7594-4c26-ab45-38e62a7d0e37@linaro.org>
Date: Sun, 16 Nov 2025 14:55:29 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: panel: Convert Samsung SOFEF00 DDIC
 into standalone yaml
To: david@ixit.cz, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

I may not have added myself to MAINTAINERS when I submitted this driver, 
but a heads-up would have been appreciated before just taking it over!

On 11/13/25 18:57, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>

[...]> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e015dcbac732..a4b16812d5a0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8117,6 +8117,12 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
>   F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
>   
> +DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
> +M:	David Heidelberg <david@ixit.cz>

M:	Casey Connolly <casey.connolly@linaro.org>

Please and thanks!
Casey (she/they)

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
> +F:	drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +
>   DRM DRIVER FOR SHARP MEMORY LCD
>   M:	Alex Lanzano <lanzano.alex@gmail.com>
>   S:	Maintained
> 

