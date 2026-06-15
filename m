Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF54E383C65
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511490; cv=none; b=KH+jYak8Bk2syUBkatH68r6FvYTTvHbADBSI4dYJWnC0lHzPLyLkZmDqUa+PweJ2vVO0vsM+wrQGwrp1E1XKEo3aP3uLhWgEmbbQUkC+37tpF5nYoJxyEH7HP5/IH+nFXg7S/Q2MJat9p2P3lL7xzfrn5nrv40qMh6wHmMXe5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511490; c=relaxed/simple;
	bh=B3pWiUMNEEWKzy1K/3SRvRwoebbJyG6lavD2PdiMWn8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aEuHwnkgB8A+IgvLhe6Ptpr3YuWyYqcgQZ2NKI7q7fsi4AccJcCm7bRiJD1yvql9May2NU+p2QeSbQSLhYp9sdplGuoa9Ou1jAJAFoM2pYoig3gkfRBLlsQi3MnVNFYuv5pZ/T2qflobYm2wAUQDh1wnS7P3cPlGZj7q0VbHA2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G+h7TERy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G+h7TERy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3637b90so22446935e9.3
        for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781511486; x=1782116286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNqioZHrsjWA41muwL0WomeMCYNtpCqX/QJC/W3MLQo=;
        b=G+h7TERyB3x2M/3LrNvSc7RQyFL8cD2bl4duBNtgBgrb8YVSsolhEYZfOWwO6z81AM
         eZODlHyzAv6TWt09fP/ZmQUDZ7KAf1i8GNjopYXfpxAFIJ02N37QhXkGTZiGR8l6UHLd
         svUsBqiTm9ogMAtnJSyi96il1LAw1tf7G2NRBmOBeuO+e9Ks38mh63EOVrjMUZPPcxAS
         T1fUlT6sDcf5VdBsSTbBVlKjlB2gAuea9b2ArRPeJn+xu75w0AYR3ggNziYoBXaN1+la
         znmqxKtmT43X9niodxI6HrFMLGfHxuiYb03tTRyuncGXOG93QBmROf+MiqL51WfW/46g
         3AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511486; x=1782116286;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNqioZHrsjWA41muwL0WomeMCYNtpCqX/QJC/W3MLQo=;
        b=W6I44R8jjwJJiu62jzZBhD8vwmC9U30s+45SvGHggT82bCWUWNtTpw7XK3MbiGsrmv
         Wyu47YRUnNFlEF4S1M6mKNBjFYNRPsaTjq1UkTHdKQn+qZwmJtTzMLg9Ydor676bgOBa
         w0+XVhpuxOIGgNRTqdF+eDNBMN8qAVOcnxlntAKeFZyjTipfwK8FwfvJFpcX94+dK5aT
         YyuwANpHJ0a2udiJg88sHm5eACCrmFZ5P713406x8Hh6sYmjzvtQm5jtR8MS00RrlgKx
         Uwzlr/fcafIHmZOrgc9q+Kg9DgdbaqHHRjAwuOSdscqFaHE0CQFokGjUAryu4pwQZljf
         zwcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8egRuhgUoDaMAm3QtSTYeLbk23Q16Es0QFcbxoLwtmddwx2qOy61GQi/+YusTctEWymYJIt15CfJyDYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx639m4ZR18fcMBAsP1tdsEQJM1hWLrH4g96dIF//b3PqmPuup7
	PWQRKFzcUpx8K1tR7LxKK4hnh3LO6X58DS+PyXjJIoY2fycB7N41exQM4tSIhg6hWtY=
