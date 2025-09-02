Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FF3D987
	for <phone-devel@vger.kernel.org>; Tue,  2 Sep 2025 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756798410; cv=none; b=kspr/sru8YozssPmq9JgWFZ250jtLVYnNSuHUU3th68+UT/HFV6AXxQqzTbYsLBquktiLu0L3MOiV7mhtiVmYHGhwq7moIVs+bNZk1ZGZs6q1JWgYcdP8KRchp7yqIlzv2Ld9N4kN+4SG98kOY/Q0sLhO6ih0aRdwpr6bHlDdP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756798410; c=relaxed/simple;
	bh=D4V+odKYeGr6EvtL8HDmeKNp13epht8jRQKStbKvYR8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i0atk60JBdyYeWCPaRxGAWsjU+rqePCHTJe7bI5w473x0/4dDlb8LhLfnqSndPOX8pym4QrWAVrzguo0hRfJFeb6uNhVxKGPljvYTWmU103JPbduTLWB0kkSv49xZ+fKkANSEPhw6xWEwVmeqzdgdDWukjAvozO7oB1mDcl1qfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tmx1MBDU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tmx1MBDU"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3d17f24d42fso2073779f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 02 Sep 2025 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756798407; x=1757403207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzGEH5SzoJb0QREXsJ+codvGvPzyIv09C4e6DjWnFbs=;
        b=Tmx1MBDUYh/Ox+qMe+U76L3e6cRvGRNpqPbI+OjhtUwGeJSw2roBVrDtB8mQhhL5Ip
         1JGxcckCKjt635WMR0UxHfyGow5nQJ3PyaLdUGJFFEn7tHvGSldfhyaKJoozuG65O8jG
         rLTshLi4J1GUfB0O3pPeD9Wxe7/suzYUpIM0UrFK+xx9LjSmgHpJcMNtuumpVezKzeoo
         7my0eI5Hss41b258IcA5J9O/0ubo9Q5jWhhuFmL/mRRKiFBh2crIXEUXnCdq29ZI3XG+
         /pBwxKstrg6Ga1RUU4lDCmstq+uf2NGgeGrnPuEo8d5yuFk4UCynco9WibMGIun5wRi+
         2dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756798407; x=1757403207;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zzGEH5SzoJb0QREXsJ+codvGvPzyIv09C4e6DjWnFbs=;
        b=rUT5Aq1U0t1fNs0KdJ5HUL4OKrYnHlppuJXXj3vcldFxTW1bRRNtkU5YqR2ZJi6BSC
         RAirZXIdaIQV2bP+uhxTQ3jHgpd68SeyrPH4T6XOYFI2up3JsFfJ7a2ZDU2//ujTW5Ee
         9i+/No6Cy4WB4cf4hHmVTSOYGlIse4CUiM2tomRJ9dWX8eqlisXRHcPa1Ipp4GPStuxT
         q2OngqaY4toU62MqydvcVXaUOyW01TVXaogDnP1VlkDUln8RIS5THsljdz+hTmhvjyJd
         4fg1OH5lukJ3JgdVsVDLs5Y/I5DNENz8y0L8nI1gNnoi82omOzC6fw0lRMFV5qKYh9nM
         IScA==
X-Forwarded-Encrypted: i=1; AJvYcCV7XDvaNZhWaRCKQMob7krVyXHnM3Ajl1O53pIt3l1/SWS/6Z6837GcBpk0hMIy+sDfxrQPGIJqTCdjQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypKUiLtulZgVBCXOHJFLHCwgNgfnLbliG0rfuBS/XVlqWTwiHV
	5Fq6scEMpp0cSCKptS8VgnRqqCyjWKHKN9ivzzoVy4Qrf0QqyDIy9nTOZ8cyIa6x7CM=
X-Gm-Gg: ASbGncv/kVIvVYMN1+cUmnjEKtakMZ49DP6uCXBD+QlKpTmZiFVI3SjCsb9pP9WgQEF
	3DmLFQB5iDg++DPUBwHE2OoCgrycvfZLXkAxl0Fj0muFahf4tx/AQg9S/LGVELPxmAgfKn6Ajol
	y463+6xQZ6qglKf1wWh47n5+y1Xle3N3WiwfzoCEI8TqmcP9GXFSjpuz/p+P05rNb4PGbmkV0vL
	8XN1SpZYeDfxWXGz7UykeBFw4Vba9Y549PSnVhlnzNF/dtxNMwjq6hmRX7bw2MiRqdYQTlXiCQo
	LcLEqnC/mrAYj9vUJkPNk0vyRO/6XxLDLheSDdD+haibx5AaYHelm7ZD6wQwmebivDmi0ozht6r
	GpI9r9x53KuzjZS90LenzONkZ1UaQJm2n7zESmV4G+wyykQdUNK9mQ4cILXnhkZ+p4TvIVc8MJM
	rOy48vABt2vA==
X-Google-Smtp-Source: AGHT+IFE/+Dwxh2SBZShvvP5BRxfoJkpvnPruwR5LDCLB7pxR9NVHiJHNxUuG89GACIWOjRNGeP2PA==
X-Received: by 2002:a05:6000:430a:b0:3d7:4e2d:1e41 with SMTP id ffacd0b85a97d-3d74e2d22efmr3577647f8f.40.1756798406910;
        Tue, 02 Sep 2025 00:33:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939? ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34491a7fsm18044897f8f.57.2025.09.02.00.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 00:33:26 -0700 (PDT)
Message-ID: <3c8571cc-ab41-4231-9950-45d3e207927e@linaro.org>
Date: Tue, 2 Sep 2025 09:33:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: visionox-rm69299: Don't clear all mode
 flags
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org>
 <20250901-shift6mq-panel-v1-2-444b4abbfaea@sigxcpu.org>
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
In-Reply-To: <20250901-shift6mq-panel-v1-2-444b4abbfaea@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/09/2025 16:22, Guido Günther wrote:
> Don't clear all mode flags. We only want to maek sure we use HS mode
> during unprepare.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index e65697ce6f51c7d64b786da18cf44b16de5d6919..2216d38366ea37368d15480f9d8a8ccbfe77ba3b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -192,7 +192,7 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
> -	ctx->dsi->mode_flags = 0;
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
