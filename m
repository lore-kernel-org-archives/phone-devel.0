Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D16448B90
	for <phone-devel@vger.kernel.org>; Thu, 24 Sep 2026 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256969; cv=none; b=j9dxQoGLJAcgcR9yIuIgPspBUWQNm2F1tzhDm5Yi8rbVFh3C4TkPlSiRw6lSVgHK+eV3pDdoB2Hzn9HeTOlzvs0hYRlisePZ4N5BZ0NaSdRBGdZmrKLdKmSTtACnMqjOiQhhp4Gy0kkM+r3UqBOCoer1SaeJCdf/B6zlkLAXjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256969; c=relaxed/simple;
	bh=JjQca4qE+VW6R8cQeCI3PAms0wwszdPg1j6ZSaYalAo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sxFzZSfIxgi9QY2xgbXrfZlrLy0LQC40MqfTVcisL7kppJEGsekjJtILRBPlYnOoRoRutDWh76Clc/IkC7Vobmg0ct9dtUgsMl5pUcIp7NBY99YkiloWocTw4IImisu9dn2QtWJAR8LRqkqImf0jVRYcROtTcNF0/BWTPQC3Kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wh7f4x67; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wh7f4x67"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so11961895e9.1
        for <phone-devel@vger.kernel.org>; Thu, 24 Sep 2026 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256961; x=1790861761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U22T5ktXeO8XQfbmyXBSjvK2W4d1tae1YGReIurscXk=;
        b=wh7f4x67clrkaxNpehGJ1MXHo/NRAtOehqeEMqEu2FUISybBa3iv8rQaoaKx/90xq7
         6t9Edb31X1met+JXcCPwOVGSXJby1yXU73/bQt+L7FHQDGED9qbMq1cc8aEuTdGPU7qf
         2OQP66BF+rMEVz0mCE/DKzPcafDIYeeBbNmc/GY9XyIShN8KPEPFrVVbzE+yD2PN4yIs
         Pj53P8t5iCJ38IZiThbkwdiqvINfUff49jAzpTKpGJsS5ldL15REnB3hiFi+FBfDu4sX
         zOlHDloJ2JzavkrudEiEeZVOtF4NVhVK3dqZ7jYLu9BIaA31z0vfu4juQFbSt0YcXTeg
         vMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256961; x=1790861761;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U22T5ktXeO8XQfbmyXBSjvK2W4d1tae1YGReIurscXk=;
        b=DJrp7d4trIlQaQlp54JvX/yV1/cqEwFBogMVfCedNtYLbYX/GGul+jzcdpRMFEeXU6
         vKCZtMRVtGOB80eqWsGwPGc72KHdU2j+FBWBZYeHGj4l3WxmDw9RqtKS4nnpwXmRDxZz
         g+6nmP/rz67Wet1dR67xj3c69loc02eMUsAUJrBvvGp/JYEQ9w1eqBXGUx+nmD9waGij
         6APpYyrMm8R4ypKjGFLCgEBMpC8j3Ij1gApKs6pnDFo1zo2MUTYkG/iEE0LaUvuYG/Kk
         Dbv9Bti9SZ1J4+yd8Zz4XJS5tSjSh+Y+KV+VIzkrn/RAxXnKGtH7nKxPqe0RP3fP/GNb
         /CyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyzQqtdCXj9YZtNx4FxwlO/FATsEZl0TBkCogTMLvqaT8k84mucBtJ9g2LFyQlE8v6PZRSlRM5jy8siw==@vger.kernel.org
X-Gm-Message-State: AFuF++l1c6ZByUqOiE7EujRpb7EBS2u9xYlSZ4OTef7NaEZOUL3JsBAN
	Y4SpUi7Mf6twQtNP/PCgji8MPjJdKJDTKzDnHiZ8oFs9dhITYe+6Rb8frDSJlcTgX18=
