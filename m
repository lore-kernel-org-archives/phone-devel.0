Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE598C4338F
	for <phone-devel@archiver.kernel.org>; Thu,  5 Aug 2021 21:06:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B2CC60EBC
	for <phone-devel@archiver.kernel.org>; Thu,  5 Aug 2021 21:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241696AbhHEVG7 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 5 Aug 2021 17:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241631AbhHEVG7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 5 Aug 2021 17:06:59 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A01BC061798
        for <phone-devel@vger.kernel.org>; Thu,  5 Aug 2021 14:06:44 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c16so13732781lfc.2
        for <phone-devel@vger.kernel.org>; Thu, 05 Aug 2021 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gjsfNCUHDF2l128sssKavdGD8G0WYEjRlXid67kgpQE=;
        b=E5dkRMn1u1x4oHRzSK8ctsaIs1Y8FaUyF1l2yBxY0aejO82HvzfgtGuQGpSbmTzGCk
         kWhXg4Wqsd0OkPJJL/SKWSQxgwLgahoZkCGnZanZm73yyCBeWKcsAncBkun/BGz+JU5q
         RHeFdEVRPp/5g/sJMpgU6kaE5EjRbJEnbSh97ikKLyY+aTn4k+8UHgSTEpHh2ko/fYFW
         fJZ0KRg31OUELKj0RUlG6RZr+fE4+1FTJekYo+OZJxahEdutd6OpbpGXzn6moKRC23/L
         m0KABb2OdH4xnmHuBn5lUvw/1BE6jlGen/jmSM0gs1THeBC+Qo0ezE/Ckek1qn3qKdxU
         dm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gjsfNCUHDF2l128sssKavdGD8G0WYEjRlXid67kgpQE=;
        b=tdBhCBHmODlBH22/dQZPwWXo6LDuAkRDmgnfZ9FNQt0RVak09GxmMJBKtve8rGZ+1d
         atwMAUH7QkcQBWj45zuYgddyR4VBsVqT6nrzF9kSQgErwBaS+ehkOJsXbYdzohXEeEia
         aVZ2VTAHOL1BjPwtsrzeezadMwxFLpjER8u1s5xTmvhh2LyZ6+CApoJ9+97hDKU8qdPv
         jvg++b1xusJtUVNHwJFLA7EBKs5tufJIx1j5EU1vpLy2zwXQa2muGGWNToIHR/1JAz4x
         3w8E/uGPaNB3AJE8L9Ew5j8lg4PCgQEn9B3MtnaDdEyNaKlMthjN88rWsODv5X0tq/y3
         c8aA==
X-Gm-Message-State: AOAM531JE3qUb49/QKlErqgV0zhw1erh5iLcvXfdepIWr+4qi7emhAJZ
        SaPkUw4XQr9IUmOeiMkXHrAoJHBnlgIT5PkbAcQrNg==
X-Google-Smtp-Source: ABdhPJw6fssTolA66bgLiBJnBkcfc29bVY2AgY8ZqmtT5FPqQrFnL8uE0+7E0eO0eFAT06+vRoVWmNhOddMcF1y09zA=
X-Received: by 2002:a19:7b14:: with SMTP id w20mr5150929lfc.29.1628197602250;
 Thu, 05 Aug 2021 14:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <YQmG6EbBherV+8px@ravnborg.org> <20210805133343.27032-1-markuss.broks@gmail.com>
 <20210805133343.27032-3-markuss.broks@gmail.com>
In-Reply-To: <20210805133343.27032-3-markuss.broks@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Aug 2021 23:06:30 +0200
Message-ID: <CACRpkdZXRtP4Z2UEQz-gwuPFkVhXTth0nFDioO9a+JKOtHXU4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1
 display panel
To:     Markuss Broks <markuss.broks@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Markuss,

sorry for reacting so late!

On Thu, Aug 5, 2021 at 3:36 PM Markuss Broks <markuss.broks@gmail.com> wrote:

> +#define s6d27a1_command(ctx, cmd, seq...) \
> +({ \
> +       struct mipi_dbi *dbi = &ctx->dbi; \
> +       int ret; \
> +       ret = mipi_dbi_command(dbi, cmd, seq);  \
> +       if (ret) { \
> +               dev_err(ctx->dev, "failure in writing command %02x\n", cmd); \
> +       } \
> +})

You don't need this wrapper anymore, just call mipi_dbi_command() directly
everywhere you use s6d27a1_command().

Because I merged this patch:
https://cgit.freedesktop.org/drm/drm-misc/commit/include/drm/drm_mipi_dbi.h?id=3f5aa5ac0b0f9704f0c60f5fbbbcdc8c043d6eb6

Yours,
Linus Walleij
