Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D0BC11F69
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 15:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91FD76161C
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 15:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbhF3Pnb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Jun 2021 11:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235508AbhF3Pna (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Jun 2021 11:43:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D610C061756
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 08:41:01 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q18so5907868lfc.7
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mcV9E45NKZ7hefc23azn5TjlOzKOt4blMnnIG7hMOYM=;
        b=WofXnVuKi1awkT5IU8azRO9FORp2TaEsALsyUD/7deHNdYkzYwvx0xwEmgZZ3fsVTh
         s90qRevq7hppcPMtU2SmpJwY1VRh6MFRN0jdY3rH4bUYSBaN3TtfdHBYJxOL6hOs4cnn
         wEL/jvincPT8FjquX+gjih9trq7DYKFEqBFyIkdEbkB6I21b33r5q5ppy4iMOmrGLZXY
         b8lKhl60f3UWc9SHHQdDOZIxpMAfNV/u1irHo0aGtNtEANT14+KEhtMC8USrH9IFEoKz
         Fgg4VcGnBAYvWK3h7L9UFEJMfBQOsr/lZNHSc9u0k4W4rdcfgd6wV5buq8CWECJt6Irz
         OpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcV9E45NKZ7hefc23azn5TjlOzKOt4blMnnIG7hMOYM=;
        b=BdlGDKyLGlSeK1w/liF5GqQw0Du4d+LR/5iWajhB4bF6nNhcb3Tf8UzslnIuExRUTK
         J26WoaVfrC1lHt+WMXRyu6fX7CvoMZF800KPno4EjwU4KEli1MsxR0oYAOEKiSBThd2L
         CZP7d7TQb8ausoeYU9+m5J6kRRzjZQaNQiiDCo71uQvSStlZY9dpu9jtASGTMIjpdym3
         oU4KBAas36XGBvC0IBbIALxjAulzb18j/6hUh0uy3uJrrX9+jjcfpPrQJq0HgxSRtn2U
         zC/qaJczp0urLX3CvnxH85ube5tvNfqxc851xip/2TvMI6QLb4dTppEHEn0qrVp3kwdJ
         eOSw==
X-Gm-Message-State: AOAM532aI5kywFhhTNSrG08976vDYIY4X9gAy/23f2sg993r/+EuvYbt
        IGpiXaIHJT/qrwdQHfQui7QZj2vU4hd/8uerKERZAQ==
X-Google-Smtp-Source: ABdhPJzl6dq3J7qwb9y320AWZIMj7FHdoSUgKWNSG+CpcV4qA+zbvtRDrXffwl1urZpHJ2sjIoDTFXssQ3NBLPnqupc=
X-Received: by 2002:a19:c141:: with SMTP id r62mr2125685lff.157.1625067659809;
 Wed, 30 Jun 2021 08:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224458.2486701-1-linus.walleij@linaro.org> <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
In-Reply-To: <CAD=FV=UdaGnUk8E9JobeTfS4nQdHxXbc++T2UtCmyzRLu5eeJA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Jun 2021 17:40:48 +0200
Message-ID: <CACRpkdamGu73CMm9N-mNKZ33B76eO32RT9Gw3hUk+p76WyN32g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
To:     Doug Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Doug,

thanks for your review! I fixed most things except this:

On Fri, Jun 25, 2021 at 6:42 PM Doug Anderson <dianders@chromium.org> wrote:

> > +static int ws2401_disable(struct drm_panel *panel)
> > +{
> > +       struct ws2401 *ws = to_ws2401(panel);
> > +
> > +       ws2401_command(ws, MIPI_DCS_SET_DISPLAY_OFF);
> > +       msleep(25);
>
> It feels weird / arbitrary the split between "disable" and "unprepare"
> on this panel driver compared to the "db7430.c" one. In the other
> driver you put the sleep mode here and in this driver you put the
> sleep mode un "unpreapre". Is that for a reason, or just arbitrary?
> Can it be consistent between the two drivers?
>
> I guess maybe this is because in "db7430" the power up order was
> slightly different?

This arbitrary sequence ordering is part of why we can't just have
one display driver to rule them all... sadly they also make semantic
sense.

The vendor driver needs the display to come out of sleep right
after the power-on to send the init sequence. The vendor driver
does exactly this.

The placement of these sleep mode in prepare/unprepare calls
is because of this.

Yours,
Linus Walleij
