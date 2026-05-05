Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC5847ECD2
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989522; cv=none; b=LQjsTmjOZ909eZWeWGRnQ97kp7Zff1L6i97hQPHQhZR/brCN5VgiantgLe6iryqho4bq1VWGxcr+EYFFEOD/guWtMfPYHt1B17rJfRyKtf++KBON2YmdsXGrxvY1t1Zp2p7KSPX3CKdPOB6c5SYp5tO7PR7OLaA+Hsh9gDRa9EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989522; c=relaxed/simple;
	bh=zOCZGaua4HNmdhm/3v1kwalKdL8LgGjyKliEQ/ZoyB0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KTO0fKFAr2qlTi/3g0zGq33tpCH5V2PciqsNu+CvMXvlZJ7RgUZ7xU4imSwFEJowpp8OmMX9S0NYPHtzJ9Yfxs78RiR7QZycxKl0WkenciiseEZcDXoZTtUmH3ofxqr98FOfNataIXeWFqu18nQPsYeb2PpycOmJmYsGE3FrKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6jS7oEd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6jS7oEd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso56080295e9.3
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777989519; x=1778594319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTqqIiWh7w88CXO/27dveUeDNrBn2mFq5ALoevEOCPc=;
        b=I6jS7oEdrNF5vSqwsuWh3xmC4IJnM909SrSre7LMZ/Rbheh1UVQOO+rZKF1oPOhpM3
         /KBdAo1iGOp82JODYRtOatcotKKLw9rD26lx6udtBHBN3oGwDprPOlD9wLhtnEjLCJ4e
         TF0u4kJRVt50BfU5lgCe6FCpnonJZEeqbzaE99byI6jH5+NFKiAQY/oy3bj8gBE+TPPY
         dubQ30Ro8HBBdngT/IBBS5hwPC/B+Z7hoUunairNtPTtMAHwUmw5vl909QC4ZolrEImo
         bS6dpri27Tb4hbZWmVVph2+JqbWw3R9jJ/21hNMC0aD8UJQ3f0/ZX8Cm6kIrr1Qg5c+T
         KIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989519; x=1778594319;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTqqIiWh7w88CXO/27dveUeDNrBn2mFq5ALoevEOCPc=;
        b=gjhTdhpDkRxJvW/ibfO8qTaq+s+DsDPRgnrEWbPRYLeYbBebaWmsgBqSbmbKZRl0qQ
         uDeOowFkPaw+tQ/nbRiugXposKqeuotm0ZynaDSxEvlBGOQJXxU4YGxVMZduSUhePLc8
         2nSAwLkzeaV3kWi79qtpYoecjQNKxFEE5AB1srE61/OoQVCFmtSlctTodxW/pJBdN9Vd
         WhY+3FEBWig7Z41a3uv+kGVY9WY7ZR1W2azpbot8eGRZgC9quxs6n1PH4CxdG4umgcbb
         QoXDkOw4/rYOSP2nmtRbUWrblw/WFpNTw3t9UU48ILf2gYFFT0sttDtVWAtUEwdIZmma
         DNww==
X-Forwarded-Encrypted: i=1; AFNElJ/SNYKir5ymHmstjhZICilCYGXsM02jVmF+8t6xo9vLpG0Fs/Y72i3Q8qNItpLaQEGXZT47uGCIi4c2bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdRQDmj55LMdYiZi408+VcbQ+YqdsK6ELrFLTetQtkT+XP4gQF
	fXpyXtR0TMDRfGNYdwgJLkkVTHZJlyZ8HG7fgpLb5qnp6yK8ZTlh0od5BBNCOMBlXh4=
X-Gm-Gg: AeBDiesXPt9DdeGRK2E61LY9Yr1Df3MRvBeYa6+ADprg/PdFdr70IZcHRmgiGUw5qkI
	YIQefNrDISGJ8E5I9ZwxOQ9gX1zjyfFAlbQZ72iHX0G83RLRu85otktCgkqHFqDviv8oX2wpxO9
	Yy+0bji2FPC5MEv/RMSn+JV2o/5qFC31UIzX6/BOiJzhOu+OuwMIFb5v9h2uHnyCKWHV3AaU2Y0
	XmENkskinPToS6K3G8CLP2p7nDigGCO1LbxLz8Xbyvcqu6QAAtywtcuROjmDxVaZGebbiNKPiLy
	VOth5KQgsgE/Y7VGFzDhxe+3CUPQKuckbXVYWvbbVvrTGyvIhAHtZyalFEH5MNJawASpbnSCjQh
	kxAt4PxiEP8IKF2+MHa9s0yMzQnmcKIqeZiCE0OPZcmyVEymQbH+nDWgVhxdEd/mIj/QrU7zEQa
	gjuc+r8g/0sg1lQKtVog1RIL1j8gZykht50gp8PHtR9ctZul+nwV29j3TWGNgaHuQlj/dJdq/UA
	nIdoVgr1t9Pby4k6g==
X-Received: by 2002:a05:600c:c0c2:b0:48a:65a5:750f with SMTP id 5b1f17b1804b1-48a98668f0emr180192745e9.21.1777989518513;
        Tue, 05 May 2026 06:58:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:19a4:dd04:854d:9f82? ([2a01:e0a:106d:1080:19a4:dd04:854d:9f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14a12ccesm20531225e9.8.2026.05.05.06.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:58:38 -0700 (PDT)
Message-ID: <eeafc3ee-ab61-4666-8e65-600c566ec1b1@linaro.org>
Date: Tue, 5 May 2026 15:58:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm/panel: Clean up S6E3FC2X01 config dependencies
To: david@ixit.cz, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
 <20260505-panel-clean-up-kconfig-dep-v2-2-9cc31d6e6919@ixit.cz>
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
In-Reply-To: <20260505-panel-clean-up-kconfig-dep-v2-2-9cc31d6e6919@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 15:53, David Heidelberg via B4 Relay wrote:
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
>   drivers/gpu/drm/panel/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 627b839ac9edb..813380ca76117 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -884,20 +884,20 @@ config DRM_PANEL_SAMSUNG_S6D7AA0
>   	tristate "Samsung S6D7AA0 MIPI-DSI video mode panel controller"
>   	depends on OF
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select DRM_MIPI_DSI
>   	select VIDEOMODE_HELPERS
>   
>   config DRM_PANEL_SAMSUNG_S6E3FC2X01
>   	tristate "Samsung S6E3FC2X01 DSI panel controller"
> +	depends on GPIOLIB
>   	depends on OF
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