X-Gm-Gg: AYBFou1YcftlFV5rFxZX0ueCUzJDo7Qqh/EQiwze52BSqJYC+HtET9KrgW9rQHaJqQH
	nNQLW82+daoztXCeDEJgUYTL4w8WE85dFYkZwmsESRH2izsMraPSGB1MYXURplqCgpyi7bb1IIP
	rQ4dunBSDQ0LsT8MY4hyRwxeqo5xo5oUMOg8K+nJqCjDMtLCKzf8NHc+GMLI+suDnVgCZMXvGlt
	0GLIwr9KC5992BdjC2VYG0fWPQ3+9O+Ibq+QxcCqinmRoXvGz19pJoM+jTMx6RjBzEcgSU2/BH0
	8CbMd4oP4BB8Z/uJmSTtDSdkADZElQhq8eDa3p1LondmmXqo0MEG3M23mqGc3mxDJgnjbn/zGpg
	og9keujfIavuv+8wP4GkJwqfn0qhwI/NJ1KFZqYmRkmx55E5DuYFmhPqTUj1bx7oAy+5Kfuo2cP
	VAkW6FMBIRB/ZUR/bYVyjYumLzvS4UgVk7o2OF86Bpc+McnTl5GttFPMp0c44DZ7NB38b7yIYZW
	El/lFLIYlZYCiY6zGue8fPGvG1I9+MQvuwUFbBqU2mQUXa9TJmWCg==
X-Received: by 2002:a05:600c:1385:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-49fe66fa5c2mr40253725e9.24.1790256960649;
        Thu, 24 Sep 2026 06:36:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2d5sm14384759f8f.27.2026.09.24.06.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:36:00 -0700 (PDT)
Message-ID: <3c92a2ea-c588-4bc6-8d6a-8006f595e9cf@linaro.org>
Date: Thu, 24 Sep 2026 15:35:59 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 6/9] drm/panel: novatek-nt36672a: Add 3 panels used in
 Xiaomi phones
To: Alexey Minnekhanov <alexeymin@minlexx.ru>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: David Heidelberg <david@ixit.cz>, Joel Selvaraj <foss@joelselvaraj.com>,
 Chintan Patel <chintanlike@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
