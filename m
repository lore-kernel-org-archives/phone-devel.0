Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BA9C54EE9
	for <phone-devel@archiver.kernel.org>; Tue, 13 Sep 2022 19:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbiIMTPO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 13 Sep 2022 15:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbiIMTPJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 13 Sep 2022 15:15:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDAF66A67
        for <phone-devel@vger.kernel.org>; Tue, 13 Sep 2022 12:15:08 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b35so19063815edf.0
        for <phone-devel@vger.kernel.org>; Tue, 13 Sep 2022 12:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iaBEq4dr7rxdkDyBWz8pzwacOGY3QBCvx9IIu85U3nA=;
        b=uZ4KVeBj5WDV5dnQYu181zlHc3RKNTYMGmYNnY946jLVKkFgsbGUDJ7O+2dWjt7Y6R
         o625nQMlpaarxoVVIQ4g6a21SfRtR5w7ZDViTY8rzTeKM9s4aoNVupBEH543ChSZihZ/
         gvWUpd9EfTvOnTV4qt4kyyxu57cjkT3EFq7QH97yhtULI1QD0SOdV2DdJgJMJCmOhvXT
         aaNuKgU1T4YAvweZpm4mz7n6kjPpRhZa53r0SWW46rqE53hcRHcJdwkk1k7u6mZLVjk8
         8M2y92eJhMhR3e0QAp5DYsMxGaj5gfAiZ11CDdPiiB3tYttfwVkeAgbDEg+AmDOCdIrb
         ZFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iaBEq4dr7rxdkDyBWz8pzwacOGY3QBCvx9IIu85U3nA=;
        b=EdfQiwD1NlrqVtAcyzkwXu4Il4wjrQ0LJMMSBjKbtr6tT6qGB2h3YoVzQ21vDoei5z
         kF9r5hGGZdJY5Ij8ez61cdP+6VtqvUClSJNBJjW5ZfHS1Me+ach4UBPMyfPGb/pR2p+n
         oTNe/ra0seSrn0DlBHG04IxH3Ji5EvifQ2wuht7JBCNzuixYBl5Aeabt+/Q0TUH8EUej
         7eQXC+Gq1bSasN+yHkwrO+1LAoeq+xrNs23i6oolwnnEfAQLN8XcbG0jw0TI+ZMWlwUv
         y77r7fENjVdgNM3sdLcq31Ft1VqFqMLWtEOs/RyfJotEGH9YcNydTqwv1AfsSDrzmZK6
         clUg==
X-Gm-Message-State: ACgBeo0K88nE7hjGnxya4XB/RDWJfHD+8NE4VIV0vOc4/d/voIjVsOfR
        DEAZtSCflF0zH5JL4gHuclKvSTPgQSGD5zXTpXCf3w==
X-Google-Smtp-Source: AA6agR5ul+PicG4tV0RF23e3X9c//sFIQNg55aG4ryAaPL6W8k+f1n91E6RjRDN7PWMismfyRzLwj4vc0Y9wge/PGIU=
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id
 w16-20020a056402269000b004523a858b28mr5470023edd.158.1663096506526; Tue, 13
 Sep 2022 12:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220816140049.102306-1-linus.walleij@linaro.org>
 <20220816140049.102306-11-linus.walleij@linaro.org> <YwdBIfASgGMDONx4@gondor.apana.org.au>
In-Reply-To: <YwdBIfASgGMDONx4@gondor.apana.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 13 Sep 2022 21:14:55 +0200
Message-ID: <CACRpkdaNBvXvoHHUYfkAGSH1c7w0nER6yOgL9pB7OaXZL6b6_w@mail.gmail.com>
Subject: Re: [PATCH v3 10/16] crypto: ux500/hash: Implement .export and .import
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     linux-crypto@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Aug 25, 2022 at 11:30 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:

> > +     writel_relaxed(hstate->csfull, &device_data->base->csfull);
> > +     writel_relaxed(hstate->csdatain, &device_data->base->csdatain);
> > +     writel_relaxed(hstate->str_reg, &device_data->base->str);
> > +     writel_relaxed(cr, &device_data->base->cr);
> > +
> > +     return 0;
> >  }
>
> At any time we may have multiple requests outstanding for a given
> tfm/device, so I'm a bit worried with the direct writes to hardware
> in the import function.
>
> Normally import just transfers data from the caller into the
> request object as a "soft" state, while the actual update/final
> functions will then move them into the hardware state as needed.

I see the problem.

Do you think we could merge patches 1 thru 9 for this kernel
cycle though to lower my patch stack? I can resend just those
if you like.

Yours,
Linus Walleij
