Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E7C133
	for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564124; cv=none; b=K5sDMolofROnz9TuOvc8WwGuZ6JgFy6pcbDuxN7NY9s27ZU5C3wH5R/L8yuUZa7/BLzJiZEwLbbIvZsWlmcYVFSU8WycOzOeZscyB+XEOfzU5DJ1uhXJyOjsLkd8skgCWqRRyiPUZsZNvS7zww8XrpWbL8hoU7M4/Gdk3qQBh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564124; c=relaxed/simple;
	bh=dbbOBEWqnm2v6li6i0NL5kRgCbRhEG1gvHmNFVnEedU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R831S9iOMV0sqba3QcpcM59ysImO7IuxLzcZh6ArmdD/+sEIKAbM7H7XLy5PJ6kkdvF9J34BDBmKg8ByyIlEkSVm5E2hIMLKtBaczW2YN3gj/OvGpeZnrEBsab0trbw+iS45Fy8iIf+J83U1OYJKZV6m/Dy3OkKB8IkhDz4s6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2/ziczn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2/ziczn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so49396955e9.1
        for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763564120; x=1764168920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AG2Ivm3gxxeIGO2S2nN8YgMONCoL1ktp5mhPJvGMAXs=;
        b=C2/zicznS4Hwc3tKP3izTiGVK4yX2xjtFsj167wtJOhzYeUUdnxEe1Zyxpw4Lo5uk/
         FeWW50owCF9wbyYf+LZSvYQ0jwWDvcF0wQlG/VCw+sgn1VA4CiMntyHry4tibFIFGV96
         lP4x6ESg/hg+5vNQQa5+5MsKYEDvYTDMFbh71tFf0bCbKoYRz8AJ+/ZjNuU9yQ391EPK
         lnOcqFqRo2kzF3NtkHLJUIzwbfxlD9pchUYAPW3bLnBicYz9fYTFXO/Rfw0TMt2nQSvj
         W5402SSGrWT9Bgg+TVYfFiUVqEXiBis3u+hLjajhiP1an8R5WaCNRkqiHao8JrtlX7MT
         F7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763564120; x=1764168920;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AG2Ivm3gxxeIGO2S2nN8YgMONCoL1ktp5mhPJvGMAXs=;
        b=av0njdJ7eVutrLn1IYO8a3TdG44uApDZMKCZGWjO5cmUFWm3ad7KXr4QmvhHFFNo4N
         L2sGxsZ6qhmaZWTIxW+9FL6dvdnOVxgK54/pTSjPDQdtINiYSURHWOwH6ss5xHKwagiI
         h9THW+d7igzi19nl4KMXhcUT2qYHhkMIdD0EXjeYOr0cEqz7wGAt2HGl8sA4kepeJg03
         v3B7Aa34qvQ9YGTcggKhs+dWjPed1b/e4MClCmY4uSSRSIfn9kNF8bglVpjgmZ63aT1N
         rOIqSNjiZktuslIkiivXFX1XyyzpCFz2KqHnn9731JihUHRdvNEeYLSoEZ/EYen00KML
         /s8g==
X-Forwarded-Encrypted: i=1; AJvYcCUvKpTOWcuKOil8P6+bLr0CqSzo/Gpym0kV0MyyCdb7sZ1UesjKcWaAW72eXKX7fyILN/zDFo3Hrzz6ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7W830sBU4IXFfLohWVcqOFK4fmEPtL+nUqMejJ5zYRWISCcGO
	LSUinjMPLT6OJMi/OgRI70tHQX/K9OxZg25vZ0s2w3jwzzv0bdryoVeovYan4GWpH2MCpFEEJ+H
	b/IqF
