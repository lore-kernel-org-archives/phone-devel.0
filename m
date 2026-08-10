Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D9175A72
	for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355985; cv=none; b=tGcmuXQV6bforP8Wh6HJ33ANXYpyeg8jAp2L1gS2CLugB1szUvTtMU/+D67UG6+sQakpsXyAIX5N2vAIRP5j7qPO1OaB4mvYCRjJGLqGmTvXuYXb7bW3O3gr+BkBqBuucjFKsOSgUqLkrW+o+JzoB5JtcntPS/lUI5BECb9FL4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355985; c=relaxed/simple;
	bh=u8FdWAUeU5h088oxNOPDdb4HSzXw+Iyy90zLT90BtcI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LGq47/+Bp3VqdBSl+hK4ICEjNU4+RdjzggJF1rFLVJzuZ+NJc5ouTu4n6SrlwZbkaJB+xcpTY0wtHun9MGAkZVAeyeiQlXHJOv/HfiwRjWazDpEfzR9nAC7SbY8KG0JE3Hbw2L/+GxUL1FHRXN2M+aSmcJ82RQRYpLruNliUvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzG1zOCY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzG1zOCY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so1193340f8f.3
        for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786355982; x=1786960782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiMbtxTKEvUw/r0Ou/ONt2ZII0Ap2iYNjYN/HVqfmSU=;
        b=rzG1zOCYsl1AY9nyOSLGQyGqLGFtJ1FCbBP6Sge30SoNN7KGmpt7ibD3nU0SF2NPLx
         /lhXnh2HmRJMgh/79Z+AlohYOsOiFlIXgSgwdby5DgNp9C4gVvSNLiTTXLTQb8q0oxCE
         f1kQQqcuXcRCoAWUSYpdhx6vUdSY78twP2nnmUoHdJIUeo/X+AkECJ1/kmu1T/1SllL0
         Ios7STVEzS6+lcJ1QP0UYToHgmmqdFgmQ8bdufV7QLD0Bs3dTxfIL40ZUDDzj49DxpDb
         n3jRO+BVAc4ndzVXnjxMDvWhco8lqyx3c0lk0XiEES/sVo4unGCKfgtNLE2pIqSZrRUG
         lLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355982; x=1786960782;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiMbtxTKEvUw/r0Ou/ONt2ZII0Ap2iYNjYN/HVqfmSU=;
        b=nLoYoT9h8gd1nOQ07NA9XDnF/jPehBPmZD3PpJommsYWvCPVN2ysif78wAr4vuENt1
         SUKEgF5cfReR7EPsi/BY9YL7+kqSXsk/4/AluMD8v21TviWOcKAxFIfgfRZCqtpNZfST
         wYF1O3ryOn9WVnPNdnOyLSLngwhtT9ExJCu+m8PUP5LBVPjdY2OP5ReVObF6DCWBT3JO
         UJ6a1wCvTsChz2446Tu9yijXsDIwkFeKCtyh1hw/StjPxyAWpyTVVBxaoznood5VEJO1
         SPF1gIpB/x7oDPsfIisvZOsPM67xzGnofhEdvoILqTap4LcnQUwGjjV+NUJkoiuTK5dY
         oSNA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8kD/m7Ez85B4kjbWSL8fNB9TCUrXLr+p4kNq4ZbAMGAl1W9K6A8Z2Fe32dlLVIHaug+eZJfls+s9MRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2KWijKboxLNcM7CR/3dG8xb9GskJuZvNGHRGZMkeEGZ1gDYMY
	rzS9MMdS7NlH5sCmDk5kiXM5zSLBSyntVmnicYOqO7/ueUrRHMbmBRqnbxfGiYL0WIs=
X-Gm-Gg: AR+sD1106ZLX+dDYmHEwSGACTLeICHgQ1kjJDkZPvL+YM7NQBpH60HeK2XfxyF5ElSH
	/EyNrtpYdORtfE4aBOFENCNnTSLJsXj8X5H/WbPNc8Xux4dMsMEdPSSADn3Ss1/+FfBFz4rkavd
	KE+XVx1Emvo1rzdNq3QYRj32rD9Njo7qA/Q5033oda+FKf5x8jC1ya7MUKe5TdoDW5BKJCEp5+s
	D7npbiwRYgC4pT52vehi4T2bLH/mpHRHqAI3vbgFxZfA8dFbygc2NzCDDqa98/bbw/G5NbU4nyf
	cKXqHZ+2yg7RVSHgvBkWgG2nuk8srFy7QeyjWFi0FGcnrDTqiCUYf0tEuJd1nUaEeElbJDcU4Aw
	Z7rRGaK4h6GH1+l3hbLm9T713ZpuTsKWioWrZ+Rp7FKJYMkqlygLsaHv7A7q9YHgzzzcRDJ4Ar6
	+alxf+zhPWPWFgZJ/MUzOhacyP/Gyq1ZyTXhY9lbTaRf6fNeuTdvi+LMg4CftrskQXGPOTPm//z
	O+xrlFe3X40IeEnyNWJagOZrNPSxDJTYIZ6bDy+6A==
X-Received: by 2002:a05:6000:240b:b0:47f:8fb6:c32f with SMTP id ffacd0b85a97d-48130eefaacmr23781864f8f.24.1786355982283;
        Mon, 10 Aug 2026 02:59:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32? ([2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm32743162f8f.17.2026.08.10.02.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:59:41 -0700 (PDT)
Message-ID: <277b95f9-7edb-4ed8-91c3-658a0bfde8c9@linaro.org>
Date: Mon, 10 Aug 2026 11:59:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/panel: lg-sw43408: use the full DCS brightness
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
References: <20260810-fix-blueline-panel-v2-0-9344dfdbc3f9@ixit.cz>
 <20260810-fix-blueline-panel-v2-2-9344dfdbc3f9@ixit.cz>
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
In-Reply-To: <20260810-fix-blueline-panel-v2-2-9344dfdbc3f9@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/26 11:55, David Heidelberg via B4 Relay wrote:
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
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 0bf8e08f10b9c..be132b65b0c13 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -203,17 +203,17 @@ static const struct backlight_ops sw43408_backlight_ops = {
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
>   	struct device *dev = &ctx->link->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
> -		.max_brightness = 255,
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
