Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF47C433DB
	for <phone-devel@archiver.kernel.org>; Fri, 22 Jan 2021 21:43:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A8C923ACA
	for <phone-devel@archiver.kernel.org>; Fri, 22 Jan 2021 21:43:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbhAVVm5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 22 Jan 2021 16:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbhAVVlD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 22 Jan 2021 16:41:03 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6B4C06178B
        for <phone-devel@vger.kernel.org>; Fri, 22 Jan 2021 13:40:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p21so4460137lfu.11
        for <phone-devel@vger.kernel.org>; Fri, 22 Jan 2021 13:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVQGipISqL+GidmgskuqE54mrZNWSegyyQUFD/qGixM=;
        b=DBYc+xh+//BuisFJO7Qj1/JPZY3GmA6Q6VyAQhmchMrcnNdQgI3jZFePMXCHUuaEGg
         5RGO80cSZyrTGMfD5NST6y8FzE5ZHd23XF5yoG3UYaBQDzFj4EBslBBv+RMkVdaje+V7
         1w8G104HZiAVP9Xw4H9rO76cPe9oNYOh3DJhL4jOXrv0KPDJz0j53J/JhIHOT3M43fAm
         w0FEQ+PVt5C4c9c+XLzX44lm3z0UUqXZrPr489pWycIYpyiq4GPqoBcsQfZi8tPWdPI3
         PJGhLhoQrjfWBxZf2vgIATJgsgdEu5EAdBl5KswwMCDnuF9udk8RL7pcv6HehjvmkuOr
         eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVQGipISqL+GidmgskuqE54mrZNWSegyyQUFD/qGixM=;
        b=OFPbkf44vKcwm2I2rsKxzygOT5HQPQmfrg0ckujVeQIzdRnr79exSliPD3dbYI63Sc
         VD3M9twiAhfFjPlydz5LWzRsbSF8PKzS9STDg7XA6q5zJp8RF2lwbPocPsRWDgyAxT91
         XFBejJQOIFjr7lX84Nxi4gR0Fr5LGpTbiQ15cbFoqp4ql6E2Q2Kh6WGYEu/oegYJWam6
         yGX6L44cFZN4q6WewbTw1YSYGn4PZqMOn5wMnap0kRMpxYlNjp6RBhNXdutsYuTQWfeL
         NVHpaf49036VA8dOIG+AeugJO/IHvdItSLKmCdBtA8PbisEC9n9dTe8RUPPy+vIouRLK
         lFXQ==
X-Gm-Message-State: AOAM532QGaEiA12behYh6i8qCrONQ9TVdMaOMYjzw+1jYnzFxMUCMMbO
        0eGutm9SgeE2XDjU8ThicZMSb2kfx/ypT2Guoy121A==
X-Google-Smtp-Source: ABdhPJxfbwAudp1weWzfAaiCkKvD4TAjwf6Rim6UybIVL3cqXpXKCe6HdRAIpeeYqM+DRPelpzMSFkQEYdi9Ys2JH6I=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr3247513lfe.29.1611351619532;
 Fri, 22 Jan 2021 13:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20210102231510.2068851-1-linus.walleij@linaro.org> <20210102231510.2068851-2-linus.walleij@linaro.org>
In-Reply-To: <20210102231510.2068851-2-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 22:40:08 +0100
Message-ID: <CACRpkdbihCo+OYuu8ffokOO=eXeTDAYG1k91dFh+2HGh0jQCWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v9] leds: rt8515: Add Richtek RT8515 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi LED folks,

I think this version has covered all review comments, at least it's been silent,
can the driver be merged?

Yours,
Linus Walleij
