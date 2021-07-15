Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C6AC47E48
	for <phone-devel@archiver.kernel.org>; Thu, 15 Jul 2021 02:25:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B7C6127C
	for <phone-devel@archiver.kernel.org>; Thu, 15 Jul 2021 02:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhGOC2Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Jul 2021 22:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbhGOC2X (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Jul 2021 22:28:23 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB51C06175F
        for <phone-devel@vger.kernel.org>; Wed, 14 Jul 2021 19:25:30 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id w13so3514270qtc.0
        for <phone-devel@vger.kernel.org>; Wed, 14 Jul 2021 19:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=McBq68M+HsWMO7TnkYEiDyLYccEzmurvCsExjxpoKnY=;
        b=cijbUUgggTcNqbllSrtS1wkZhN1lCIRy1EHbQHn8iR7GmtvV0qmcHImAGokNOmWsYf
         Z+6xs3jEFiDEEwUnv3nb0cpnmXtfBQPT6tf78UQihArg2dw2wfRLOrmOGKOUPwTmlkLp
         s51vxj3pDrwXc8OdrOiEiZvuKSQoomzmt20mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=McBq68M+HsWMO7TnkYEiDyLYccEzmurvCsExjxpoKnY=;
        b=cymh8V66G9cBEwaWURNTYIP9H01PKh7Y33/UfKyJ2ZwNE2FFaxB1+rBW2+ViOtDNYi
         mHcZiNZhFQU8DvVBq95SCziSH3aud71vW422AQbZPRXSxKDEZ3rhZ9kcfcenxn0O2+6r
         6E/c3ubxqJTYMMRKYVZFWEAcbdGTSuWoSgLyYsy6cWIolyYMx5/byC1fyZ9Nr9goNQZQ
         nQ0W6UZI+o/Rjyd9OWHY1+k5iZE5oVWv2w5CGHThvC/SJrZMUmvg02rZwzkmJ7CE2H/+
         ukxtj7nGnzmj8H5kqvYiUQsHfJKPz0GYAlNkH8uB4v+ubwQXNvO7ZpRxea84gj4RL1Sk
         dujA==
X-Gm-Message-State: AOAM530wW3fykUw9Z/hng+SnY6mf3g+TLbD2/616BVaBrLwEGfkj4Jw2
        BuYa4i1M58y7iJ8JgdQzPf40GlGqkyw4YA==
X-Google-Smtp-Source: ABdhPJwa+DL9kaCa93B5KqyT6WF4WcJl7MibLvC2bNMH6BAwo4BxO5eg1xqnXE1ZANF7UKj+srTdpA==
X-Received: by 2002:a05:622a:c6:: with SMTP id p6mr1384190qtw.305.1626315929147;
        Wed, 14 Jul 2021 19:25:29 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id z22sm1937413qki.54.2021.07.14.19.25.28
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 19:25:28 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id g5so6464109ybu.10
        for <phone-devel@vger.kernel.org>; Wed, 14 Jul 2021 19:25:28 -0700 (PDT)
X-Received: by 2002:a25:8082:: with SMTP id n2mr1538174ybk.79.1626315927662;
 Wed, 14 Jul 2021 19:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210714225002.1065107-1-linus.walleij@linaro.org> <20210714225002.1065107-2-linus.walleij@linaro.org>
In-Reply-To: <20210714225002.1065107-2-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Jul 2021 19:25:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
Message-ID: <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] drm/panel: ws2401: Add driver for WideChips WS2401
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

On Wed, Jul 14, 2021 at 3:52 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
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
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:
> - Add more talkative Kconfig telling which mobile phone has this.
> - Make sure to turn off the internal backlight totally if requested.
> - Alter the logic so that we assign the backlight handle to
>   panel->backlight directly and save some code.

Officially this is disallowed according to comments. ...and I quote:

/**
 * @backlight:
 *
 * Backlight device, used to turn on backlight after the call
 * to enable(), and to turn off backlight before the call to
 * disable().
 * backlight is set by drm_panel_of_backlight() or
 * drm_panel_dp_aux_backlight() and drivers shall not assign it.
 */

I do not personally know the motivation of not letting drivers assign
it, but with the words "shall not". Yikes!

-Doug
