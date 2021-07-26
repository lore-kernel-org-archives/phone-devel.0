Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4B1C432BE
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 08:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D46060F48
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 08:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhGZHYN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jul 2021 03:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhGZHYM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jul 2021 03:24:12 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3BFC061760
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 01:04:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g13so13866289lfj.12
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JaI5tMmGQ6u98h9ZILTU3YhFCXLcWCQyd9cfLKgPW1k=;
        b=L5eXBlAdenGgpJiocQZYRMObAVfbv9J7w6HU2XYcpdnmb117sEi7ETc8Zj5BYEj7U6
         J67TnqrsLDBoN+S62WA/jmWIwn3JWJxTKd81B9rOh28bwN3605pT5QG8/IUES9lhAOVe
         msSTSb6R7EkgsJ/814lekoOc1lQzW5y9zqAnP3vXmWL8sdNlZ8X+O4ZM7idI/jD7APaF
         WT/EgZn+SGayNXIWOhMrEdWb6BXeqg2YDI/8Izv8EbVo+bmRIbzAVuX42zqfFFibjqiF
         Nvs2f/Vx8XbCZ5a8LKtnQo0U28KU+UBXR9BX5Yyv3rrAGGEdXI4WXpUwsp4PrnXhw3hL
         AsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JaI5tMmGQ6u98h9ZILTU3YhFCXLcWCQyd9cfLKgPW1k=;
        b=oUIW5Xl26jRnBgXJGuhLL5A/1Wn1fmLMYu9shHxG/SFUZ63hPdPM54wnglwxR+TaIA
         1mvyxseUIDTttLaA44lXxQvphn45QvFb3Ow3A6Q9p0hK31ee9MTAEJP3ydE5GDdzetRr
         X+XF4bDs0D9AohUU8UxtTVIKSVl0ue7k22tFATfDguTityZ4NskozF/wdj6aBJ2aAzC0
         WY6uI2nbe2PJyzdXJE6yjr9ucyl07/PkueCwBuYW3iGhnJc1n4qJTmHQ0jdViHvskKlW
         IW6yVQwma6ErDGpDXVFmN+6OcvEppHBN+lXvgZgxKCMTpVC8p2pRkByaAyqtGLB1KGsi
         CRTg==
X-Gm-Message-State: AOAM530dftVR63v0vc77nwclx76AClX01KM0ZDmS32J3BxvrN3tV034a
        iCGcv5yqfkRgf7H2ww3kfppIiFFHMHExqqAhzc4vLg==
X-Google-Smtp-Source: ABdhPJzyoEZtO9nOO7nmGhvK5qqZEvFi8VPOukrSWdKMXB8VF7HX6PJ2p5r2t+ai2avlkN++c3nSY8UxAqeePM2vWT4=
X-Received: by 2002:a05:6512:3696:: with SMTP id d22mr12378703lfs.586.1627286678860;
 Mon, 26 Jul 2021 01:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210725140339.2465677-1-alexeymin@postmarketos.org> <20210725140339.2465677-2-alexeymin@postmarketos.org>
In-Reply-To: <20210725140339.2465677-2-alexeymin@postmarketos.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jul 2021 10:04:28 +0200
Message-ID: <CACRpkdbpxQdyTVKkKGCtjLGn5G9L2=w-dhyMpgJP42_tpLU6Pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add Samsung S6E3FA2 DSI panel driver
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Alexey,

I had some gmail problems and replied to the very old driver
by Iskren, sorry for the mess.

I overall like this driver a lot. Some of Sam's comments could
be addressed especially for backlight.

I think the driver should indeed handle both the physical
displays like you do here.

On Sun, Jul 25, 2021 at 4:05 PM Alexey Minnekhanov
<alexeymin@postmarketos.org> wrote:

> Samsung S6E3FA2 panel is amoled 1080x1920 command mode DSI
> panel used in Samsung Galaxy S5 phone. There are 2 known
> variations of panel that were shipped in this phone, and
> this driver handles both of them.
>
> Panel has built-in backlight (like all other AMOLED panels),
> controlled over DSI by some vendor specific commands, some
> of them include sending long byte sequences of what seems
> to be called "smart dimming".
>
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

(...)

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

These look generic as pointed out in other mail.

> +static int s6e3fa2_dsi_dcs_read1(struct mipi_dsi_device *dsi, const u8 cmd,
> +                               u8 *data)
> +{
> +       int ret;
> +
> +       ret = mipi_dsi_dcs_read(dsi, cmd, data, 1);
> +       if (ret < 0) {
> +               dev_err(&dsi->dev, "could not read DCS CMD %02x\n", cmd);
> +               return ret;
> +       }
> +       return 0;
> +}

I don't think this needs a wrapper, just call mipi_dsi_dcs_read() directly.

> +/* Panel variants */
> +#define LCD_ID_S6E3FA2         0x602813
> +#define LCD_ID_EA8064G         0x622872

Interesting use of the "vendor" byte by Samsung here. It seems they are
repurposing the non-standard MTP bytes as they seem fit.

> +/*
> + * Which AID sequence to use for each candela level.
> + * This lookup table is same for both panels.
> + */
> +static const u8 map_candela_to_aid[S6E3FA2_NUM_GAMMA_LEVELS] = {
> +        0,  2,  3,  4,  6,  7,  8, 10, 11, 13, 14, 15,
> +       16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 27, 28,
> +       29, 30, 31, 32, 33, 34, 35, 36, 36, 36, 36, 36,
> +       36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 37, 38,
> +       39, 40, 41, 42, 43, 44, 44, 44, 44, 44, 44, 44
> +};

This and other things hints that we are dealing with the same display
controller.

> +/* Other panel drivers call these commands test_key_enable/disable */
> +static const u8 seq_s6e3fa2_test_key_en[6] = {
> +       0xf0, 0x5a, 0x5a,
> +       0xfc, 0x5a, 0x5a
> +};

0xf0 and 0xfc is obviously some "level 2 unlock" commands.
Maybe #define them as pointed out in other comments.

> +static const u8 seq_s6e3fa2_test_key_dis[6] = {
> +       0xf0, 0xa5, 0xa5,
> +       0xfc, 0xa5, 0xa5
> +};
> +static const u8 seq_ea8064g_test_key_en[6] = {
> +       0xf0, 0x5a, 0x5a,
> +       0xf1, 0x5a, 0x5a
> +};
> +static const u8 seq_ea8064g_test_key_dis[6] = {
> +       0xf1, 0xa5, 0xa5,
> +       0xf0, 0xa5, 0xa5
> +};

The use of two different registers for locking is suspicious, that
may point to different display controllers. :/

This is an icky panel, but it seems they are close enough to
be handled by the same driver IMO.

Yours,
Linus Walleij
