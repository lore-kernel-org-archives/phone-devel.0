Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F72C433DB
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28DB4230FC
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:48:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405965AbhAZOsR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405941AbhAZOsJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Jan 2021 09:48:09 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4333EC061A29
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:47:28 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id t12so4458513ljc.6
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NSov9hCAZmBO4f5IqjzRfZw8GiUqBpiKDFVieekbDjQ=;
        b=XTzDRCOtBTWBSE3rewHEzJrNlvVeSIhNA5fbCfyK9IVdizTEaqec2Jtz7smGsVOFhr
         MGp6EPKN4EftzMuKXxYIRfwdMsCW7R3SZHwYVlXZTXsc8netYQbJFeW1zHaWf4LTYfcI
         VpSAYwinvUj29oPYsTojeXQuqiWjkLlZv9eciwpPy9Nprj8Br8ioQWrVzwWk3Ye6eEdc
         dh5DBUCu8Qad8BZvxhMqs8a+DL4OuVDNxDn7JDw3jQarZ9iJsNgsJLd3/PjcNBuAurKv
         mg2zQyvt+QbEyAiCOyKE6poVvzlw3nIysmCZjLL8iGX7VYNkO8nYvBwwJKQUpH7jXpXo
         jeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSov9hCAZmBO4f5IqjzRfZw8GiUqBpiKDFVieekbDjQ=;
        b=XTgaL2KcxjY8KB89s1aS9KFSsUPFNi5nAOPHn1o2zdwKe0pyz9bW+frjByqvrnNyhU
         EqXWcQPRmLvQT/GWqICUxPPxvNYkbXpTcLigLKzRudESDiKbpfacj50I85fi3E8qQq1o
         vDRGwB7Cm0ML9/VQ/23xNVJPbZgSER4/g0+pfIUUo7gs2wGEzUFzBTN4Alam7CzZE3Pt
         3/sHLCZ3+ztFZiLGludIvVQ0GWRwbBolbuSjTzvjIWH6gqKKUwUFrW7S4n/nFTac2t1a
         oxVkr1xPJhtpbmAW7NSUvQqwRLPlnHhv1VRrlC2uqnoAKym5N9OGLLrcAH1JxitENNhz
         aDVQ==
X-Gm-Message-State: AOAM533r7f4J02HwLES4HgiTRlzKsnzzvP0aoPC8Qivxey4ZfqU6sL1r
        udzom9veE5Q6zm/5soF64Ja1QEVU70zoP9wp9L677A==
X-Google-Smtp-Source: ABdhPJw8hdQrVaqBGeCLGaRM3DlKvQ/5Mw07r+te2YaR5i4prOqwouxQgGsOT1+3HdIfrvpQQdvZEAfrsaB7XSvfBY8=
X-Received: by 2002:a2e:8ec3:: with SMTP id e3mr2958932ljl.467.1611672446814;
 Tue, 26 Jan 2021 06:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20210125182219.213214-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210125182219.213214-1-angelogioacchino.delregno@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 15:47:15 +0100
Message-ID: <CACRpkdZWX6iacZxhBaeboAgy0HbvesuVBBMLxaCPLASfGbRURA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
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

On Mon, Jan 25, 2021 at 7:22 PM AngeloGioacchino Del Regno
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
(...)
> +static int aw9523_gpio_irq_type(struct irq_data *d, unsigned int type)
> +{
> +       switch (type) {
> +       case IRQ_TYPE_NONE:
> +       case IRQ_TYPE_EDGE_BOTH:
> +               return 0;
> +       default:
> +               return -EINVAL;
> +       };
> +}

This looks better.

> +static int aw9523_init_irq(struct aw9523 *awi, int irq)
> +{
(...)
> +       gpioirq = &awi->gpio.irq;
> +       gpioirq->chip = irqchip;
> +       gpioirq->parent_handler = NULL;
> +       gpioirq->num_parents = 0;
> +       gpioirq->parents = NULL;
> +       gpioirq->default_type = IRQ_TYPE_LEVEL_MASK;

This looks wrong. IRQ_TYPE_EDGE_BOTH?

Yours,
Linus Walleij
