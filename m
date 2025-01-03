Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD031E048A
	for <phone-devel@vger.kernel.org>; Fri,  3 Jan 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896378; cv=none; b=OZ7wYoA9a21QNVg77EBf3NBRhQ9MGsrFqRrwqT3iVAnCW2h1RIw5kjdABSEQ77iSz+BOjZJ8X+2w1H2RfvMYMSaOJHBib2j+FTbRVsy5k3MI+eGVSZDHNRFdnZlFMWE3Q5PVH2pbEzZqmY396QlUYAltZNq+Skh8HW8OcCSdzHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896378; c=relaxed/simple;
	bh=60uCnrGKkZF8la9P/22GV1PylIP//kU4OHWP05NbldU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VlzjlUvqZQuztkXiw65M3XZhLXnbx9rgnRueMd16sDUkDYYHRUqIjO2NGOV3jAY5ZyVoWDUQOL1W0shrl+lx9qWgqQum9RguqLs7Jiv/mB6L8TJw4lbtoYQOjae+XR+2Or22qRNO1HIJshO4MbsRPa681ZqI/i+ylrZwwF3jrgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjmBo4dY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjmBo4dY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso79459885e9.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jan 2025 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735896375; x=1736501175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltoO8pNMKUN2z/DTd5eBVFvMQ82v9NT5MTctpViOMQ8=;
        b=KjmBo4dYY21W/6oSHdTXUy/n9fT6oAjUZnmuTbyRsL2Okr07SMSuFM4noa013z9zpa
         p1MML4tee45+MCG9rJ0a0lf/eYiNCILwfvY0CalSK0zoNrHOFs5H3ecf3YPwLtu1ETfH
         4STmYL4/pRQR83ao1KEyyogXkzMM5J3KsR9WzjgbugCETW6NIS8WR2NP87UwxS5s9jN/
         EFD7mP0F8cuLlT/ZhjBttpuelOn2urdIyJbuq7QeKD01ufuCghR7jCUaLIdW7PKmfrXQ
         nhRr/3QdKoJKGrAO/Z+7QCyhu13euyNGwvqDIvvVjjMyAhurGwm07w3g9OWO/n9dzTXb
         8AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896375; x=1736501175;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ltoO8pNMKUN2z/DTd5eBVFvMQ82v9NT5MTctpViOMQ8=;
        b=iQT2NVQPPXLK25/S9ZzsDrpQxuUEaGnsaLsvh3W3iLCjQHjpJ3M6QL3BjWkAXZQmsD
         xRDwqyQAIWuR4BDvgW/J87H+3sd5tJ/H2xrd6wWoX4LWNF1Ag7XrzAT/k+V86TVlRaC4
         kIrwJ6XrbgExVAS0Tt6Ni9+js6UiIWVvDdSMBUWkHpyNN3PwWWml8My8iA321CIswOct
         Pmu9nJmz0mx0BwyytH9es3jXzoZ1ptQil47lUDcHoL6VJrrX++6twp5e9+qG1y/JX9/M
         L5+oVFkOxNuji6zoS81O3l9s4O2MD6DWwLGR3vAdomQX+PvEgBQF1pXaZJ7dSUAVDKOc
         EPJA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BkSyaPK5OLcsSKr5hcDCjEh9I8TWJgR0vLCmRHz+TS2iBLduzdt7Phu5kFp+Tg/mo3vJHDZOJGr5/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRqK90SQMQEo2MYn42vla99L3rA+hhaxC/KYjRmMH2FNoulU+
	Gk4eHkBHfqrMez1CWVBlV+GqfonzaU4nVrARX+v/7MBOS4aclK0oXYqVEzWpNIo=
X-Gm-Gg: ASbGncta6zYJT9oqoRMovcENnrC8gl5rQJy72+HsiJMNn7CsQ/9SETFfZqeEpjyOj0G
	3UALDWeM+iUNbEi4K7Wnz9t9xQQafWrw+ieqWzbcsodSdxyimCwPY2gDKbIbVUeNXljRGn/iGJ0
	bB63Dr5Et1WPMrQiesMp3ghGLt9erQlK0ZvJjK844WigmC2c/smn/YpMB1azfu05/4YbRP8fRFD
	P0oGVKJg3psE0678G361U5UD+c1iiUvrdCbLio6PslPvuyZ5OliA03oVBNXqpOuDAPocK00hPHs
	hWgYGO8gPxCJd/zYYCUoDsqKQ4Gs5YRnjg==
X-Google-Smtp-Source: AGHT+IFBYCljxVDoDXjZ2E+Coqb6tKVzRHdfH5LWFbS2JycHrgUGxWdB4fuHvTtdL0yEnEXHgKqbZQ==
X-Received: by 2002:a05:6000:4615:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38a222019d8mr45782729f8f.35.1735896375094;
        Fri, 03 Jan 2025 01:26:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3084:b2a4:688f:2d3a? ([2a01:e0a:982:cbb0:3084:b2a4:688f:2d3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c66sm522831775e9.5.2025.01.03.01.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:26:14 -0800 (PST)
Message-ID: <7dd25309-cf51-4e5e-8ddd-24267670ecf2@linaro.org>
Date: Fri, 3 Jan 2025 10:26:13 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] Input: goodix-berlin - fix comment referencing wrong
 regulator
To: Luca Weiss <luca.weiss@fairphone.com>, Bastien Nocera
 <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeff LaBundy
 <jeff@labundy.com>, Charles Wang <charles.goodix@gmail.com>,
 Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
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
In-Reply-To: <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2025 10:21, Luca Weiss wrote:
> In the statement above AVDD gets enabled, and not IOVDD, so fix this
> copy-paste mistake.
> 
> Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
> Reported-by: Jens Reidel <adrian@travitia.xyz>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/input/touchscreen/goodix_berlin_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index 3fc03cf0ca23fdbe36028a6228030d3ffb8d3a09..e273fb8edc6b92bcbad0fd35223a841d7da7d671 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -263,7 +263,7 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
>   		goto err_iovdd_disable;
>   	}
>   
> -	/* Vendor waits 15ms for IOVDD to settle */
> +	/* Vendor waits 15ms for AVDD to settle */
>   	usleep_range(15000, 15100);
>   
>   	gpiod_set_value_cansleep(cd->reset_gpio, 0);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
