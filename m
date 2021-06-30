Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37034C11F65
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 14:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DA116146D
	for <phone-devel@archiver.kernel.org>; Wed, 30 Jun 2021 14:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234991AbhF3O2f (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Jun 2021 10:28:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbhF3O2e (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Jun 2021 10:28:34 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA0EC061766
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 07:26:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r16so3535424ljk.9
        for <phone-devel@vger.kernel.org>; Wed, 30 Jun 2021 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gZ+pBckd3I0US6KCT7SV+o/q8H6dAz4SMjIRYznbz+8=;
        b=OUXYxdunhTmyBDnUBK5HVfHY2SlExR2Yf/6I1RTvWEx80Vxtewe+52MvATC2Zdm2r1
         rADaUDoCQUat9RnWnmyLazNefoZHNWvkFdPS7eB/wzVLHYx2yHde8PdYJ+X7b/KNI+Lu
         JsE/nAF65bqC+G0K99QtCFB4kZgwNHEdSWtERdTlC9DyPfo+9/4rUzUzCCYUe6/y5v7A
         34NnNTzh2CPgdiSzJmcZVcD3JmzbNfyKoVXvcq4mhBzUIz2sXf/4b408ucpHnV0XRH6n
         Q1kjnB9sT19Pp4K5Va1Y2AXp/ZH0FR+1Xpf6eC5UPXoK+feVYe6VAbWrhtPQkLC9J9+n
         aqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gZ+pBckd3I0US6KCT7SV+o/q8H6dAz4SMjIRYznbz+8=;
        b=pJK1juopv4oAs13cOQ7lsS9u96la8z/Lf9Mu5pu63aFn4ROLZ5nlaCZq7yrjKA12xs
         HdhhiCDv7TNEmF3dbjItj9i1afIuA3hM6ijCVJYNk+gOeF9D9Lbh0f0oH2RANZdiYmf4
         ZQ6KAHujuw5Qh7NPSGSXl4jh8G2VJ+V/ML7fSx3Vkw8FeHXaPyfWcPYjlffls1k91+4R
         3BwRhqKlCxRnz9v+MvaxDpBBzErTXGHxtnUGRee8DIQyZr0iFTrr4u/fSkk0in6n9pD/
         PVypOnTA9hxSXXVo/P688wG0dkLjt41ZtVmjKcz/p3tb4iG0yLATRSVJYTJmgXnNSse8
         e8cw==
X-Gm-Message-State: AOAM533cy4pqvUcnZ7izzlmprQOnC33daTQFnANu4pZPHWTjgsfo46dW
        HzCPne/CRA8EQFH27Z+Ce8QfWoBLbFy6uC9KPxnu6Q==
X-Google-Smtp-Source: ABdhPJytCer44r5MEmGo2WqmYQg1eqnOCKEDZCytPohoMx+mkCdnpcDLpWTeIElecyiFhWoAVrBWuQm9TG1WPSFwXt0=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr8253530lji.200.1625063163150;
 Wed, 30 Jun 2021 07:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210628232955.3327484-1-linus.walleij@linaro.org>
 <CAPDyKFpfJC=KAZ5dGAso2zcgBic4uCkOiDFQ0ZA5Zi7UDUeEug@mail.gmail.com>
 <CACRpkdY4kegTzeqPHNEd3=hOdqSXAvJq+LehLbf09mUybU0VfA@mail.gmail.com> <CAPDyKFoj47-4XuKbV6jYkJ2pesAfHK999vudWDGTQA-J5eQXrg@mail.gmail.com>
In-Reply-To: <CAPDyKFoj47-4XuKbV6jYkJ2pesAfHK999vudWDGTQA-J5eQXrg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Jun 2021 16:25:52 +0200
Message-ID: <CACRpkdYX5RiUy7u_SeCqhytbyL1Ta9iVmx500uwAq8sNmW+3Ug@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Add a card quirk for broken boot partitions
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>, newbyte@disroot.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Jun 30, 2021 at 1:50 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> > We wait forever in mmc_wait_for_req_done() since the completion
> > never arrives.
>
> Thanks for sharing these details. It looks like the mmci driver is
> waiting for the busy completion IRQ, forever.

Yep

> Either the HW busy detection isn't working properly in mmci or the
> eMMC card is behaving a bit odd (continues to deassert the DAT0 line
> forever).

Yep. I think the card is odd because I have this working fine on
3 other ux500 phones, this is the odd one out. I will try to check
what eMMC is in the others as well.

> What certainly is missing in the mmci driver, is a software based
> timeout for cases like these. The mmci driver should better complete
> the request with -ETIMEDOUT error for the cmd, rather than hanging
> forever and waiting for the busy completion IRQ.

That is true, it would make the driver more robust.

> > I think you also mentioned the timeout in EXT_CSD maybe not being
> > long enough? How do I play around with this?
> > MMC_QUIRK_LONG_READ_TIME?
>
> As mmci doesn't care about busy timeouts, but waits forever, this is
> likely not the problem.
>
> However, I would like to try to narrow down the problem even further.
> Would you mind try the below debug patch?

With this patch mmc2 comes up and I can mount and browse
the eMMC.

I think it is because these lines in mmci_cmd_irq() will not
be executed:

        /* Handle busy detection on DAT0 if the variant supports it. */
        if (busy_resp && host->variant->busy_detect)
                if (!host->ops->busy_complete(host, status, err_msk))
                        return;

These seemed to be especially problematic to me.

However the core can still use ->card_busy() at times?

Yours,
Linus Walleij
