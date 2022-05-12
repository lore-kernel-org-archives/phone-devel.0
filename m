Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78919C433FE
	for <phone-devel@archiver.kernel.org>; Thu, 12 May 2022 21:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358992AbiELVxe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 12 May 2022 17:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359032AbiELVw6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 12 May 2022 17:52:58 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768CC5F245
        for <phone-devel@vger.kernel.org>; Thu, 12 May 2022 14:52:12 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id r1so12186710ybo.7
        for <phone-devel@vger.kernel.org>; Thu, 12 May 2022 14:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1rN+CwqR+bH7StWcAdqh6rJz6EZ5daE9SrwU7kGYAAg=;
        b=uey7p3FPmlV8ybbB7CX62wvjMDfYMimWgr7YFNG/RN0kUBvJdIH6yAWPwDblMqcaom
         44H8zJ5WAZxERa36MnwbaP4ed62zhA5aDd1uF0Orwt5+v7Z3DDA0K3j3dbInN9yIu5Nj
         XFqhuzYE4eUestUpSIlEffLtN97Yg9+RT92Dgvn+eZtm0DwdQdYI48v7P2nSwQ3jgulR
         1+JcUs826xZLmLrM6z4OwDDLdy4td6XfnpsVUuH/oNkCS0QFnP5jekD/06uM5gGZNPEP
         VxsohkXFP5y3Dq7eSWVX5MsDKfnPxV5TyPhLA3N6lksUvuI0fTIGzmwFWa/N1XZxemvW
         9VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1rN+CwqR+bH7StWcAdqh6rJz6EZ5daE9SrwU7kGYAAg=;
        b=GlTUdP+NBnmzBk6aZ1Rrke2WVg05QM5AhnaHe6cb+gIWVGIQNizOQRVwh6QCGm5Dmh
         3OC6NV8jGsWbfERk9Bs+FpDtXaOZfMPZoO60lgDm4AbeXpLi+xVGfU1RzKxaEGMCveOP
         iHzs/fndbhYd+vdK//J+dabItwIP0a1DXvGH/3ucgJHFRxARRHdV+81qPd32YbXArHRh
         fB5X5zkCPYJJC51mPWPNT0eKb1cYWiYmXTvq4TxTYZQU4Jtk1NpoituZC0cCRCyhw3Mr
         FpWekPHlO4mbwhmgJml4IVnYNvE5UAbKupO/Kjvmg3glp12dF8XL0RymtAuCx3LfP55R
         BNww==
X-Gm-Message-State: AOAM531O0N4pLd7biuOO109PGPPBbdwLu8lqSM52a7k1gK8xUTXRcuMu
        CFxapCWKRQPL17+Ik4olwHMB86YDDj7QEbuvKlwcYw==
X-Google-Smtp-Source: ABdhPJzBciKJzRYibXRHHMHUQNthVJZ1oMHtE0x2iIbQxYaAk1bpoVS2cWCVmfOZEPSsSxUQs6HB561kBnOxHA40g/E=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr1891393ybp.492.1652392331408; Thu, 12
 May 2022 14:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651835715.git.jo@jsfamily.in> <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009B91FB7306503B58C264BD9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 May 2022 23:51:59 +0200
Message-ID: <CACRpkdYhkP9RYj98Lu=zkt+6aefx172R=8JtvOFpvh2uJ4byKA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: introduce ebbg,ft8719 panel
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Hao Fang <fanghao11@huawei.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, May 6, 2022 at 2:18 PM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

Cool!

> +#define dsi_generic_write_seq(dsi, seq...) do {                                \
> +               static const u8 d[] = { seq };                          \
> +               int ret;                                                \
> +               ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));    \
> +               if (ret < 0)                                            \
> +                       return ret;                                     \
> +       } while (0)
> +
> +#define dsi_dcs_write_seq(dsi, seq...) do {                            \
> +               static const u8 d[] = { seq };                          \
> +               int ret;                                                \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
> +               if (ret < 0)                                            \
> +                       return ret;                                     \
> +       } while (0)

First I don't see what the do {} while (0) buys you, just use
a basic block {}.

Second look at mipi_dbi_command() in include/drm/drm_mipi_dbi.h
this is very similar.

So this utility macro should be in a generic file such as
include/drm/drm_mipi_dsi.h. (Can be added in a separate
patch.)

Third I think you need only one macro (see below).

> +static int ebbg_ft8719_on(struct ebbg_ft8719 *ctx)
> +{
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct device *dev = &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +       dsi_dcs_write_seq(dsi, 0x00, 0x00);
> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19, 0x01);

It's dubious that you always have dsi_dcs_write_seq()
followed by dsi_generic_write_seq().

That means mipi_dsi_generic_write() followed by
mipi_dsi_dcs_write_buffer(). But if you look at these
commands in drivers/gpu/drm/drm_mipi_dsi.c
you see that they do the same thing!

Doesn't it work to combine them into one call for each
pair?

> +       dsi_dcs_write_seq(dsi, 0x00, 0x80);
> +       dsi_generic_write_seq(dsi, 0xff, 0x87, 0x19);

Lots of magic numbers. You don't have a datasheet do you?
So you could #define some of the magic?

> +       if (ctx->prepared)
> +               return 0;
(...)
> +       ctx->prepared = true;
> +       return 0;
(...)
> +       if (!ctx->prepared)
> +               return 0;
(...)
> +       ctx->prepared = false;
> +       return 0;

Drop this state variable it is a reimplementation of something
that the core will track for you.

The rest looks nice!

Yours,
Linus Walleij
