Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5546C07E9C
	for <phone-devel@archiver.kernel.org>; Fri,  9 Jul 2021 15:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B28A7613C2
	for <phone-devel@archiver.kernel.org>; Fri,  9 Jul 2021 15:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbhGIPGM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Jul 2021 11:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbhGIPGL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Jul 2021 11:06:11 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48926C0613DD
        for <phone-devel@vger.kernel.org>; Fri,  9 Jul 2021 08:03:27 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t17so23908057lfq.0
        for <phone-devel@vger.kernel.org>; Fri, 09 Jul 2021 08:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=liyDc8KPNREPxYu6ZBK2AjGzDPc3y18sesydg06M0to=;
        b=nIyG6XZKLZAvgW4L3u6Dh+N8oCKr7rX1MIemUVoAtUVYiFoEi7Z+obVxpNc2Ag3vq4
         BYSDgX4ly6JBEmBJafm/0vRqAT360NHU1GXiY4Upx0vzn3Ajcz2rEivyu1LsGunuGJsv
         Ou1BUN8E1ujekGe6IiflnBHC8O7Jaajx8Hv2+mBzwU85FWVLppGX4A8OPvteOtRfPUYM
         xlQJ9IZTvmjhqu01mrfXzI6D3HjG6l21MSA970G9O2NvwSQC0ujhYB9YFKSZtxLJp8TR
         mxn9ugv/A+2hJQ2FEgCi21c2GOhR7+deK3JgnVr5ginzj8/5Y48v/K3Ip1e67McUPk0t
         1lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=liyDc8KPNREPxYu6ZBK2AjGzDPc3y18sesydg06M0to=;
        b=VLWf9QnciKnXPpnvYucM/FGd84wLP410KJr/HfQDDTMuHNQqc0Jo+D2ZMt7XnS4vaZ
         FXubTNCbxscgX4zX4zv6pM27c/kZXWVGaHdiPDbNiWVfTvjYShIyY6iPrU4uoWzV0Iss
         ZVdV9AK7bPplPc9rt5T/IaIfnNomv09GWdwINMl6QilheloXL/J7AaMij8L6I9CAom3F
         wkPPeYHbw/VfzJ1xHYGLZuxwzqAH22FKAKYsUAvXjZheNAp2f/CYd9umY8WZh7FUlxdw
         pLWR935Qw/gZnIfPkU0EsLX7c6HJzOtTxx22StFUgcI7G3DIxWrU+AKGVc5/AW+5XbFJ
         OuIw==
X-Gm-Message-State: AOAM530a73vCEIzSsC7pAkCqfOrsoHmh0QpOS4ezNnqxg3MVMuzuNuIA
        +pQ9cV16wZdKWH++/DZ7+ZQisgsT+Lu8K+ZTMVhjAw==
X-Google-Smtp-Source: ABdhPJx5zmrwgeteYY4t5Mjz5wr4c5JFUa6wYmjNzObu7aUcyu0bUVeWtS0dczld8lWvqKs703psndDvTMhAFGeOe70=
X-Received: by 2002:ac2:4d42:: with SMTP id 2mr7524852lfp.465.1625843005537;
 Fri, 09 Jul 2021 08:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210707234315.242663-1-linus.walleij@linaro.org>
 <20210707234315.242663-2-linus.walleij@linaro.org> <CAMty3ZCjciURnUJnTOPDQOSaiDVRneJoe=w9U==73Jt=Wd895w@mail.gmail.com>
In-Reply-To: <CAMty3ZCjciURnUJnTOPDQOSaiDVRneJoe=w9U==73Jt=Wd895w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jul 2021 17:03:12 +0200
Message-ID: <CACRpkdaSo_+z3tJzR8A5B9HhDVUHeutW9AHash9YgVo9SC+ARA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v3] drm/panel: ws2401: Add driver for WideChips WS2401
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Jul 9, 2021 at 11:25 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> > +       /* Assert reset >=1 ms */
> > +       gpiod_set_value_cansleep(ws->reset, 1);
> > +       usleep_range(1000, 5000);
> > +       /* De-assert reset */
> > +       gpiod_set_value_cansleep(ws->reset, 0);
> > +       /* Wait >= 10 ms */
> > +       msleep(10);
> > +       dev_dbg(ws->dev, "de-asserted RESET\n");
>
> Just a small comment, are these delays are as per init sequence
> mentioned in datasheet?

As so often with Samsung mobile displays there is no datasheet.

These delays are in the product source code tree for the
GT-I8160 (Codina) mobile phone, actually in the glue integration
code. WideChips were acquired by some other firm and do not
exist anymore so I can't ask them, and asking Samsung for anything
else than source code doesn't work either. (I have tried.)

Yours,
Linus Walleij