References: <20260917-nt36672a-panels-v2-0-f8de8be5b86f@minlexx.ru>
 <20260917-nt36672a-panels-v2-6-f8de8be5b86f@minlexx.ru>
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
In-Reply-To: <20260917-nt36672a-panels-v2-6-f8de8be5b86f@minlexx.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 18:43, Alexey Minnekhanov wrote:
> Add support for 3 panels used in 2 Xiaomi smartphones, all based on
> Qualcomm SDM636/660 SoC:
> 
> * Shenchao panel used in Xiaomi Redmi Note 7 (xiaomi-lavender), the
>    exact model string is unknown
> * Tianma TL063FVMC43-02  for Xiaomi Redmi Note 6 Pro (xiaomi-tulip)
> * Tianma TL063FVMCA01-00 for Xiaomi Redmi Note 7 (xiaomi-lavender)
> 
> They all are DSI video mode panels using Novatek NT36672A controller,
> so they can share almost exactly the same init/off sequences with
> minimal differences between variants. This allows to avoid a lot of
> code duplication.
> 
> Co-developed-by: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> ---
> v2: sort compatible strings alphabetically in of_device_id
> ---
>   drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 166 +++++++++++++++++++++++++
>   1 file changed, 166 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> index a445c8067aa5f..d356348d39608 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -357,6 +357,90 @@ static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi
>   	msleep(60); /* 0x3C = 60ms delay */
>   }
>   
> +static void lavender_tulip_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	/*
> +	 * This function supports 3 similar panels with minimal differences
> +	 * in their init sequences. We assume base to be lavender-tianma
> +	 * panel, and 2 variations (lavender-shenchao and tulip) are handled as
> +	 * differences to base.
> +	 */
> +	const struct device_node *node = dev_of_node(&dsi_ctx->dsi->dev);
> +	bool is_shenchao = of_device_is_compatible(node, "shenchao,fhdplus-video");
> +	bool is_tulip = of_device_is_compatible(node, "tianma,tl063fvmc43-02");
> +
> +	dsi_ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x18, 0x96);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x05, 0x04);
> +
> +	if (is_shenchao)
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x27);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x20);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +
> +	if (is_shenchao)
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xd9, 0x10);
> +	else
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x78, 0x01);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x24);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x82, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x84, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x88, 0x13);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8a, 0x31);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8e, 0xe4);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x8f, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x90, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x26);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xfb, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xa9, 0x12);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xaa, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xae, 0x8a);
> +
> +	if (is_shenchao)
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x1c, 0xfa);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xff, 0x10);
> +
> +	if (is_shenchao)
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x01);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 80);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_set_tear_on_multi(dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +
> +	if (is_tulip) {
> +		mipi_dsi_dcs_set_display_brightness_multi(dsi_ctx, 0x00ff);
> +	} else {
> +		/* lavender tianma + shenchao specific part */
> +		mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0x68, 0x03, 0x04);
> +		mipi_dsi_dcs_set_display_brightness_multi(dsi_ctx, 0x00b8);
> +	}
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +
> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
> +}
> +
> +static void lavender_tulip_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
> +{
> +	dsi_ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
> +	mipi_dsi_msleep(dsi_ctx, 120);
> +}
> +
>   static const struct drm_display_mode tianma_fhd_video_panel_default_mode = {
>   	.clock		= 161331,
>   
> @@ -389,6 +473,85 @@ static const struct nt36672a_panel_desc tianma_fhd_video_panel_desc = {
>   	.send_deinit_cmds = tianma_fhd_video_send_deinit_cmds,
>   };
>   
> +/* common for both lavender-tianma and lavender-shenchao panels */
> +static const struct drm_display_mode lavender_panel_default_mode = {
> +	.clock		= (1080 + 90 + 2 + 120) * (2340 + 10 + 3 + 8) * 60 / 1000,
> +
> +	.hdisplay	= 1080,
> +	.hsync_start	= 1080 + 90,
> +	.hsync_end	= 1080 + 90 + 2,
> +	.htotal		= 1080 + 90 + 2 + 120,
> +
> +	.vdisplay	= 2340,
> +	.vsync_start	= 2340 + 10,
> +	.vsync_end	= 2340 + 10 + 3,
> +	.vtotal		= 2340 + 10 + 3 + 8,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct nt36672a_panel_desc shenchao_lavender_panel_desc = {
> +	.display_mode = &lavender_panel_default_mode,
> +
> +	.width_mm = 67,
> +	.height_mm = 145,
> +
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +	.send_init_cmds = lavender_tulip_init_cmds,
> +	.send_deinit_cmds = lavender_tulip_deinit_cmds,
> +};
> +
> +static const struct nt36672a_panel_desc tianma_lavender_panel_desc = {
> +	.display_mode = &lavender_panel_default_mode,
> +
> +	.width_mm = 67,
> +	.height_mm = 145,
> +
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +	.send_init_cmds = lavender_tulip_init_cmds,
> +	.send_deinit_cmds = lavender_tulip_deinit_cmds,
> +};
> +
> +static const struct drm_display_mode tianmaplus_e7t_tulip_mode = {
> +	.clock		= (1080 + 100 + 28 + 120) * (2280 + 10 + 3 + 8) * 60 / 1000,
> +
> +	.hdisplay	= 1080,
> +	.hsync_start	= 1080 + 100,
> +	.hsync_end	= 1080 + 100 + 28,
> +	.htotal		= 1080 + 100 + 28 + 120,
> +
> +	.vdisplay	= 2280,
> +	.vsync_start	= 2280 + 10,
> +	.vsync_end	= 2280 + 10 + 3,
> +	.vtotal		= 2280 + 10 + 3 + 8,
> +
> +	.width_mm = 68,
> +	.height_mm = 143,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct nt36672a_panel_desc tianmaplus_e7t_tulip_panel_desc = {
> +	.display_mode = &tianmaplus_e7t_tulip_mode,
> +
> +	.width_mm = 68,
> +	.height_mm = 143,
> +
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +			MIPI_DSI_CLOCK_NON_CONTINUOUS,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.lanes = 4,
> +	/* tulip panel uses almost the same init/deinit sequences as lavender */
> +	.send_init_cmds = lavender_tulip_init_cmds,
> +	.send_deinit_cmds = lavender_tulip_deinit_cmds,
> +};
> +
>   static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
>   {
>   	struct device *dev = &pinfo->link->dev;
> @@ -465,7 +628,10 @@ static void nt36672a_panel_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id panel_nt36672a_match[] = {
> +	{ .compatible = "shenchao,fhdplus-video", .data = &shenchao_lavender_panel_desc },
>   	{ .compatible = "tianma,fhd-video", .data = &tianma_fhd_video_panel_desc },
> +	{ .compatible = "tianma,tl063fvmc43-02", .data = &tianmaplus_e7t_tulip_panel_desc },
> +	{ .compatible = "tianma,tl063fvmca01-00", .data = &tianma_lavender_panel_desc },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, panel_nt36672a_match);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
