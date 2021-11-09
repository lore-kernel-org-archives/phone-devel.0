Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43040C4332F
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 248B96124D
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242681AbhKIEkf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242623AbhKIEka (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Nov 2021 23:40:30 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB28C0613F5
        for <phone-devel@vger.kernel.org>; Mon,  8 Nov 2021 20:37:45 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id bf8so13601161oib.6
        for <phone-devel@vger.kernel.org>; Mon, 08 Nov 2021 20:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dodHiJ/i5+yBi7D79YaFpKUD7A0B39/NZgj04F7HTkw=;
        b=bxdem1QFzTvWY5Y2FugMEGhusz7KtT+Tg2/aELkYspP8+jbBn9eqwHlvusv7pgcd7j
         6D6ZszdZelH0gPfDb3eOZuBteKvIglrJWvz1URYC/chQn/SbHArSOzzGEUv45u38bq87
         axSySjtpwqup5cMdp2z/PHbwGW6nfLqXAfIInnVA9xfDZyNcTM87yBLQPTNLICf6I6w8
         436T6zDADKFoCAUS/d9Xb2gAVNaWuT2h8+isOxYbofYxlpSq5W8X4fzh64opGShFwOh+
         +ApkXe/izP+lvWMHLDQpkKS6tlaI8ZVQcySl57rluNzK8LPb0LQJ7M7eKRoCzmUV7Rev
         XjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dodHiJ/i5+yBi7D79YaFpKUD7A0B39/NZgj04F7HTkw=;
        b=Ldsxmr8N7SlX3UrJIcI/lQ7fy4zNra4lyADYoGgqbv0+cTD0G+RQrznIv2KcAYH6fG
         k3HBvaYjKkdnETQSPy1PXt+KAwGcv7BndQmFlYsYdkzZAhr+GMPbuzRR+4AKxF4bxY9l
         Abm8VCe0vDo/6/Y+D9yQ42XnDZfhB2QPCsGtKeXiSqnPG//4zxTGy7a7kFkq5lM8IdZB
         /qyiizFDz4WvmYNNnaiecRAKTQM9HR9t9xd56h1FtF8szmFnxa6Hu1LGWGHwM5WuK8+/
         PlazW5KW1ebWi41pOLpkifQv/Pf2l6WtR/ucHTyFM9mbYMoCnZ1KKE9aGT62u0keROYH
         hlHQ==
X-Gm-Message-State: AOAM5304miD0Q6H6ap1FudysYYtLINS5OZcPcJX/Iu3nt9IsQImiIdZ9
        B5iaruyb1zHWsthxP90QzzEu+qej4GOytb5BcmM1Iu7COMU=
X-Google-Smtp-Source: ABdhPJxMjFn9a+4GNqOWAH4EuafH57IWoIk8A7VGoJ9dRj8lPdTloVwkWYgqhbGYsB8vzyZye8wrz2mz+XEZdAbysWE=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3362653oic.114.1636432664361;
 Mon, 08 Nov 2021 20:37:44 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-2-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-2-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:37:33 +0100
Message-ID: <CACRpkdbnZ+U4GgaWyM7v62Ex6SNBMs-j6-pc7k1Wkan18=O+uw@mail.gmail.com>
Subject: Re: [PATCH 1/6] input: touchscreen: zinitix: Make sure the IRQ is
 allocated before it gets enabled
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> Since irq request is the last thing in the driver probe, it happens
> later than the input device registration. This means that there is a
> small time window where if the open method is called the driver will
> attempt to enable not yet available irq.
>
> Fix that by moving the irq request before the input device registration.
>
> Fixes: 26822652c85e ("Input: add zinitix touchscreen driver")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