X-Gm-Gg: Acq92OHyNZCrkevb7Y7ckPJqmUu1zQvVdZTWwxsXoIS0ve2czWRarOggOuM1Idh0Ox9
	i2sCPf3BUgvcWLKbq8HwhVQilNNRjMXd6p3cgc2AXZ9mlIAUR3QSoIGvZb2q+ibXsOCIzUaw1c9
	JcxFfVJJ65Vtvtgk2vn1qqYu2vhP6FtpRV8qlu5V+4lnO7cPGlhZpCq82jTBs8DUrI0RS3ZDfCx
	cBLEP69YoZAqrg1MH0Mck3LjaanfXYmVFvMAg/z9WsoAPCf824fHe/qhomS1EcmUWTyAhVpn8cC
	+BS7TKlKEIZfMkRnxd3qWHjX0O2ZQN6vI/BfD8yuo5VKUOqT5yXtDuwMlbiVeHBLvwxGiCDlsjS
	uloLMKQ/nFKL3rL7iP8t0rPmY3KHqjWAvQZBPWS7N5Un1RxkfFgEOd3bFTc+J0j6s+OUWgDEk4B
	dci39SJA0sF4lv9gJTe18o3aBAmwoucJxPC6MSum7xSv1Aiu2669oe/9JdtXjbwkADOGpPQnE0D
	YYsQeE=
