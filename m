Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A89C4338F
	for <phone-devel@archiver.kernel.org>; Fri, 30 Jul 2021 09:21:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C67FF61019
	for <phone-devel@archiver.kernel.org>; Fri, 30 Jul 2021 09:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238143AbhG3JV6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 30 Jul 2021 05:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbhG3JV6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 30 Jul 2021 05:21:58 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11FBC0613CF
        for <phone-devel@vger.kernel.org>; Fri, 30 Jul 2021 02:21:53 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id l17so11476747ljn.2
        for <phone-devel@vger.kernel.org>; Fri, 30 Jul 2021 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bmtL6Vdjj5k5RGhRsWd7cHDELGFIW5xujPHpB/57Xq0=;
        b=oi2jkH6IJzCgg7/px7n5c9sFzHTbgl/hIrUfZRqkZkhjxCd4HJqpAu+75C21pN1dtZ
         31klCJqnzmIGiLEYW5u+1SlikxFCoE+zGhMYXuX7UTN/jYjLYk1R1vVVO8jCONH3euaI
         vBidPXiIM9YdMH1vbWdTc3qVgjJ5z1N4cERjTqprqtzcQzW7QFePZfN1fuD2C5NHkxxZ
         e/BvwyBk15PXK+zfQH1mZAaE22j7NEEoIcbiJnG1XeI6BBWv7/TYhL2uxxXhc4H+gmHi
         iCXggk30PkOT029DBAif0P5mPbC2TriwlGmHGGbNPBEyti5yb6nJeCIHWAweGKnKOxRD
         kwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bmtL6Vdjj5k5RGhRsWd7cHDELGFIW5xujPHpB/57Xq0=;
        b=VPcVTSSbsFphWkuuZPAtiCc8Jc6exPbQr1dxYKK6XE99O3zTKQu2dR4dY3A0/Cg8iY
         Tg8CXOLbSvTFPx6L9y6UbbsHSU0aJGTGl8mts+a+tTYEDbb2ZFcaSi4Wmj/8HNOoZPdR
         UdAJdSHjeNN5nzVzMO9++j0hHgrtg8ope2xxU46XdvdE6WKDiWER0w99ImPrzC20AfXz
         hEF9SQ0eT5778vFx2q+Y5aIRMeVeNtxmqFB3/F1MskzF7tmNryT9J2WjY9MrlfRxNgzN
         gV5Hrm6a2ZxycPcwR4JDBDvsxhL9qjANdqmAM66slcM99LH2zLQ+JJLnWOqVt+qVhumK
         RH7Q==
X-Gm-Message-State: AOAM5336kxL8ciYF7sSnlXtgcQPjSdZvPeHsmjevkf2p6vl7ZjYeZKux
        l8cDQQL4xjbuZycEjcOHmc/k0jZeKdRysqA2PTW8LA==
X-Google-Smtp-Source: ABdhPJzInc6eePs7o0CSdISwDcn4+dULVaH2OFG6AcqlL1J6KswAUFVurHtlSyYUxQLVqRbD1ZA/7hXPNhl/Jq3CgKc=
X-Received: by 2002:a2e:888f:: with SMTP id k15mr1079779lji.326.1627636912056;
 Fri, 30 Jul 2021 02:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210711231659.255479-1-linus.walleij@linaro.org>
In-Reply-To: <20210711231659.255479-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 11:21:40 +0200
Message-ID: <CACRpkdagx71ZnOYt7M7PZFkW4UgD-9a_7+ZsMjowaWJmZrCsUQ@mail.gmail.com>
Subject: Re: [PATCH] brcmfmac: firmware: Allow per-board firmware binaries
To:     Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-hsien Lin <chi-hsien.lin@infineon.com>,
        Wright Feng <wright.feng@infineon.com>,
        Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
        Kalle Valo <kvalo@codeaurora.org>
Cc:     linux-wireless <linux-wireless@vger.kernel.org>,
        phone-devel@vger.kernel.org, newbyte@disroot.org,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Jul 12, 2021 at 1:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> After some crashes in the 3D engine (!) on the Samsung GT-I8530
> it turns out that the main firmware file can be device dependent,
> something that was previously only handled for the NVRAM
> parameter file.
>
> Rewrite the code a bit so we can a per-board suffixed firmware
> binary as well, if this does not exist we fall back to the
> canonical firmware name.
>
> Example: a 4330 device with the OF board compatible is
> "samsung,gavini". We will first try
> "brcmfmac4330-sdio.samsung,gavini.bin" then "brcmfmac4330-sdio.bin"
> if that does not work.
>
> Cc: phone-devel@vger.kernel.org
> Cc: newbyte@disroot.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Who can pick this up by the way?

The patch is in active use in PostmarketOS and work fine there.

Kalle?

Yours,
Linus Walleij
