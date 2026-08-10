Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C423AF667
	for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355547; cv=none; b=oQ1rImBGqyByVEFHDBMYNVa2zE7/rHE5GdaWYRuDQVui/V7Mw0jcwp+Je2FQsJX17NMTVO4vmbhd+A1FWu1PuENrcqD0U40cD3ipdfSJ21coH6KrOJS+oyApCv8wtyqKPZgmNiqrFWTyx7Yzc99nIvxocSxFEb7r8OJ0kUVdGYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355547; c=relaxed/simple;
	bh=UVdNw2R798TTSE4kOXkrtJ5Pmy0oiAoVnYuZumE5qX0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X1kDdtjs7ieBmaFI37VMGS8ONDPscWI2h/YzRPytOSHj2WrsUpTxjBeZNQMiHuUxwYDhVAmRZYC0GsvtbrSyorCTXDf8npKPPIXkF7QWG7eZMbYexiFmnv9w/8Z3Qh/G9xK9znKRUzU7sDhi5QVogwGAOVC4hW5LWAypJPXX5C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzn7JyTn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzn7JyTn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1181561f8f.1
        for <phone-devel@vger.kernel.org>; Mon, 10 Aug 2026 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786355543; x=1786960343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/rNB53EPT8cj0jg6UkNkJ8sSSyhUGBEo5y4v0oy9uk=;
        b=bzn7JyTnolwo+avaP7EsuI3anSJUb1sHlgXdmFn6fyBA5th4ObrJ0cIEsfuzQWmSxb
         aNeSCjQSxvix/V7RBeUWJvfsmGVpMv0PWhqI/I2+TnxvEgpRMJCmC/nRiSH2wZ0V91w6
         J/IJQtGqht3ZBE4V2He4gByzYJWmljmpi1K5sWxWLLmboneOCxU+3DQvuI6m0OfA/dpS
         KBf9djcSSv7c9QttqQxQ6IIh88C1p0Mzoo8uMl83gVcjuCofv/N32cKI/na2m9+1BX3d
         6Jvhj+49yDUDyySI+o8Wmqf3U5aYNS9St4rq+6mDia8TOPBa1ab4mSAeZnWPPZ2HOqOS
         K94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786355543; x=1786960343;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/rNB53EPT8cj0jg6UkNkJ8sSSyhUGBEo5y4v0oy9uk=;
        b=mfKoyLOPVS3rwbHABRAaBKNoXhE4jVpX3z2pjDDbBSyLEpgMrLM/VWRAMH+oGLEDW0
         tLMJ/in6nZRv3I/CG+s+fK6o5PHKdpzOWse7QRtbqkStKZ31ZHw6sYiS95ZucafVYDFR
         VvQ/AjHYYOpUhNRqv9xOeb8rZ45JtHyNE8AIgCPKiYN6HMCvK2l4uxj5wTn8w4pfDjBW
         2/N4OSpeNBEMANlgF/sjfDtmUnrTqfGfH0fnhkOMf9nN/zWt7cWkAKGlUaQbwy4KUhFK
         9Y0cq7NxS1carbQpqlZ1i3GCN/dlz1FJZR2hr9hDpirCZ6q1nL2PCwpb45aVtUIEM6Jg
         /6pw==
X-Forwarded-Encrypted: i=1; AHgh+RqAejMzX0PPK8O1mpi/EGApdtjFRt7zRjIFAZ+Qm2bnJt2SXYUZ7nKYTKiKjmV12myCcOCuNfYqu6TN/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5gHE7r8bC6vH/QPHYjKfM6EJ4sgFsroIwHTBAaCEJqGUHEi9
	sm15Re80D2yZpDmwj5QkWwGfekID6NW2Uw8x+5kc8JKw7yaBm367Woog2xmxcAtRlog=
