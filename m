Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43371C3E8C5
	for <phone-devel@archiver.kernel.org>; Sun, 29 Nov 2020 20:43:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EACE320727
	for <phone-devel@archiver.kernel.org>; Sun, 29 Nov 2020 20:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltAUV8xc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgK2UnI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Nov 2020 15:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgK2UnI (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Nov 2020 15:43:08 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEDBC0613CF
        for <phone-devel@vger.kernel.org>; Sun, 29 Nov 2020 12:42:28 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id d20so16672562lfe.11
        for <phone-devel@vger.kernel.org>; Sun, 29 Nov 2020 12:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5uBLY7Ua4rfHubKZI/G+6QMI6J0iMgJ9HGZNIZryQbY=;
        b=ltAUV8xcjgqKSy62ciPxDWEgXuyJ1B2kI6+cb44w6G19toyVP0D6HZddlG1zwZCpva
         h6ieZY5Ieh6NkyaYxLt9nWFxGZwboGuSe/k5zeOV70Ls4tl0EN7blQUHu8fbFcOrAQlG
         7b9yXAJ9nH0Z0LWOU09A81+U3gO6LRGTE65dfgXaOzWQpSCo0CpaUIJircI680ZNI4LW
         8wM40VohlpKEDOCs2bSSCt2kf0kgc3MAliO1g+rqyuQMdjl9KE03oIEYg8dcIBtki7ql
         ks0WaeFPO63yC6XAP/LdRFPFgQVIFsXrCfODbTPM9KQOdrpzcWJgGAaRLckjVpmhwf+G
         KCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5uBLY7Ua4rfHubKZI/G+6QMI6J0iMgJ9HGZNIZryQbY=;
        b=RpNqrtLPGxJCHWSCnPXG/jjd2M7nBl0mXOp9EeaJ6XgEKsyxKonvSSLgOkn+3w22Xb
         8O1aaKGut4HWJlDW6OIcwXSWdvmQWANKME2hqdyW0oWVlmYuRPDS2PhA6qf5guqjTX3y
         44K11pTyBP05StAiTBfkZIcNcoKi2xXwk5G2VPBDCpf1Q4p8HQLEVdIVYL5NQUpbZgeB
         TJ32R2nsNjPfZLqy3UEMTBYAtpgJ9udt6NalidhvB9mJjGpPqBrcG0IJIiy1rG7fDnN4
         XAz8tQ6SjLel0g9o9kbdfb0CJmyqwbdS9Zz8RFnKaYZ2fwuVTOeqoIapxtuWdhNdEWcn
         67fQ==
X-Gm-Message-State: AOAM533tcLp0cLSEdpX8wwGl44SReZQoJs7WsA4nXZb91Dtcgsaraupd
        +NOWxIX37rIhDdOBAXWKnk50ctUQXk50DJ8EN7xEPA==
X-Google-Smtp-Source: ABdhPJzY1JviYd7H5LSLECyBaOqpwEM2KhxmJ+AniJVEswZixjGqXiHBl5M93+TInnvMzvW81pJoUhC2J6S082yRyCY=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr7417427lfb.572.1606682546304;
 Sun, 29 Nov 2020 12:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20201128004038.883289-1-linus.walleij@linaro.org>
 <20201128004038.883289-2-linus.walleij@linaro.org> <20201128122153.44c1052c@archlinux>
 <CACRpkdYvkV0Xrw9fseQneHwhJ-EkcX+RQKVcCF8hhidE479AmQ@mail.gmail.com> <20201129112603.1644e5a5@archlinux>
In-Reply-To: <20201129112603.1644e5a5@archlinux>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 29 Nov 2020 21:42:15 +0100
Message-ID: <CACRpkdYFGRsk28hLGxNB4jOE2vVMMmSLEGSxucsBQGnuzxPCeg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] iio: magnetometer: Add driver for Yamaha YAS5xx
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Nov 29, 2020 at 12:26 PM Jonathan Cameron <jic23@kernel.org> wrote:
> On Sat, 28 Nov 2020 22:04:56 +0100  Linus Walleij <linus.walleij@linaro.org> wrote:

> > > > + * YAS530 MS-3E (2011 Samsung Galaxy S Advance)
> > > > + * YAS532 MS-3R (2011 Samsung Galaxy S4)
> > > > + * YAS533 MS-3F (Vivo 1633, 1707, V3, Y21L)
> > > > + * (YAS534 is a magnetic switch, not handled)
> > >
> > > And there is your reason not to use wild cards in the dt file name etc!
> >
> > It's pretty safe as we definately account for all magnetometers
> > of the naming scheme YAS53x. The YAS534 would be in another
> > subsystem (proximity, I guess) so the path to the file gives the
> > right info: this covers all magnetometers named yas53x, goes
> > for both the bindings and the driver I think?
>
> I'd just name it after a specific part.

OK no problem I just name it yas530 everywhere as it is the
oldest supported part number.

> > > > +     c->a2 = yas5xx_extract_bits(&data[3], 10, 15) - 32;
> > > > +     c->a3 = yas5xx_extract_bits(&data[3], 6, 9) - 8;
> > > > +     c->a4 = yas5xx_extract_bits(&data[4], 8, 13) - 32;
> > > > +     c->a5 = yas5xx_extract_bits(&data[5], 10, 15) + 38;
> > > > +     c->a6 = yas5xx_extract_bits(&data[5], 4, 9) - 32;
> > > > +     c->a7 = yas5xx_extract_bits(&data[6], 5, 11) - 64;
> > > > +     c->a8 = yas5xx_extract_bits(&data[7], 7, 12) - 32;
> > > > +     c->a9 = yas5xx_extract_bits(&data[8], 7, 14);
> > > > +     c->k = yas5xx_extract_bits(&data[9], 10, 14) + 10;
> >
> > Since this segment easily fits in a u64 I thought about
> > extracing a u64 and then use FIELD_GET on that.
>
> Could do, but to a degree what makes sense here is dependent on what
> aligns well with the datasheet as that's what people will check against.
> Is there a public datasheet with this in?

There are public data sheets, but no public register descriptions.
The only documentation is code looking worse than what I
wrote (IMO).

Yours,
Linus Walleij
