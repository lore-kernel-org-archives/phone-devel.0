Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE444DA0D
	for <phone-devel@vger.kernel.org>; Mon, 18 Mar 2024 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710770890; cv=none; b=ZGAuRRCoy01KuxYO8vpItMCRHEuGcU3k/XHFwYNdHDqDKz2sFWrdi9oYQrBxJgaPzE4ZxdG1TcLt4yDp4uTiec9eqvvmVbqW8N7bsrtlu5/UMEJXM89o9+ayUfTIqbI6NB55FmgDzNn7Emc/7jXopvS+2ZyVBfJYOXVH/kWR82M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710770890; c=relaxed/simple;
	bh=ZdkctpSHjq02scICiJ0GQd5huYHivaMgmDGgrZraAaY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CPUmUhT/MC2eitkar0qnQGlj5upBAU8nR+wEltUS1TvqMbg64MH1rbAtwBe9ERMpNpXJo2qTJBYvhAGAGCSEEPl8YBc1fMZLcYyScdx6s54u6Caeubd2HWMBOJRMM2D17Lbq1YiYQ9qAXnJnjtaLBrE8oF9RB1N1EySXseBoKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fBcpQ4cs; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fBcpQ4cs"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4140edd58c9so8729085e9.2
        for <phone-devel@vger.kernel.org>; Mon, 18 Mar 2024 07:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710770886; x=1711375686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nPK3ysxs1xx6fjG3/EoRSQ40WVHya8WPq6yF/INz0c=;
        b=fBcpQ4csvQnzJKEoNaHMOIOSCUQvHMAYOuf0HiZ2L4ygZl4XWm7aYQoFAqMLhQZ0R5
         QyH5HPKBkKlpVSQGQNtzN4GBXfjqeCKyongIvGtDm1GJdEPPJnxsnWR/DovXdIYNPLdP
         ciUY+hGeiI7gJXmRpbxU8uWdFut5qy0zxnlnyreDU0+PL2EuhxOoEyzhhpUc9KLUXlJG
         cIDdlEx3Vrz6WDpPKJEPWoDoRSfuDiPucDNxoA3lGlrlm8kMlAxeSHL/hhxs4hlFskDT
         C8GBu80pNCU2r/xUIwIagGBCJVOqPLA0vLB4iY/aLas1gtS85tOUWMyUPRmEs7fy5T7+
         5ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710770886; x=1711375686;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3nPK3ysxs1xx6fjG3/EoRSQ40WVHya8WPq6yF/INz0c=;
        b=MzACM565HzdL5h5Co8UJF7tribpdQUrOlZsWgvnDkKbiGcupqfz3lRuqHrd5K3XRra
         kD256ZUvpTqiURw85RCEZFyGUNGU6Au2taXf6w3GPwNF13+luEBY8gs1oiB2kpQvhgtf
         mcp+BkbZnM0gQ2wjfLWvDuJlA+ZVGFzkPw0yEyj2rkZYHe4kfkuKqh3rT33KliyF2c/m
         sAH9iPKgKursKRnsOgNah3TkWkEr9w5RmN6//J9axd8n1eBEV1qwUCA7JOXSGkYjcsbP
         X2Jmvfc2OPIdgW8ioxNbD1BHbz3gzZeT+t0XHhKSd6ehTFcmDSXUdfVdPaed+UHxAlFe
         8uaw==
X-Forwarded-Encrypted: i=1; AJvYcCVe07qFUk6dwNx8GfgwNy0IGARm0mJkhZ6mvqv90TUQG/HWn8Gw+5VkTQ+IvK+/mh8U+TzAqbmEKT/+K/3JJcu4VdkiaJb+mPXPVD4=
X-Gm-Message-State: AOJu0YzQi33Nlk2SiEj4jApOnHXQmEIjbngTw65CGqZ82qjg4etrNHs0
	j3gO78AxL0NrcbnrZ9Huf7EF3FKoXN5t2VJF4wLsC/65NgofslCti6e7TeoyFzQ=
X-Google-Smtp-Source: AGHT+IHJPw11WaGYzy6KPpwU+OfAbIYVcsWo8Tev5a9gx3VLenR9TukZSv3QrHRWrps+Zw7pT00Rkg==
X-Received: by 2002:a05:6000:4021:b0:33e:7a42:68e2 with SMTP id cp33-20020a056000402100b0033e7a4268e2mr10505839wrb.21.1710770885373;
        Mon, 18 Mar 2024 07:08:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc? ([2a01:e0a:982:cbb0:ad2b:a316:59d9:3dbc])
        by smtp.gmail.com with ESMTPSA id bu27-20020a056000079b00b0033ecbfc6941sm9630900wrb.110.2024.03.18.07.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 07:08:04 -0700 (PDT)
Message-ID: <c2d86017-7523-4f4e-ace3-980689b7a881@linaro.org>
Date: Mon, 18 Mar 2024 15:08:03 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Luca Weiss <luca.weiss@fairphone.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <171075294759.1615603.8073986785380285265.b4-ty@linaro.org>
 <87wmpzq0bp.fsf@intel.com> <ZfhEpBLfAHk3JdlM@intel.com>
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
Organization: Linaro Developer Services
In-Reply-To: <ZfhEpBLfAHk3JdlM@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/03/2024 14:41, Ville Syrjälä wrote:
> On Mon, Mar 18, 2024 at 12:52:10PM +0200, Jani Nikula wrote:
>> On Mon, 18 Mar 2024, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>> Hi,
>>>
>>> On Thu, 11 Jan 2024 13:38:04 +0100, Luca Weiss wrote:
>>>> Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
>>>> bridge/panel.o to drm_kms_helper object, we need to select
>>>> DRM_KMS_HELPER to make sure the file is actually getting built.
>>>>
>>>> Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
>>>> be properly available:
>>>>
>>>> [...]
>>>
>>> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
>>>
>>> [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
>>>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3f18b0dd1db242791afbc3bd173026163ce0ccc
>>
>> With my kernel config, e3f18b0dd1db ("drm/bridge: Select DRM_KMS_HELPER
>> for DRM_PANEL_BRIDGE") leads to:
>>
>> WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>>    Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
> ...
> 
> All the defconfigs in drm-rerere also seem to fail here.
> 
> Neil, are you using some weird .config, or did you not actually
> build test this before pushing?


It definitely built fine, but my config test is not extensive and went through it,
I'll send a revert patch ASAP.

Neil

> 
> PS. the drm-rerere defconfigs seem pretty outdated (eg. missing
>      tons of panel drivers). Would be good if someone could update
>      those to provide better coverage
> 

