Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61F3AD500
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419477; cv=none; b=XhPj4C5salhfmXl0IGVc9Go4eKAMXvwyhK44VPQtmW0V4r21dCk2XoExQ/vyFhEGJh+FP8YQvN4alno8VU5hdiA63t6ZuV++woQGt3K7JfX5nJ92xK7QZWXY2UpDtUJ+YVXeQe5exr8knpoyQ5d14g9spOITcVrbHfMs51byYAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419477; c=relaxed/simple;
	bh=o3yDrb/88+LuAPFtniGU39J3MPiEpljWEOm2I3ZGhDs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oojKgXhvLu22TCXvrm+HOegtXgh2S/BzpYSpDVMNPBk4cogiCyXUCQLsFBgBs+nLzDthOqP2tB4Q1oR9R+bkYPq70XRtQORdIDxdN+y2ERzYABHD1ic3YdqDrv9s0olfrsWVymcjiw294j3dTJWRgoXsFGb4LTMiz9va1aAFdD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjJhF9cs; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjJhF9cs"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so4176855e9.0
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 02:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776419473; x=1777024273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0uCHuAKeS6uUlnZaQ00rIBdMGYxOjfO74lX8NHxdEo=;
        b=GjJhF9csq0TNSx+LyE2b3I0w92BKZjB6LebS9Hd6KjoALoVifvLALSkOjJ0EzI5xvS
         rSZem+cnvVBdJSH5eENMsRoJNdb9aZEwCmi3X6eeehndn10ftzsbMq8t/XfLWmMkjy8Q
         cO2kxDVgqCOmwb+Ho6Tx3BPvTipqDNmxh1QfIlSPiUs9MABry2TYxHyFx/vmj9FCrbVy
         lKB1eLakYUVe5McUjdV/UVVhd8Qdym0lVw2CooJAj1uB/N33k/sks6eRFouvs3OVXKQc
         4zGzhhf+GCKfuYLK+oTpVptVP1HWct0FveS1RBXRE6HXoO0FmSP6NCmKMTrUb2wUWZwq
         hA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419473; x=1777024273;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0uCHuAKeS6uUlnZaQ00rIBdMGYxOjfO74lX8NHxdEo=;
        b=tF4it0HyYaBYDNs+Garg8/o4QHjXgoth9ujaQ9ARelLEHcQScGhDF+PtsAQ5JU6pxX
         deGkzLFxcSPf9LGz7DARhgCJSkdaIsmZP2IoAh5KXyhPPO/3i5RDu7axCtr4j5tyDwyu
         Jfi3r61yNnYpp41hUh7378U+m1vtkoOTCvUOlGi/3Za1/WakhXTkCYeYtfcaNNnwAmRg
         MAAHtrGU3qmxJXobHDhaRjiCBv60qINCf7QwuAzHXZtaPyPbN+d0MPjMDO+48A3ZvFQq
         Dx3Hkt80MHDmXhReXAzp1lHkNkLvh7txKU63B0SCTsE2J/iB0UVKAhO72nDVYvCaZLsP
         e43A==
X-Forwarded-Encrypted: i=1; AFNElJ+mgd2t/HMAi4gsfrwwNxtBOcVvQt448QGkcC7eRbtIMXbXoJpRDiXBuxHNkU3CB7EzpV8EDxnFHm3Icw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZH8HbjKfPydGHz+YudJEzUVTobvVDmoqLp8l+H3Ws+KBARJ5
	Zmhr6/x5407AVOvFjtu9VwTYdI6DH2Y/Axx0HWDT+lY4okXuY/6+QMWFJx1tli8JPbw=
X-Gm-Gg: AeBDievsFJ8bmk6lcJ4DlkeYCmmNcinOZEnPrQ+pO8jCFNg9aZsA+yzhIz5/6kY71e6
	mIdPiPqpD/6L3XoVhfkINc3/0yIS1qQkTOsLZHxzNuO9NASo0ZKl8118yx+YZZCJTZPIsen4f8K
	1S6D4rI2jScPLzhN430nRKsakweNt/kix3osE8hqE7xUkAW9tPd/ZFfcD7lTTplCUtLNySvNJQy
	UMqny63MwyY+Qt9tb6+f2tCfDihtDw1esTkaYkUqqDfrF+6+qy0esWhjcDYgfi+q8tmeQKl7YBN
	nwnZRph/nonooPB4fp20+fFIT4tDG3KddRrnGB7inqqmTHhgrSbixg65goVe6j3Y7O2kbbfyJcV
	KERHajBdBJA3HIZScok4JLKwko8zIkJDR2u0w8LE8xu0g9TgEFRrAsaEQtQz6D0NdXzp/fe6M3N
	Sl3Kk1g4bOGrVFR/iDkVcIQ673m/L9kFTWJqL4HRXK+Gmg4L5Zmf0YZs0m+w/Ede4igoz/lRZ4w
	BaS4AAr4uoF/eNcZQ==
X-Received: by 2002:a05:600c:3110:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-488fb739cf6mr27616865e9.6.1776419473355;
        Fri, 17 Apr 2026 02:51:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9b0a:b8df:9ec3:b505? ([2a01:e0a:106d:1080:9b0a:b8df:9ec3:b505])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc14a61asm30946315e9.15.2026.04.17.02.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:51:13 -0700 (PDT)
Message-ID: <a8031b65-62bf-46fd-b360-54dc84c58d13@linaro.org>
Date: Fri, 17 Apr 2026 11:51:12 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: visionox-rm69299: Make use of
 prepare_prev_first
To: david@ixit.cz, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
References: <20260417-axolotl-display-v2-1-8ce5341e46c2@ixit.cz>
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
In-Reply-To: <20260417-axolotl-display-v2-1-8ce5341e46c2@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/17/26 08:55, David Heidelberg via B4 Relay wrote:
> From: Guido Günther <agx@sigxcpu.org>
> 
> The DSI link must be powered up to let panel driver to talk to the panel
> during prepare() callback execution. Set the prepare_prev_first flag to
> guarantee this.
> 
> Fixes: 9e15123eca79 ("drm/msm/dsi: Stop unconditionally powering up DSI hosts at modeset")
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v2:
> - Move the prepare_prev_first before drm_panel_add(). (Douglas)
> - Link to v1: https://lore.kernel.org/r/20260415-axolotl-display-v1-1-7abb2d248355@ixit.cz
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index e5e688cf98fdc..f1430370ff942 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -371,16 +371,18 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   		return ret;
>   
>   	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   	if (IS_ERR(ctx->reset_gpio)) {
>   		dev_err(dev, "cannot get reset gpio %ld\n", PTR_ERR(ctx->reset_gpio));
>   		return PTR_ERR(ctx->reset_gpio);
>   	}
>   
> +	ctx->panel.prepare_prev_first = true;
> +
>   	ctx->panel.backlight = visionox_rm69299_create_backlight(ctx);
>   	if (IS_ERR(ctx->panel.backlight))
>   		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>   				     "Failed to create backlight\n");
>   
>   	drm_panel_add(&ctx->panel);
>   
>   	dsi->lanes = 4;
> 
> ---
> base-commit: e6efabc0afca02efa263aba533f35d90117ab283
> change-id: 20260415-axolotl-display-715ce416e5c8
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
