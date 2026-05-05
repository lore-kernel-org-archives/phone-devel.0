Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EB83E95A9
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987714; cv=none; b=obG2XsZ9vKo4uaRUXRtSV5igwqF3uO9qPe+xla3mheDykOiw2eEwujZCwre/I/vkyixON35aeZktubuQBLT2QVf5Z794po4Sin6pF757jFy+cGD5x78atywa2ViaP7SIDssL7B4pLJ8OrfRPjGcsYo3cE16XwhHd/90iD75TgUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987714; c=relaxed/simple;
	bh=Y9gxTsbXal6OZs1qauRgZRadDfLwaAbfsbUNMeszeps=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hKsLaPUqRrbxTi1NMkixj4LU1nb38bcOKl1TKyX//QU1HQnJu1ocbtDNlTJv3f9sysvr0/B2C7mEGmxquoVMxkBJQZ/jGsUo6vHtrp8i+FffpgblD2WxKfjn/+XRSfgIH8CmR1A4SMcu89b1TL9etKV5OWxPGhEc7Fo4jdrNRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLIt8cuz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLIt8cuz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so83348705e9.2
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777987711; x=1778592511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8zvshtiKUBMbbv4GkLxrVfyYZwq8RqVDHQpw4VGH8g=;
        b=OLIt8cuzXmqY/CL+xnMu/bV8KQROJzEuk/rfnqtdLndmvZJR4tDPJHcTtKB8DVm5/W
         /l5A+iMdAIFvZWAm/zE73Jz6nf1L9UaDPHxBBQ928jBO/ZPO5hPpHXnbBcc8A74NNUR9
         1+JIh7dFa7NuoNUaFWv6QR35lJzPjen2LJb1uCmdrz6SsLtYvdPiXyZYTgjoX+wWYtI7
         j+5WxajAgzs/1BFcooxOD8QhBT20VB7lbOSLtYZE7oWASTQLtpVo6gTSw+aowTuCixGT
         Iezs3ailIhFaIwH0jdE3/aMJgj9HF2rb+SE7DNnlFR4Q5hZ087EfzNsf7PFpCd9Iuzwj
         pOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987711; x=1778592511;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8zvshtiKUBMbbv4GkLxrVfyYZwq8RqVDHQpw4VGH8g=;
        b=EYLn69zeRAKV3linsfVnAGUPv9kRQMWGR+/BKFkcIYgf6/Hvb2HE7Vh51yZlSP9yG1
         I3rOF5K/aIdApx/R7/lnv7xTi39vTJyfpqnG03A9bKQNcamnT1HQ6mIX8Lmj/8ePo/Vj
         gafPeBg0JslmwNxmrKuXTeyUNQ/AZyzaCyV4z/Xeb6mVR77me2GZDSv9IwiQfrn5pZ3W
         io3jm6ev2hYnCzco+7FDFJSEkC7fCoudYUiUghzD/rAMrjbKRo/F+EXEprPmclzYg9ze
         wdutK0OrdyxdITG34sCDV/j5LZJL7cVsfp+sOpbujhd/rafpOQlUxZ2kS+MAUuN4Ey7w
         B4sg==
X-Forwarded-Encrypted: i=1; AFNElJ+sOHZnxBGfZqg4HmGgPbiUehoKqi+h46CXrvhVh0DEqzrl99BNF46af4xmhUwZrX9PyjvKsgDuB5AAow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4itYzEubFQCaplZ1l4FgDANoMPXdDZxwhx9qjhOpyaw3wfsIV
	2UNg71tzNVUJ1Xddwk0XDIiKTczUpS8z+zEtBzFESxL32rtRq/C0EMMJ88BUWe4Y6IQ=
X-Gm-Gg: AeBDiesD8AVOG/JSsRYRMvAVUfBWgSS3fm2/cdv7bB74NUfQSeNHXbWqfW+gDAgFCUJ
	IjTM89RjdMEPgv472loCDLMxKDyzMqW2W7qRNf/RBtLydY0P3JxxgIJCqG3h+0Sg++W7OwJtP/d
	GE4YfLXvxjT5+zLjr5ANiDhgYn/9ojgHTkeS1LZ6DAIG+SGvWpn1S3ukXTZ3haOi9OBCIce5wZn
	DpPWWCYR3oKKba7vThVjTlA6DS9Itys5fTRLU1MxkhTjFi5+yJz+4+aazSg7ZdTkh6hNpVMXIpP
	BDUb21mGW69Mis8hKpu34VQ7q/S3H6soPIPk12pQGpe9c8LxDefKSzTm3wRTlWnsP3eMqwW03dq
	FWNaeqG8K7dRlwXY4rO8WxJDybKD4biQgrF173iO8yTIE+c34t+OotoUKzBN/wcFiT1Le7K3fGW
	C3YKNYuaDv9BkrzNky1U3w7oDl85Qs/Og15FvmFD75ds34i+B/SiQ1tozBkxYX7yEYSUFVwXsay
	7MR65i+sPKbTYz/Eg==
X-Received: by 2002:a05:600c:a118:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48a9865d8famr176983735e9.13.1777987710597;
        Tue, 05 May 2026 06:28:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:19a4:dd04:854d:9f82? ([2a01:e0a:106d:1080:19a4:dd04:854d:9f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm354941905e9.5.2026.05.05.06.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:28:30 -0700 (PDT)
Message-ID: <602c39cd-d412-4315-8d1b-28053c55db61@linaro.org>
Date: Tue, 5 May 2026 15:28:28 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 2/4] drm/panel: Clean up S6E3FC2X01 config
 dependencies
To: David Heidelberg <david@ixit.cz>, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260422-panel-clean-up-kconfig-dep-v1-0-d825e9ffe911@ixit.cz>
 <20260422-panel-clean-up-kconfig-dep-v1-2-d825e9ffe911@ixit.cz>
 <ebe54ec7-9cf2-4243-a616-34b18c50fd57@linaro.org>
 <e20e87fc-532f-42c5-a60f-37b900d74dab@ixit.cz>
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
In-Reply-To: <e20e87fc-532f-42c5-a60f-37b900d74dab@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/25/26 16:57, David Heidelberg wrote:
> ...
>>>       tristate "Samsung S6E3FC2X01 DSI panel controller"
>>> -    depends on OF
>>> +    depends on OF && GPIOLIB
>>
>> Why OF && GPIOLIB and not on separate depends ?
> 
> No particular reason, is the multi-line syntax preferred?

Since OF & GPIOLIB are not strictly related, yeah please split them

Thanks,
Neil

> 
> David

