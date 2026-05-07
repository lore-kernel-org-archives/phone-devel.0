Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510B2877DE
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137913; cv=none; b=XG1cdceujoi2kvB5KVifqH7I5Hd8Ge+nJQGDdrLfweUMY31RG8azsbIZa/KKQWuO7fZ7AJrnjixg+N03IFIyJkWgKo53x5vQWO4H0TbMIZD6gGmsUiA005t3It1ZYz3m0oZQMrfDZq+wRh+KXN/Sc0JvevnMFGE4eaPmqnMnjVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137913; c=relaxed/simple;
	bh=A4sxlXdJ5VpsjfAq/q2qS53fkOxEwNUruwMMAmLro40=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FS+9twpEgf6U5snq8YanPFg7RuEci6AtC+RoCc61QqInEKk/veRL6Wi9u8dmDXE5zSQ3R4WCoV41skc/KHEL4j+g/3Y8+8doaX12D4NH82O6P3XrhD5rpytayZymjJ3fnYjfAt3dA8XHfNWhwXud7hTFV5t9TKSI9ZihQJJNziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xppp/trV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xppp/trV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so357730f8f.1
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778137910; x=1778742710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGYzjuf3R/p5pJNr3Enknt/6f+NCeQFDRQlWU1+0ACg=;
        b=Xppp/trVdcyLaKS24GN+KtoCVLQd+XvV9rIMsu5SMsA2p1bC3JJldBCZ+0+itRGif4
         mxey4yVvqwUdwOX0iVLtwap17F6UhfyUpKM1NomNFd+aXSMMPdTCB33tOWNysKGr+HnY
         UDjNsy9ApmKeI+twrN4NM8PDLW31Z/WFryriyRw+cmA0/nxQooxu8eH+f3L6nOVC29xS
         INTe+UxnWVvTzXqNXCSbbL+Bv0zpHfn8nGRg3F9AbH5FlorPCBPxO7Gg8rVlFC20gVus
         p1Po9Aq11h9MG7ng0TY2Yu3BZzrudfMsNltrlO5uem8nlfavq0vvILvfOsne6utnsB/o
         oXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137910; x=1778742710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGYzjuf3R/p5pJNr3Enknt/6f+NCeQFDRQlWU1+0ACg=;
        b=NxTGb4wcfMimtBDJ394QOrTscj23w4LzYmAfwOI91Qz6B+0YgciE8KaCY7idBeuy5+
         9bFp616qXNXHGP3Z3mH7sFt9PaNsCJKQlvEkkpKUAzIFn4RHJbBPZH4oNwEra2oOlm7c
         TFEOtlOuAxEKxBcpSU7kFDOgRdLOxYc1J8AzcBNyErUzsdbChQAnmb/KKtdyvArjd0rz
         6M3U07Cs8Zy5hi83w0wt/JTibqDMfUorzMxl5yeGkKdL7s+doibYAm7+3cbUJSkU3pKw
         T0st2jVMj/hZMM7f7H046j2fqPI+lzW51Zinmg9RD62oY0CSC4kq27utrfrEPiaCgPq9
         arLw==
X-Forwarded-Encrypted: i=1; AFNElJ+DXfFF4cw+JkZ5v7D6t1mBRLiolb0qxxchsPN7xwL7auVpZV9Yat/URDclg5EuQTe44iPZTaXEp/PSIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkSV4dhMmLoGEbWzG1o5qbprPKdKlBa/PWAaDwVGzPLmmYZcg
	2Z0fbWCsw2bh4QQOCWQ5nQ5kIqgC1WMA8Y1NmojJYbLFdxxf1xMm4cdnmAEyf3Kh8Bo=
X-Gm-Gg: AeBDietNhSgtnwYdkw2A8qigqmlJgxB0ZBbBAGUR9crhMTYW0ecnaSDZ5ge50iuXxEA
	iqo/cZrHa4pQ3DGhpszGTBO35S4Amm5SAMzL0Gl/OtBIVbMY+YjuFJ0WPS+c14yuh5q5KEkAxTR
	1hFWFz6EJLgvBxHP41p9k1rEuC6uPtRqE0othpQ34xOHNsFmyh2uYdE28+V91vrTJIH9iTlKSEg
	glEYYToUJaVrMOtS/3AzAXy69UqAN8H3ql3RcIyQAAwKUv2J1a91jaffSchH/9hQLUYmKIxNbhq
	m3IsmZ4bYVq6tILxqQQj+WzWPWPyWAnUBPvg6cw0f8pPG0uIhWpKM14IOWWcCK9SgQ5u1nnGqcD
	M+icJLc976ufClRcsNMEJhddFRrnZIOJ1dQWpp3cdpCCPVisJ2SiuKNI77HnZwU34+6TFLGy9ZT
	WPwXKuKZkbJoB0WBmjLve7h5mQ3WLX4WuLVStt58sA/yyivty/y1dINOQN1S7j4whFDm6//Nphz
	s6EoaCSa2O+aEmj3w==
