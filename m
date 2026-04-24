Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A1203710
	for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023126; cv=none; b=CePVtqpSoVa/0pjgAWV/w6QG7Ih8AylgZqZblA8U2KcTNpzGW4vTVENanyd22byeC5DihTyoeSXLhwAyUopa+YNxVsD+fFHCZsXmSKwHA+lTDFE3fCUK7mQdByWy2DQHIhqbQ80A+NwDiTWLLEDtuT323HeaS1lAV5fw8o4BBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023126; c=relaxed/simple;
	bh=OeqbiERmGg8+ddPca0aSjunrURhH4ndTqyjB6j4B+pM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dMpjaT/VhMXt0k4cUPx8LpoXCE61vYP2AeNQ8eREj6yNkzg910SMLCKcKBrKpZ/M7w4gDbfRTUCCguqNdhG64ktMnl+QqWMIjhz0gSElpQR9XXM5Uxayib5uoESPQXb5y7sSdJNrEsoZk9U3JYCJqjNsjAsVreBkSqOQnwY/Bss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RZWztq02; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RZWztq02"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so4677518f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 24 Apr 2026 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777023124; x=1777627924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5X+knTsCdbNBxq4XMgOAP3PZXLW1KWDABPAEfaBV/tc=;
        b=RZWztq02cySAh2Ggb5alBs1oAzKGfyCaMNRKumyNTwJ+dA5cpbgHsTAuphiyxFiiK0
         /XYEibkX6x0rH3TTGPPuJ0DbkWZLczKIOqf1DsmzeEMl6FpZpHCsBs5CCv8MRtk+FGx6
         UhbxK+jO1mXgb/LjhC8AnHYrcCpvzjQtqll9EkfVn4hg+svqAxWKGvs/IyMl/3GQ7M2v
         WwqowTeosvFPqNg0OL8WKsn4brIMOr0scqgFyKN0cuGY7PYh6y01fae5Pwz2s9fkiKWA
         W4pMc45iYW3iLeB+fzNe7bScp1X/ye2/f/Y5n+SbK6KSpSpciDDSz8lZ/sRPjsOPUJB4
         zbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023124; x=1777627924;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X+knTsCdbNBxq4XMgOAP3PZXLW1KWDABPAEfaBV/tc=;
        b=B70BWCDID6oeiUOAIjZTdllrpExDxIQSfEVUl9ky226iqoESwNiNYRz+wjKPIBToKC
         xw17EauAjAQ1GckKmJJpuIkNcRZqE5X+E1/PetTuQWp1aNFLEWy4LnaeKP+a8hJaL00r
         wKSnb1wMrDw3cc5PpR082mC6qfDVfGveZrm1ujlF3sRW4S99iFUti5bAupFSLok4UvNn
         gpXXfONfxxOty1XaLeycRJa4Jk08BigckxZIbP9D42F8sPi/VHPnA31prvGzYsUp6D9c
         mWeI/RU+JhfyD00Qxy8xSt+ykM0pdAokAuc3ZSdP0LdJ9/Q2O9zOiIkijT6Jdq2qEdxD
         SsBA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ue1ucmJ05Gml4AjcVn8On50AXVGrTKb7DkHBgBv9EdlUb/6m7C2ZLNaE04gigDCb7cI3rzEVI+dvgkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm55inlB+bUjYbTQ9XS/XGmvUYpDNRBODqo6CTk1DWr877Armn
	mfwqJ7s3v2oU5p39P6R471zJeT1t8cCG5IYJVJns7OoxuNmYvdARa0+SpjJJSgNxsb0=
X-Gm-Gg: AeBDiet9UCPM+sKFfb5TbCecluuHfTYY1Fytvu153mUJooiPZoM5gMcBRXx2m04yC61
	kygAWjsnpfm+yhCPPPsG/UQllVgwqeYWHQLzpk6KtnTWYnOkEalKBGqEbQeyHysqC1DWz1vXxSJ
	msODzTXtApBwKPCoF7HTt4rlYgw0xxkBasy4Yxk0/ZN7nhkInbQY9wssU2iV7T8DaVKobQTDG/L
	nsnK8OZv10pAufvLX/zG8khgX6xqAdrpH4nGkItytRuWf0WVi/CllJcXD8krnIIYqGvIUCzLTrH
	5v8GQq3im8zGSsx5gcxERF/k/UJKR7gu6TA1YGtruuTu08w7NPTAuSmAsOKYAACimlCpKRjK7Lv
	1lZsNMp1xQEvMyXFuO5ZLhLg1Yf4TUd8fjsVMUrcjPUgI5N5e80CGsjYi4GSal0k7X2CAMhmoh8
	6uCpdOyc0iHCGrylvZyDRixkDZQH/8hGPXRtty2079S2hNhAH/cZTt4w+46u++q3fpWYjtKeVBO
	ZpCITxFPEdR7y2fhw==
X-Received: by 2002:a05:6000:61e:b0:43d:6fb7:fee2 with SMTP id ffacd0b85a97d-43fe3e20b32mr51416716f8f.45.1777023123349;
        Fri, 24 Apr 2026 02:32:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0f31sm58644023f8f.12.2026.04.24.02.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:32:02 -0700 (PDT)
Message-ID: <ebe54ec7-9cf2-4243-a616-34b18c50fd57@linaro.org>
Date: Fri, 24 Apr 2026 11:32:02 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 2/4] drm/panel: Clean up S6E3FC2X01 config
 dependencies
To: david@ixit.cz, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260422-panel-clean-up-kconfig-dep-v1-0-d825e9ffe911@ixit.cz>
 <20260422-panel-clean-up-kconfig-dep-v1-2-d825e9ffe911@ixit.cz>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260422-panel-clean-up-kconfig-dep-v1-2-d825e9ffe911@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/26 11:48, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> As per the config name this Display IC features a DSI command-mode
> interface (or the command to switch to video mode is not
> known/documented) and does not use any of the video-mode helper
> utilities, hence should not select VIDEOMODE_HELPERS.  In addition it
> uses devm_gpiod_get() and related functions from GPIOLIB.
> 
> Fixes: 88148c30ef26 ("drm/panel: Add Samsung S6E3FC2X01 DDIC with AMS641RW panel")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/Kconfig | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 2fd3222ba2e3b..a81ea7755c03f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -825,20 +825,19 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
>   	tristate "Samsung S6D7AA0 MIPI-DSI video mode panel controller"
>   	depends on OF
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select DRM_MIPI_DSI
>   	select VIDEOMODE_HELPERS
>   
>   config DRM_PANEL_SAMSUNG_S6E3FC2X01
>   	tristate "Samsung S6E3FC2X01 DSI panel controller"
> -	depends on OF
> +	depends on OF && GPIOLIB

Why OF && GPIOLIB and not on separate depends ?

>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> -	select VIDEOMODE_HELPERS
>   	help
>   	  Say Y or M here if you want to enable support for the
>   	  Samsung S6E3FC2 DDIC and connected MIPI DSI panel.
>   	  Currently supported panels:
>   
>   	    Samsung AMS641RW (found in the OnePlus 6T smartphone)
>   
>   config DRM_PANEL_SAMSUNG_S6E3HA2
> 

