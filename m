Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C5231ED83
	for <phone-devel@vger.kernel.org>; Thu,  7 May 2026 07:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137968; cv=none; b=na85A/Ed52N5GYZHQ0wpetjVhoLYuO8LvDBZBNwicrwDKuosjAQNU04jhKn9OHPJx8/QhlsSbHqPUBy1kvM21EXuE08u+NiXF9PYEk8z7Ph6gxnfWW9cPaEpgfqwyEgZ7hZZfAFDmwkAQxroCDEYSopnf9X245xnxwFMU6YMNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137968; c=relaxed/simple;
	bh=aoxoRwdupPVjinyBEJT3CZV0vycwYHpVtIKdHcBikFM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=d8y569l9kD74eIy+Efh6n82rwTXBTxH5Qb3bMJwpdymEXi7tuGs6TI1kJILUyHtOhxXKOqH+48xlwljU21H4dGWJKCpH/DSWqNn9bltddA1kZb2OxbzamTdXchhVf1wN5vHnKSGBdS7ZVdzSNVXSuTsbqxrs6FpAycEo10SbwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SbkbsyB7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbkbsyB7"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so10390295e9.0
        for <phone-devel@vger.kernel.org>; Thu, 07 May 2026 00:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778137965; x=1778742765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxn+gzXZryt3B/YHtHg/ku/ujylgebVtdoLvLxBx7Y8=;
        b=SbkbsyB7OhQdxplPLcdaNC5RKNI0mRt9rbvemRlFGRpDE1CBzyqtjwGrpi1UKZTSVE
         sq2f1H/1K9kUpKdpDtUPPCgUzGFIkmovHygeOPks3nme4DR772gR4thn88XdJbaPtuUa
         wQJq3Kt75Y5a50kr4b6+ibCbVWJJCw2JUhmti5XE8R/Ao5PJ1QrApthYnXLCJn1PXf6Y
         BLDroYAXy+q7SsPmE31GCeT7Q8uANM5w1bDWeTJZc4bMD1yRXqL/dTVHNczSBLmswqzv
         uOZHFhNCtAAuuskMrivBHI+27n54WzPRevFzllEJQ77Czp5KolaWei1AzKsZqnJzNuaL
         0Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137965; x=1778742765;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxn+gzXZryt3B/YHtHg/ku/ujylgebVtdoLvLxBx7Y8=;
        b=YfMKiD052rO8hfzbXm5WBpMXygkSam+HrdsMqOc4ngcTK0yP/4aEsofmoTfKz9YcU7
         Tx0ZI8fY4AQHGsP7lNtMkvffOYP3ELGWJoKTNcvg7iUA2WyOdee8PvJ9K0mm6Oj6KtfU
         nA0x29R+JOHvQoxao5Axn6YSRQ/o7DjO5WujafXWOzdo+upneNLtDYGfBZ6yFVC3+k6C
         nXXsvmEzx+ti/XVqATGIv3jEyVLLGiqfyDqtgeETl6qT6klnOF71ferMusey4THZLKDH
         CBRau5M3xabGeannnT/tmmldynrhvhsGhMu0hdfRGAiMw0AXwdBrfF9+BUn5JCLLc3/x
         +hRw==
X-Forwarded-Encrypted: i=1; AFNElJ/GinaNzeV7+iGBADd2MlcpdlcjOvkwQxsq22303n/Eb24ssQd5+Y9DTpt3wFLRz+4ZwUs6gwB7AZkVwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy72t1rJMd/UfrbbTu1BmM9fFq3O30oMpYU2QbNV6m3kRjH0ymx
	rDatcU6xJtcauTaX587M5HAYIGxuTv1rtnUBvliIfe2UPkmnt/w3PMc2ruaXElcD4RY=
