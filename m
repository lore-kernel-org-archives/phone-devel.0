Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188533A037
	for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765878822; cv=none; b=kxGyJUHNdgKxnVmBomKRHKSuDUzxC19sS/ocI+Z78QxbmAaLKi1vA0ItCNzpVxKykqgaZFv6MEjwGIphGHyJrjIWNFgmOcD3Nw6LKNkeddGfATw9YuUXJ+TxOJBiX00x+GFDt+nRmmRa/sUnnCJI0q5YAUfcmr/MQml54ADltOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765878822; c=relaxed/simple;
	bh=MxCeYtDtWbOw9wOMfeewsIrFHMqyjFHflXJgbwZYA2s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ieBA1uEUkfXt3ufERKJvt7j4YLeYMBLlvr8H+KSG6ZdX7YQtg4rCQET0zgmmi0TwnvWQa1t26slyvXnp6YwpNruoO+HAqL0t0ydWu3hv/dQvKcaW8N8sU6y3FOirvuydn2wo8vh+ZjAg87F5hnSbF5T8NXeBGg7c16KZ0OW7RFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PfIdcP+S; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PfIdcP+S"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b91680f8so43115225e9.0
        for <phone-devel@vger.kernel.org>; Tue, 16 Dec 2025 01:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765878819; x=1766483619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B77gVNs+N24W0zy7hh7wrFHCGHcgHUUg1aqdMgvjdak=;
        b=PfIdcP+SCsL9admPXR/na4/6/69VSYyNUBByt+gkgrTOypQZtM8KB16zr/RCYIwsDg
         A0Hpv/hd5UX2rzdO6eBrMxOLCtYJSgeNDgkp2kBWPAfQiQgudVANjqYTVpaqg0AijeZM
         9mogGWvC2APAQnIad6KOY9P9kvD6eAjzB8ShMXaBn3mBPxoy0mBB+z1NYpI4Z7qu7qQp
         ZiVtueNvv0AvwLfR/rGg7ZB4KAwOxqAvHfVenn9LaID4uuKelq+X3pWRXdnZqbqZCtl3
         igoD6u2ulbyDKGbg53VlIx8oAGw09Ky8i16Tzy8kpZo5I80QPmOQ6kKz3rwy+T8D7XwL
         xHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878819; x=1766483619;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B77gVNs+N24W0zy7hh7wrFHCGHcgHUUg1aqdMgvjdak=;
        b=lcd7LIvT4gvEE3IZpx9e1crqiEcMv52vb8qBcIL0Abz7nyLc+NYsmdVAR5enFdFZwn
         rTY9H2PT8LwASAzmo+nVdqSR0kM9land3E3lCLRIzOCiCHLziC2vt/N+gVDe3C57XCrS
         q0fVV3CULzczx1aMFu10RN6fmGH6sWIwmUcAmi0C/UwoDlppkLSJV4XY+EPhcehe2xp9
         KAx3KiusIx4uduHR1X9XqZg9OQ5Pu7LV8MBjTMnFsNbxW5uQ4fr9k0EaJ5yo6mOOgf0W
         U1OySIW0por0fC2lCTVY5HqUPslGJa3IFUONwPTxAbYrtfiZPCP3R8ESKzlDbN/2qTa8
         vH+g==
X-Forwarded-Encrypted: i=1; AJvYcCXJWG1RwaS2wwr9IQ7nq+K1bJsRJQOG5pBKYCyN8dC+brAcHl2pE26tS17B4B4x/1JsCURbMYQjsiDV8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ciSjtB+tFcsG4kQcgsf/x/fIsHnGwgaWRWl+q8Qzj8POxKv1
	eHTkGrBMIIszmXeJHY/AdVyrtLNsxbeVHWMXsvHZguL2PNnxhtOviEMyvMuL69Qt+Jg=
X-Gm-Gg: AY/fxX6zedW4lDBQT/yLaD3F/JKUAdWQO42vQYBVp2WxAy5vUTLf8/QZ5A6TeJLHW2n
	QoW4uYTDNHZ1hPDd71vE/u4F1ZDfDioAPhNv+AiX2w5VfddOxZjGWcY7HXrpRd7ZMPoZ1F/NBlL
	NJv9/UoxYUn/x25jNPeQx91u6THnx1cUeMCvolAw0SNat/om+G+tmKq+/CKs0BjHwvLc36jvjRs
	qYjKHwFZtV7VVJMA0pWI5EEcvAwSuP7s6nb0PJGgJOu5z51Gam43cR21UjL5Y8ORqy/7UbXqNFB
	ENiVTnnyalttE06mr2LG/dXWoZb9wic5WSJ3PNCUmUe8N+gs2AQGRkFSPT5bmbbb7GSbMmWLdoP
	7Z4hQqgzkKV7W6NpRsFkLZvbss57Bmj4BFT9g2aAY4hd0MYiWHukMLDrVzQrNWyKUHiW4weYYtc
	cab1prtCVLG6KAQBfGfnfXmifHl9mcoPtbI9twPUwW9pwPH10qD0TABnSJsT/CGOk=
X-Google-Smtp-Source: AGHT+IHhh7eNAvL73sUX53//v2jQskR2Q8o/cn9pMbSxXR/ZXz2pFzXlk7MoGVqsyxZ2xGWvQxnFEQ==
X-Received: by 2002:a05:600c:1ca0:b0:477:9b35:3e36 with SMTP id 5b1f17b1804b1-47a8f89be82mr154636105e9.2.1765878818536;
        Tue, 16 Dec 2025 01:53:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2? ([2a01:e0a:3d9:2080:2913:9c11:b7b9:c6d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm13657861f8f.21.2025.12.16.01.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 01:53:38 -0800 (PST)
Message-ID: <6c04c58e-339b-4b5c-a2b4-8a9509612335@linaro.org>
Date: Tue, 16 Dec 2025 10:53:37 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 4/8] drm/panel: sw43408: Separate reset sequence into
 own function
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Petr Hodina <phodina@protonmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
 <20251214-pixel-3-v7-4-b1c0cf6f224d@ixit.cz>
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
In-Reply-To: <20251214-pixel-3-v7-4-b1c0cf6f224d@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/14/25 15:51, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Splitting reset() from prepare() follows clean coding practices and lets
> us potentially make reset optional in the future for flicker-less
> takeover from a bootloader or framebuffer driver where the panel is
> already configured.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index dcca7873acf8e..ed9c7452ea846 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -119,6 +119,16 @@ static int sw43408_program(struct drm_panel *panel)
>   	return ctx.accum_err;
>   }
>   
> +static void sw43408_reset(struct sw43408_panel *ctx)
> +{
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +}
> +
>   static int sw43408_prepare(struct drm_panel *panel)
>   {
>   	struct sw43408_panel *ctx = to_panel_info(panel);
> @@ -130,12 +140,7 @@ static int sw43408_prepare(struct drm_panel *panel)
>   
>   	usleep_range(5000, 6000);
>   
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -	usleep_range(9000, 10000);
> -	gpiod_set_value(ctx->reset_gpio, 1);
> -	usleep_range(1000, 2000);
> -	gpiod_set_value(ctx->reset_gpio, 0);
> -	usleep_range(9000, 10000);
> +	sw43408_reset(ctx);
>   
>   	ret = sw43408_program(panel);
>   	if (ret)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
