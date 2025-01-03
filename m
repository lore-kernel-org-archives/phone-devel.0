Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C4718BBAC
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896454; cv=none; b=AvoeL/D/YgkC1UykOLxOzMHQ1iow0mBeMeTc28PqJrNo/xWenRQv/kJ/DQE8V6Be/0PEi/Yg7lafIR6q1PL8aklBdZ66njDyI3fC0YJux9HID/nmipiC8fJcVysN5IfxIUVsCfYKFc9zIeud4SbP7LtoLVA1jypM6PdlNzcJSX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896454; c=relaxed/simple;
	bh=2gqbqWKKWKa1mkawLYzz7EKEhLdrVsZDIM/hLZIbU2Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YMJGQw4czWgo5nCfSheOx3VrdKJO7QLUv+s1RNdCv0FYqmrSlcblryeDo0KeEBd+9v31bLy68SBpEKeGg9IAnGO1umuxXzvk1ge8kolKeBTXgvf5nGHgUu6WC/OIyZvzIJE9bBGlYwUrMokZBDjclT68L5tQoD2M8njxvWem8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mjuSSm19; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mjuSSm19"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3863494591bso6345606f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 01:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735896450; x=1736501250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5htFRR1yoCM+HOuES/TylTlWwjld4HyaLRUe9q0q5kM=;
        b=mjuSSm19gUENs+e3ePKJmleKgqNNegPAbJJyo5RwW47OOH5oEOFuHTfXoFNH8DLH5r
         Y13MfJU1OO74+aZMH7Vx02KTP+5hrElL/6sHJtuEXQYYzI0oXurA+1zZhbMyhSuaiDSn
         +AhLwJ6XjW5p8YhCEBWYaR+omI9qa2T+6lkBwYVCTMmU/9yXZ4KrWPfwxynWEfNYgGxF
         xwnn1S39RaHL77APW4+Wl/RMGv3Drg2mseoi3lslqWr2iSFmFRfAWh3hkr3tDTdqobyh
         3/RzTa1bYLHuVa5p5QuH+rNS78bChM56Wy1o4DUA1Gq217Yb+J8GSWDo9egaQy+eil0z
         EQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896450; x=1736501250;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5htFRR1yoCM+HOuES/TylTlWwjld4HyaLRUe9q0q5kM=;
        b=uXYEqKUK3BwiEqKIqSyWQPDxU/ML1SxdY/w/FpEsZ434F93Dea1B/KCckgJn9BfM3x
         jtji81mYvYvvzfwZ/Z3C/9uYyE7oaF/YASKq4UU3Am6lqQUHUGZEKkBvFjVoUNW6fB8r
         nIeGdOsa2DqLZpbeqpt+2mF4WXg1Zy32hhLENDfBHHH6AezaDy3eBedDpbf61as/U27a
         OP2MAILccJAKIFCaWGRdOxMdXbaUCp2tD9JIBO5lf81XzhNekZYc7e09R2ihWvW0OW0h
         tsWmgjTUviftdcOLc46xMEB0CuO6/S56ohE/WIUaIqI/DJVx+zCfIcJ/bnR27x/zUOXc
         qUAw==
X-Forwarded-Encrypted: i=1; AJvYcCXrYN486xVoh1peEtkfIXonwIyJk4zzrUwjDX66DuSauI0xr4N84CZ1j+BKuxqlR9ZTwB3eUc6E0FdxcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWTXrSJAi+d1m6KTj+xD4cOJvjChui2SBgiolOO7Ki0OOLTH5
	nEOf5ZlKOUabGqbwb2ckK+p1VYP6jjPF1tsNHLScsXpYwn2aWu+s/rAnDmEZFkw=
X-Gm-Gg: ASbGncvd+8LaKfsDnwqw6zh/uY/4xc4qfokR2y/5bTT0oFL/0irJq+5kdjozl9qUcNU
	7i1cQqg2NlFxh9LNLEO2Vy+R39HJFQuiErzKN1uNobi2gt5ti2Tc/qR41YXfPUPqSFXcE2TK5LN
	xvJkCovNUozrXmCdkQlsmLER4liRnu4h7ds1eAvt6+XBkGwBUnA5vEWLbDaBlNAWTebWWrAT/rt
	eP2iAmoh/gZleWOyVxxoUkzD0acbqyFuinHpws2WCPzqCW2Xsj1UW0FYGjqahL6rvyyMLPhrZN7
	JU8tnUkj1Ov4yRCsfV5nTb+Tbo5+uTIPHQ==
