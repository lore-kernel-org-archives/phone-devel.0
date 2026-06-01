Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE60348C5C
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315411; cv=none; b=BDNx6aIUCb3qTXBSzfwd+2cb4zgSDZnpT9U5p1pYGQoiU+SjhpPv5hZp7d731pWzqbBkfm9k7UUSgTVprPEJe2Ox1ibj+7tJab5Ex0ZYih055CVXqsJgM5WVIw3Sk6e2gm2Ie8c4uPeAHRxLGQIPhvGCwLq4q0Qw1fZP8Yn56eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315411; c=relaxed/simple;
	bh=nLFoRvyFOscsg03x4Jr1KChaOFpHYFQQVp3SnZyAm90=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tAvhA0PRUNHmbbvRPjqOnEjJltcCk7hRSa5RmV3CP06vpy8GmnMNLWiHmf2cer2KkKBpMk4e9VwD+6W3HWfFH9Q6LqFkTLgeQBmCFWgHucitKFA+lnyUMJ/k9rsl3KCVq4XgbzcdN5SCxbmGNCdL1EyCsqVCzZfiiDD2fu0MF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJG8zwSu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJG8zwSu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ee1a56328so4611801f8f.3
        for <phone-devel@vger.kernel.org>; Mon, 01 Jun 2026 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780315409; x=1780920209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1Wey3un0fXTH19wrNGP1LhTu9gQnKFoUWyi+rqBlPU=;
        b=EJG8zwSuTc/h3NJQNWZ+xHXKnlC6pRjczT1Nsc+HeQ8Dk13jOObG59z6PWP5ALvKHO
         Itz4kwLUHl8LCzjkTMXikUnEiLeV/1dJ15zkijNntVbYyLQRaHzTrwkUgOWMCimq7HPw
         CV6/wLCJHQo0gi5d8nOFQaAQXH3kHU/9q34lMPHCyNIHmxgp4T27sMpM5OKkvvTkGODn
         R2wV7pBoGpA94MM67uuDVpPLXKvG5hxNFzaZTplAwkskjiXS5CfECJ0fi4Xmotv/5/tR
         LmgdMppJSRXpKxgpTmfOS2NuveX/7r4ZxmBZ/m228QF4jQ7BakTrNeSTSk4Fxri33quY
         L9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315409; x=1780920209;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1Wey3un0fXTH19wrNGP1LhTu9gQnKFoUWyi+rqBlPU=;
        b=tPOuPnAk3Q7AHD/XGYEBouYU8+5DhA1wjmhkmyZojTCMz3kT5vGzXTHwjpRsC1BtEN
         jImKFcZolIrxRI7/pJ7yMtYgJXLopPkzhm/h8OoZY3b8HF2hfA1nmf9s8gVOC38PMrOj
         9lvNshnMoyV4L2OWUywjYkY+q+N7rWjtFzB705l4qqedXzemo0U2SjDKvFSSKvWiCHto
         VYHKY9A7Xio/8bDcXxESZuDUofcC9rUgCf45WXtSuOYrbgDEg4xquc4uC7mNoGRcPbSL
         zRVtOUhSG7lNjVDyveZj0RO8lgVehR3zOGEJYHxjkJUhQqv7hsTtUbr6Xc4hpjp01CA5
         KI7A==
X-Forwarded-Encrypted: i=1; AFNElJ8iFx7xalWDt9TxLhhpmfL60svErHLT7Wiy5ZoCgAcx1z92q+dWtF5dHU7Zg4fRlpFXCSXrH3Z1PVn1WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHd2dJUoPr12gqHNJpRcrkvVALM8lyiJZlFhzmpvKb3SP90/Lv
	8rDSmEA1V89G+7mM9NPG2aUI2aHuD4W2u4awZWgCsEzJip62mLjGBdiGgJTEGIXYoXY=
X-Gm-Gg: Acq92OGKL724wnXUm60clPGql2weR1UsVneiHay75S7BWRUWMQZJLTbONv1UEsuNxlp
	G3jy0S2i+gxxOsYGIjRPNHbkdVKWAC+4vLvLj5UReKnF1aswiBYlYub0XJKufQtK2ygU/5HIAXp
	kRe6WpKt5P50UiJFqxHaVWXd/t0usw8lP0zUfSQziefFHqCoitrv8FFC4yC2rIZDHK6BmkK8Gbs
	c+TXkp2v2t0lA2ap3nnnMh298peIlggobMn1t2gRmCFiTpsXlwXrZFjHGdT9OzSro4KEdoLw1bj
	juAxZu23qB1gP+F99IMcPoim5KFzEg1hQl870H3xrkbgDH0MMeI+bszdxvHSqcMG/h5I6LN9z4h
	CqH3allNAcsz8QiJb2YFNtm9Xwra8HEPxYy9UnLo3LBsVskbH+Z+2EujkbA/jYzyr2d3DtVHrgv
	iiOqnQBcvgUcWoFBWKnN9ilp0ZAqUWgBRLsULOqBgp6/eAnYH40C+wOtQAOxZ7NVYQEkSdoK2gh
	oBE1cWZfkZHRNhqAg==
X-Received: by 2002:a05:6000:18ab:b0:460:c9f:8747 with SMTP id ffacd0b85a97d-4600c9f897fmr11924854f8f.33.1780315408668;
        Mon, 01 Jun 2026 05:03:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2fd4:bcb3:83d3:ecb5? ([2a01:e0a:106d:1080:2fd4:bcb3:83d3:ecb5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef356a4c4sm25348347f8f.31.2026.06.01.05.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 05:03:28 -0700 (PDT)
Message-ID: <337ae033-f5b4-4771-a063-dc6b0cd8f47a@linaro.org>
Date: Mon, 1 Jun 2026 14:03:27 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] Add gpio configuration support for Qualcomm
 Snapdragon platform
To: petr.hodina@protonmail.com, Sumit Garg <sumit.garg@kernel.org>,
 u-boot-qcom@groups.io, u-boot@lists.denx.de
Cc: Casey Connolly <casey.connolly@linaro.org>, Tom Rini
 <trini@konsulko.com>, Rui Miguel Silva <rui.silva@linaro.org>,
 phone-devel@vger.kernel.org
References: <20260601-qcom-gpio-v1-0-e24bcdb35da0@protonmail.com>
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
In-Reply-To: <20260601-qcom-gpio-v1-0-e24bcdb35da0@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/26 13:52, Petr Hodina via B4 Relay wrote:
> This patch series adds the gpio configuration as input along with
> pull-up/down/disable and drive strength for output.
> 
> Remove the reconfiguration from the set_direction.
> 
> This enables on mainline Linux phones to use volume-up in menu.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---
> Petr Hodina (2):
>        gpio: qcom_pmic_gpio: implement standard pinconf parameters
>        gpio: qcom_pmic_gpio: don't reset pull on direction change
> 
>   drivers/gpio/qcom_pmic_gpio.c | 41 ++++++++++++++++++++++++++++++++---------

Please switch to drivers/gpio/qcom_spmi_gpio.c instead, this driver is
deprecated and should be removed once it's tested on all SoCs referenced.

Thanks,
Neil

>   1 file changed, 32 insertions(+), 9 deletions(-)
> ---
> base-commit: 1f89ddd61cd8c27a3dc1fc7edbeccb55d424eb72
> change-id: 20260601-qcom-gpio-98e85ab22647
> 
> Best regards,
> --
> Petr Hodina <petr.hodina@protonmail.com>
> 
> 

