Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DACEC4338F
	for <phone-devel@archiver.kernel.org>; Sat,  7 Aug 2021 22:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CFB061050
	for <phone-devel@archiver.kernel.org>; Sat,  7 Aug 2021 22:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhHGWmB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 7 Aug 2021 18:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhHGWmB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 7 Aug 2021 18:42:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC59C061760
        for <phone-devel@vger.kernel.org>; Sat,  7 Aug 2021 15:41:43 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h17so6376965ljh.13
        for <phone-devel@vger.kernel.org>; Sat, 07 Aug 2021 15:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6hVw1r1xpEEInLXXoh33JupWqqEySNuELXLxCfeyrys=;
        b=RcsslV0xypOfQvV0lHtWdMMrmMoto9aibjGdTKlZ6OdVZsgthRLJWU3VBcar1WBu+4
         4WNOvmiLtnedt0KjCDiLGHCiTAYaHWeAy3WzUhsOAHFMgQ4Too5QCUh/bvkR6NhoA5Fd
         LV1ILblpt2cVewmiYg1QYCSstJjV44chQKGk5SqAAQu8Tf3cf4DIuYTf7wQaJH738Pi7
         zJdbwmXNUrknrCJJUUSZBTqyyNJYPbshkfB+aGmZpC584KtfGFHijNmxng9tENAQ7P23
         CNnM8jDfIwB2A3eY1JCSZi26mba09h4ol+UnZluoX0KCHKCK0Qw6eCpDrM76M3h5ucFD
         vrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6hVw1r1xpEEInLXXoh33JupWqqEySNuELXLxCfeyrys=;
        b=SMqgLsAgOv6+FR6D1EKvNGZhb5Dqly3XRGrAs+e+d32yZGOIuhMLd1z7PKYtuHBB1v
         1y7KZHiI48Bsz+g+UuC38VJkxULI+2lGAWwNsa8YNDOywdZOvsZWJUsy2o6qDZa6jUFi
         2Jo+fgjyGtw7zNCW5vQ1YNirBznB2MnZVlADPPHv+94nU+6Z2udEvfPjV+uregnKGyTw
         09+vqUxpW8yKtdBSan4Hcq6a9c8rs67s4T7VFSzGWCe2UK/8ek8iMnYua8OZCnR0gdvV
         lObUpsb2E39ElRPOtnXJVus5QhxC4OTbOsFTx2fYC9x/aFT+dQ7skjqW6C2sYA7USDOD
         7NAQ==
X-Gm-Message-State: AOAM530K+A3Y62KxvmnUWn9Mh+iirnd/7jcTZJMVmo+0+rqltOehgOjK
        hVeNnEjj8MjnLvf6G4/B/VfuoM//dLT4dqNXdLlM3w==
X-Google-Smtp-Source: ABdhPJwJvd9YehjH3Z7NxGJZ4qtVeQRm9MP0I86bEkJjIUPV/Ii2uwT9draQbeHYvx/NrjwYUO1yGuqblYUBqBwqnxw=
X-Received: by 2002:a05:651c:1318:: with SMTP id u24mr10696662lja.200.1628376101474;
 Sat, 07 Aug 2021 15:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <YQw7M7OF6OZLcLjk@ravnborg.org> <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-2-markuss.broks@gmail.com>
In-Reply-To: <20210807133111.5935-2-markuss.broks@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 8 Aug 2021 00:41:30 +0200
Message-ID: <CACRpkda5CX2AVh4=Kt7Fn_6TrW7btX0Vqb30-60SMG5u05JBgg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: Add DT bindings for Samsung S6D27A1
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

> This adds device-tree bindings for the Samsung S6D27A1 RGB
> DPI display panel.
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>
> v1 -> v2:
> changed additionalProperties to unevaluatedProperties;
> added vci-supply and vccio-supply as required;

These bindings look good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Will give DT reviewers some slack before applying the patches.

Yours,
Linus Walleij
