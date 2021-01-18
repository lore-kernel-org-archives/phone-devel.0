Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D66C433DB
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 13:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B28EC206F9
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 13:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404433AbhARNUk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 18 Jan 2021 08:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404461AbhARNUU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 18 Jan 2021 08:20:20 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC3DC061757
        for <phone-devel@vger.kernel.org>; Mon, 18 Jan 2021 05:19:39 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id n8so9372839ljg.3
        for <phone-devel@vger.kernel.org>; Mon, 18 Jan 2021 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30Y90aBAs7JCradiJqSsGAdWWwSfg6flq2QshmCd+F0=;
        b=DdzalSnTLN/NQPHzufb2YJKDvdAGLTgN4/Znr09MIb1moNn31wXoPGYTdUHh3Or7SI
         qDNs73kP6Z6EwstehDZ+zCHonxvXk2vDfPlA8FpaNICimeVvbwMoTHuW6bcktZmgAP5A
         3hi/Vb5bjiMDxId1ERIfPg0zrIUgb/Q5eaQxDpbaKKYZNAXkg5NT/z2LUEn+DXrc0xCM
         GW2S0FVFdgChl4nBzGFWA/mK6wdS17Yfbo78n1uSWjL72S2ekF0o8ie9hP8PucLKnKY7
         z0oJiU/vzKrNg3p3BsJV3QadhtKfjq0SeNAeRfzgbSfF5VHEOD4C1OXj/OCetV62WHsH
         jVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30Y90aBAs7JCradiJqSsGAdWWwSfg6flq2QshmCd+F0=;
        b=WI2hjjSfuOi0U8xNEf/1HfBJ+Vtmde34633lO2ZSEjHDMvFKFlq6HSN8RzfbVmqeod
         apanhNxmHfD8U48eoXxtDsDq/6mZCEJ+T6dQIwUO5Lp0O5bs6WQP5OyYiercKJuOhwP/
         G/FgyC/ur3eWPgnaJMYjgme5lBEHxQ3n2YHRz8F68UBkw70vsSpbGrJDKzfQfoscCt7+
         FkUibmLOoL3ZEE592/zgrFoar54ShzADOXPHsiIrOT7wzfE+KWFRQQIGGJPy9IFU7GD6
         9SImfa3irIIOb9cJ9gkQd06JD4Bk/Qyy1U2hzHXT0JElcpL8JbklK9drlC6ShotXGAQi
         /2Ug==
X-Gm-Message-State: AOAM532aFcImvJ3y77iyipBSTpiO87Rnfnuov58Y9xhlEXQFMw3uM55d
        PJgWl/f+3fh+HJeUmkn8MB+3EopJGlW6nlHFuEjKTg==
X-Google-Smtp-Source: ABdhPJwgirSexfJYg5xA5fqAGGMeT0ZdotdFmKURPfydXvped0xoAwJWbJ2SwBtHZ6yaIpyXR5AvWX7+5G+CgAIbaFU=
X-Received: by 2002:a05:651c:205b:: with SMTP id t27mr10391938ljo.368.1610975977549;
 Mon, 18 Jan 2021 05:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:19:25 +0100
Message-ID: <CACRpkdZp3oqj4VeUZEPu=POwAdf-7R3NzNoN9XehtEi_R_fgkw@mail.gmail.com>
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

On Mon, Jan 11, 2021 at 7:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> The Awinic AW9523(B) is a multi-function I2C gpio expander in a
> TQFN-24L package, featuring PWM (max 37mA per pin, or total max
> power 3.2Watts) for LED driving capability.
>
> It has two ports with 8 pins per port (for a total of 16 pins),
> configurable as either PWM with 1/256 stepping or GPIO input/output,
> 1.8V logic input; each GPIO can be configured as input or output
> independently from each other.
>
> This IC also has an internal interrupt controller, which is capable
> of generating an interrupt for each GPIO, depending on the
> configuration, and will raise an interrupt on the INTN pin to
> advertise this to an external interrupt controller.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

I really like the looks of this new version! :)

Just some minor questions now:

> +static int aw9523_gpio_irq_type(struct irq_data *d, unsigned int type)
> +{
> +       switch (type) {
> +       case IRQ_TYPE_NONE:
> +       case IRQ_TYPE_LEVEL_MASK:
> +       case IRQ_TYPE_LEVEL_HIGH:
> +       case IRQ_TYPE_LEVEL_LOW:
> +               return 0;

This still doesn't make sense, I think you can see why.

If level IRQs can fire both when the line is high and low without
any configuration in any register whatsoever, then IRQs are
*constantly* fireing. Which I suppose they are not.

Something is wrong here. Either you just support one
of them or there is a way to configure whether to act as
high or low level.

I'm also mildly sceptic because GPIO expanders ... do they
really support level IRQs, and does it make sense when you
think about it? I would rather expect edge IRQs as these have
a natural trigger point and level IRQs may very well be gone
by the time you come around to read the status register.
I suppose it can be done but the events must be really slow
then, slower than the 400kHz of an I2C bus.

Can you please look over the interrupt logic in your specs?

Yours,
Linus Walleij
