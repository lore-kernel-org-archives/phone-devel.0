Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7603CC07E9C
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 20:04:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E10361419
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 20:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhGHUHe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Jul 2021 16:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhGHUHe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Jul 2021 16:07:34 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB15C061574
        for <phone-devel@vger.kernel.org>; Thu,  8 Jul 2021 13:04:51 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id f12so4820803qtf.5
        for <phone-devel@vger.kernel.org>; Thu, 08 Jul 2021 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uPw+0QJuY5Q09jTgOGFaWLvfQj6r7YCC88pG09d9eQ0=;
        b=W1+rZYCrvHU7VgIu2eBCFOeAfLxz4b4WUKFEgAcUzzxr7KE0nxGi/2ttANL2+3JiQr
         cB+bEP+nYjQYgTxfy9e0hNiHlXM0ZkwlnVkSX0v2cxzUkLaRuguTF18w9PcaKslYWAd3
         L38WveaxPZt6R37upOEgyO5LAaJUVQQE/3zHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uPw+0QJuY5Q09jTgOGFaWLvfQj6r7YCC88pG09d9eQ0=;
        b=Be+G+KoeVXiK5ilsSty+O5nLyDbK/tSmE+jQrKYE8f4LyLDEtVvIqnVAGIL9qk6amS
         P+5g0wHhIqMBkwBUZJWkf0P/7U7gZS+Ojvfrs7GAQKLIo5HB6aDK6swZGA/HYcNJjVmO
         TZEZBka92kmZbg/8OyUv6C4OLC2Fr3IV7D0JfH7yNU5y74RrPA+CF+YJxa5mOZ/OX2U0
         FujmlKgKjfSDuJrfD9pVFSTxvdmHMpzqPmOpewXh3ziF6Qa/4bK89+E9khyCVpQk/O9t
         kMcIDJ9BSYWoyXxhHz0S2sQLXu7L8a3X0LhhvRUoAqq/6fBeZ4iItac2d0OGPGqBLo+C
         R47A==
X-Gm-Message-State: AOAM530Fj4VMneiDCYTh12g8QWSe43uxxlwWoMNJ7K4fzLdjFyvBK+TQ
        +UI/Yb+IF9pErCfmvL/adGHUz5OHOoWCeg==
X-Google-Smtp-Source: ABdhPJwDLRhrP1Un5N4zsJHd6mwKQLthBdQQtNRnxmnPJm/Vr14CfrLus9fInGnp6R2eGSb1RJIVvA==
X-Received: by 2002:ac8:549:: with SMTP id c9mr29630035qth.80.1625774690548;
        Thu, 08 Jul 2021 13:04:50 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id x14sm1329281qtv.17.2021.07.08.13.04.50
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 13:04:50 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i4so10953088ybe.2
        for <phone-devel@vger.kernel.org>; Thu, 08 Jul 2021 13:04:50 -0700 (PDT)
X-Received: by 2002:a25:dc50:: with SMTP id y77mr41917648ybe.405.1625774689596;
 Thu, 08 Jul 2021 13:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org> <20210707234315.242663-2-linus.walleij@linaro.org>
In-Reply-To: <20210707234315.242663-2-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jul 2021 13:04:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkppOGLbgAMf-t+d8eAMcV9kiPGprHtKdeck0YhUnYrg@mail.gmail.com>
Message-ID: <CAD=FV=UkppOGLbgAMf-t+d8eAMcV9kiPGprHtKdeck0YhUnYrg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Wed, Jul 7, 2021 at 4:55 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
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
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Drop the ws2401_command() macro - we enhanced the
>   mipi_dbi_command() to print errors for everyone instead.
> - Read out MTP properly (used wrong variables)
> - Register internal backlight if and only if the panel->backlight
>   field is NULL after trying to look up external backlight.
> ChangeLog v1->v2:
> - Disable the backlight in ->unprepare() before entering sleep
>   mode.
> - If we are not using internal backlight, close the L2 access
>   after initializing.
> - Depromote some talkative dev_info()s to dev_dbg().
> - Power up and read the MTP values before we register the display.
>   This works fine and is probably how MTP is supposed to work.
> - Fix the set-up of gamma values, this was found in the GT-I8160 HD
>   kernel tree.
> - Bail out properly if drm_panel_of_backlight() returns
>   -EDEFER_PROBE.
> - Drop OF from dependencies since drm_panel_of_backlight() has
>   static inline stubs in the header file.
> - Sort MAINTAINERS properly.
> - Alphabetize includes
> - Use format specifier %#02x so we get 0x... output in debug
> - Drop unnecessary braces around if () in debug macro
> - Drop unused <of.h> include.
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-widechips-ws2401.c    | 436 ++++++++++++++++++
>  4 files changed, 453 insertions(+)

Looks nice to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
