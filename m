Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D60CC07E96
	for <phone-devel@archiver.kernel.org>; Thu, 15 Jul 2021 07:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3328760BD3
	for <phone-devel@archiver.kernel.org>; Thu, 15 Jul 2021 07:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhGOH6l (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Jul 2021 03:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhGOH6l (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Jul 2021 03:58:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF4DC06175F
        for <phone-devel@vger.kernel.org>; Thu, 15 Jul 2021 00:55:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id b26so8319689lfo.4
        for <phone-devel@vger.kernel.org>; Thu, 15 Jul 2021 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xfxlv8kb+dV90008LUKSaosCI+CrD0YPJuZfLy/Uh+E=;
        b=lbzPguOWgJvzoyfvKyutWLO3F3sMLYJw+65bfButrKsFlGU8h39r/Ent5K0KbzoFCs
         j2G2QQbATELlPYvPleE3QYnz+VDuq352184KSpWQinJKXfp8SzaTTTTykk5SUvg1oiW2
         Lkz/N33t/ZVUOgZSbb/DzN3ubeR0Em+L9foCrCUyZ3fSa94MVCEVGAR8yXkecTRMvUA7
         5SvyXljsgE9tzqoNIc98Y9Y1l8Zorx6G6p+3b2XidxUaWwy6IroP5F2rmSDFUlg5MKRv
         rP4iWs5kQRSboWV7biaYVD/MW0wcqtZPrzGkoWmzZKyay+Als545uupikvRVszS9P43d
         mbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xfxlv8kb+dV90008LUKSaosCI+CrD0YPJuZfLy/Uh+E=;
        b=K31KgefcvBwYpJOT0zE4MA+n0jdoq1yhMGwlgLJaOLNkJRI44tP20y8aFW+wzHfbCz
         BnP4Pna5qUBsdpLcncNsd/axw7XoTzaI0qVFWrxBx/yNrVIYGq8oJTDnNNmR3SViDMut
         DZ+fUhTEyLt9IhUS9e8OJvSeERhLwmC3jUPuJgRiao5uGAw+1CycLTPcq6BQ78yRYcQR
         V31DJDC8a4Z3OJ93UkqoBHgRexjZ0lGh4BLHyeOf0tFk7fK29izVvqKKnrRiW26OjhMK
         q17K5QVXRPVfRnCPNtl15jbnkVf94xV1QhbkCQ9s7qnqplmdQhl7h46G2rRI1IQsqnIZ
         wSTw==
X-Gm-Message-State: AOAM531WX0Eg1qjayhLviKXMee5NxFxe+E/SoPvtWT1uUgbcVchKQKin
        5DSxTPJRKUPPpjwm9spHaWmtLSoAPjJW62gejn+PSw==
X-Google-Smtp-Source: ABdhPJzq0NcMby1ZYDoH6Gc2O4jRrDN131uswMJddh1XV6xqDsxnUSBj6TXTxXOPxfuEJHbAofFla2oYYbmWFpTpv0A=
X-Received: by 2002:a05:6512:b1d:: with SMTP id w29mr2381579lfu.291.1626335746318;
 Thu, 15 Jul 2021 00:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210714225002.1065107-1-linus.walleij@linaro.org>
 <20210714225002.1065107-2-linus.walleij@linaro.org> <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
In-Reply-To: <CAD=FV=WnO+vH_6-KC8WZ4AyGY9knWz6ecK3Hwqy9CQX1RnZzQw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jul 2021 09:55:35 +0200
Message-ID: <CACRpkdauv+UUAFwOgOJdVGEo+5-z89QHH-ZisWRLNBFsbhmhAA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] drm/panel: ws2401: Add driver for WideChips WS2401
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

On Thu, Jul 15, 2021 at 4:25 AM Doug Anderson <dianders@chromium.org> wrote:

> > - Alter the logic so that we assign the backlight handle to
> >   panel->backlight directly and save some code.
>
> Officially this is disallowed according to comments. ...and I quote:
>
> /**
>  * @backlight:
>  *
>  * Backlight device, used to turn on backlight after the call
>  * to enable(), and to turn off backlight before the call to
>  * disable().
>  * backlight is set by drm_panel_of_backlight() or
>  * drm_panel_dp_aux_backlight() and drivers shall not assign it.
>  */
>
> I do not personally know the motivation of not letting drivers assign
> it, but with the words "shall not". Yikes!

I think it's a documentation bug. I trust Sam more than the docs.
I'll send a patch.

Yours,
Linus Walleij
