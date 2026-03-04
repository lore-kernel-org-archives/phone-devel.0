Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2C235E946
	for <phone-devel@vger.kernel.org>; Wed,  4 Mar 2026 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641667; cv=none; b=UybVz9I7IhPhG1e9gyXO0UGMjA5Uq4EPv95/5ohnp4L3Z8mIMd+IwaBqDFTOHcBb12uyNK/ZKoUzF63MUSEpB4naoZdBiKr4yniKTyWH93VLn8vWY5RoaOcwSnk01iZ6f1aFv5rJkUWiZsWcxQP3o6j3zMluqVTv7Qc/rC4+fGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641667; c=relaxed/simple;
	bh=NwH6LIxcX3xeN91en9y8iMO+uWzG2ZNFE1foFo78ThQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OGqAIy092nLEx6u1mZauiu4uQA41mnDJZcIx7D+cmKyc98PMfWp2BiiQ9gTzxklKXvg5jktBN0NDMeK7rIfoRr1EQGZecgsidMi0HORMr5Lr3cNHD4VVrQ5lEMlsa6v1fybMRtTyJWZxGRLVGbaY1Sf7KnrF21IlA4G1Sjt2/o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nFH9Hh6U; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFH9Hh6U"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837584120eso52895545e9.1
        for <phone-devel@vger.kernel.org>; Wed, 04 Mar 2026 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772641663; x=1773246463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUiQRhZhuyL2bRHYFIvUj3h1OxzYZlpga2Ooaul5ruw=;
        b=nFH9Hh6UY6b3hggOvNAKGTtek+rVHy+0GSeBYJOuYO4DMDq659BZ1vEGo73kgfxXwm
         ReSSPN0h2zzKMTchlBKVcs3/buyCBHleYO0xqUSR1Qp2tZlngJBwD2J1psOSh7M8jIiC
         rEwp80XVyIjDxTt9fc9qORA+jkSFwpQvCeu0LeTrRXaVcYTp9YPfuWC9AhvpEhFgomyI
         xJohFatmM5Fgtm1ZtsHhze857FzrqJuy8rm0nDBXBZfuDOgIp6fhj3uMZu0pocKNy3hl
         TFvE85qmV/P6NJlGukosxjtFhs//Ki0yIcFH1qPtLyb/00jHzgL2lGqjnoYYO0PMEOe4
         8aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772641663; x=1773246463;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUiQRhZhuyL2bRHYFIvUj3h1OxzYZlpga2Ooaul5ruw=;
        b=YuqSKs702fuqbHO+8vNNxVoG79jq7shUWsaavv1GUSeQzZk3kRmd26PPNpCTBW/GG6
         mjYYL4tWa6YhVjrHQwoWrYEgX/4bdHOf8ACOsmhMxeai2Q5kHa+Z/ujGbqrO2StE19bp
         t169pSt78b45O+6eYnuLyNDtgiWaSeg08Rv7oYXUmrKlIXchyZlv5dBA4DXyghX6V1UL
         dHyVjWDoasa+//Z0IyPMvIo5Y0FIr/rFQGBGfixrRaitgFzaano1oAyGtxmlJJfp3zFM
         Tc42MG8PYKptrXRlVMYCCBtzY6S6/iHlTwn6Q3UgX7on00swFC3yAsAGA/UxuqLU+CCL
         aNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUl8LHb38NYf+w+NY9IY7fBlQWyN1HvZjCplDXBx/vCogQ5cDh6G9zfBKFBO3ZM30qRcmMJ8Hs/q9VCiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUn2pkQvYhJsKg8U/1+qXon+cOtH37y/uZYMwd9xtDDk8zK/6
	zBedkEl77cnnqAWpFu4GwXN563k+t8V3JyadpIh7ShCZUGAkTqZxEkID8dfMARZMXp8=
X-Gm-Gg: ATEYQzzkc4wybKQTN/mYgot3/xCGbFnpjgr3VXMji1MLxVeSb2O2aX+YA6ejwgfC+Kg
	dT4AgifFMCLH44K9q6jwKg5e8MnIRjzf+EP7sMvAKWU5Vdjj+DxrwFjabDtaqZQqeExVNLz0q84
	eWSMxdt3+6UvsIMGyVzV8HSpHlTlbpPPX43t7ltmHDGTItghKHzl13VVGR0/uSQN5fWlFfj5KQT
	A1jNcHirfj9Kbe+SBjBgkBSvbJ/CK1spKRB9ZyxxFFr6+BekD7xAntEpbrRf0SdQS0/69mgbx+p
	yEC/llD5eh58UZ0e7Riv5uM7RFuQZ7QA+wQnG//wOvTQbDq8YL3kj4z9d/AD1V/An7S7JCt2cBg
	lGYN7Ak6RpriL1s1C9iBKLywlFlypaFfEZP2psozw3XJ24Th+dYRdaPVmOkCGQQgdXGelvZShP0
	yNVZ/z42ZjQfEUMoyJZVtmCDcIOgRCA8VJttOFvTIQfxVE9qmf98G/CZHvBgp3A9NoDO28LF/sx
	N1ZKOAUnw5uqQ4=
