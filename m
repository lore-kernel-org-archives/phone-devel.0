Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3F2C07E9C
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 20:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1EBA613FD
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 20:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhGHUHX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Jul 2021 16:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbhGHUHV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Jul 2021 16:07:21 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAE7C06175F
        for <phone-devel@vger.kernel.org>; Thu,  8 Jul 2021 13:04:38 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id q190so6972751qkd.2
        for <phone-devel@vger.kernel.org>; Thu, 08 Jul 2021 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2tis/C0UqjD1liYeV/9bMo7ufMIoxp5d9o+L0SuTnWs=;
        b=RHXdaBuqa3OJyiICnd7gf3m1qaVIoxCbA/3OKJw9OC1afjnH5B3IzyVjEKjd9obVC4
         oCZSj3wz9V+Eh8wQobsRIY5Nj8sCBeOHniUIJ/FKMQBGMWtzbnf6uMNppMjPGgKc0HDf
         6TtbAOulin63zapccYSnuPM8QlByvJcQNHjms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2tis/C0UqjD1liYeV/9bMo7ufMIoxp5d9o+L0SuTnWs=;
        b=Lzvzi/UvXyoAlMfnJYcG1j5xfBPQgrZL5vvKkg8RgO2I7A6nu7LuchdAw+jAvtAQ8S
         WwU0uokMJ5ZzEcRN4f6qeAns+mdVXASdWmeTZ9ahTOip4POETelnxvlHnRfk/rcvOdc8
         ojJXNT3A2cf/1GzBfc1+rvZEEmjRsgfLiQbrqpLDMnzr1IElCdoBSJhxfB+04hLYqolD
         u3oIpQLZdYVeaizKODE929Y2kXW2UJZpOFGBQ/rxfBXp0cbi/rXAHBN6fQpGKkVhjzcO
         56YpPhcAeFGxfq3l194psM//u4mO60NuA3RcFDQNHKvqICpIR/bHFvF7MyL/lPBXSg0v
         fojw==
X-Gm-Message-State: AOAM531GZ9iIPdSDbYDwmsXqXCNzy5DRZGlQ5xRfwMzJSyWgJEwRnLy9
        3ncO/rE0tBpdwv6L49zdhYkb3Ar/a+Da8A==
X-Google-Smtp-Source: ABdhPJzI6USVTdjsuBbuTz17neEpdDy4hepDe2cLr25uJKyLRPvOWTLu/V7KoUW9a5MMNqOlHjYKMg==
X-Received: by 2002:a37:ae05:: with SMTP id x5mr33416492qke.321.1625774677465;
        Thu, 08 Jul 2021 13:04:37 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 71sm1391387qtc.97.2021.07.08.13.04.36
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 13:04:36 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id p22so10915173yba.7
        for <phone-devel@vger.kernel.org>; Thu, 08 Jul 2021 13:04:36 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr41020230ybm.345.1625774676301;
 Thu, 08 Jul 2021 13:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org>
In-Reply-To: <20210707234315.242663-1-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jul 2021 13:04:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9tOrwu_vFyYy_uyA+BM2sPPx+erS9Atdw72-m9v68ig@mail.gmail.com>
Message-ID: <CAD=FV=X9tOrwu_vFyYy_uyA+BM2sPPx+erS9Atdw72-m9v68ig@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] drm/panel: Add DT bindings for Samsung LMS380KF01
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Wed, Jul 7, 2021 at 4:45 PM Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
> This adds device tree bindings for the Samsung Mobile Displays
> LMS380KF01 RGB DPI display panel.
>
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes just resending with the series.
> ChangeLog v1->v2:
> - Expect SPI bindings to be pulled in for the client and state
>   spi-cpha: true etc.
> - Make port a required node.
> - Update the example to use a proper SPI controller (spi-gpio)
>   so we get full validation of the example.
> ---
>  .../display/panel/samsung,lms380kf01.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
