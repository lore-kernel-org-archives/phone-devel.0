Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52293C4338F
	for <phone-devel@archiver.kernel.org>; Wed,  4 Aug 2021 22:52:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F7B60E96
	for <phone-devel@archiver.kernel.org>; Wed,  4 Aug 2021 22:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhHDWw3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 4 Aug 2021 18:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbhHDWw3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 4 Aug 2021 18:52:29 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC1EC061799
        for <phone-devel@vger.kernel.org>; Wed,  4 Aug 2021 15:52:15 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z2so7268213lft.1
        for <phone-devel@vger.kernel.org>; Wed, 04 Aug 2021 15:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYdZtyj8pNJFHp1KzrJy5cVFfneYSipKoxottjQPwPY=;
        b=doSXqBlBbAIFWmKvVcXxT/K32bvtAZZBK2FEyHzxixpcjRxWFOx5udQqJpS6DdhtUe
         FL6OBkaguKCSYQAvHnzfiO0SLkhTRKxL7FoaP745lcIisR4UxslZW4xaAUoGk5sL254z
         dPbVtjCVGSnJOwY+ifIHr6gVFxZx7b/1x5vAzq/WvplArlpLcM6kpF3eLtdXYFOukoPW
         gFxu+uT5qKvWCWeKj/nDRJJTZ3rNCo9FZyWE3f2K4S4vtFaaxHDCQsNUbPoZIq4mPh34
         ykez7xP+bCu8oV26aiyBysa0HQ3f6MBXVuZnnK32yWUWEelmtGzNtyBhl5aIul9VHvEe
         kPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYdZtyj8pNJFHp1KzrJy5cVFfneYSipKoxottjQPwPY=;
        b=i5je0pwP4zRap7FBsrOPpZPWSjn6IZyW8vFgRtzLGnLry6s7Ews/CBqlbyrBJBzyFp
         UZ/Vhp8kQbWUU73n5turQcVkihUY9xpkhj3ZSj16xsA5loV9RzzK0rMDaZXhkoVJZtP6
         +w+ow9YHBA+qXdloWUgK0QiaxC2cLT54XlgvhAVXcmvKkN2rDr1K8wN8QmFIVAgNyq7M
         jP/WwedCLOKvV8TSxTYp8uRSSGYYZ9NyeoTlNwMmJlb0HDvJvPjh7oT6h4jHWXK+tLJ5
         xWwgY1H3D8wixB+izf6C9XgS2NQ+YfJQ0zhm2nrOsh2zj09GrtYBwnVoNNGKGYELU/hk
         Ci9A==
X-Gm-Message-State: AOAM533TpXfwFpPhYP+o5QCdJHOTE0YdiqP124DqO0alpFZYs6AYu4kK
        /S9ZajD7zUNELJAvGHENuRhEY8lc8kQFCCxiN1FUJUDOu3A=
X-Google-Smtp-Source: ABdhPJxilMlJha+CPg1BqDjtl7sd+Vy6Ff1gM+CV6JM+oj4VrZKGn4WYEmB51egRJoRDeYJ/4vNw3rBQtVbz5qFDYF8=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr1051247lfu.291.1628117533435;
 Wed, 04 Aug 2021 15:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
 <20210801233314.3150754-2-linus.walleij@linaro.org> <YQejHNP1AzFHZ6gK@google.com>
In-Reply-To: <YQejHNP1AzFHZ6gK@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Aug 2021 00:52:02 +0200
Message-ID: <CACRpkdaK0pBgmFSazjJ5NOj9rF9DzUyCfumxyi8PNaS_61_=Ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Aug 2, 2021 at 9:47 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 02 Aug 2021, Linus Walleij wrote:
>
> > There was an "unknown" firmware variant turning up in the wild
> > causing problems in the clock driver. Add this missing variant
> > and clarify that varian 11 and 15 are Samsung variants, as this
> > is now very well known from released products.
> >
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-clk@vger.kernel.org
> > Cc: phone-devel@vger.kernel.org
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Clock maintainers: could you please ACK this so Lee can take
> > this into the MFD tree? The chances of merge collisions are
> > zero, this code changes very seldom.
> > ---
> >  drivers/clk/ux500/u8500_of_clk.c | 3 ++-
>
> >  drivers/mfd/db8500-prcmu.c       | 6 ++++--
> >  include/linux/mfd/dbx500-prcmu.h | 3 ++-
>
> Acked-by: Lee Jones <lee.jones@linaro.org>

Actually I intended for the clock people to ACK it for you
but since it is completely independent of 1/2 it actually works
either way, maybe they will rather pick it up, who knows? :D

Yours,
Linus Walleij