X-Received: by 2002:a05:600c:828a:b0:480:1c53:2085 with SMTP id 5b1f17b1804b1-4851986f362mr50738455e9.19.1772641662829;
        Wed, 04 Mar 2026 08:27:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2? ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm11481675e9.20.2026.03.04.08.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 08:27:42 -0800 (PST)
Message-ID: <b2ce76f4-bb19-4e4c-a5bb-c3000f8a9827@linaro.org>
Date: Wed, 4 Mar 2026 17:27:41 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] drm/panel: himax-hx83102: Add support for DSI DCS
 backlight control
To: Val Packett <val@packett.cool>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
References: <20260217070121.190108-1-val@packett.cool>
 <20260217070121.190108-5-val@packett.cool>
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
In-Reply-To: <20260217070121.190108-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/26 08:00, Val Packett wrote:
> The HTF065H045 panel based on the HX83102 controller does use DCS
> commands for controlling backlight brightness. Make the driver fall back
> to DCS when no external backlight has been defined in the device tree,
> like many other drivers do.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 65 +++++++++++++++++++++
>   1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 34e0e956db48..8b2a68ee851e 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -7,6 +7,7 @@
>    * Based on drivers/gpu/drm/panel/panel-himax-hx8394.c
>    */
>   
> +#include <linux/backlight.h>
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> @@ -76,6 +77,8 @@ struct hx83102_panel_desc {
>   		unsigned int height_mm;
>   	} size;
>   
> +	bool has_backlight;
> +
>   	int (*init)(struct hx83102 *ctx);
>   };
>   
> @@ -913,6 +916,7 @@ static const struct hx83102_panel_desc holitech_htf065h045_desc = {
>   		.width_mm = 68,
>   		.height_mm = 151,
>   	},
> +	.has_backlight = true,
>   	.init = holitech_htf065h045_init,
>   };
>   
> @@ -1049,6 +1053,59 @@ static const struct drm_panel_funcs hx83102_drm_funcs = {
>   	.get_orientation = hx83102_get_orientation,
>   };
>   
> +static int hx83102_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness = backlight_get_brightness(bl);
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return 0;
> +}
> +
> +static int hx83102_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	u16 brightness;
> +	int ret;
> +
> +	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	ret = mipi_dsi_dcs_get_display_brightness_large(dsi, &brightness);
> +	if (ret < 0)
> +		return ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	return brightness;
> +}
> +
> +static const struct backlight_ops hx83102_bl_ops = {
> +	.update_status = hx83102_bl_update_status,
> +	.get_brightness = hx83102_bl_get_brightness,
> +};
> +
> +static struct backlight_device *
> +hx83102_create_dcs_backlight(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	const struct backlight_properties props = {
> +		.type = BACKLIGHT_RAW,
> +		.brightness = 4095,
> +		.max_brightness = 4095,

I guess those values could be in the hx83102_panel_desc.

Anyway:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

> +	};
> +
> +	return devm_backlight_device_register(dev, dev_name(dev), dev, dsi,
> +					      &hx83102_bl_ops, &props);
> +}
> +
>   static int hx83102_panel_add(struct hx83102 *ctx)
>   {
>   	struct device *dev = &ctx->dsi->dev;
> @@ -1080,6 +1137,14 @@ static int hx83102_panel_add(struct hx83102 *ctx)
>   	if (err)
>   		return err;
>   
> +	/* Use DSI-based backlight as fallback if available */
> +	if (ctx->desc->has_backlight && !ctx->base.backlight) {
> +		ctx->base.backlight = hx83102_create_dcs_backlight(ctx->dsi);
> +		if (IS_ERR(ctx->base.backlight))
> +			return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
> +					     "Failed to create backlight\n");
> +	}
> +
>   	ctx->base.funcs = &hx83102_drm_funcs;
>   	ctx->base.dev = &ctx->dsi->dev;
>   

