Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCF0C4338F
	for <phone-devel@archiver.kernel.org>; Fri, 13 Aug 2021 13:54:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B807A610A5
	for <phone-devel@archiver.kernel.org>; Fri, 13 Aug 2021 13:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240672AbhHMNzF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Aug 2021 09:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240663AbhHMNzF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Aug 2021 09:55:05 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB008C0617AD
        for <phone-devel@vger.kernel.org>; Fri, 13 Aug 2021 06:54:38 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id d4so19930244lfk.9
        for <phone-devel@vger.kernel.org>; Fri, 13 Aug 2021 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=otK/iMJZAO+WUnDkESkc3mIfvbccqZxXw7/cgOsKwuY=;
        b=q68p0V6YCcitFiRzJYs8VI8mus2v9tDpwSOhqnoaIDSg7LfkH0zLNiHj4gIcFdVYvQ
         6pdjylWQI5BaGuWgWjHZ5iMzfRiDEPBXSqhek8dE5WElyuuQYfmPQiwuEX4K9IdlMd/h
         ZRnDuzLR8U8r/otEDJNYndGrqUtXnOAliPlAUoRJThsn+BDTJX0USU6zKmftAO4Bccz3
         LQChesHq/80o4S4WFPSrfbXZNlJIY6rf9HfkZs7B1FEs39+7DiXkue84G5GLOw6ukWmf
         daz9pYwB2yrZ2d5XLgizi+FTaSpz3p0gJNiKb4n0TiEjynY4jcr2gA2RT7bF6JZYwnzc
         KAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otK/iMJZAO+WUnDkESkc3mIfvbccqZxXw7/cgOsKwuY=;
        b=MFCSBMBXtnPpfyYCMJQHd6SUETnPMKJGn3IujelY3JLiIVDdBaYnFA+Fu2CR+PAi9F
         J6q9DZUEzbnTtUf+ZAw9Le+fICfxOnJynKESz1hu3SuRdnHC9UxmOXXHYqCuLsugif7z
         yV9xOMgKaV/4Buu3m1cS7rhILEkKCisEBunR9LQabKalLsA10iV/Cm6bjdIV+QJw+W9+
         kKZBIVJX1Eo9pUBS1GyxuFAcnzFdwUHNXObbhAa+rftGCBz1LDyIUKLjDMMkI+F0okE+
         eW5A5tHNljFKRMyP8AzoBRyPeHOUvL054AZzKCF1J8gHyxkL4Tjf7RSyW2cozklPDVPD
         MlqQ==
X-Gm-Message-State: AOAM531ID09XvQnlvmPK4F17LT4HXJrD3W5Qpjuj+AaWfSsQBNM4xAj+
        Z0tfg4PR6uaza1hBkFP2mp+bC16gF/It2O6QhUtNIA==
X-Google-Smtp-Source: ABdhPJxme3U8eSdMjqWto+v2Z1XrKuaTSSrkpLdfLgEk06SuK1WGFzHCiMQBx5H30X5MFWZEaVZ2xe/VjuI/fkr1zX4=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr1835348lfc.29.1628862877070;
 Fri, 13 Aug 2021 06:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <YQw7M7OF6OZLcLjk@ravnborg.org> <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-3-markuss.broks@gmail.com>
In-Reply-To: <20210807133111.5935-3-markuss.broks@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Aug 2021 15:54:26 +0200
Message-ID: <CACRpkdaGvd+47zwJ8pwAU_Ce2N7bmBBJe-UwKNTQ9gfxPsCd_g@mail.gmail.com>
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

On Sat, Aug 7, 2021 at 3:31 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> This adds a driver for Samsung S6D27A1 display controller and panel.
> This panel is found in the Samsung GT-I8160 mobile phone,
> and possibly some other mobile phones.
>
> This display needs manufacturer commands to configure it;
> the commands used in this driver were taken from downstream driver
> by Gareth Phillips; sadly, there is almost no documentation on what they
> actually do.
>
> This driver re-uses the DBI infrastructure to communicate with the display.
>
> This driver is heavily based on WideChips WS2401 display controller
> driver by Linus Walleij and on other panel drivers for reference.
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>
> v2 -> v3:

Both v3 patches applied to drm-misc-next and pushed.

Yours,
Linus Walleij
