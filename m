Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FB9C4320A
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5641D60F4D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhGZHES (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jul 2021 03:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbhGZHER (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jul 2021 03:04:17 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A37C061757
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:44:46 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h11so10178638ljo.12
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssUokjsSMJ48EWHlDCE/laISgBgQpXHrgULNy5xmgno=;
        b=SqRyj7wr5bJD3lTR+EcqGiYgyaosN6BCK/eOMZcy51IciGGn5mrL3Mt1GfsV/+4fcM
         hSGtdN1BzLtKLmKrZlLPsc4b84i2075zOJSa3e5GbPBd7X5cr8oe9CXGCiqCxsVlNDVG
         V5fFjF2iZqFRG1+sXcMVo9Vj4gl+rrp1mOr3rdTsv2ou7vloTDwHpmyH6qcEkHHRrYYK
         yDs3T/P8CABLJeGQrSnVihjZawmje2Oo0Myoj08xMvbVOPrIu7QcnzAm48ixAIAsxdrU
         sxEermJR+49zUL/QXMTLpcZgVhucDK/tcXlkiWBEOibZmA+LhIgCv2YkjLa0auY+5rtj
         1i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssUokjsSMJ48EWHlDCE/laISgBgQpXHrgULNy5xmgno=;
        b=HWHDsMU3q5b8u1DCXLA3CKHpFV9QPzdiJdALlLCRs5L/G4jquuTcVTel6pRAF1ycu7
         A2HzxRxug3GRWZgLlQpXGblTu+TKT2uLyQvReqn4ejhYM1EFQ7TQ/DGOknvexNklFrwu
         gOvW3DiTG8TicR+qnek48zsAX9DN/6iQa5ad826TwVANY5N1jfhfaMhqRbgYGKKoljfE
         Deer9dvHnyZS3OrfkQswfleZ4oK4znHPqhqYYU1xKxLdMF5/N/wFCPuKnb9K3YhTm4ST
         8XvWyGigW5zpA1EUmlbLUoXbVU52XnwhItLZzPB/SoqHVfSIhhRJ6RaSpRkbEVTC4LUX
         sobQ==
X-Gm-Message-State: AOAM532yuMD0ca3FASSWjF44jh8oriEIqtAfWgocX+uHeS0nhiTtad9x
        C23HPR+xdExVMtpPzQNjFZ8CQkLmB8FYnWhIfXr/lA==
X-Google-Smtp-Source: ABdhPJzVrcz+dhjqBgM3sUPzsNVuW+h+bIfdIXiwMlexLR594Z79PEGkWe9DsgvgcJSZ3GUUlEf2RybZa1F7JygAag0=
X-Received: by 2002:a05:651c:169a:: with SMTP id bd26mr11378293ljb.368.1627285484464;
 Mon, 26 Jul 2021 00:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
 <20210725140339.2465677-2-alexeymin@postmarketos.org> <YP184rqayPLbWLx4@ravnborg.org>
In-Reply-To: <YP184rqayPLbWLx4@ravnborg.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jul 2021 09:44:33 +0200
Message-ID: <CACRpkdYbL54XeWWipgn8yiQRuQOL+VkdHumkLZv6DrkUgdCjUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add Samsung S6E3FA2 DSI panel driver
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

 On Sun, Jul 25, 2021 at 5:01 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> This driver supports two different panels:
>
>         S6E3FA2
>         EA8064G
>
> They differ on a lot of the tables and requires different init.
> In other words there is only a little boiler plate code that is in
> common.
>
> I think it would be much cleaner with individual drivers for each panel.

Sometimes Samsung have different *physical* panels connected
to the same display controller, but I don't know what is the case
here. This looks like it could actually be two different display
controllers. (I don't like these opaque binary drops from Samsung,
datasheets would be nice...)

What I think is most intuitive is to have one driver per display controller.
If the two drivers are writing some very similar registers with very
similar values they are probably the same display controller.

If they are not then they are not...

If they are obviously the same display controller I think parameterizing
a display controller driver along the line of panel-novatek-nt35510.c
is the best. If different display controllers, we need different drivers.

> Which brings me to next topic - this is two different panels and the DT
> are supports to describe the HW - so the DT tree should have different
> entries depending on the actual panel. As it is now you try to hide the
> fact that one compatible describes two different panels.

(...)
> > +     ret = s6e3fa2_dsi_dcs_read1(dsi, MCS_READ_ID1, &id1);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret = s6e3fa2_dsi_dcs_read1(dsi, MCS_READ_ID2, &id2);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret = s6e3fa2_dsi_dcs_read1(dsi, MCS_READ_ID3, &id3);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     lcd_id = id1 << 16 | id2 << 8 | id3;
> > +
> > +     switch (lcd_id) {
> > +     case LCD_ID_S6E3FA2:
> > +             dev_info(&dsi->dev, "detected S6E3FA2 panel (ID: 0x%x)\n",
> > +                      lcd_id);
> > +             ctx->subtype = PANEL_S6E3FA2;
> > +             ctx->seq_data = &seqdata_s6e3fa2;
> > +             break;
> > +     case LCD_ID_EA8064G:
> > +             dev_info(&dsi->dev, "detected EA8064G panel (ID: 0x%x)\n",
> > +                      lcd_id);
> > +             ctx->subtype = PANEL_EA8064G;
> > +             ctx->seq_data = &seqdata_ea8064g;
> > +             break;
> > +     default:
> > +             dev_warn(&dsi->dev, "unsupported panel ID: 0x%x\n", lcd_id);
> > +             ctx->subtype = PANEL_UNKNOWN;

This does look like two different panels, I'd like to know the MTP
IDs printed (also wrote in different mail). The MTP print I think
should be kept.

Yours,
Linus Walleij
