Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA73C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 21 Nov 2022 14:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiKUOLQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Nov 2022 09:11:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiKUOK4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Nov 2022 09:10:56 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07441183E
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 06:07:54 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id f201so13673159yba.12
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 06:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IWOZXSWadpIbDXCwQsI8zutVdTS+C5TkqaxcBi/y1dg=;
        b=m/1O1bJEHXsx6J9Mujw+gsd9g+z98hk92EVKBqEk3sHE1ScqSQZbnSxhZ11v8OOIZU
         PPDQFLV15YEBsPnWtkgUZVnvGEgAO1xxYCfl22clmWNiU2eq8oA0b/UqU0pHHzVNGp3O
         psvzrwPrnBYsgk0l2wlkayXynDsrKHwJVGJnVntPqWM+tqaB5b9FDGUYVJhlO5CvPv8e
         c4ydE43cgaxgsQYKYO78fh4oT4EG1zfkhtUFei4WahCRErL8kQN2Pmt0OYDnw4fVEl7Y
         /eLV1C51AOk5lnV6tOLSB5WoU9QQFFyF9x0ecZyEkIk2JrEVsSMDJsWzsyjuJ/2PET65
         50ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWOZXSWadpIbDXCwQsI8zutVdTS+C5TkqaxcBi/y1dg=;
        b=70AWAYoA+HAmMnrqPBMKe2hg4AXwpDvzD2MzE3H3GvAZQu+anb4hnBcGiU9EMVpBxh
         WkLluzUkvXZ5czoBDsjVwYrbnvIygTeoE9x5OU+oaqOL2ccRbkpKO78egoymoI9nDyOQ
         +MpBG9oR3flld44MBL175aJp3CJYXlcvj+PrT+uMA7sIs8BxwKqavdjg2lHh5AxyX0uN
         yL1EueIrrulzU3bkT07OdQXzyxk0FReyo6gDzEFqeQKqRTKoCnFuUrklb9v8DwR7PbyG
         hlad6yik5e3jlg5GTiY/QVmnBmVPfwRW58IiplPOmykXwosqSe2bpknKhxbNmWsA7q/s
         i7xw==
X-Gm-Message-State: ANoB5pn8Sx+6ZsXDxGmtG4msIQllOc8q5ccmls+95lo/TBME0nyhEi/z
        DdBc3szdkSIXRHdBgZ0EPs+cGsEImzyTJ24jh4K76A==
X-Google-Smtp-Source: AA0mqf6koKfrv1sUPz1RuyfPFqXMHWeOJkaz2tBv+fn82k4M8T9LPB0xozZUrsBaMW+2AebPNH4ZVg0MAPxHY0/NBjY=
X-Received: by 2002:a25:734a:0:b0:6dc:324a:7561 with SMTP id
 o71-20020a25734a000000b006dc324a7561mr17155400ybc.52.1669039673956; Mon, 21
 Nov 2022 06:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20221119221219.1232541-1-linus.walleij@linaro.org>
 <20221119221219.1232541-4-linus.walleij@linaro.org> <8f55596e-12e3-8968-ebe5-e90be38ca5cb@foss.st.com>
In-Reply-To: <8f55596e-12e3-8968-ebe5-e90be38ca5cb@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 15:07:42 +0100
Message-ID: <CACRpkdYr3RKidNUjJQG88wEua0OvMYRTHe_48W7N35C5MSsSKQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] crypto: stm32/cryp - enable for use with Ux500
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

On Mon, Nov 21, 2022 at 2:35 PM Lionel DEBIEVE
<lionel.debieve@foss.st.com> wrote:

> + writel_relaxed(readl_relaxed(cryp->regs + CRYP_CR) | CR_KEYRDEN, cryp->regs + CRYP_CR);
>
> Why are you still using CRYP_CR here, would it be better to use cryp->caps->cr to keep compatibility?

I noticed that the first two registers were not moved in the memory map so
I just kept CR and SR as hard defines.

It could be argued that the code will be containing one less memory reference
and addition so it is more efficient, but it's so little so I am fine
to change it
to an offset in the caps if you prefer it to be uniform.

Yours,
Linus Walleij
