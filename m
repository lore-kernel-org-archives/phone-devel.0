Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71865C4338F
	for <phone-devel@archiver.kernel.org>; Sat, 31 Jul 2021 21:24:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4256360F36
	for <phone-devel@archiver.kernel.org>; Sat, 31 Jul 2021 21:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbhGaVX6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 31 Jul 2021 17:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhGaVX6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 31 Jul 2021 17:23:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80248C061796
        for <phone-devel@vger.kernel.org>; Sat, 31 Jul 2021 14:23:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z2so25785662lft.1
        for <phone-devel@vger.kernel.org>; Sat, 31 Jul 2021 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFuagbB68OTvddF9Xywx7UrDN/I21A6uFb3ydrSsaG8=;
        b=CRqwWc7QBYs7ycsAgYE5p59uP5JVARslAuqr+wmJA6jVq8VD76RE/xwkyEuczrL7y/
         qYSvp1fOFmy8Nx+lYlnUKnZLLwK9WdJ77KXwxtjV8b4TLO7LGkEQ3cqidhda96VJomgh
         P9ON+IGk+7tfgw/4t6+joWkbp0yXfGa7NORIxMegHLyEXWrHxTFf5nXnA9PVZ6LVKcC0
         tkpjQqi+m/+t5CygOoFF9YlqixGOBWaQemI5sZnwY8qSHelPfj5HAOcx+nYtkJxVp++Z
         2/Z+et95YgDXFLfI+9N5Yc57rewWnvBMlJCJSvT9uKuW7RF7Z53fakh72OQsEsypGe8M
         jOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFuagbB68OTvddF9Xywx7UrDN/I21A6uFb3ydrSsaG8=;
        b=O99NVTHINcC4od0AYgk9Vko+ba85g2hNmfIX3n9GHRE21AL/Y5vQzVJpoAjubP8fpQ
         FBT2w2ukhUfDPkK9RD8ho7Ao7UeHQxT557nnOU2HLC1lHgKdatlu2k/lhCPszgzGXDRY
         Yg0tobZMeUQ/erf/MAG+EHaUGxFzzq2bfwfJgvX1xwMNQbrU6mWK1rfjIAjVuLhGtot2
         I6IH9W9kl5d7ZzCTjK2pygZhN5AnobUymFdmGQswtKuGQFImhpyzwQtJUNptwMF+FN8m
         MPQmeeiNV9hYxkuOX+K5xWJXcCpca842Fn1TDH+V+PwtwJGIl6Zol3Bst3oMwXPTujxL
         tbag==
X-Gm-Message-State: AOAM532/69cLWLmlF9GefNmF7AJZfY9S3yvz7HrpbVwHdhfW+XNlXtoH
        +8dYurXiSEnkFwsY+npGQRclhf1AYhVqV6fCbfoW7Q==
X-Google-Smtp-Source: ABdhPJx7Q9x1W9R0NDVhm+5e93isK61FmR6LCKivpcqNcKWU0TYWxJ+S9YQgwYa7UlNcmN4iPwiV5tUP5zTz9VvOfOc=
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr5925413lff.465.1627766628769;
 Sat, 31 Jul 2021 14:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210723192352.546902-1-iskren.chernev@gmail.com>
In-Reply-To: <20210723192352.546902-1-iskren.chernev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 31 Jul 2021 23:23:37 +0200
Message-ID: <CACRpkdYVX+AZWto15Buq023cPSodQuyYXr8Fq64-RP8SQ2b0bg@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add Pinctrl for SM4250/6115
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Jul 23, 2021 at 9:24 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:

> This patch adds support for the TLMM block on QCom SM4250 and SM6115, codename
> bengal. The code is taken from OnePlus repo [1]. The two platforms are
> identical so there is only one compat string.
>
> [1]: https://github.com/OnePlusOSS/android_kernel_oneplus_sm4250

Patches applied!

Yours,
Linus Walleij