X-Gm-Gg: ASbGncvyPaATOmeQZMST1doznbc3niAoBQqwESbNOz4ed692AMBT8IvMsi0MGjwZ1DM
	3Eqno+E601cOVIvRC+qhsWvznemkLbxEoVfyHk4Obb1G22ZYo63bVsZRBz3kusz9DwOu7MQK3qS
	tB70OD7k5c0eP+gxvN8TWqlnXLdvHn1AZRykgvUW5B2nhSPSzNvHf/I7GDDuyMay/KGyLDbrp08
	lxMT4SzcHOiBmElRL392r5vSXXsRM6F/V3K70yWkwt4Lup+WInB8I9IQVSXXig1EMfG56tiA6eT
	VkXPTyGD3TWXPQQ+KvK6k/Jld/PXVIKq27Z3V+lysmu2ytv+zjaUcMBNY8G0BBB4nsu5QYyKEEE
	HDmirC4P6JDgzH81yzdIUJod0F6HI5rZo84Y4+MkxyM/YECG/TI+6nfxC5wDxsRKyJjSJNMXaYQ
	bCM2xyH8+cFt2NX1ByDwoNUWsuM7uh174wGYN3MH+9rrc9P3/u5KMsGMeacu1JIN4=
X-Google-Smtp-Source: AGHT+IGVWrCliuxc+g4cZNa9BoI6eCTMQ+YEhvBOCZ461rA/CFjIgL3GjXC2pMqZRX0mGHfaueAfPQ==
X-Received: by 2002:a05:600c:c4aa:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-4778fe88fefmr173211085e9.32.1763564120379;
        Wed, 19 Nov 2025 06:55:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:263d:925b:a11f:ae36? ([2a01:e0a:3d9:2080:263d:925b:a11f:ae36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b103db28sm65817575e9.14.2025.11.19.06.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:55:20 -0800 (PST)
Message-ID: <0dbb931f-5b62-4f37-a314-3c9696b5149e@linaro.org>
Date: Wed, 19 Nov 2025 15:55:19 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/12] Make Samsung SOFEF00 DDIC and panel work
To: david@ixit.cz, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
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
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 15:21, David Heidelberg via B4 Relay wrote:
> This DDIC is essential for panels used in OnePlus 6 and Pixel 3a XL
> (SDC variant). With proper support, all downstream patches in
> sdm845-mainline and sdm670-mainline can be dropped.
> 
> The mainline driver was broken so far, and with my recent introduction
> of S6E3FC2X01 driver, I had to "break it even more" due to OnePlus 6
> common device-tree changes which defined all the regulators and
> corrected properties.
> 
> At this moment the first version of the patchset will not include
> Pixel 3a XL (SDC) as no testers yet volunteered.
> 
> The code, including the Pixel 3a XL enhancement can be found at
>    https://gitlab.com/sdm845/sdm845-next/-/commits/b4%252Fsofef00-rebuild
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v3:
> - Drop arch prefix from the commit. (Bjorn)
> - Added Casey into MAINTAINERS file. (Casey)
> - Moved compatible legacy comment inline.
> - Link to v2: https://lore.kernel.org/r/20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz
> 
> Changes in v2:
> - General fixes to device-tree binding (Krzysztof)
> - Add myself as a maintainer
> - Updated commits wording
> - Link to v1: https://lore.kernel.org/r/20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz
> 
> ---
> Casey Connolly (2):
>        drm/panel: sofef00: Add prepare_prev_first flag to drm_panel
>        drm/panel: sofef00: Initialise at 50% brightness
> 
> David Heidelberg (10):
>        dt-bindings: panel: Convert Samsung SOFEF00 DDIC into standalone yaml
>        arm64: qcom: sdm845-enchilada: Specify panel name within the compatible
>        drm/panel: sofef00: Clean up panel description after s6e3fc2x01 removal
>        drm/panel: sofef00: Handle all regulators
>        drm/panel: sofef00: Split sending commands to the enable/disable functions
>        drm/panel: sofef00: Introduce page macro
>        drm/panel: sofef00: Introduce compatible which includes the panel name
>        drm/panel: sofef00: Simplify get_modes
>        drm/panel: sofef00: Mark the LPM mode always-on
>        drm/panel: sofef00: Non-continuous mode and video burst are supported
> 
>   .../bindings/display/panel/panel-simple-dsi.yaml   |  25 +----
>   .../bindings/display/panel/samsung,sofef00.yaml    |  79 ++++++++++++++++
>   MAINTAINERS                                        |   7 ++
>   .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   4 +-
>   drivers/gpu/drm/panel/Kconfig                      |   7 +-
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c      | 105 +++++++++++++--------
>   6 files changed, 163 insertions(+), 64 deletions(-)
> ---
> base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
> change-id: 20251104-sofef00-rebuild-04cfc6e68e71
> 
> Best regards,

For the serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
