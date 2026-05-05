Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3430CD9E
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989535; cv=none; b=IYLEnLlBAytx4qfIPwnncIdyUUTV9hrH6mQEuzqvcJ05lZ1k/jqxssPtPrs5Hjj9MERRQ3jiIBQccfoIMWF7Fh5Xm/tNKLq973EKTx2hWG5o6vrqgFy65V//oxpVEbuxlFmj86F5WQcCJhRpcF9O6L/EnYHUx0mzDpojL4kEB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989535; c=relaxed/simple;
	bh=D5qA573oEns8WumfZOHmd/nTRVStD24XDCla8xCr+mk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JM/UbjwpCviVTWRjuv0WzMmpzEvQ1AYS2x1XcYm0hoxLXo0Gl/ETjLvxgpSZlAT8OLY0/SBl9pWnGIEF8Lx1FA/Lvt6nXyEbXO5EwCAdcWtYi6F9kYKJJGdUntbUCtMYMj7OnQHgDWFXybyMugx+jfD8mYeL65sUYCmAE27yVEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2kBBLg/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2kBBLg/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso65333925e9.1
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777989532; x=1778594332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEThy3ceEM1qRBHeltl9ycUnSvR4lD90NN2PoprYdj4=;
        b=M2kBBLg/dnMyd8hJjLOwCUyB1w1ABW8fiJTO8cCTHUjO/q2hDt63soynzmd1qsGfn0
         Ttbo8jyS8/pShbLBGWjzZn7oRxQMWfSXXoeVCGQQZPHixaRclm/R9vv8skVadJTfM/cJ
         fF/kailjGCjusypu/KmKaypE+/GhNitCYvET9TF2FgTEiXeLdMbx/fxpj2OhkxG0nd2Y
         dJTsBo/6zvWCpvNsNifDc8isMtB//fPF2K073eR1gjE69GpJkiYgDQV1U498YLCZPYLq
         iDcq3xluzZaVGCZDzhHhlSrhVQYBWhgjugYm9haorpShT3sw/TGgOCYkwMMRx7TJDVbN
         eqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989532; x=1778594332;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEThy3ceEM1qRBHeltl9ycUnSvR4lD90NN2PoprYdj4=;
        b=PQkCKrOZ1pav6lVcqwglTziEQSpnPNcm4+9qoSsSkxKlNdOm6siRyfNESOidLBeUEy
         6dMleNkdjRvBAzWuAt1nXj/7XWuYxFOAauhjuMYT6GggtsDgIEIB4vAAvZqyrchIy7JJ
         AE0LlubX6t6fX4Z0r14bJccn3LUlNYzUrNSd9P8tWcBVJBe8Jr0vbBz/277R94ipMMY/
         UrnC9wZDmWpXoMsGRqeqTTDg2m0Z9EJ2qkomoEjV5YNTV2YO8aB2ZGVQOPksM17wRFLp
         Pg63TbrQgxBaCECULzhT00tBmAx9V83TrLH4P6+IZd4Amq1JsLRz7dW/2+vEDxfAolkR
         o+fw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ii1lfeA/hkBy4UgA0j57rKStW7kptMpgHBb77ajwr9+GaFjJGTZNDge0dAWHzqMJcutFeH49MhPe2vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzModYGMOSv+lxX6IDMKkLVM3KJAMrYUgk85l9sjCOIkxKShK9H
	o8XYgxbtlJBqlvMyyfRhQNF822aNlGaUAThKdetRjwvhMLkGzXVDgzzeNLqMNzIWEZkZJZcn9t/
	gIGYx
X-Gm-Gg: AeBDieuJmUbBziFP1C+H7BX0Xm0iCCw2n2/xWwX5kIvkWXffWIHp74dSQ2BgeXLBiU+
	LMIvTRQCkb1gw3O4ygVeOm3OkkyI6K9Zbkl/QYghFu4/LsgxX4l7u62lA04LzGuc5XFpI0iswWx
	/0gFZ4A9xT6WnivkrfQy+0QzNShL5rrDWcQ/b/62FuktWXH5vV+MTyK4X92rDzfxV0bXanrLP/8
	kjMNc4FqGVYXmV4VCuVwArIUMPfjqoTFw2iVQOxEhvsO0EC38X8IK9JoccbAIfTGbNoTFlc0Wpj
	MclWTlVCxJvyGUeylFCXZpYise3kPqYeRSQa23YGW2rXzrs5Q28QpRGM0oYtDPdVoVos31D8phK
	+l1Fzv038TAPz7GXyoCSqHvYR8mRNOjDaR3HdLIeQ143wla2pvRroiCpveyVfouvwy9REroljip
	QGp3uu+sIxtObmbsYKJMtohCidXG5P9sd+Z6SAbNM+2Pe0zCxt41XbRO/JIG8W0BhcEHKPkkaQ2
	13KgV3FTlRrahwezQ==
X-Received: by 2002:a05:600c:4b16:b0:489:e696:836f with SMTP id 5b1f17b1804b1-48bcc9f32f3mr131446495e9.10.1777989531558;
        Tue, 05 May 2026 06:58:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:19a4:dd04:854d:9f82? ([2a01:e0a:106d:1080:19a4:dd04:854d:9f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d181efbdfsm17720105e9.25.2026.05.05.06.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:58:50 -0700 (PDT)
Message-ID: <f47be60b-5629-4536-89ee-6d033e21fe20@linaro.org>
Date: Tue, 5 May 2026 15:58:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/panel: Clean up S6E3HA2 config dependencies
 and fill help text
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
 <20260505-panel-clean-up-kconfig-dep-v2-3-9cc31d6e6919@ixit.cz>
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
In-Reply-To: <20260505-panel-clean-up-kconfig-dep-v2-3-9cc31d6e6919@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 15:53, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> As per the config name this Display IC features a DSI command-mode
> interface (or the command to switch to video mode is not
> known/documented) and does not use any of the video-mode helper
> utilities, hence should not select VIDEOMODE_HELPERS. In addition it
> uses devm_gpiod_get() and related functions from GPIOLIB.
> 
> Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/Kconfig | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 813380ca76117..9360297ee99e5 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -904,21 +904,28 @@ config DRM_PANEL_SAMSUNG_S6E3HA2
>   	tristate "Samsung S6E3HA2 DSI video mode panel"
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select VIDEOMODE_HELPERS
>   
>   config DRM_PANEL_SAMSUNG_S6E3HA8
>   	tristate "Samsung S6E3HA8 DSI video mode panel"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select DRM_DISPLAY_DSC_HELPER
> -	select VIDEOMODE_HELPERS
> +	help
> +	  Say Y or M here if you want to enable support for the
> +	  Samsung S6E3HA8 DDIC and connected MIPI DSI panel.
> +	  Currently supported panels:
> +
> +	    Samsung AMB577PX01 (found in the Samsung S9 smartphone)
> +
>   
>   config DRM_PANEL_SAMSUNG_S6E63J0X03
>   	tristate "Samsung S6E63J0X03 DSI command mode panel"
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select VIDEOMODE_HELPERS
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