X-Gm-Gg: AR+sD10wyiJ6ws6oYW2ff02O3e2XJ1ur26gOEx9p6rxQ/emhAsyHzmuuwcroCqsmu/F
	BAZ7OxRcOFJkVBTENQazWJPdvajJWQ0g9m0hyyA7r7RbUFhSwqB7MiiSQrXGNdxohvPYMBFwTnX
	AJOYYPd44pbZdUibU77OZjoCAsTBG7TgSSmctMeL1NdN+j8ahVp+mQfFvhexeNk6ZlQQ/tA7but
	kXtpawZQsQgKRHzMVnQmga+9i9ti9A9fdR9VqHRWAI8L4errE3HKJXFG9IOX8ErKGZnNKmUfS7r
	45PHSzLe0IwPE6RCTZr5Ze1bxVVvzCxwTpXyXfpEU3AUy/rSdvbkiKeigvMqX7sbTAKS3TZe59w
	fJTjnRc9g9eanal4TdEglhBZWbxLIhrKvYVDlu/cpQ1bIVSZ9+yM5LOVeYipIFQksU/eszXMf0e
	s1iuJGFkc6qP8wH7inSUn0Lc7W3VPo9olvK0qSCu27sNOp9wM4NZyX/6f3GFtiAaz//X19hDcfC
	cS3CcTZlr70vZNW7S1q+JUJtIe9U9Ny6uHMt0RK0cQwyX7bRQEllw==
X-Received: by 2002:a05:6000:4904:b0:47f:93b4:2def with SMTP id ffacd0b85a97d-481456680dbmr883503f8f.28.1786355543374;
        Mon, 10 Aug 2026 02:52:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32? ([2a01:e0a:106d:1080:eb7f:37e4:e8c9:f32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8b09sm36993326f8f.23.2026.08.10.02.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 02:52:22 -0700 (PDT)
Message-ID: <66864dd5-0ab4-48d9-9404-70f839db320a@linaro.org>
Date: Mon, 10 Aug 2026 11:52:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: lg-sw43408: do not assert reset across
 unprepare
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
 <20260809-fix-blueline-panel-v1-1-e7f3a6beb1fa@ixit.cz>
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
In-Reply-To: <20260809-fix-blueline-panel-v1-1-e7f3a6beb1fa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/26 02:04, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Asserting the reset GPIO in unprepare() and leaving it asserted puts
> the DDIC into a state it never recovers from: after the following
> prepare() the panel answers all DCS commands, reports display-on with
> clean self-diagnostics, and its configuration registers read back
> identical to a working panel, but it never lights up again.
> 
> On the Pixel 3, vddi is shared with the touchscreen controller and
> remains powered while the panel is off, so with this driver the DDIC
> sits in reset with its logic rail up for the whole blank period - a
> state the vendor stack never creates: the vendor firmware only toggles
> reset as part of a full power-on sequence, and the vendor OS never
> power-cycles the panel at all (LP mode is used instead).
> 
> Leave reset alone in unprepare(); prepare() performs the regular reset
> sequence anyway.
> 
> Without this, the Pixel 3 display never comes back after the first
> blank/unblank cycle.
> 
> Since there isn't any other panel or device using this DDIC, this
> approach seems resoanble to address the issue.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 293826c5006b9..0bf8e08f10b9c 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -50,18 +50,24 @@ static int sw43408_unprepare(struct drm_panel *panel)
>   	int ret;
>   
>   	mipi_dsi_dcs_set_display_off_multi(&ctx);
>   
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
>   
>   	mipi_dsi_msleep(&ctx, 100);
>   
> -	gpiod_set_value(sw43408->reset_gpio, 1);
> -
> +	/*
> +	 * Keep reset deasserted: vddi may stay powered (it is shared with
> +	 * the touchscreen on Pixel 3) and holding the DDIC in reset while
> +	 * its logic rail is up puts it into a state that no init sequence
> +	 * recovers from - the panel keeps answering DCS commands and
> +	 * reports display-on, but never lights up again. The vendor stack
> +	 * only ever toggles reset as part of a powered-up init sequence.
> +	 */
>   	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408_supplies), sw43408->supplies);

Asserting the reset then shutting down half the rails up may force the DDIC to enter
a special low power mode with a bad sequence and then would not come out.

But anyway reset has a sense only if all rails are up and we want to get a proper
initial state, if somehow we want to handle those special low power mode to speed
up suspend and resume we will need to understand how to get in and get out.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

>   
>   	return ret ? : ctx.accum_err;
>   }
>   
>   static int sw43408_program(struct drm_panel *panel)
>   {
>   	struct sw43408_panel *sw43408 = to_panel_info(panel);
> 

