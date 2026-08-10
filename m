Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A3C3B19B0
	for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355263; cv=none; b=A/AmxYoxDx4Z1inMlDx0qc/WG4ddCgRdrzzoa7H7BODUhpCLZoMldtO/yoY/MPKfShd6HHd7grsuUjGf3O4F0y32Z6q6PuWusvALIo7T2DwGvuC5F5Fbo//q2OZ85v2nSJiCTpRG6NzrzrK6zaezvuM/37t7JhBBQnpi8cRUmI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355263; c=relaxed/simple;
	bh=Uzn++09x588t5AvJ32IbY/pJqXbwS8LGFKhCxgn9/bA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ST9ZwELDfpTqkoC6ezLFc4u8ShcxH/6bwhFYsN8Oy2WFZEAB6U+2XQV2pcBjF1XDxHm8X+q0+lNzRpeaEL1pO49e2ux+mbfxfvrg06wgvzKDHxY5AgzyHJCQndOuB5D9wVdFgg69KTLFjM4LDuYIc9nSmFEhZ8+QCNXrIGzLNGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHHuZ6Vk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHHuZ6Vk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1472743f8f.0
        for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786355260; x=1786960060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7w13xP3LHLGowpJR2oLZQ9ZrIgfjH4D3SSrR2hJhZ2U=;
        b=CHHuZ6Vk15k4uTs3MXKzAf1cxhL+mnT8n8pLVJZ3OI6wNci/QLzsiyBI5BRjkAOsHA
         I0tFgOPtk42vimGSX9NVQZKER0j36avWDi/7TEjgJiJ5sHATRvpXckJoWKzx6KigfKY4
         ss5z9hmxSjrVGkp8S6Snu6Ze7L4r9YOCaZu/wn3KUVdtcyBCXjApZcsAMf85VBL+YpGd
         C/KUPuiDQa6UYTIbDSM07fjN4xgEyJRHrvaozRx6aD4mFifmxIDd4fba1ckSttW5gVdM
         eyx4cyPB63TJy9qVXJvFqx9sahU2jqDpOPjdqpkAw0PUd9QxHrHCesTgIi/in1R2dIEE
         wmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355260; x=1786960060;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7w13xP3LHLGowpJR2oLZQ9ZrIgfjH4D3SSrR2hJhZ2U=;
        b=I+z+zf5rIFCdDvVv09tpVZF1UnQm38lKr1sfj+x801uJxf/hym0i3IGIlMYpGDORJE
         AvSN+gDBzdSj+6pjswxDjYvM/Me4+iopW5bpoI6L1aAl7eN1gqz+dltdkQMkFIdlWS/9
         CVzycwDYjIq1MNhaX6HPr6b+qmqDQEn/PO7KDDWtIdTek13hQn71NtlEftays669orhz
         q+fC2WfXSxUVwgcAxCI3yvJscJSyrHCzHy2LtoGjAnGxqWkEmEPDRSBXoQwJKffZnNIv
         NJfXL6JWVkzWwZefAVy206d2QJuK0oDJJy4GgN+PWAA1dDMYZjpr/gPk5fZXKFYV7psg
         KdxQ==
X-Forwarded-Encrypted: i=1; AHgh+RorFFmKAlHZUbSYwICCTHzB+pYvupUvBLGdnydwmdlmxhH96MRHNdizQBdvlsyYJFK5Ok8vrpZH1IEgNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfBLfo265GijZjB2C9xhd42Msnm4lHSpTSsT7QRuaTQgr1cxub
	6IPY7OMlfYIdS20xBc2Pg0R4GVAIZvf5RQ0hOTcAQQAOQhY/2rqYtjXp70Z/vFkqPas=
X-Gm-Gg: AR+sD135g0g2aAv5MMn52ryjaveTj58NJOzvIDdF4AvP2EVaoznaKZQwkUmaAwsvEey
	FvPbX2YLCP69wzyn0uiasjTQPpCwBKVjxL92jQNDpk+JtKYhAxQgQ5KLcW0c3cPU3JHbbHFv5v8
	s9Um9dAfQuirZw8OVdF3fbIwEpe1EMV7t1M7YIk00mkWchk3jv2zS2LMaOsqF7umTeeTTOToxH7
	MzA76x+Qw1s2NIq8k017e0VXQFuKDy0K7oSNxzIfcSNI+h6T3Wc3vsDRS97RhI7uP4jWZDxNhr/
	vEFy0hFqxVTrOMiCzJmA8OUGQRKuyXwXZEh6lAjoO3xUdH//x21FacZhvaWH8I2HUi2ULRxlUU8
	GCS6OXKb0anUQw7ejQC8oblDKgYoDka7PDyu0fLfgsVrqenoQCmhcYnCH6X5NqYIlxLqxogkKvx
	TUxbZBlhRtO5vi8W/HLg4Jw5eCONtm4FsFbvxxkwpSPnK5A3Jh1XLb/QRBCO6qWwtdK+hoNPebV
	Z3cWZgodyBUWEwSAH9eIb/ZGUFj5JJANi64lFQ2M+c=
X-Received: by 2002:a5d:5391:0:b0:47f:6efd:8421 with SMTP id ffacd0b85a97d-48130eb2dbfmr20125555f8f.13.1786355259953;
        Mon, 10 Aug 2026 02:47:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32? ([2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800214557esm31221551f8f.2.2026.08.10.02.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:47:39 -0700 (PDT)
Message-ID: <71ce47be-8077-4829-805c-953a65f1dc54@linaro.org>
Date: Mon, 10 Aug 2026 11:47:38 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: lg-sw43408: use the full DCS brightness
 range
To: david@ixit.cz, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260809-fix-blueline-panel-v1-0-e7f3a6beb1fa@ixit.cz>
 <20260809-fix-blueline-panel-v1-2-e7f3a6beb1fa@ixit.cz>
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
In-Reply-To: <20260809-fix-blueline-panel-v1-2-e7f3a6beb1fa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/26 02:04, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vendor firmware panel configuration (XBL DisplayDxe panel XML)
> declares DCSMaxBrightness 0x332 with a two-byte brightness command,
> and the driver already sends two bytes via
> mipi_dsi_dcs_set_display_brightness_large().
> 
> Capping max_brightness at 255 therefore limits the panel to ~31% of
> its real brightness range. Use the firmware maximum.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 0bf8e08f10b9c..332b15b6a4c94 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -202,18 +202,18 @@ static const struct backlight_ops sw43408_backlight_ops = {
>   	.update_status = sw43408_backlight_update_status,
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
>   	struct device *dev = &ctx->link->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
> -		.brightness = 255,
> -		.max_brightness = 255,
> +		.brightness = 256,
> +		.max_brightness = 818,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
>   							     ctx->link,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
