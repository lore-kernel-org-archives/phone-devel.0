Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85166C43217
	for <phone-devel@archiver.kernel.org>; Mon, 21 Nov 2022 14:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiKUOJf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Nov 2022 09:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiKUOJQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Nov 2022 09:09:16 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96938C9A95
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 06:05:56 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3a7081e3b95so10128407b3.1
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 06:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aNnRafn2Fe3woBngEtfiMVRe//+9fMOX4/niIs93zPU=;
        b=GqFPnWzRXaVFmPPMpBibORf6Ck5eaQEZchbGXmr8J8iv1mrebP9apgA8SqlaavFZwZ
         tfwNs6yLrp4cvwrlm3HaQAAJoUa8XsncrZMbk1MSQwfHw1YLejFjIxe8A+5mlFZ5YiwF
         Z4R3AmH895OF82fyf+7UTeQaJ01sHxkIKqvJ0WUtDN9qc9rNKBYHqX/YUjJxoku8gnOx
         OpiMS0t2iWoUK+HCgcntQC8mPnhZTmQy0ypacve5YM937WE7KTSvG9k7fqv5GVRLAXJH
         uEgjkNIb7me4Zu08Xf7Tf/1yoOeUA77iawgqczNAwuL3fxFKETjsYfk0hNZ+qJZXnLcO
         p5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNnRafn2Fe3woBngEtfiMVRe//+9fMOX4/niIs93zPU=;
        b=HRXh6yGJPjgEDWVNxDU5Fcx+yCiOPFg3ES2B/WvCWCN+ZaNyXLq+/QiffmQCabpv1Z
         gi6/jxhWK/p0RDfLQyZc1lmwXad/vs9RVJvje+s7CbTw3TC7wEluZ8ORj+o48olNHhHy
         UjBDTCg2ycXG/ZJHDvE2Qf6z7Wm0Gkcw4y9ioV+05aTUF+CHXVGlmiVbNoxZDxSCC6Ez
         uBvhLLhMgjayTKdD6k2geNdLgnXrpSFfAM5p7RWBAw6MfFI7hOFrEJkP9zj0iyQPARU/
         Ck3xsPRdm1WVwzUET5b8A3O4uEGRhyouNXsU2j/suPeG0xbQTe7uopQq7iMk9e5GhgF+
         O2vA==
X-Gm-Message-State: ANoB5pmhOXMVhuILC5G3mVFeRt8h0ZZHDr6iD36nAKmACaS+sTCOl++E
        tMKE1XW/WhLO1Y3rhhyFkSQlii+XGIdeFIbAvFDAG3SMG94=
X-Google-Smtp-Source: AA0mqf45lZgo4f1/CeR2wR/yqT5+fiTLhHmsEdpl9VSlGpdZ3QL2EjhIzQhvdZ0UdfKZRiKN1YciuGl8lO4vZEUJBFs=
X-Received: by 2002:a0d:fdc7:0:b0:37a:e8f:3cd3 with SMTP id
 n190-20020a0dfdc7000000b0037a0e8f3cd3mr17194099ywf.187.1669039555178; Mon, 21
 Nov 2022 06:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20221119221219.1232541-1-linus.walleij@linaro.org>
 <20221119221219.1232541-3-linus.walleij@linaro.org> <b0b346ca-7b47-758a-c9e7-e7fda2b0856b@foss.st.com>
In-Reply-To: <b0b346ca-7b47-758a-c9e7-e7fda2b0856b@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 15:05:43 +0100
Message-ID: <CACRpkdYf3RbPe3FL4wyxAJK0QJ1UqFMhLD=dNJm8VkO4YtZoeA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] crypto: stm32 - enable drivers to be used on Ux500
To:     Lionel DEBIEVE <lionel.debieve@foss.st.com>
Cc:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Nov 21, 2022 at 2:36 PM Lionel DEBIEVE
<lionel.debieve@foss.st.com> wrote:

> One short comment.

>  config CRYPTO_DEV_STM32_HASH
>   tristate "Support for STM32 hash accelerators"
> - depends on ARCH_STM32
> + depends on ARCH_STM32 || ARCH_U8500
>
> I'm not seeing any compatible update in the HASH driver for Ux500.

Correct, I'm just enabling it to be compiled in right now. I haven't
figured out if I will reuse the hash for ux500 as well or just keep
the old driver as it is using polling only. Need to experiment and
figure out what gives the smallest and understandable amount
of code to maintain.

It doesn't hurt to enable it to be compiled in, ideally all depends
on ARCH ... should be removed and replaced with
ARCH_nnn || COMPILE_TEST anyway.

But if you insist I can drop this oneliner.

Yours,
Linus Walleij
