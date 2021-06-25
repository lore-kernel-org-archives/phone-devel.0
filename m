Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2F1C48BC2
	for <phone-devel@archiver.kernel.org>; Fri, 25 Jun 2021 15:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB9F161960
	for <phone-devel@archiver.kernel.org>; Fri, 25 Jun 2021 15:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbhFYQBZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Jun 2021 12:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhFYQBZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Jun 2021 12:01:25 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724ECC061574
        for <phone-devel@vger.kernel.org>; Fri, 25 Jun 2021 08:59:03 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id p7so2215979qvn.5
        for <phone-devel@vger.kernel.org>; Fri, 25 Jun 2021 08:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMFqRamqkQgCF+ySIQhnWpXoURw1WLNbTY9bNZn+W38=;
        b=ciq0fyJCwg5/hK+oj/CXsEPQ74Dr1RLsBVZh4+AuAUDQH8M9HyGelwOrWBcBE8ev5l
         t8nYqFeRr3jN7EmUqoRa6Day9kVuUCvo0MK/+3x/SbtOyInz+5B5+iTMU8SvD2yqSxlv
         bSQp7Uv9ewlRA/0BHRPSkC4W8ju2ek50oD8Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMFqRamqkQgCF+ySIQhnWpXoURw1WLNbTY9bNZn+W38=;
        b=ID+ulEhrdDKQbQR4AL6J4VcFuljeoPVxyb2PVWZEceIENfnM+bP3ZYdMNSjEUrfgit
         GBxZFSYb19Vh3el7M0tA0ORuHgW/fMYfxoqAk1zTcBVml7aI8DzQmFV2/AetRGE506Xm
         4fMNG0gPtrgaRJlzNQr5VW5hg0BsGtjxQLJYuEOicX/zJeyIMjo5Q9uzl8/8lMNm92jL
         4pXhur6ZrhbBDAlTICTmqIIpNGASoI2KC43tv4joWKC/ipnfLIfWPqS717nAjQErNaAn
         ZiDgdxnAlB6a83+lKyMooZlA12uatsirrS6Qq2zfXtJrou/2cghFiID6dCIEWbG75OTn
         BiYw==
X-Gm-Message-State: AOAM530EdIjnPtdZ+ExtizAXLsDPfEZVA/YwuW3VNlBBQzuS2scJeuKD
        11H5gswlcDm1OjYru0fzB4lqmxHdh7n9/w==
X-Google-Smtp-Source: ABdhPJx/dIdmu914rCkfBUgfk8NCrL/HSFLbVin2DH1B5mnLsCTPacy3RWgddeiVuBRErfJYPmewuA==
X-Received: by 2002:a05:6214:186f:: with SMTP id eh15mr11743560qvb.29.1624636742354;
        Fri, 25 Jun 2021 08:59:02 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id s6sm5170629qks.102.2021.06.25.08.59.01
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:59:02 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 8so5337819ybn.9
        for <phone-devel@vger.kernel.org>; Fri, 25 Jun 2021 08:59:01 -0700 (PDT)
X-Received: by 2002:a25:2405:: with SMTP id k5mr13449716ybk.405.1624636741419;
 Fri, 25 Jun 2021 08:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210624223743.2486302-1-linus.walleij@linaro.org>
In-Reply-To: <20210624223743.2486302-1-linus.walleij@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Jun 2021 08:58:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Un00zNuCQ=f5BV0dvi6gSMXgfC_e94OD5ZpS5ad3wJUg@mail.gmail.com>
Message-ID: <CAD=FV=Un00zNuCQ=f5BV0dvi6gSMXgfC_e94OD5ZpS5ad3wJUg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add DT bindings for Samsung LMS380KF01
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Thu, Jun 24, 2021 at 3:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> +  spi-cpha:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: inherited as a SPI client node. Must be set.
> +
> +  spi-cpol:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: inherited as a SPI client node. Must be set.

I will defer to Rob Herring (added to CC) to confirm if we really need
all that stuff for spi-cpha and spi-cpol. I would have expected just:

spi-cpha: true
spi-cpol: true

As I understand it, the fact that they are flags will already be
validated as part of the "spi-controller.yaml" so you don't need to
specify that. ...and the fact that you have them listed as "required"
properties documents the fact that they must be set for your device,
so I don't think you need more.

NOTE: if you're testing this using your "example" below I think you
will find that you could set this to something other than just a flag
and it won't yell at you. However, that's because your example has a
bogus SPI controller node in it. I think if you put a real SPI
controller in the example then it'll pull in the "spi-controller.yaml"
bindings and magically start validating everything.


> +  spi-max-frequency:
> +    $ref: /schemas/types.yaml#/definitions/uint32

You don't need the "$ref" line here either, right? Again it'll be
validated as part of the "spi-controller.yaml".


> +required:
> +  - compatible
> +  - reg
> +  - spi-cpha
> +  - spi-cpol

Does "port" need to be listed as required too?
