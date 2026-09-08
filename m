Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A85335AB
	for <phone-devel@vger.kernel.org>; Tue,  8 Sep 2026 12:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869504; cv=none; b=hQ0+ok0rBBXN9Aym82t/vc7OO2JB4S4ikiVlKZd6V3okDvfLHvcOrcOzaM6RgwYmhPFOb6iQsBAlfAQoHmrCmEkPTfc2DFeK2TRVOMA0t4UjjMKvYUnAinJNvyfHW2TFU1WghfegXEo/uPOetmq2Aw/+bmwA+f2iFNU1Bd/Gm8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869504; c=relaxed/simple;
	bh=mUXOQ5AV23ys5QiaDDAZ0AcNquND3Wc1wM07X/igZGA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KdUr+w7+5VN2jcmsN87NPcBCoOEOmXn49/FjuV+YclkBSxPyXB7JhnXCwxob1EUnlfmvP3yP5OBkOPJQbpCcjtoFKliIcUX8oiwh/9ADKGx5eR4eBEkQO4gF4MyIHDlg98H3efpxmKsd7jVgSHqpQvpUSqlDGG8WaIJ1cAQ/0OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5Jq8p6O; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5Jq8p6O"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2544ff970dso638735566b.2
        for <phone-devel@vger.kernel.org>; Tue, 08 Sep 2026 05:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788869487; x=1789474287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2P1SkFoYcs0vGhaQZ4l8dD/Ypai6Sg+yoqkptSpF1w=;
        b=E5Jq8p6OY8VS38AWz7Qc0HVoDe94EpElffQSYKlVLqJgBIPpeSb0OUvKCXVow4mjFc
         kNKtPBilDdLGXLTIgztTHhpdOlO/519EQxpVtSVPm5InxVWm6G8JwYKE4v7SVzady0QH
         lPYf14Uc2EUnnie3/F3Axwcyy/CpvZgPnFQYslYxpUi28A3g4yVhAiLqZPu4HXEVIP/3
         URfRM67DPiRzxXK+dgXEnnoCxR53MqUX/47hFdYuLX180P5A5f0cSmTpK8koZ5R+VW/t
         9Awm9UbiLn2sde9930yeoaZtZSmxQ/g4LpEg9MZ+G+yYEaPPmfhOssSYbBswSHF+Q0V+
         NOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869487; x=1789474287;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2P1SkFoYcs0vGhaQZ4l8dD/Ypai6Sg+yoqkptSpF1w=;
        b=rcOn+RJDjJ6H3c7f5tFPj5dDnlwK8ZCuVucUsuRRjqlO8rPHZ54s/E480A36809eTq
         1rTD9BXazgsEN8yDOxzDiKJ95NCmvMr/vwWBSBVUP7zEYJrFyno5bIarnjJjfV6BWGGu
         MqLGctnWpplJbK6N0vz2lEE4NVnkFzwaOEoDHb5Ai4iB2MoSAsbBESbyY3HsV7CzZ5Ky
         7eYeZXkv6F6PS9mAkU4+pDnU2DIqNSclbhsIzafHpb6feFB68RDQwJCgsLCwT96Wvzsx
         JuZz1SQqY6x2Fwzk4/FzHRCQuxHAJqFcvgOGbhh1HuNNLN+5t6NqIZ9EboAkQcp0ZsGO
         Ddkw==
X-Forwarded-Encrypted: i=1; AKwUvByYduWqDaEv9Am2jYH6G0xijv/g/0jue7F2viNk1Dac5jULcQbE6cx69lwMylX7FNIrxDPBmYASec5KYg==@vger.kernel.org
X-Gm-Message-State: AFuF++nL41u+BdCGK+1EYRdjyvZYAoND/AKJj75bleWl9gZjD2i3GwbS
	s7DBan2BjJ7QrJHXami8P2nzIDdyqb6fhA9s/8Sf+rZ4AkSVwW2P0xdRWlRBJfvQN7U=
X-Gm-Gg: AYBFou2FQ2cIwen1aJ9x3liOjHHNONYkzJyAtsSsIvhfdcIfJ3pbdkQvhbdCoAzMhbD
	du9xyZoUaRNuj9w3ZULPSFZxUryZegK+328De0+ZXetcNWpRRzGl8qNp5mZMiACGnOgtfqJmyj/
	JNOwZt5Vf++ulY6KzUYBOR17Jswd5dozb/UcFIilHD0rPB8gUQdFXdVxJfMRWp9ZLz+LnX6U6bv
	rEA1j9q2UTSTc/Ab12RU1+9rhAQyaMYm+oxfYEoiBU/h0etymNmeWhekYhSJ9Lgd7jUImpVvVsW
	pxDEgH/xFD0jmWBh8fFXtDbDbI9icZ4b0MqfTEYw5xAap3BexsLXM+jdIDXa0Xkq6z+8bHo6wEc
	9ql/A/gNJuJTNXJv48npQwVRwmrF5PT/tEHw60pto/Kwvcicw/Si47QVI84JKeIsFEtk57xvNP3
	0XMSqmFQJ+YpuVSxBhEFIJmAcoKL4q8br4SBAQGDqfTLH/3djyPvdDY1ZyRRhmnCXYfUBhk1NsX
	FmwDQmoirVGbnh/rFdr75M1XF4TV3YxnDhnuQexttA=
X-Received: by 2002:a17:907:7243:b0:c26:1649:47b4 with SMTP id a640c23a62f3a-c2616495644mr949929266b.42.1788869486673;
        Tue, 08 Sep 2026 05:11:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ea45:883b:8b89:b4e5? ([2a01:e0a:106d:1080:ea45:883b:8b89:b4e5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cdf7asm631013466b.58.2026.09.08.05.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:11:26 -0700 (PDT)
Message-ID: <61a734b9-6cd3-44e5-a8d4-76e139d0b768@linaro.org>
Date: Tue, 8 Sep 2026 14:11:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: ebbg-ft8719: Fix the MODULE_LICENSE()
 string
To: david@ixit.cz, Joel Selvaraj <jo@jsfamily.in>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>,
 Linus Walleij <linusw@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260906-ebbg-ft8719-fixups-v1-0-4e846510cad1@ixit.cz>
 <20260906-ebbg-ft8719-fixups-v1-2-4e846510cad1@ixit.cz>
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
In-Reply-To: <20260906-ebbg-ft8719-fixups-v1-2-4e846510cad1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/26 15:19, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
> value does not declare the module's exact license, but only lets the
> module loader test whether the module is Free Software or not.
> 
> See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
> "GPL v2" bogosity") in the details of the issue. The fix is to use
> "GPL" for all modules under any variant of the GPL.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> index 1ab09c50a6306..14982263a94f1 100644
> --- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> +++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> @@ -241,9 +241,9 @@ static struct mipi_dsi_driver ebbg_ft8719_driver = {
>   		.name = "panel-ebbg-ft8719",
>   		.of_match_table = ebbg_ft8719_of_match,
>   	},
>   };
>   module_mipi_dsi_driver(ebbg_ft8719_driver);
>   
>   MODULE_AUTHOR("Joel Selvaraj <jo@jsfamily.in>");
>   MODULE_DESCRIPTION("DRM driver for EBBG FT8719 video dsi panel");
> -MODULE_LICENSE("GPL v2");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