X-Gm-Gg: AeBDietVt5W7Mwz4TIwAvkAofYijv9MdiE0c3gBvShLe7HI6Ez5dw8hCgvrN/J+RCYu
	oNugs2VeW5bqUbc7v2uszWXsnAW+WbN50UnXwPprh/v0Mi/fAuaflkz/tP+HGyenP3GLaeVs9EI
	X6jaHcGbbs4hcw3e+U+Rjf2iLCkNgoY/tljk8tdkflo5+o+VFeNCylXqYIJfr7v9O4IYHkKvPW6
	js4POeGTEpL7FLpIz9sKYIU0hpQguYidCPIwcTAftDHd8iyQ6QTV6YAljA05AKFLJnBPI0xiCOM
	xlMJFNGGCVCgaAmx/AkrhTtKhds6H3j1DOT8YBpiHzKtgqCvAfpbDzh/WJSOXCsv/T15cuI4sI4
	yuG1QdYRO9Fr2PG7kIwlmD6iUqwoOICZ5VqV4pSho+6n7nnhs1bL4hWR0gNmWWiDn/wPk4YvUQ/
	lFgC8lblmZaUNcle86W0R86Tqct052ID+Yg4VC8Quj9otkKUYGNfYlIe7xQABv5itTbJjZaemxY
	PUgoSuiWPdRPYhGWA==
X-Received: by 2002:a05:600c:c0d8:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48e5e000c1cmr17768625e9.12.1778137965257;
        Thu, 07 May 2026 00:12:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5389da63sm103677125e9.4.2026.05.07.00.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 00:12:44 -0700 (PDT)
Message-ID: <fb94f291-3831-417a-a924-e355cae27d89@linaro.org>
Date: Thu, 7 May 2026 09:12:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: visionox-rm69299: Move power_on/off into
 prepare/unprepare
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260427-visionox-rm69299-enable-v1-0-fa7d62d26d87@sigxcpu.org>
 <20260427-visionox-rm69299-enable-v1-2-fa7d62d26d87@sigxcpu.org>
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
In-Reply-To: <20260427-visionox-rm69299-enable-v1-2-fa7d62d26d87@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/27/26 15:56, Guido Günther wrote:
> No need to have separate functions now that prepare/unprepare only
> handle powering on & off.

Following my comment on patch 1, just move the unprepare() one, keep the
power on in prepare().

Neil

> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 36 +++++++++-----------------
>   1 file changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 3c92a6ceb8df..5c869d353368 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -198,15 +198,25 @@ static int visionox_rm69299_disable(struct drm_panel *panel)
>   	return dsi_ctx.accum_err;
>   }
>   
> -static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
> +static int visionox_rm69299_unprepare(struct drm_panel *panel)
> +{
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> +
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +
> +	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
> +				      ctx->supplies);
> +}
> +
> +static int visionox_rm69299_prepare(struct drm_panel *panel)
>   {
>   	int ret;
> +	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(visionox_rm69299_supplies),
>   				    ctx->supplies);
>   	if (ret < 0)
>   		return ret;
> -
>   	/*
>   	 * Reset sequence of visionox panel requires the panel to be
>   	 * out of reset for 10ms, followed by being held in reset
> @@ -222,28 +232,6 @@ static int visionox_rm69299_power_on(struct visionox_rm69299 *ctx)
>   	return 0;
>   }
>   
> -static int visionox_rm69299_power_off(struct visionox_rm69299 *ctx)
> -{
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -
> -	return regulator_bulk_disable(ARRAY_SIZE(visionox_rm69299_supplies),
> -				      ctx->supplies);
> -}
> -
> -static int visionox_rm69299_unprepare(struct drm_panel *panel)
> -{
> -	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -
> -	return visionox_rm69299_power_off(ctx);
> -}
> -
> -static int visionox_rm69299_prepare(struct drm_panel *panel)
> -{
> -	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
> -
> -	return visionox_rm69299_power_on(ctx);
> -}
> -
>   static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>   	.name = "1080x2248",
>   	.clock = 158695,
> 

