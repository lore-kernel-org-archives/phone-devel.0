Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BFD275B06
	for <phone-devel@vger.kernel.org>; Mon,  1 Sep 2025 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729493; cv=none; b=itMcA5HIO6wPp6ymCgF9M6OD7cvv91sV5GtZMlqzY8XRNzIW9LG1HA/ZoofRa0qpM8dW4W5At6gL1OLmmXW84mSeUCpMm1o8xLGv3C4iWoW4kfni1bGL3dHq5yNVhqa7RWhd/ydqSM18j1owxpcBAhTU9KFrJialZNicA5bA20Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729493; c=relaxed/simple;
	bh=CHed+8mf5mb6CcPy6iQ6I5+S37yuiId+EUusY95s8wA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=NrDZOXFQV9LPg6DtY3qRFHR45BF1waW52bbvL/HoPfURFXDDbiMRz0koGJrlFFxvA9SZt3ZdRyF2+o68SeGuMNWq5m9FR0H3rHOWNQa/OcSNIgHktGX5zvin3XAW6vUGTPjj2j9d1OHxonDTQhjdRCkgWsEmLKB/o8Xgq6+/yGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGgwKPRj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGgwKPRj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3d0b6008a8bso1412667f8f.0
        for <phone-devel@vger.kernel.org>; Mon, 01 Sep 2025 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729490; x=1757334290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfkhISYvBMEAQlL6pZ3jPBacsMMEIifm78tAx7TD2ao=;
        b=RGgwKPRjuuaIfLAWjhBiRpl1+5VkOXM+ORmiVLixIJVWjyUy/7rpxDwRPTfPGTqzQ9
         evtyex46eCZYPZsppknUY5LCsjqnAz+a/NO3K87aUyk7fvbRla736BIccJIo3uAg2DkX
         mWsxFyN9gh+0sqU4FhEQGCaQy1Sb993m/X3xq7zIfKN6jg2iVXh5Chs6Ri3eSAbpRsuT
         usRu/UnjB2XuC5SX/6DvCQqjyn34NNG3eo73ViSEkWYHhJV5uR1NESYd9yrzNCddnSQb
         /0iACXMdx0lEidGhYUI0LoFveMVfm7yDqrals/Gk3mYOmrGRPnFWyWKuoBLAu0epMWJ6
         brUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729490; x=1757334290;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MfkhISYvBMEAQlL6pZ3jPBacsMMEIifm78tAx7TD2ao=;
        b=cQXaXDqBjxD5kVT28Bqz2TOycHNuwOS4BQCecSXCIGRVKMfYyt4ymXGa31w9zc6Yoi
         7wterKp1dzO+hl8e+PddS91TOZCk0bAjYigibK9LMRMr6ICIaCeDFEYz/O0cnu0TWK7I
         yTC+L8XJj85c+N8AAw+l2FnXBHtokUipEdGCj3yUAQIQ5alXPdAE/HDe3UGbSprC5G+6
         WfM9bmTbtRshMLR4nc1Y+YuUOTzLc9elokj+KLjNHIYUJrtIEmkjYPhqlq+sReC25m1x
         gYYkGv7c93IQkKQwhNd2UsU2f7YOzRye8CaRRbk2sB47ONlo9sEVKwqH32vkfV7F3oqn
         gFGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj4qLbI4crqbgxiKx+Lc0j38TtRbgogMAz2cnu2rgy20oKP1333XEMJ8HCTuq870fWP9t1z/k1V8xD4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YymL7dcpOojpMS8ZbphHH/xDVZqUTT3SN7tnYlp7dAX9pios2Ak
	Vut4JtyUseBT9x8scxQzT4fquVNVAhFnE89Ew2g9xmoXuAP0//wLrkE1Dr0XPidEvBo=
X-Gm-Gg: ASbGnct43gj9Ny297EJ2yaNpWyKww2MhAD+TWw9/YNoSN+zrphAATqRS89DnbCYE06e
	0rpH2UwObO7SrZH0N9DtUZjTyBncdx7xWHK+6w0cXWSvQKlKs3gvg1lsE+ilKnxSXSXQZJJktVu
	/+ac4gtnfH5x+eSaaKEl80KwifbHjmFAS7uXDSdNpZLN3iHd1XySA79vt1Ly5WE9Kb8hcY69P47
	OH61V8xXkpYZzejffly3emGrCKOPyLJdc+VgLrU07AnqPsx4qTXAfvsaKRJEut33jzS7iCkGw3X
	sEVLna07MYn8DnA2WakBPk5qXd2qL8nT2H2zAYoSf/kLgrpqdybMNfgs2S9mAGMIiLjG0SshoOm
	7AtICu3voRGlbm4jPgI4Z0kYMlKh6akfdgXQFDos9JRUq7x+GBtTxi+gp4MCl7PJvUJAWQuzQcw
	KCz76cSE8=
X-Google-Smtp-Source: AGHT+IFGT8W3UAxgtuIxzCjUXqI2nE78D/VdHvOwHMOvAuiM4y3wWCDkvebLIQeC9Id+0fTq3AN6+Q==
X-Received: by 2002:a5d:5888:0:b0:3ce:46d8:5e11 with SMTP id ffacd0b85a97d-3d1dfa19456mr6338946f8f.34.1756729489776;
        Mon, 01 Sep 2025 05:24:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a? ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm9738932f8f.40.2025.09.01.05.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:24:49 -0700 (PDT)
Message-ID: <e92049c6-1d90-482f-ad4f-0c88bb96989e@linaro.org>
Date: Mon, 1 Sep 2025 14:24:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Fix clock frequency for
 SHIFT6mq
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Casey Connolly <casey.connolly@linaro.org>, phone-devel@vger.kernel.org
References: <e975da213c1f8030db50d66ec1c9597f59f25e35.1756567474.git.agx@sigxcpu.org>
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
In-Reply-To: <e975da213c1f8030db50d66ec1c9597f59f25e35.1756567474.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/08/2025 17:29, Guido Günther wrote:
> Make the clock frequency match what the sdm845 downstream kernel
> uses. Otherwise we're seeing timeouts like
> 
> ```
> msm_dsi ae94000.dsi: [drm:dsi_cmds2buf_tx] *ERROR* wait for video done timed out
> dsi_cmds2buf_tx: cmd dma tx failed, type=0x5, data0=0x28, len=4, ret=-110
> panel-visionox-rm69299 ae94000.dsi.0: sending DCS SET_DISPLAY_OFF failed: -110
> ```
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index 909c280eab1fb..e65697ce6f51c 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
>   };
>   
>   static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> -	.clock = 158695,
> +	.clock = 149360,
>   	.hdisplay = 1080,
>   	.hsync_start = 1080 + 26,
>   	.hsync_end = 1080 + 26 + 2,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
