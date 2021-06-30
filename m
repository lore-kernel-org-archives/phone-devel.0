Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691CDC11F65
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 15:49:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FC3561477
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 15:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbhF3Pvt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Jun 2021 11:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235726AbhF3Pvt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Jun 2021 11:51:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39602C061756
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 08:49:19 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n14so5949095lfu.8
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CBLEdCNsKL/DEmzbZarmUYfKxCM0YWrJ43uCB3rc4OQ=;
        b=AUuZnHOjslNRB3LgR9mL5FD3aj4xdBmXgqnleB5Xt+zw9w8KmhzeCOoyBKSLTk0QY7
         P4LPhv2mDvFL84eEAG45TVUozAs9N5WRFVqrBRt6uMZXHP5+sUUHEuOoAAcEY+C06LWc
         RXnzLXO72vOzWFAa2S02rZ/pIKtjgK0ri0KAbBbfTyrNi44wTHPgOa5e6rkF/HRDRw6y
         5qEOypbbciof/93fQGnZBisXbVpGyDaSocws3DAKhTdFHh13bK59F27Z/TlKiy7Ujvd6
         DqWKs5twR2k4LTM7hIBLDqkkd7WCvMT3Il+2vXzDX9zh3/bYMfsyFffM/1W4PLdFEaVy
         LKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CBLEdCNsKL/DEmzbZarmUYfKxCM0YWrJ43uCB3rc4OQ=;
        b=GFcC/JJAUkhbsiBdLwtPquEY9iZRqsRjmsYo58AnW6H0eqY3I4A9R1AUxgdvzzygEv
         352adf0urzAlRLl0G+uHSlyAZ2ayFXIz87SP7sOs77z1yA13U1erwBd3qc0I6nLrxtZK
         BVyvAoDCUTeDDp6MG/mTEvAzZ0SRoXt/tfQYFeeIOzOuOuyHlRRLvAUg0i4W/JF5YiBS
         G9tOPxoGJyGaCt4i8yFIxoYJftxx6ELtmVU2ek+nh6l0LWZJBuA/4wvwEyrl32tpmq4Z
         6j8vjrQ5CBD2Dqpcm4QjMTMqiQ7a+Dm3msEfrNfk/Jh9OcqVmtd1yFwYgLx8lkSpdu4q
         k2tA==
X-Gm-Message-State: AOAM5331oFj3naT3CdGDYjlZqb8lN5f0pi8gYY7Xn4SBSmQ43oMScElg
        rfEs2rlhscQPC1+zHml0lPLZHp5pcMJWV4zLlAqkog==
X-Google-Smtp-Source: ABdhPJwgNjE9V41fvcIyXXDd3XXUbOL1DY0RiunHeYzLZIF3cHjFud3J1eazy5yDAgcRfIbo+2+RjXzgJG/Kl69HiSM=
X-Received: by 2002:a19:c141:: with SMTP id r62mr2148574lff.157.1625068157573;
 Wed, 30 Jun 2021 08:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210624224458.2486701-1-linus.walleij@linaro.org> <d7dc8987-60ab-41c2-0200-a7f6a8ae837c@tronnes.org>
In-Reply-To: <d7dc8987-60ab-41c2-0200-a7f6a8ae837c@tronnes.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Jun 2021 17:49:06 +0200
Message-ID: <CACRpkda-si+D=Q7=nuy+NjrQEixVQRhHt=o615N4xY7f03DkwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: ws2401: Add driver for WideChips WS2401
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        phone-devel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jun 28, 2021 at 11:30 AM Noralf Tr=C3=B8nnes <noralf@tronnes.org> w=
rote:

> > +     dev_info(ws->dev, "MTP ID: %02x %02x %02x\n", id1, id2, id3);
> > +}
>
> Why do you read these id's on every power on, it doesn't look like you
> use them?
>
> If they're just informational, they should be available through debugfs,
> see mipi_dbi_debugfs_init().

I moved them to probe. I actually really want to print this into
dmesg so we learn to understand these MTP values better,
if for nothing else so for the fact that they will turn up in google
searches.

The actual display controller vendor comes out in the first
MTP byte, and by collecting this data we can figure out to
some extent what kind of hardware is actually inside some
of these displays. In this case 0xDA is 0x40 so that is
widechips manufacturer ID.

I fixed the rest of the comments!

Yours,
Linus Walleij
