Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCF1391E5F
	for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681670; cv=none; b=kbBsH9Ka33jPcTBnLsH1AtiSOy5rhmelNSUp746ULs6tZAceKPmAn6gtGR7M+T/HvConn/178gkBYxsKVUuopjClksszMEuPJEct2CoLhIZVVNNZo9lyvHjV2ZsKYo0v0KUIVhMeXgV9Ft2TcnhIIOJX6xLJUUI30vCrinPNoeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681670; c=relaxed/simple;
	bh=Gi0XiZ8YuxbcG9V+HtV+HlNj+B5fo8qkkv3muwP4M/o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PTsRHfroFLjEkJMGRdJ0rsIz/fWhh7X4uHs5Ss40wAa8yVGIAJhu6nkZqIZLgFRzQSzF4Q1lO8NuT5hbuRKHagCPGNplunWzLc+UbePkkmnQZodaKBhX4F3G1FoLyd/YPF3smLg9zlFn/ymg8tCUQ92GdTfkbFHyKJ2v9OBFhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOLu0r4G; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOLu0r4G"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490afc47455so24482235e9.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Jun 2026 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781681666; x=1782286466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Uim5pbWVyeQp4JbMjOlnv43bbNh3AaD6WsvZpd9kZ8=;
        b=bOLu0r4GEoeAXK4H7yFPPwWYXKnFSuDrMZpJyvhuROKf3+tHxmGzoeTAfydAQMLyU5
         n/ocCTwlaN/mArhdtYrCmacYMKJKK3JKTgblhdi6pBBNTAbEFz3cD+CqEjCGcuonHhBK
         KuIhU+GGh5Hp2av8v+zzq8a2zhBKUjBFrCywj6dcNY/OaGzKxRF38RE8+TTUJDHoEOfS
         XqCGI3vGzasP/9SzQkPYrLumktt7OLbP/LHzHN0nFBmYdQGrLD82M1FiYGtc1hCHaCRl
         5Bnu38MOqZaGZfqpkSkMQarI4iMgqlSVEDY7lfuvv/W/PhGp5lBBZy0GspPNBQnvggX7
         kzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781681666; x=1782286466;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Uim5pbWVyeQp4JbMjOlnv43bbNh3AaD6WsvZpd9kZ8=;
        b=Vl9z+PNit+RobQKszhQ/pl/8IpXhGGHN8n2zO+SCiU5b80dCHBmeEz/b6/m+kFTTiP
         5NNKGZRt/HDgYKExdkGOceaqiJIOuf8IJFbH8KdabenkRQwOJPEGxrfktz4k7OLZP1mG
         G7/IasY9O/NFB+ktmFEmN6fhx8Y+K59RiLRn3IIASt59Z+TA+tpMMFXvvZun8mvm11BJ
         hk54kaCRGmTUMpoke0UuEzLTPqa0JY9deEqhhzmszwhrxuSqJnWmUDX08YUIaZ0wcuhU
         d1QPn3fetZbDlQ4J9MsFl2Gc1DpdjWY/8kw3QSEPWjgTuA6imP4b7C7JUfHUChDE4JGS
         IrLw==
X-Forwarded-Encrypted: i=1; AFNElJ9JeHrdZyZekH5dtBtxJNWF+ZGtMMA9YAz5KYj1gTZLV+V65Vpe0NYaQNjcOn6uZyHst1okgWg7/l+jDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOS7kw5UjGzyJwi745uZ8FCSC6HJsaPcuWb/mCwBK5TBaJ2bEc
	VpFqEUUzc6XuGXwwSXAdWEVrvgmjeVF6t3cdRN+Up4YT70bAyRDPdyLUqM5YxdAsiRE=
X-Gm-Gg: Acq92OHiKVpNwvVf1XVLUYU7UiEFV41B4nDxd3K1rjAWNFMjysOdRSsuDnfRGhF9oIp
	cA52jTY7J8e7BuhmsYqqsnSZHJsE5FQq5Uu3Jx8V2FIZVA6Leeyh5lMFFQV6wKT91u71o0/sJmV
	ULI0MB7dbw0UPrnWABVHkJRU58DbVtJ2D1+Ven+Et4rz9VhNJEMohY9PWHCwJuW3h3S35oy6/Py
	2kXrp5OHIdThWHSRDy8+sXkET67Xw8luQ90iuLj9fUUWt9cZVbv/PWEOlRmEgeocYf4lAuhn17Q
	6HQdGvKPBK4Kt1lIvsvDce3vaQny7PioBSAzVFKhP3yGGdFv0UCBXThX7d6NTM3215ASihu8aYV
	O49bcddbNS9C/0AqdT3y/6AkCXhhK5iMhnAzmQe4fEEka5KTZlYcIV9BORN3BnNem0JFhkXfKMg
	nl6H27K2n4mgQcJNubTYPU6w==
X-Received: by 2002:a05:600c:a305:b0:492:2c87:3d4b with SMTP id 5b1f17b1804b1-492333af19dmr33307215e9.12.1781681665133;
        Wed, 17 Jun 2026 00:34:25 -0700 (PDT)
Received: from [10.12.4.106] ([212.133.41.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa97a07sm242913335e9.14.2026.06.17.00.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 00:34:24 -0700 (PDT)
Message-ID: <6726e289-02c8-4267-b8cb-3b4ba2ebae1a@linaro.org>
Date: Wed, 17 Jun 2026 09:34:22 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/4] Revert "dt-bindings: display: panel: panel-simple:
 Add lg,sw49410 compatible"
To: Maxime Ripard <mripard@kernel.org>,
 Paul Sajna <sajattack@postmarketos.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@tuta.io>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>
 <20260615-amigurumi-kagu-of-prestige-ecae6c@houat>
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
In-Reply-To: <20260615-amigurumi-kagu-of-prestige-ecae6c@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 11:17, Maxime Ripard wrote:
> On Sun, Jun 14, 2026 at 05:08:01PM -0700, Paul Sajna wrote:
>> This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.
>>
>> It isn't actually panel-simple-compatible, and we knew as much by the
>> time this merged, but I guess maintainers needed something to prevent
>> the dt-bindings error going off while I was working on these patches.
> 
> I had a look at the patch and discussion that commit was from, and I
> didn't see anyone bringing up that it wasn't actually panel-simple
> compatible.

I wonder why rob applied this one, I clearly requested a v3...

Neil

> 
> If you knew as much back then, why wasn't this brought up?
> 
> Maxime

