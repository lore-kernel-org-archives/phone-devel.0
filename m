Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FBDC4338F
	for <phone-devel@archiver.kernel.org>; Fri,  6 Aug 2021 08:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1577A61206
	for <phone-devel@archiver.kernel.org>; Fri,  6 Aug 2021 08:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243874AbhHFIPh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 6 Aug 2021 04:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243582AbhHFIPO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 6 Aug 2021 04:15:14 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08223C0617B0
        for <phone-devel@vger.kernel.org>; Fri,  6 Aug 2021 01:14:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c16so16385953lfc.2
        for <phone-devel@vger.kernel.org>; Fri, 06 Aug 2021 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jD/avfm2p41lo9b5VPwnKdxplJeoAf0dQTUMIW6jWE=;
        b=vEkPvb8W6TaWes4EedDII8c+Hoks3fgwjH5i3tESoywvbi7+98gqjT1/CM62CxTu7R
         sJjuz8NqygDBFUjysOc2cQi5CjhufOz7NFHxlO5F8FW1+zkPZXUNcOdvVStjyVxV4oEW
         PpQvWbCMnBbu2NCyjE0OjKNnhXTbQH9D6qkRVwb/bgGgaDcroZ66hT9C87pHwxmNUai8
         G+gGgr/lqFp8hodH48urk+xyPv7iGKaigPVe8DLDdA0cu1HdvhrEROjNGcwa8AQgzLqb
         +fDxpiywqEV62svQFJe06JHnjPD5X5q1qVn2db7DDTjsnXdoAEiMpQc2jajc61RpZ8HH
         5JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jD/avfm2p41lo9b5VPwnKdxplJeoAf0dQTUMIW6jWE=;
        b=msn0T6ii8ar3oKYVnGvX2Wt28QFEt7JAF8CsDpXESzMYddAv4kK0K3bWnhZ61yXNgn
         0QWns3XHmeCnLQZVY4l9n/SqQS0Zmpcjp/qicqiVbpPX4k2xBiBvRaRBOnACEbtJRLAW
         0fweREx3dvPUVLaApa75sNl2BQ/2j5ESVf2WSW4OAHbpClzcpPydAGI5wD02glwdbJ6J
         0Is3YtN7TG/7jWFXG6ahQtRH7zlL/AhIfhg+LKuopY7GEXvtP1U6ORgeMZwjl8EgDO8N
         LHXx/UxmBru6hkwZ+cTFk1jZqaYRp9utwGtGSJbazNOXypsM3yOJaVaoXoYo1AmfrmT7
         uZdQ==
X-Gm-Message-State: AOAM532n1TX9dBlP9NfHY+4GiyL24tcUDu6l6b/5BO4c35vf+aBGaodE
        KuAzypJSq6QqJKnycjrqPFaOfXN1s1f7L83Kzdd1kQ==
X-Google-Smtp-Source: ABdhPJwoQQ/ih127w1+ABBOgpekbdUrfbMfwZAngBKpgvv00NTFv2YUzJVTJkvebBkmnU9fO3Kcjc0VMMqIjlV/IlNs=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr6912020lfd.529.1628237691324;
 Fri, 06 Aug 2021 01:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
 <20210801233314.3150754-2-linus.walleij@linaro.org> <YQejHNP1AzFHZ6gK@google.com>
 <CACRpkdaK0pBgmFSazjJ5NOj9rF9DzUyCfumxyi8PNaS_61_=Ww@mail.gmail.com>
 <YQuaiW/MSZY4bmok@google.com> <162820748053.19113.16240444817751473992@swboyd.mtv.corp.google.com>
In-Reply-To: <162820748053.19113.16240444817751473992@swboyd.mtv.corp.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Aug 2021 10:14:40 +0200
Message-ID: <CACRpkdZfb4szcERUynqOaGrV5A1LbDSo-gSebW8dYmFE_=P6XQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Aug 6, 2021 at 1:51 AM Stephen Boyd <sboyd@kernel.org> wrote:

> > I assume they will not require an immutable branch, as the turn-over
> > in this file is very low.
>
> Seems fine to go through mfd. Isn't there some other ux500 patch on the
> list though?

Not for clocking, maybe more MFD stuff so merging to MFD should be
the best option.

Yours,
Linus Walleij
