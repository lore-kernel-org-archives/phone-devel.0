Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AF0C4338F
	for <phone-devel@archiver.kernel.org>; Sat,  7 Aug 2021 22:38:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06A9F60F02
	for <phone-devel@archiver.kernel.org>; Sat,  7 Aug 2021 22:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhHGWi2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 7 Aug 2021 18:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhHGWi2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 7 Aug 2021 18:38:28 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897F4C0613CF
        for <phone-devel@vger.kernel.org>; Sat,  7 Aug 2021 15:38:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b6so9506846lff.10
        for <phone-devel@vger.kernel.org>; Sat, 07 Aug 2021 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lj89aSQV7OCOrepNKn8koFUUrCNiOnfBqunvMMwzNw8=;
        b=oh7DQA5GxYuqxO4BZrykAhKNgaCAYME7OWjMo/uOvn1pw1az/pLIOa4YTbr7jJ5i3+
         M0TrPWjgVIhRP6ayY8ABnAQaVoiNCM9EN7vSxgmlLZoFyGVjvy9JuatUzFmp8fd1I3lp
         j9YxntVjVbdq5tqJknAbwvBpm5zGCvgDQDV9BnMVDgUhHt9DQ3aCVZkKfcftoVhtC0W2
         sEHvusMNS5VrWqpFdPclhyfB8sZZVFNZyd0iaFsG2ceAoG62pOKMryAV6d6kMvOf67OG
         5agI0NJnowmzqbfOFOsm1a25FcwYvz1VDfMT2op3NBtkM6mgWhxuRMW+Gx1xTHu/ZSQl
         VzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lj89aSQV7OCOrepNKn8koFUUrCNiOnfBqunvMMwzNw8=;
        b=AHFXvQSCJmxrjb3noSh1m618TRnRIG0pGSaLTRoyP6ELjfi1NaQcsCq7q7RzUitzfW
         aW0BClEpzk2BkSj4231SNWvpH+h77ory7A7rpXyeILZ3ByJNefD6wTutXEbeNzCD7kh7
         AhsM5AtsuhgZeHlz87pDvkqJb99GBB+5qO5DFr0X7BxO96CjZlIIyl7c0WSSin7ivfbu
         9cYkH5Va10zHkMpC93B06l/FQa5R+OawU4ULv2YlsVU9D9qUR9tXIVtXivxD+P+JicGy
         J7cvneuggOy1x/S5LS3Swa9fDcavFoY8hh5dqav9WPFoKzMSJTMQs+U2MMr2K1c5I44D
         do7Q==
X-Gm-Message-State: AOAM533XuD/c0Qh14mLnwxX7hKHqY1eefshovqOeEtI6wdgUFv0P8Y9r
        pI9kYmcAi9JItD7s5levkErH7gTqjgmU2SK9XHJLDg==
X-Google-Smtp-Source: ABdhPJygNJetu7Q3WHCj4Rb3EJS60ayEOW6Cf3me7T+gPMKRUGV5KHs8bfbUiAmOv/uIL8pe6VU7fSK5IaW9mbhg+w8=
X-Received: by 2002:a05:6512:1084:: with SMTP id j4mr12499776lfg.586.1628375888754;
 Sat, 07 Aug 2021 15:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <YQw7M7OF6OZLcLjk@ravnborg.org> <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-3-markuss.broks@gmail.com>
In-Reply-To: <20210807133111.5935-3-markuss.broks@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 8 Aug 2021 00:37:57 +0200
Message-ID: <CACRpkdYu5fdLvSYPV=fs0ry59abpTWoVVkKpd9cApSbmyssjmw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1
 display panel
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Markuss,

this is looking really good, the following is just nitty gritty details
I could fix while applying, we're mostly waiting for DT review now.

On Sat, Aug 7, 2021 at 3:31 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> +       /*
> +        * Exit sleep mode and initialize display - some hammering is
> +        * necessary.
> +        */
> +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
> +       mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);

Check if this hammering is really necessary on s6d27a1, on Widechips
this is just a bug, what happens if you put just one of them?

> +       msleep(50);

This should be msleep(120) on s6d27a1 (according to board-codina-mcde.c)

Yours,
Linus Walleij
