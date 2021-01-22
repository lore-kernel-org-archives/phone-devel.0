Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC26DC433DB
	for <phone-devel@archiver.kernel.org>; Fri, 22 Jan 2021 10:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 729342376F
	for <phone-devel@archiver.kernel.org>; Fri, 22 Jan 2021 10:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbhAVKCw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 22 Jan 2021 05:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbhAVKBF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 22 Jan 2021 05:01:05 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6EAC061786
        for <phone-devel@vger.kernel.org>; Fri, 22 Jan 2021 02:00:02 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id q8so6696988lfm.10
        for <phone-devel@vger.kernel.org>; Fri, 22 Jan 2021 02:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3b6S2/z3tpa4MkB+bZqY5tPcMx97QoLNDAPmEmPnGt0=;
        b=CD6w0ZgUypDgjE9zR0ZJVOxq+rlOgFypR7WRO0P5wQjcTwWxl7hRP3Ql2htnVNIAcX
         a6IqCbfY2yRx6C5mdcNVOsZuG69XJvCbRsJ9Uwt9kAhwZJKg1z4WKyK8EfJxQXhrmawK
         jvFt+Si3bh4KoOEFtnIjQlVBRf7/v7+F49qvweV/jRKr+KlXm110gJzTsJCQIWgstzaw
         67MyDzp+6NUBDMO2GYmaWO2h4m36KrN07K4BoFPv7KykDmlqx27YNW9ojW1K0wkSNu+M
         JNGZPmD0ZAsv4GIQ7hMVzNvVvRqICKOZ5otGgE3Bh6ATdVkrvErsTghZo2d4jrVmARuI
         cncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3b6S2/z3tpa4MkB+bZqY5tPcMx97QoLNDAPmEmPnGt0=;
        b=qwi+pxyH/nH1wP8Q48jvHi+48E8pEUcQSDrc5ciHyoroQwPVx2lc1pkH2ZcBXpO0Fc
         HQuCxm8AjcIlmzFh1rmnaWjdHTFa1EbMuIsChFtXVEffVodtjOylPl1AAOhH1quQZapi
         Wk9H2utH1qKFbs9g2tVLNjs3CkdRM2/mK8uiGGvDR1Qf3AClCqM+jspslCiM7OhqaEfe
         YRLEZsgRiHikIRNHEMdacXNXEkldfWp19g9cHu4/p35dZx8bBuKDu1LqoTSL8DVBW8H/
         fLGVePhNWjxI76rggzt9m/LBfgkrtSQoWJh4ckpLgWZ5Oem7hN7N/YDDsDKXk4eTsHUw
         +ZAQ==
X-Gm-Message-State: AOAM533507tVeEwdjb1p0t6iKR/NvQF3ex8S6xUW0ncO9DnK0AyQCe7F
        Z/fB2qnJICPDV9pdaroW9r1PKAcSKMVgw87cjnJ/Jg==
X-Google-Smtp-Source: ABdhPJwUwANyZtTNJ+wpcGjC0EBfyorEBi8TdaoRhCKcIcRkNc2spagF6/gcNBcB8Dn2Aspuc2waqUkn0aaoZM6u8JY=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr19528lfp.586.1611309601102;
 Fri, 22 Jan 2021 02:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
 <CACRpkdZp3oqj4VeUZEPu=POwAdf-7R3NzNoN9XehtEi_R_fgkw@mail.gmail.com> <1e34145b-a04a-1cbb-7fbc-87c69b8dcfd7@somainline.org>
In-Reply-To: <1e34145b-a04a-1cbb-7fbc-87c69b8dcfd7@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 10:59:50 +0100
Message-ID: <CACRpkdacfa6usOZtc+A=ZxEpB1ij_gAKX2PLMOaX0mY_0qHp6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jan 18, 2021 at 3:38 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> By the way, this is really LEVEL irq, not EDGE... To avoid any
> misunderstanding, I think that the best way to show you what I
> am seeing is to just copy-paste the relevant piece from the
> datasheet for this hardware (it's not a confidential datasheet
> and freely found on the internet).
>
> Check this out:
> " External MCU is required acknowledge by INTN pin. INTN is open-drain
> out-
> put, low-level active, and need external pull-up resistor.

This talks about what polarity (active low) the pin from the expander
to the SoC/CPU is. It has nothing to do with the line into the
expander.

> When AW9523B detect port change, any input state from high-level to
> low-level or from
>   low-level to high-level will generate interrupt after
> 8us internal deglitch. "
>
> ...but since the datasheet is sometimes unclear about "things" (I am
> mostly sure that they have translated it to english from chinese), I
> have actually checked whether the INTN pin was pushed LOW when one of
> the inputs goes from HIGH to LOW.. and.. it does... and as you imagine
> yeah.. it's slow.. and yes, as slow as you can imagine. :)
>
> So, in short, this chip is raising an interrupt when any input changes
> state, regardless of the change being LOW->HIGH or HIGH->LOW.

This means that the expander only supports
IRQ_TYPE_EDGE_BOTH and nothing else.

"port change" above means edges.

Augment your driver to only accept this type.

The consumers better request IRQ_TYPE_EDGE_BOTH
(from a device tree for example) and consumers better
handle the fact that they get interrupts on both rising
and falling edge as well, else they may need special
code to handle it. This is not a very nice feature of
the expander, it would be more helpful to users to
get interrupts on only rising or only falling edges, but
as written, it will generate interrupts on both transitions.

Yours,
Linus Walleij
