Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5288C4338F
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:34:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93A9F6052B
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:34:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbhGZGx6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jul 2021 02:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbhGZGxz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jul 2021 02:53:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EDBC061757
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:34:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id h14so13780700lfv.7
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WzDj03+uxLgpoaWPrzchlzGJJRHt1KDyhKLfW9KxchY=;
        b=HHqCwgyGLk0Ov3RHSfpHlqmMBwt5TuC97L4nerS0XtXoP8DI5MLxkyrP+gAoQlQ4lV
         xH0yLFwgDpntDSy79PE3K3YJpqpt5gI1O4nxu6sR7TGuipxNCOV5VXIas3GWMLnYi6gQ
         EE++XcigBwGznPWEZMtrHSb/I9HMp3ZnTKu8skB1zwoEBfOdTHdZc2TnB62KC541rcZM
         3mK2jfGuENnG97VhsBrQ7JqZYXzYRFw/zTQJEZk/5TLck3W3bo0Byz5+bMlivxJvM/LL
         NHtq7QccDdCUkrQ/9XKBkgGKSmilFwRXJkyoeXgYVb24q8OXwe57Qe3IiYl3Wwn5My2c
         TM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WzDj03+uxLgpoaWPrzchlzGJJRHt1KDyhKLfW9KxchY=;
        b=jhKnWAHeq2jD4z9YrvDRn1PQPljdBtbQYot0OZFcPCa2Xst4fTZxEH8kHRPqoSdhOd
         5dfSLnTuzpbWbINhBncbLcW2LSvl6xYVlAxA2bFDmlGsL0U0TRNj9FoXzadp1wwvDF48
         giMiMhqQdj4eyJ+TVmgYEQj+he2QjUhMWfe8JrD7yatwiSoR5PHGzb2CF4mEMRHLTn2V
         36xb2OqP8BA6TV5vr5ru74hqQmGuChb85oI133i6ut3TohQe7gZjC4oTPvOXLlIF0tY1
         cmdU5FMegGm2kgmwvl+cNaPUiZscJkDIwvK2cXa0hiL7vYGZ4PhxAGb51jfGjbD21+TN
         pbzw==
X-Gm-Message-State: AOAM530Vp+Jcc8ImiRpg9wRDrIXAxnIjv//hodcpteXiVhyeehiqfhY8
        QqmU3cyUhpzprGO3QFGWCfOgqcIXsBrYPbLYouDOHw==
X-Google-Smtp-Source: ABdhPJwbLFqSyy74K8M+dukb4YtYay7Zz9Rpac3plBuqfsj3peN7OHDMZlo+UvvrDG6M66iSFDucy0RcrwWyXRRQ1D0=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr11760484lfr.465.1627284862797;
 Mon, 26 Jul 2021 00:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210201165307.51443-1-iskren.chernev@gmail.com> <20210201165307.51443-2-iskren.chernev@gmail.com>
In-Reply-To: <20210201165307.51443-2-iskren.chernev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jul 2021 09:34:11 +0200
Message-ID: <CACRpkdai5+vDj0C053qfPkdM-FCC-74HDCVF4=SPtUb7LE=Srw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add panel for Samsung Galaxy S5
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Iskren,

thanks for your patch!

On Mon, Feb 1, 2021 at 5:56 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:

> The Samsung Galaxy S5 uses the samsung s6e3fa2 AMOLED cmd LCD panel.
>
> This driver was generated with [1], with the addition of
> mipi_dsi_dcs_set_display_on at the end of the on method.
>
> [1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>

(...)

> +config DRM_PANEL_SAMSUNG_S6E3FA2
> +       tristate "Samsung S6E3FA2 DSI cmd mode panel"

Spell it out "command mode" no need to abbreviate.

> +struct samsung_s6e3fa2 {
> +       struct drm_panel panel;
> +       struct mipi_dsi_device *dsi;
> +       struct regulator_bulk_data supplies[2];
> +       struct gpio_desc *reset_gpio;
> +       bool prepared;

Why do you need to keep track of prepared?
The framework already does that and that is why it keeps
different callbacks for prepare and enable.

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

Maybe this is something we should add to
include/drm/drm_mipi_dsi.h?
It looks very generic and helpful.

> +static void samsung_s6e3fa2_reset(struct samsung_s6e3fa2 *ctx)
> +{
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       usleep_range(5000, 6000);

There is really no need to do this, the next statement asserts
reset. It looks like a copy/paste thing from a less informed
framework.

> +       gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +       usleep_range(5000, 6000);
> +       gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> +       usleep_range(7000, 8000);

These two look good.

> +static int samsung_s6e3fa2_on(struct samsung_s6e3fa2 *ctx)
> +{
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct device *dev = &dsi->dev;
> +       int ret;
> +
> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +       dsi_generic_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +       dsi_generic_write_seq(dsi, 0xfc, 0x5a, 0x5a);

These are very similar to other Samsung panels so you can definately
add this to your driver:

#define S6E3FA2_LEVEL_2_KEY         0xf0

> +       dsi_generic_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +       dsi_generic_write_seq(dsi, 0xfc, 0xa5, 0xa5);

Add a comment that this locks level 2 control again.

> +static int samsung_s6e3fa2_prepare(struct drm_panel *panel)
> +{
> +       struct samsung_s6e3fa2 *ctx = to_samsung_s6e3fa2(panel);
> +       struct device *dev = &ctx->dsi->dev;
> +       int ret;
> +
> +       if (ctx->prepared)
> +               return 0;

Looks unnecessary. The framework should keep track of this.

> +       dsi->lanes = 4;
> +       dsi->format = MIPI_DSI_FMT_RGB888;
> +       dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> +                         MIPI_DSI_CLOCK_NON_CONTINUOUS;

You are not setting dsi->hs_rate and dsi->lp_rate.
The panel definitely has these max timings so when you
don't set them the DSI host will just go with some defaults
(some of them don't even allow you to configure this).

For reusability it would be great if you know roughly what these
clocks are, sometimes board files in vendor trees give a hint.

Worst case drop a comment that HS and LP rates are unknown.

I also wonder if the panel can report an MTP ID?

If you add some code like this and call from prepare(), what
happens?

#define READ_ID1                 0xda /* Read panel ID 1 */
#define READ_ID2                 0xdb /* Read panel ID 2 */
#define READ_ID3                 0xdc /* Read panel ID 3 */

static int s6e3fa2_read_id(struct samsung_s6e3fa2 *ctx)
{
        struct mipi_dsi_device *dsi = ctx->dsi;
        struct device *dev = &dsi->dev;
        u8 id1, id2, id3;
        int ret;

        ret = mipi_dsi_dcs_read(dsi, READ_ID1, &id1, 1);
        if (ret < 0) {
                dev_err(dev, "could not read MTP ID1\n");
                return ret;
        }
        ret = mipi_dsi_dcs_read(dsi, READ_ID2, &id2, 1);
        if (ret < 0) {
                dev_err(dev, "could not read MTP ID2\n");
                return ret;
        }
        ret = mipi_dsi_dcs_read(dsi, READ_ID3, &id3, 1);
        if (ret < 0) {
                dev_err(dev, "could not read MTP ID3\n");
                return ret;
        }

        dev_info(dev, "MTP ID manufacturer: %02x version: %02x driver:
%02x\n", id1, id2, id3);

        return 0;
}

(Dry coded, but you get the idea.)

Yours,
Linus Walleij
