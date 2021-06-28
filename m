Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04F3C49EAB
	for <phone-devel@archiver.kernel.org>; Mon, 28 Jun 2021 09:30:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B261A61C5C
	for <phone-devel@archiver.kernel.org>; Mon, 28 Jun 2021 09:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhF1JdD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhF1JdC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Jun 2021 05:33:02 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173B7C061574
        for <phone-devel@vger.kernel.org>; Mon, 28 Jun 2021 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds202012; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P7K4qB/yrQ2EoW+RSXh2al0SDXCW/M7yQIF8cpspe6I=; b=AIfiysXwWX0P+pc7Qdsawkpf1L
        I4H/fCw+yLcp5eLNGSIBedhGyPfjlLH28+lJFCd7tft5nimvpqjxPkxCwwLvpcdMZAQ/TJQoEtOce
        BGj4KnOrJtE/r7R1KDuaO87IvoxebcQzi7WmL5M2uF0Ftw3WSezSBDvhxVAFEB6rQuMYUAbhUqbFP
        JkwtgekNQlr+tOgeiRuRO4WNj9kkLwKhCqkxGuREmEqISA2CxvTrEeyd1hFYETAKZ+TJMzxCuRBvr
        CWSFWyaxA8Yuzfh5FUA8tVRw6UkSQsv8sJ5xu2mTVEdxjLARlMEXP1JzVB/zYAdAmg9RglLnEfyZL
        PaC7akmA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62436 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1lxnb6-0004Rp-J5; Mon, 28 Jun 2021 11:30:32 +0200
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
To:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org
Cc:     phone-devel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
References: <20210624224458.2486701-1-linus.walleij@linaro.org>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d7dc8987-60ab-41c2-0200-a7f6a8ae837c@tronnes.org>
Date:   Mon, 28 Jun 2021 11:30:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624224458.2486701-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



Den 25.06.2021 00.44, skrev Linus Walleij:
> This adds a driver for panels based on the WideChips WS2401 display
> controller. This display controller is used in the Samsung LMS380KF01
> display found in the Samsung GT-I8160 (Codina) mobile phone and
> possibly others.
> 
> As is common with Samsung displays manufacturer commands are necessary
> to configure the display to a working state.
> 
> The display optionally supports internal backlight control, but can
> also use an external backlight.
> 
> This driver re-uses the DBI infrastructure to communicate with the
> display.
> 
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4894913936e9..f4fe1dba9912 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -552,6 +552,15 @@ config DRM_PANEL_VISIONOX_RM69299
>  	  Say Y here if you want to enable support for Visionox
>  	  RM69299  DSI Video Mode panel.
>  
> +config DRM_PANEL_WIDECHIPS_WS2401
> +	tristate "Widechips WS2401 DPI panel driver"
> +	depends on OF && SPI && GPIOLIB

I couldn't find any OF dependency in the driver?

> +	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_MIPI_DBI
> +	help
> +	  Say Y here if you want to enable support for the Widechips
> +	  WS2401 DPI 480x800 display controller.
> +
>  config DRM_PANEL_XINPENG_XPP055C272
>  	tristate "Xinpeng XPP055C272 panel driver"
>  	depends on OF

> diff --git a/drivers/gpu/drm/panel/panel-widechips-ws2401.c b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
> new file mode 100644
> index 000000000000..d15870301174
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-widechips-ws2401.c
> @@ -0,0 +1,404 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Panel driver for the WideChips WS2401 480x800 DPI RGB panel, used in
> + * the Samsung Mobile Display (SMD) LMS380KF01.
> + * Found in the Samsung Galaxy Ace 2 GT-I8160 mobile phone.
> + * Linus Walleij <linus.walleij@linaro.org>
> + * Inspired by code and know-how in the vendor driver by Gareth Phillips.
> + */
> +#include <drm/drm_modes.h>
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

AFAICS there are no users of this header.

> +#include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
> +
> +#include <video/mipi_display.h>
> +

> +static const u8 ws2401_dbi_read_commands[] = {
> +	WS2401_READ_ID1,
> +	WS2401_READ_ID2,
> +	WS2401_READ_ID3,
> +	0, /* sentinel */
> +};
> +

> +static void ws2401_read_mtp_id(struct ws2401 *ws)
> +{
> +	struct mipi_dbi *dbi = &ws->dbi;
> +	u8 id1, id2, id3;
> +	int ret;
> +
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 1\n");
> +		return;
> +	}
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id1);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 2\n");
> +		return;
> +	}
> +	ret = mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id1);
> +	if (ret) {
> +		dev_err(ws->dev, "unable to read MTP ID 3\n");
> +		return;
> +	}
> +	dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
> +}

Why do you read these id's on every power on, it doesn't look like you
use them?

If they're just informational, they should be available through debugfs,
see mipi_dbi_debugfs_init().

> +static int ws2401_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct ws2401 *ws;
> +	int ret;
> +
> +	ws = devm_kzalloc(dev, sizeof(*ws), GFP_KERNEL);
> +	if (!ws)
> +		return -ENOMEM;
> +	ws->dev = dev;
> +
> +	/*
> +	 * VCI   is the analog voltage supply
> +	 * VCCIO is the digital I/O voltage supply
> +	 */
> +	ws->regulators[0].supply = "vci";
> +	ws->regulators[1].supply = "vccio";
> +	ret = devm_regulator_bulk_get(dev,
> +				      ARRAY_SIZE(ws->regulators),
> +				      ws->regulators);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> +
> +	ws->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ws->reset)) {
> +		ret = PTR_ERR(ws->reset);
> +		return dev_err_probe(dev, ret, "no RESET GPIO\n");
> +	}
> +
> +	ret = mipi_dbi_spi_init(spi, &ws->dbi, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
> +	ws->dbi.read_commands = ws2401_dbi_read_commands;
> +
> +	drm_panel_init(&ws->panel, dev, &ws2401_drm_funcs,
> +		       DRM_MODE_CONNECTOR_DPI);
> +
> +	ret = drm_panel_of_backlight(&ws->panel);
> +	if (ret) {

I fail to understand how to use internal backlight. If there's no
backlight DT property, ret will be zero, right?

of_find_backlight() can return -EPROBE_DEFER which will also end up here...

> +		dev_info(dev, "no external backlight, using internal backlight\n");

Like Doug I'm not a fan of these backlight info messages, things like
these clutter up the boot log. It should be possible to glean this info
from the backlight sysfs node should it be important for debugging.

Noralf.

> +		ws->bl = devm_backlight_device_register(dev, "ws2401", dev, ws,
> +							&ws2401_bl_ops, &ws2401_bl_props);
> +		if (IS_ERR(ws->bl)) {
> +			ret = PTR_ERR(ws->bl);
> +			return dev_err_probe(dev, ret,
> +					     "failed to register backlight device\n");
> +		}
> +		ws->panel.backlight = ws->bl;
> +	} else {
> +		dev_info(dev, "using external backlight\n");
> +	}
> +
> +	spi_set_drvdata(spi, ws);
> +
> +	drm_panel_add(&ws->panel);
> +	dev_dbg(dev, "added panel\n");
> +
> +	return 0;
> +}
