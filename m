Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88332C2B9F4
	for <phone-devel@archiver.kernel.org>; Fri, 25 Jun 2021 16:42:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6568461987
	for <phone-devel@archiver.kernel.org>; Fri, 25 Jun 2021 16:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhFYQoi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Jun 2021 12:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhFYQoi (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Jun 2021 12:44:38 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F23AC061574
        for <phone-devel@vger.kernel.org>; Fri, 25 Jun 2021 09:42:17 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id x6so5498394qvx.4
        for <phone-devel@vger.kernel.org>; Fri, 25 Jun 2021 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsozG1UsXB2tqec6xjxXbUbC1wkoz0cK0Wz9twWzXrE=;
        b=F1Px+J58uFH8y7P+rEv+X4VWjH7cFC1cbLejg11LMon62y5NIkwpKcPlpLqI8QX2+B
         UEyvysbgADqkiWRTwZq4c2vt0WL2SXKMRQW+qP6CgPXDpdJUjypEriQI8hGuolCnZTHX
         Br0mCzH4qazhAne4TFOTtmFpJERhGa5R8ydOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsozG1UsXB2tqec6xjxXbUbC1wkoz0cK0Wz9twWzXrE=;
        b=b/Xw/TfOA3VxXb0SU7CIw8Zf/WiLSbfilc6P0LrVAcO+edPtjaN9iDdOcHjuPnFmxK
         Y9E5BhvR6+mSEfkQE+WJ2UrDFaSZH5fLSdmiqbqe5FoS8jwLXChL6DMweW/o2+Y3N8Ha
         h04joVgvhBBdPkb3C2cZEpZo/jonK1+CE2lY3N7n113bDsJRelB93Djlt9fD+epQL9Bp
         rTzy50wtUzO17xxwnQAOywrE3J3HmAe7OHXomrqSoh2q5KfQMiFCQCF0tFvlnwAG2yEI
         NE/R15ueauRRwOgqHzLJs8HEvqIzRpg1KX+ca74EfG87tbQfcjMCpC/y8j4Icg0S+2Wc
         W+Sw==
X-Gm-Message-State: AOAM5325eCU6uVQLURTw1RSXyj7r2jrwQmIegMWfSiqSPGKQejuSai05
        IJt/K/U7F3FHmNZpxLaAt1JMmT/mvzGjvQ==
X-Google-Smtp-Source: ABdhPJyfB0cNPz6UaI6Aqd0UMDWlXfAoVHKNWmoIvC80TCJ5efzE7EY6Ta7BOYh1JHvU8u+c6o689A==
X-Received: by 2002:ad4:4eaf:: with SMTP id ed15mr12281754qvb.39.1624639335968;
        Fri, 25 Jun 2021 09:42:15 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id b2sm444203qte.18.2021.06.25.09.42.15
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 09:42:15 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id c8so5536363ybq.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Jun 2021 09:42:15 -0700 (PDT)
X-Received: by 2002:a25:60c1:: with SMTP id u184mr13311344ybb.343.1624639334895;
 Fri, 25 Jun 2021 09:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224458.2486701-1-linus.walleij@linaro.org>
In-Reply-To: <20210624224458.2486701-1-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Jun 2021 09:42:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
Message-ID: <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 3:47 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> @@ -5946,6 +5946,13 @@ S:       Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/vboxvideo/
>
> +DRM DRIVER FOR WIDECHIPS WS2401 PANELS
> +M:     Linus Walleij <linus.walleij@linaro.org>
> +S:     Maintained
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
> +F:     Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> +F:     drivers/gpu/drm/panel/panel-widechips-ws2401.c
> +
>  DRM DRIVER FOR VMWARE VIRTUAL GPU

nit: I assume this is supposed to be alphabetized? If so, [W]IDECHIPS
comes after [V]MWARE


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

nit: m[o]des sorts after m[i]pi


> +#define ws2401_command(ws, cmd, seq...) \
> +({ \
> +       struct mipi_dbi *dbi = &ws->dbi; \
> +       int ret; \
> +       ret = mipi_dbi_command(dbi, cmd, seq);  \
> +       if (ret) { \
> +               dev_err(ws->dev, "failure in writing command %02x\n", cmd); \
> +       } \

nit: don't need braces for the "if", right?

optional nit: use %#02x instead of %02x


> +})
> +
> +static void ws2401_read_mtp_id(struct ws2401 *ws)
> +{
> +       struct mipi_dbi *dbi = &ws->dbi;
> +       u8 id1, id2, id3;
> +       int ret;
> +
> +       ret = mipi_dbi_command_read(dbi, WS2401_READ_ID1, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 1\n");
> +               return;
> +       }
> +       ret = mipi_dbi_command_read(dbi, WS2401_READ_ID2, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 2\n");
> +               return;
> +       }
> +       ret = mipi_dbi_command_read(dbi, WS2401_READ_ID3, &id1);
> +       if (ret) {
> +               dev_err(ws->dev, "unable to read MTP ID 3\n");
> +               return;
> +       }
> +       dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);

Does this need to be printed every time you power on the panel? Seems
like it's going to spam up the logs... I'm not sure what it's used
for.


> +static int ws2401_power_off(struct ws2401 *ws)
> +{
> +       /* Disable backlight */
> +       if (ws->bl)
> +               ws2401_command(ws, WS2401_WRCTRLD, 0x00);

I don't have any real knowledge here, but the location of this seems a
little odd. Just based on inspection of the rest of the driver, I
almost would have thought it would need to be sent _before_ entering
sleep mode, but I certainly could be wrong.


> +static int ws2401_disable(struct drm_panel *panel)
> +{
> +       struct ws2401 *ws = to_ws2401(panel);
> +
> +       ws2401_command(ws, MIPI_DCS_SET_DISPLAY_OFF);
> +       msleep(25);

It feels weird / arbitrary the split between "disable" and "unprepare"
on this panel driver compared to the "db7430.c" one. In the other
driver you put the sleep mode here and in this driver you put the
sleep mode un "unpreapre". Is that for a reason, or just arbitrary?
Can it be consistent between the two drivers?

I guess maybe this is because in "db7430" the power up order was
slightly different?


> +static const struct backlight_ops ws2401_bl_ops = {
> +       .update_status = ws2401_set_brightness,
> +};
> +
> +const struct backlight_properties ws2401_bl_props = {

"static const" instead of "const"?


> +       ret = drm_panel_of_backlight(&ws->panel);
> +       if (ret) {
> +               dev_info(dev, "no external backlight, using internal backlight\n");
> +               ws->bl = devm_backlight_device_register(dev, "ws2401", dev, ws,
> +                                                       &ws2401_bl_ops, &ws2401_bl_props);
> +               if (IS_ERR(ws->bl)) {
> +                       ret = PTR_ERR(ws->bl);
> +                       return dev_err_probe(dev, ret,
> +                                            "failed to register backlight device\n");

nit: probably didn't need the separate assignment to "ret". Just pass
"PTR_ERR(ws->bl)" to the function. Then no need for braces for your
"if" too.

> +               }
> +               ws->panel.backlight = ws->bl;
> +       } else {
> +               dev_info(dev, "using external backlight\n");

This (and the other "no extenal backlight") feels a bit chatty to me.
If you really want them and want them at "info" level then I won't
object, but I guess I like short logs even with "info" enabled.

-Doug
