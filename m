Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E747DD7C
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989549; cv=none; b=JawBLIJ58kRWV0hUXyfdo8PDoO/XByGYLlmGVTkHG2kJwQTXGPvwhzsRskhALIR2EZGMcpAT7Zgzrgx8ZJkpY+9EU+cF4ouJMCNEztp7aja2A748203k1oyvcG0tCRcAj6O1sKOhQ/5FMSCZuz8r2pDw7cWXMEGzroaHPIfF9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989549; c=relaxed/simple;
	bh=ap512pc+5GuvGMbqOfDP5AQ1btQoG1tc1lu4yd4RVr4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hM0Csuk2wYRlCkG4fTzFUAp7E3DC+0++SGmSMMgygkCfz9PcPSY7lrFfvURyWYxexxkbfgEIZ6aEHA044ggrcb68NcyufqhB4ZstNWkZHN9YxNpRlCyZ0a+lUNx2mAC8jhn4qkWAqRMJehCTR+TrL1WPnRFTzNWxk7q45t4x1cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeOmFaS6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeOmFaS6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so33682515e9.3
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777989546; x=1778594346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5jDuJcze3P4s7VYgp+yE4jNd0LF2tgF4WZnAUmhlkIk=;
        b=oeOmFaS6DwUCNG21pmaDY4mLfGkK8eCVwLaFNM5YHW7Oq/ey1xrchF+4fUT7+/mx4n
         Y53/jSV3KMmaN3aABzUqyz4ugLp0GTe9Olg7vDlBq3lB8uqFhZAm7PC1k6pcCE5QBqEX
         VuAVFuglJbt464JG1xIAyCPz0Wtw1YTks7cS+O9EHNwIjLxrYumhE+5Old9Z2DSXn4yj
         h3m6yPT1odzdnuzmhmBCL5aFLDx6r9K00pGmbvOHA4TlKZPSPww02AUaKBQs01x1qzTf
         BL/BJlw8ZYbxPgcyvaGZDRRlQMXwBCTm+1VPpx3xlR58yC4ObgdFMm8BIPzy9yFBIXmo
         Cm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989546; x=1778594346;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jDuJcze3P4s7VYgp+yE4jNd0LF2tgF4WZnAUmhlkIk=;
        b=RWWENOoEZ5cEA2nGyhh1rpX3CQtbfD1/w3D3JCQes/VC8oKrqRlOH7r0TwNcm1gJ5u
         jZcvMj8CuaWiN6ymOuDq0HzSD+gblscH0k6Jk2rmpXtbIxIAZeqfju/Ojvyxtsyww69G
         FlIVgiqKq71VC0MwigSodsPYZyUQtRNe/B3NzvlRsBZUNaON911Ao0vGYp7ojouWbsbi
         Pi0iAaPFzmKdH3EXpruMA51WhvmOMUOSe6ZRBeD8e4TVOW7ESxEFz1iE02X8RXyZeeud
         wcZy17VJYrpmJxuI4kPXsYVIG6hSXRAn0/8nrAPvdTCP73uBMVTml1OH2z8SSGPIYFve
         xW3A==
X-Forwarded-Encrypted: i=1; AFNElJ+EE2t13g8DdUswCjzsO/TkTwzF82j4TAC4Llg/NbrihHDwrNHLb+fVd2P+LuPCppBSPxqjJb0S9hUZVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS3vQtyVr7nHfmlbDyO8vMEax8MVkJkqUWR2MSoBLrtsb2MNbM
	g/DEJCNrRJfgHvHtO4GSNiMByml8wSaXJuCsarRboIXzkfI9v7IpI25y2Sk24XKhv34=
X-Gm-Gg: AeBDievXbTGhYglQUh2xJh3YQ2yhOdVDF7S6JceOn7twsCfzuukQ1ghCYHEu3PbU3hZ
	joqlYJXthO9/dGr/XZhjla0Z4uyraUGCwHWpHzHAKuvq5TgEZyytYkqlCmXERg8+ArXrMfbTq2N
	bjiS08Ps+AfJXjIGtrPq5fbxM4o5HKnOBWkEbzO0vz/Udub6oOHVoo0YlEiBQYJ8J79Dqm0o7o5
	qYED7du0Ptk+lEo95f5BOAmieJhAUnTw5QniK/hOco8MRSrQPKkItZ78Mh4fYq/HOGtbW64nUOf
	GfdWTPtKa+nANGusbGmCgRKcc7DBdHAwpfWi4e9eTxYjPyJ/9j6k//RixvxffGkT2nKxkVVDie9
	CU3HGhRzMMZ4YGaZgbMPG8merZYcML7eNCIGqtJN+ORK987bWT2PMjsovAidwxBwgJ6TOivHKbb
	YF1hrl4e39lsLgRIViIy413OyqWUvEMTtMuwYAzTJy79dnl/zNnSggwVThXA1N9GJm8yXyVwHFe
	rQJpjTE41n+SSTdcrOCdpFUvVIo