X-Received: by 2002:a5d:5d87:0:b0:43d:d037:d59c with SMTP id ffacd0b85a97d-4515b524224mr10977840f8f.16.1778137909805;
        Thu, 07 May 2026 00:11:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524834eesm17521496f8f.4.2026.05.07.00.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:11:49 -0700 (PDT)
Message-ID: <d3f99285-1811-45f7-91be-5017438c2475@linaro.org>
Date: Thu, 7 May 2026 09:11:47 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: visionox-rm69299: Split DSI commands out
 into enable/disable
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260427-visionox-rm69299-enable-v1-0-fa7d62d26d87@sigxcpu.org>
 <20260427-visionox-rm69299-enable-v1-1-fa7d62d26d87@sigxcpu.org>
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
In-Reply-To: <20260427-visionox-rm69299-enable-v1-1-fa7d62d26d87@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/27/26 15:56, Guido Günther wrote:
> It's when DSI commands should be sent and it also fixes these DSI errors
> on every screen blank/unblank on the SHIFT6mq:
> 
> dmesg:
>    msm_dsi ae94000.dsi: [drm:dsi_cmds2buf_tx] *ERROR* wait for video done timed out
>    dsi_cmds2buf_tx: cmd dma tx failed, type=0x5, data0=0x28, len=4, ret=-110
>    panel-visionox-rm69299 ae94000.dsi.0: sending DCS SET_DISPLAY_OFF failed: -110

This error is un unprepare, the link should be in LP11 so the command should still work,
but you can move them to disable(), but in the other way you should still keep the
power on commands in prepare() since the link is in LP11 and video is not flowing.

Neil

> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 77 +++++++++++++++-----------
>   1 file changed, 44 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index f1430370ff94..3c92a6ceb8df 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -158,6 +158,46 @@ static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
>   	return container_of(panel, struct visionox_rm69299, panel);
>   }
>   
> +static int visionox_rm69299_enable(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	for (int i = 0; i < ctx->desc->init_seq_len; i++)
> +		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, &ctx->desc->init_seq[i * 2], 2);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +
> +	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +
> +	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int visionox_rm69299_disable(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +
> +	/* 120ms delay required here as per DCS spec */
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
>   static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
>   {
>   	int ret;
> @@ -193,16 +233,6 @@ static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
>   static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> -
> -	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -
> -	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> -
> -	/* 120ms delay required here as per DCS spec */
> -	mipi_dsi_msleep(&dsi_ctx, 120);
> -
> -	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
>   	return visionox_rm69299_power_off(ctx);
>   }
> @@ -210,29 +240,8 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   static int visionox_rm69299_prepare(struct drm_panel *panel)
>   {
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> -	int ret, i;
>   
> -	ret = visionox_rm69299_power_on(ctx);
> -	if (ret < 0)
> -		return ret;
> -
> -	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> -
> -	for (i = 0; i < ctx->desc->init_seq_len; i++)
> -		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, &ctx->desc->init_seq[i * 2], 2);
> -
> -	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> -
> -	/* Per DSI spec wait 120ms after sending exit sleep DCS command */
> -	mipi_dsi_msleep(&dsi_ctx, 120);
> -
> -	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> -
> -	/* Per DSI spec wait 120ms after sending set_display_on DCS command */
> -	mipi_dsi_msleep(&dsi_ctx, 120);
> -
> -	return dsi_ctx.accum_err;
> +	return visionox_rm69299_power_on(ctx);
>   }
>   
>   static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
> @@ -284,7 +293,9 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
>   
>   static const struct drm_panel_funcs visionox_rm69299_drm_funcs = {
>   	.unprepare = visionox_rm69299_unprepare,
> -	.prepare = visionox_rm69299_prepare,
> +	.disable   = visionox_rm69299_disable,
> +	.prepare   = visionox_rm69299_prepare,
> +	.enable	   = visionox_rm69299_enable,
>   	.get_modes = visionox_rm69299_get_modes,
>   };
>   
> 