X-Received: by 2002:a05:600c:1509:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-4922009348fmr84439445e9.14.1781511485563;
        Mon, 15 Jun 2026 01:18:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdaf:c588:880d:106a? ([2a01:e0a:106d:1080:fdaf:c588:880d:106a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm211485645e9.2.2026.06.15.01.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 01:18:05 -0700 (PDT)
Message-ID: <e1eabaab-b035-4b3a-b1ef-02257387d824@linaro.org>
Date: Mon, 15 Jun 2026 10:18:04 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/4] drm: panel: Add LG LH609QH1 Panel with SW49410
 controller
To: Paul Sajna <sajattack@postmarketos.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@tuta.io>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-1-07f4134441bd@postmarketos.org>
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
In-Reply-To: <20260614-judyln-panel-v3-1-07f4134441bd@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 02:07, Paul Sajna wrote:
> From: Amir Dahan <system64fumo@tuta.io>
> 
> Add panel driver used by LG G7 ThinQ (judyln)
> 
> Signed-off-by: Amir Dahan <system64fumo@tuta.io>
> Co-developed-by: Paul Sajna <sajattack@postmarketos.org>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>   drivers/gpu/drm/panel/Kconfig            |  15 +
>   drivers/gpu/drm/panel/Makefile           |   1 +
>   drivers/gpu/drm/panel/panel-lg-sw49410.c | 528 +++++++++++++++++++++++++++++++
>   3 files changed, 544 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7450b27622a2..ecf6a45224d3 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -498,6 +498,21 @@ config DRM_PANEL_LG_SW43408
>   	  pixel. It provides a MIPI DSI interface to the host and has a
>   	  built-in LED backlight.
>   
> +config DRM_PANEL_LG_SW49410
> +	tristate "LG SW49410 panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
> +	select DRM_DISPLAY_HELPER
> +	help
> +	  Say Y here if you want to enable support for LG/SiliconWorks SW49410 controller
> +	  (found in LG G7 ThinQ).
> +	  The LH609QH1 panel has a 1440x3120@60Hz resolution and uses 24 bit RGB per
> +	  pixel. It provides a MIPI DSI interface to the host and has a
> +	  built-in LED backlight.
> +	  To compile this driver as a module, choose M here.
> +
>   config DRM_PANEL_LXD_M9189A
>   	tristate "LXD M9189A MIPI-DSI LCD panel"
>   	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index c2c5cf817116..153970480269 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>   obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
>   obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>   obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
> +obj-$(CONFIG_DRM_PANEL_LG_SW49410) += panel-lg-sw49410.o
>   obj-$(CONFIG_DRM_PANEL_LXD_M9189A) += panel-lxd-m9189a.o
>   obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
>   obj-$(CONFIG_DRM_PANEL_MOTOROLA_MOT) += panel-motorola-mot.o
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw49410.c b/drivers/gpu/drm/panel/panel-lg-sw49410.c
> new file mode 100644
> index 000000000000..02d1b85c3aff
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lg-sw49410.c
> @@ -0,0 +1,528 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree:
> +// Copyright (c) 2025, The Linux Foundation. All rights reserved.
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
> +
> +static const struct regulator_bulk_data sw49410_supplies[] = {
> +	{ .supply = "vsp"},
> +	{ .supply = "vsn"},
> +};
> +
> +
Spurious empty line

> +struct sw49410_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct drm_dsc_config dsc;
> +
> +	struct regulator_bulk_data *supplies;
> +
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static inline
> +struct sw49410_panel *to_sw49410_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct sw49410_panel, panel);
> +}
> +
> +static void sw49410_panel_reset(struct sw49410_panel *ctx)
> +{
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(9000, 10000);
> +}
> +
> +static int sw49410_panel_program(struct sw49410_panel *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +	struct drm_dsc_picture_parameter_set pps;
> +
> +

Spurious empty line

> +	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0x0000, 0x0c2f);
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, 0x00ff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
> +				     0x2c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x81);
> +
> +	/* Manufacturer protection */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0xac);
> +
> +	/* Source Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3,
> +				     0x04, 0x04, 0x28, 0x08, 0x5a, 0x12, 0x23,
> +				     0x02);
> +
> +	/* Gate & Mux Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4,
> +				     0x11, 0x04, 0x02, 0x02, 0x02, 0x02, 0x02,
> +				     0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xd0,
> +				     0xe4, 0xe4, 0xe4, 0x93, 0x4e, 0x39, 0x0a,
> +				     0x10, 0x18, 0x25, 0x24, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00);
> +
> +	/* Sync Setup */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5,
> +				     0x2e, 0x0f, 0x10, 0xc0, 0x00, 0x10, 0xc0,
> +				     0x00);
> +
> +	/* Panel Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6,
> +				     0x03, 0x05, 0x0b, 0xb3, 0x30);
> +
> +	/* Touch Timing Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8,
> +				     0x57, 0x02, 0x90, 0x40, 0x5d, 0xd0, 0x05,
> +				     0x00, 0x00, 0x18, 0x22, 0x04, 0x01, 0x02,
> +				     0x90, 0x40, 0x4c, 0xc0, 0x04, 0x00, 0x00,
> +				     0x18, 0x22, 0x04, 0x01, 0x08, 0x00, 0x3a,
> +				     0x86, 0x83, 0x00);
> +
> +	/* Touch Source Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9,
> +				     0x64, 0x64, 0x2a, 0x3f, 0xee);
> +
> +	/* DSC Configuration */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba,
> +				     0x3d, 0x1f, 0x01, 0xff, 0x01, 0x3c, 0x1f,
> +				     0x01, 0xff, 0x01, 0x00);
> +
> +	/* Low Rate Refresh Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc, 0x00, 0x00, 0x00, 0x90);
> +
> +	/* Black Frame Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbd, 0x00, 0x00);
> +
> +	/* U2 Corner Down */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbf, 0x4f, 0x02);
> +
> +	/* Internal Oscillator Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc0,
> +				     0x00, 0x04, 0x18, 0x07, 0x11, 0x11, 0x3c,
> +				     0x00, 0x0a, 0x0a);
> +
> +	/* Power Control1 */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
> +				     0x01, 0x00, 0xf0, 0xc2, 0xcf, 0x0c);
> +
> +	/* Power Control2 */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
> +				     0xcc, 0x44, 0x44, 0x20, 0x22, 0x26, 0x21,
> +				     0x00);
> +
> +	/* Power Control3 */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
> +				     0x92, 0x11, 0x09, 0x09, 0x11, 0xcc, 0x02,
> +				     0x02, 0xa4, 0xa4, 0x02, 0xa2, 0x38, 0x28,
> +				     0x14, 0x40, 0x38, 0xc0);
> +
> +	/* Vcom Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x26, 0x00);
> +
> +	/* Power Sequence Option Configuration */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc9,
> +				     0x05, 0x5d, 0x03, 0x04, 0x00);
> +
> +	/* Abrupt Power Off Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x9b, 0x10);
> +
> +	/* LFD Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb,
> +				     0xf3, 0x90, 0x3d, 0x30, 0xcc);
> +
> +	/* Tail TFT Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc,
> +				     0x00, 0x40, 0x50, 0x90, 0x41);
> +
> +	/* U2 Option */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xce, 0x00, 0x00);
> +
> +	/* Gamma */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
> +				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
> +				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x95,
> +				     0x95, 0x3f, 0x3f, 0xa2, 0xa2, 0x94, 0x94,
> +				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
> +				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
> +				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
> +				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x95,
> +				     0x95, 0x3f, 0x3f, 0xa2, 0xa2, 0x94, 0x94,
> +				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
> +				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
> +				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
> +				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x95,
> +				     0x95, 0x3f, 0x3f, 0xa2, 0xa2, 0x94, 0x94,
> +				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
> +				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2c, 0x28, 0x3f,
> +				     0x3d, 0x4f, 0x4f, 0x66, 0x66, 0x6e, 0x6e,
> +				     0x76, 0x76, 0x80, 0x80, 0x88, 0x88, 0x94,
> +				     0x94, 0x3f, 0x3f, 0xa4, 0xa4, 0x95, 0x95,
> +				     0x8b, 0x8b, 0x81, 0x81, 0x75, 0x75, 0x66,
> +				     0x66, 0x47, 0x47, 0x2d, 0x2d, 0x00, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
> +				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
> +				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
> +				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
> +				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
> +				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
> +				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
> +				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
> +				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
> +				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
> +				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
> +				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
> +				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
> +				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
> +				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
> +				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2e, 0x29, 0x41,
> +				     0x3f, 0x52, 0x52, 0x6a, 0x6a, 0x72, 0x72,
> +				     0x7a, 0x7a, 0x84, 0x84, 0x8c, 0x8c, 0x9a,
> +				     0x9a, 0x3f, 0x3f, 0x9b, 0x9b, 0x8d, 0x8d,
> +				     0x84, 0x84, 0x7a, 0x7a, 0x6e, 0x6e, 0x5f,
> +				     0x5f, 0x41, 0x41, 0x2a, 0x2a, 0x00, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
> +				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
> +				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
> +				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
> +				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
> +				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
> +				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
> +				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
> +				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
> +				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
> +				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
> +				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
> +				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
> +				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
> +				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
> +				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01,
> +				     0x12, 0x05, 0x20, 0x1b, 0x2f, 0x2a, 0x43,
> +				     0x41, 0x55, 0x55, 0x6e, 0x6e, 0x76, 0x76,
> +				     0x7e, 0x7e, 0x88, 0x88, 0x90, 0x90, 0x9f,
> +				     0x9f, 0x3f, 0x3f, 0x95, 0x95, 0x86, 0x86,
> +				     0x7d, 0x7d, 0x74, 0x74, 0x68, 0x68, 0x59,
> +				     0x59, 0x3c, 0x3c, 0x26, 0x26, 0x00, 0x01);
> +
> +	/* MPLUS Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3, 0x12, 0x01, 0x00, 0x00);
> +
> +	/* MPLUS Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
> +				     0xdc, 0x5f, 0x9c, 0xbe, 0x39, 0x39, 0x39,
> +				     0x47, 0x48, 0x48, 0x48, 0x3a, 0x00, 0x03,
> +				     0x6d, 0x80, 0x00, 0x00, 0x8c, 0x66, 0x00,
> +				     0x00, 0x8c, 0x66, 0x00, 0x00, 0x8c, 0x66,
> +				     0x00, 0x0a, 0x48, 0x80, 0x00, 0x0a, 0x48,
> +				     0x80, 0x00, 0x0a, 0x48, 0x80, 0x00, 0x0a,
> +				     0x48, 0x80, 0x20, 0x0a, 0x14, 0x0a, 0x18,
> +				     0x00, 0x1c, 0xcc, 0x23, 0x9e, 0x23, 0x9e,
> +				     0x01, 0x01, 0x01, 0x01, 0x04, 0x04, 0x04,
> +				     0x04, 0x01, 0x00, 0x02, 0x80, 0x00, 0x10,
> +				     0x00, 0x10, 0x00, 0x10, 0x13, 0x9e, 0x13,
> +				     0x9e, 0x13, 0x9e, 0x13, 0x9e, 0x05, 0x05,
> +				     0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x23,
> +				     0x9e, 0xff, 0xff, 0x13, 0x33, 0x18, 0x00,
> +				     0x16, 0x66, 0x10, 0x00, 0xff, 0x01, 0x00,
> +				     0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05,
> +				     0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00,
> +				     0x09, 0x00, 0x0a, 0x00, 0x0b, 0x00, 0x0c,
> +				     0x00, 0x0d, 0x00, 0x0e, 0x00, 0x0f, 0x00,
> +				     0x1b, 0x25, 0xdc, 0x18, 0x00, 0x20, 0x00,
> +				     0x1c, 0xe1, 0x00, 0xff, 0xe0, 0xc8, 0xc8,
> +				     0x41, 0x8f);
> +
> +	/* Notch Up Gradation */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xad,
> +				     0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06,
> +				     0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
> +				     0x06, 0x06, 0x20, 0x40, 0x60, 0x90, 0xc0,
> +				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +				     0xff, 0xff, 0xff, 0xff);
> +
> +	/* Notch Down Gradation */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae,
> +				     0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06,
> +				     0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
> +				     0x06, 0x06, 0x20, 0x40, 0x60, 0x90, 0xc0,
> +				     0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +				     0xff, 0xff, 0xff, 0xff);
> +
> +	/* GIP Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5,
> +				     0x0b, 0x0a, 0x0c, 0x00, 0x02, 0x04, 0x06,
> +				     0x08, 0x0f, 0x1b, 0x02, 0x1a, 0x1a, 0x0b,
> +				     0x0a, 0x0c, 0x01, 0x03, 0x05, 0x07, 0x09,
> +				     0x10, 0x1b, 0x03, 0x1a, 0x1a);
> +
> +	/* Mux Setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6,
> +				     0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
> +				     0x18, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16,
> +				     0x17, 0x18);
> +
> +	/* Test1 */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xed,
> +				     0x21, 0x49, 0x00, 0x00, 0x00, 0x00);
> +
> +	/* BLU Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x81);
> +
> +	/* Sharpness */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3,
> +				     0x00, 0x01, 0x00, 0x0d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4,
> +				     0x00, 0x00, 0x40, 0x83, 0xc5, 0x00, 0x01,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb,
> +				     0x20, 0x40, 0x60, 0x80, 0xa0, 0xc0, 0xe0,
> +				     0x13, 0x18, 0x18, 0x18, 0x16, 0x0d, 0x0d,
> +				     0x00, 0xc7, 0xcf, 0xd8, 0xe1, 0xea, 0xf3,
> +				     0xf9, 0xff);
> +
> +	/* Gamma Correction */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf5, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf6,
> +				     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
> +				     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7,
> +				     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
> +				     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf8,
> +				     0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40,
> +				     0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00);
> +
> +	/* BLU PWM Control */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc,
> +				     0x13, 0x70, 0xd0, 0x26, 0x30, 0x7c, 0x02,
> +				     0xff, 0x12, 0x22, 0x22, 0x10, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_ENTER_NORMAL_MODE);
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 135);
> +
> +	/* Black frame setting */
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbd, 0x01, 0x05);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	drm_dsc_pps_payload_pack(&pps, &ctx->dsc);
> +
> +	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_picture_parameter_set_multi(&dsi_ctx, &pps);
> +
> +	mipi_dsi_compression_mode_ext_multi(&dsi_ctx, true, MIPI_DSI_COMPRESSION_DSC, 1);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int sw49410_panel_disable(struct drm_panel *panel)
> +{
> +	struct sw49410_panel *ctx = to_sw49410_panel(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 128);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static int sw49410_panel_prepare(struct drm_panel *panel)
> +{
> +	struct sw49410_panel *ctx = to_sw49410_panel(panel);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(sw49410_supplies), ctx->supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	usleep_range(5000, 6000);
> +
> +	sw49410_panel_reset(ctx);
> +
> +	ret = sw49410_panel_program(ctx);
> +	if (ret)
> +		goto poweroff;
> +
> +	return 0;
> +
> +poweroff:
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(sw49410_supplies), ctx->supplies);
> +	return ret;
> +}
> +
> +static int sw49410_panel_unprepare(struct drm_panel *panel)
> +{
> +	struct sw49410_panel *ctx = to_sw49410_panel(panel);
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 100);
> +
> +	gpiod_set_value(ctx->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(sw49410_supplies), ctx->supplies);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
> +static const struct drm_display_mode sw49410_panel_mode = {
> +	.clock = (1440 + 168 + 4 + 84) * (3120 + 2 + 18 + 18) * 60 / 1000,
> +	.hdisplay = 1440,
> +	.hsync_start = 1440 + 168,
> +	.hsync_end = 1440 + 168 + 4,
> +	.htotal = 1440 + 168 + 4 + 84,
> +	.vdisplay = 3120,
> +	.vsync_start = 3120 + 2,
> +	.vsync_end = 3120 + 2 + 18,
> +	.vtotal = 3120 + 2 + 18 + 18,
> +	.width_mm = 65,
> +	.height_mm = 140,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static int sw49410_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &sw49410_panel_mode);
> +}
> +
> +static const struct drm_panel_funcs sw49410_panel_funcs = {
> +	.disable = sw49410_panel_disable,
> +	.prepare = sw49410_panel_prepare,
> +	.unprepare = sw49410_panel_unprepare,
> +	.get_modes = sw49410_panel_get_modes,
> +};
> +
> +static int sw49410_panel_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct sw49410_panel *ctx;
> +	int ret;
> +
> +	ctx = devm_drm_panel_alloc(&dsi->dev, __typeof(*ctx), panel,
> +				   &sw49410_panel_funcs, DRM_MODE_CONNECTOR_DSI);
> +