X-Received: by 2002:a05:600c:c094:b0:48d:5c1:bc3b with SMTP id 5b1f17b1804b1-48d18cef847mr40114605e9.24.1777989545455;
        Tue, 05 May 2026 06:59:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:19a4:dd04:854d:9f82? ([2a01:e0a:106d:1080:19a4:dd04:854d:9f82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d181efbdfsm17724765e9.25.2026.05.05.06.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 06:59:05 -0700 (PDT)
Message-ID: <e2c0d1a3-9023-423f-b784-32f55cc859b7@linaro.org>
Date: Tue, 5 May 2026 15:59:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] drm/panel: Enable GPIOLIB for panels which uses
 functions from it
To: david@ixit.cz, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>,
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260505-panel-clean-up-kconfig-dep-v2-0-9cc31d6e6919@ixit.cz>
 <20260505-panel-clean-up-kconfig-dep-v2-4-9cc31d6e6919@ixit.cz>
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
In-Reply-To: <20260505-panel-clean-up-kconfig-dep-v2-4-9cc31d6e6919@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/5/26 15:53, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> These panels used on sdm845 devices are using GPIOLIB functions,
> ensure it's enabled.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/Kconfig | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 9360297ee99e5..268b45d4b82f5 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -102,16 +102,17 @@ config DRM_PANEL_BOE_TV101WUM_LL2
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to support for BOE TV101WUM-LL2
>   	  WUXGA PANEL DSI Video Mode panel
>   
>   config DRM_PANEL_EBBG_FT8719
>   	tristate "EBBG FT8719 panel driver"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for the EBBG FT8719
>   	  video mode panel. Mainly found on Xiaomi Poco F1 mobile phone.
>   	  The panel has a resolution of 1080x2246. It provides a MIPI DSI
>   	  interface to the host.
> @@ -339,17 +340,18 @@ config DRM_PANEL_JADARD_JD9365DA_H3
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for Jadard JD9365DA-H3
>   	  WXGA MIPI DSI panel. The panel support TFT dot matrix LCD with
>   	  800RGBx1280 dots at maximum.
>   
>   config DRM_PANEL_JDI_LPM102A188A
>   	tristate "JDI LPM102A188A DSI panel"
> -	depends on OF && GPIOLIB
> +	depends on GPIOLIB
> +	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for JDI LPM102A188A DSI
>   	  command mode panel as found in Google Pixel C devices.
>   	  The panel has a 2560×1800 resolution. It provides a MIPI DSI interface
>   	  to the host.
>   
> @@ -454,16 +456,17 @@ config DRM_PANEL_LG_LG4573
>   	depends on OF && SPI
>   	select VIDEOMODE_HELPERS
>   	help
>   	  Say Y here if you want to enable support for LG4573 RGB panel.
>   	  To compile this driver as a module, choose M here.
>   
>   config DRM_PANEL_LG_SW43408
>   	tristate "LG SW43408 panel"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for LG sw43408 panel.
>   	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per
> @@ -579,26 +582,28 @@ config DRM_PANEL_NOVATEK_NT36523
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for the panels built
>   	  around the Novatek NT36523 display controller, such as some
>   	  Boe panels used in Xiaomi Mi Pad 5 and 5 Pro tablets.
>   
>   config DRM_PANEL_NOVATEK_NT36672A
>   	tristate "Novatek NT36672A DSI panel"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for the panels built
>   	  around the Novatek NT36672A display controller, such as some
>   	  Tianma panels used in a few Xiaomi Poco F1 mobile phones.
>   
>   config DRM_PANEL_NOVATEK_NT36672E
>   	tristate "Novatek NT36672E DSI panel"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for Novatek NT36672E DSI Video Mode
>   	  LCD panel module. The panel has a resolution of 1080x2408 and uses 24 bit
>   	  RGB per pixel.
>   
> @@ -726,17 +731,18 @@ config DRM_PANEL_RAYDIUM_RM692E5
>   	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Raydium RM692E5-based
>   	  display panels, such as the one found in the Fairphone 5 smartphone.
>   
>   config DRM_PANEL_RAYDIUM_RM69380
>   	tristate "Raydium RM69380-based DSI panel"
> -	depends on OF && GPIOLIB
> +	depends on GPIOLIB
> +	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for Raydium RM69380-based
>   	  display panels.
>   
>   	  This panel controller can be found in the Lenovo Xiaoxin Pad Pro 2021
>   	  in combination with an EDO OLED panel.
> @@ -1251,16 +1257,17 @@ config DRM_PANEL_VISIONOX_R66451
>   	select DRM_DISPLAY_DSC_HELPER
>   	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for Visionox
>   	  R66451 1080x2340 AMOLED DSI panel.
>   
>   config DRM_PANEL_VISIONOX_RM69299
>   	tristate "Visionox RM69299"
> +	depends on GPIOLIB
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
>   	  Say Y here if you want to enable support for Visionox
>   	  RM69299  DSI Video Mode panel.
>   
>   config DRM_PANEL_VISIONOX_RM692E5
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