X-Google-Smtp-Source: AGHT+IG7STrF4Zo0hNQLwodv7ELPBWQSSXDVMDZiR5gjYyhQoMaDIsEyQzxio3lO/3p27fhvJqidTQ==
X-Received: by 2002:adf:b303:0:b0:38a:625e:341 with SMTP id ffacd0b85a97d-38a625e0360mr5104821f8f.46.1735896450506;
        Fri, 03 Jan 2025 01:27:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3084:b2a4:688f:2d3a? ([2a01:e0a:982:cbb0:3084:b2a4:688f:2d3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828e3fsm40747533f8f.5.2025.01.03.01.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:27:30 -0800 (PST)
Message-ID: <0233a087-67c4-482e-8ef1-9c8dc610f9fb@linaro.org>
Date: Fri, 3 Jan 2025 10:27:29 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] Input: goodix-berlin - fix vddio regulator references
To: Luca Weiss <luca.weiss@fairphone.com>, Bastien Nocera
 <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeff LaBundy
 <jeff@labundy.com>, Charles Wang <charles.goodix@gmail.com>,
 Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>
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
In-Reply-To: <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/01/2025 10:21, Luca Weiss wrote:
> As per dt-bindings the property is called vddio-supply, so use the
> correct name in the driver instead of iovdd. The datasheet also calls
> the supply 'VDDIO'.

This is duplicate of https://lore.kernel.org/all/20240805155806.16203-1-danila@jiaxyga.com/

But it's still valid:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
> Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/input/touchscreen/goodix_berlin_core.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index e273fb8edc6b92bcbad0fd35223a841d7da7d671..7f8cfdd106fae03a6b197582bca4eb61f80182c6 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -165,7 +165,7 @@ struct goodix_berlin_core {
>   	struct device *dev;
>   	struct regmap *regmap;
>   	struct regulator *avdd;
> -	struct regulator *iovdd;
> +	struct regulator *vddio;
>   	struct gpio_desc *reset_gpio;
>   	struct touchscreen_properties props;
>   	struct goodix_berlin_fw_version fw_version;
> @@ -248,19 +248,19 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
>   {
>   	int error;
>   
> -	error = regulator_enable(cd->iovdd);
> +	error = regulator_enable(cd->vddio);
>   	if (error) {
> -		dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
> +		dev_err(cd->dev, "Failed to enable vddio: %d\n", error);
>   		return error;
>   	}
>   
> -	/* Vendor waits 3ms for IOVDD to settle */
> +	/* Vendor waits 3ms for VDDIO to settle */
>   	usleep_range(3000, 3100);
>   
>   	error = regulator_enable(cd->avdd);
>   	if (error) {
>   		dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
> -		goto err_iovdd_disable;
> +		goto err_vddio_disable;
>   	}
>   
>   	/* Vendor waits 15ms for AVDD to settle */
> @@ -283,8 +283,8 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
>   err_dev_reset:
>   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
>   	regulator_disable(cd->avdd);
> -err_iovdd_disable:
> -	regulator_disable(cd->iovdd);
> +err_vddio_disable:
> +	regulator_disable(cd->vddio);
>   	return error;
>   }
>   
> @@ -292,7 +292,7 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
>   {
>   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
>   	regulator_disable(cd->avdd);
> -	regulator_disable(cd->iovdd);
> +	regulator_disable(cd->vddio);
>   }
>   
>   static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
> @@ -744,10 +744,10 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>   		return dev_err_probe(dev, PTR_ERR(cd->avdd),
>   				     "Failed to request avdd regulator\n");
>   
> -	cd->iovdd = devm_regulator_get(dev, "iovdd");
> -	if (IS_ERR(cd->iovdd))
> -		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
> -				     "Failed to request iovdd regulator\n");
> +	cd->vddio = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(cd->vddio))
> +		return dev_err_probe(dev, PTR_ERR(cd->vddio),
> +				     "Failed to request vddio regulator\n");
>   
>   	error = goodix_berlin_power_on(cd);
>   	if (error) {
> 

