Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3876AC433E6
	for <phone-devel@archiver.kernel.org>; Sun, 10 Jan 2021 00:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AD722389F
	for <phone-devel@archiver.kernel.org>; Sun, 10 Jan 2021 00:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbhAJAZb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 9 Jan 2021 19:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbhAJAZb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 9 Jan 2021 19:25:31 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92111C0617A2
        for <phone-devel@vger.kernel.org>; Sat,  9 Jan 2021 16:24:49 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id u25so11429896lfc.2
        for <phone-devel@vger.kernel.org>; Sat, 09 Jan 2021 16:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MaNjSrG8taLJEzXd4CfVhlhv+S87fFrkBRWdE4GXbNU=;
        b=G8CJ6yX91fKSLE4hDDwBLWMD7zoM/coT9SC/zm9kWRyySwDSMvvyHUFNWSMzgok6SO
         Lxn5dJDH31e0i0pe1U/qnjX/hiAuZbs90ZAqY53pPMVzmMtdgDerq08JTffI9NWSBSZB
         IfDutdLr9GtspwSxrBNesP1zKWI00tRSii4fBGexW6C4Ohc2o38OTrpecKWH23DWz6i2
         bowTwVCAvxljAKg9BdqEjSeu2IgVTWok6FxoKbkoB5v6Icvu5MCHgA0lOGkOWlts6Tpe
         NpwdN2lgiOrjYeo1D8JDG442LUnAaM5m2E4VpvSD8San20rdGlIh90BG+347KxbSHL+X
         m1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MaNjSrG8taLJEzXd4CfVhlhv+S87fFrkBRWdE4GXbNU=;
        b=kNqoXybO8Iom6/APk3Q6nboJR0JG066S9xOdk3No8OAo2PqRUpx8UU4kgQgM0SpShH
         2V73tmFVKWn5kVwAJQIl1O6t/TaviA92qhBYLJ0UrBC2Lta/OjaNyHUTe7BtV3BRIs5M
         Xze2TTpcjOby7UL9I0o8ix50mMuMpjIGs3XkOgVRZwtKIi1OpLoycWBEXy0FiooeKHee
         SfKxBYLrzCIK9Xs92VfJRNYKmtCW2Cl3Xo6OSkjMaxM6DdR/VXiC7xpG9ohy/dkbzWb5
         YpRxaKlGy58b+I8meojJz2cI7fAIHvicJ1GMN51gDWmjlQCpmLpCNdnp0pB8cgFaYknQ
         OFHQ==
X-Gm-Message-State: AOAM531LYhsDAyJSx1C2NHxvzTF3clAT7iL+U8nuCLJinqL3OL9lCaef
        S+qU0neo6NjfwGB6ur78jS9sweou73VdL2LfR8zqHA==
X-Google-Smtp-Source: ABdhPJzWhUb8OaCqZ+wGW3wghfI4OfSe4HcyYD2SElJtQEE0jHkfmLE53PIQAkoRBbNxCjll818U9BU6+WvJ1RvEg5U=
X-Received: by 2002:a19:6557:: with SMTP id c23mr4137115lfj.157.1610238288101;
 Sat, 09 Jan 2021 16:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <CACRpkdbETKnhgR2-T+s3ChY4v-C5ErdPEp2WcMSZHzJ=O-fHig@mail.gmail.com> <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
In-Reply-To: <111b918d-2b43-be81-2dbf-e984750b0ef7@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jan 2021 01:24:37 +0100
Message-ID: <CACRpkdZXgN91jKBDvf=P5_6ObOaacQa2PGL3-jP1gBW__ZyOaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Mark Brown <broonie@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Jan 10, 2021 at 12:11 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
> Il 09/01/21 23:11, Linus Walleij ha scritto:

> > The major review comment is that it'd be nice if you look into
> > using regmaps register cache instead of rolling your own,
> > and also possibly using regmaps locking rather than your own
> > as a result of that.
> >
> Actually, I really tried to use regmap's FLAT register cache and after
> many, many tries... I had to give up. I just couldn't get it working. :(

This needs to be root-caused. The register cache in regmap is for
using not for decoration.

What is the problems you are seeing?

If it is fundamentally so that regmap has limitations that is one thing,
but I want to rule out that we're just not using it wrong or that there
is a bug in it that we should fix.

Looping in Mark Brown the regmap maintainer.

Yours,
Linus Walleij