Spurious empty line

> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(sw49410_supplies),
> +		sw49410_supplies,
> +		&ctx->supplies
> +	);

Alignment is wrong, it should be:

ret = devm_regulator_bulk_get_const(dev, ARRAY_SIZE(sw49410_supplies),
				    sw49410_supplies, &ctx->supplies);

> +

Spurious empty line

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	ctx->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&ctx->panel);

Use the devm variant

> +
> +	/* This panel only supports DSC; unconditionally enable it */
> +	dsi->dsc = &ctx->dsc;
> +
> +	ctx->dsc.dsc_version_major = 1;
> +	ctx->dsc.dsc_version_minor = 1;
> +
> +	ctx->dsc.slice_height = 60;
> +	ctx->dsc.slice_width = 720;
> +
> +	WARN_ON(1440 % ctx->dsc.slice_width);
> +	ctx->dsc.slice_count = 1440 / ctx->dsc.slice_width;
> +	ctx->dsc.bits_per_component = 8;
> +	ctx->dsc.bits_per_pixel = 8 << 4; /* 4 fractional bits */
> +	ctx->dsc.block_pred_enable = true;
> +
> +	return mipi_dsi_attach(dsi);

Use the devm variant

> +}
> +
> +static void sw49410_panel_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct sw49410_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&ctx->panel);
> +}

Drop the remove after switching to the devm_ variants.

> +
> +static const struct of_device_id sw49410_of_match[] = {
> +	{ .compatible = "lg,sw49410" },
> +	{ .compatible = "lg,sw49410-lh609qh1" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sw49410_of_match);
> +
> +static struct mipi_dsi_driver sw49410_panel_driver = {
> +	.driver = {
> +		.name = "panel-lg-sw49410",
> +		.of_match_table = sw49410_of_match,
> +	},
> +	.probe = sw49410_panel_probe,
> +	.remove = sw49410_panel_remove,
> +};
> +module_mipi_dsi_driver(sw49410_panel_driver);
> +
> +MODULE_AUTHOR("Amir Dahan <system64fumo@tuta.io>");
> +MODULE_DESCRIPTION("DRM driver for LG DSI Panel with SW49410 controller");
> +MODULE_LICENSE("GPL");
> 


Thanks,
Neil
