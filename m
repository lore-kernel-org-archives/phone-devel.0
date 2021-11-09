Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D90C433EF
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:45:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D2961186
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242841AbhKIEsH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242766AbhKIEsG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Nov 2021 23:48:06 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CD8C0613F5
        for <phone-devel@vger.kernel.org>; Mon,  8 Nov 2021 20:45:21 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id bf8so13632233oib.6
        for <phone-devel@vger.kernel.org>; Mon, 08 Nov 2021 20:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rrUXzO/SXSYvsB+cqJXI4sWsKIikjeXfqc6uXfkQ7dU=;
        b=fZx8eeRzFjoenMcmcYQTn6ymcMuoGaZwU682S15i1IwsNsJ4Kc7YMsYbYqlUDBzoQ5
         0xutz+Ylapgh8ApsABzt7BASgYb9+0tqZWeSLQ+QBcOAHyO41nUuhrxzUqJ55yKN3ShG
         PjER1WHqs+kZ2b17N7OkIFVVdE/wIczhKNcEBHi4iC08o0Hb+bbprn5ZTTYey8I3vTIy
         YfqfkZhhtp7fwANa9X2q6iidrjyXiF9kWBiJTjOY1s2iGCtrUC0Kf3F4zCklQfrTlnCV
         xaC+8xmw3CLcy1CH4mLOtU6tMW/fTnnxIxj+iXTH3c+HRWEL0fTGFt5Bt8M/UvZSaKjM
         3ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rrUXzO/SXSYvsB+cqJXI4sWsKIikjeXfqc6uXfkQ7dU=;
        b=msux2OoSWJeJBUWuudx/4IbsN3P2vSpc2KTbhE0cNRgn1EbjWw0XVlP2tss4ZkyI32
         3Xgx407F8QiRyWJmbzD3JbR/nAt77EkDCnEjYcH4RH11LlkyhCKXAoXgUvXwBow4XuJH
         X1jYA/GZpoZy4DNl5kyzlJeAKsInoXohwBgYTq308jgflqNooNXqBR09KRvay+SEf8Qa
         UfgpfnXJWmcUpN6eUgll/RSy9wlMDsq68065EANyKG7yjI8sQMqu8IT64vwdqn2VPRUr
         Tu5eHJLEfMcA7fob4o/Eqwmki4EE1HMxUZW+6hw+mJcN1zH28KyEtPcyZjHioc3r1nMc
         RMqg==
X-Gm-Message-State: AOAM5319rqFp25YLDcnkBbipRRyM48WSpF8dKeuqfQPuqK7Gl+c1rtZk
        VaOW7AnLvskHa7NyAon2kBAvWDut0wEb5sS1teXoFg==
X-Google-Smtp-Source: ABdhPJxB/Y/jjWaY9guY61DEGMDSZKf3Q4w5/NgwO5gdErp/7ZQwieYv6LRgOffm7IVuHcgnSYnEQbM++u3iJSxmJ5s=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3127795ois.132.1636433120520;
 Mon, 08 Nov 2021 20:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:45:09 +0100
Message-ID: <CACRpkda_EM9mXuJdrZcpFaJCKF1UDgXkfdxkaniyXFHFd_7+Pw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Nikita,

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> This series adds support for the touch-keys that can be present on some
> touchscreen configurations, adds the compatible for bt532 and fixes a
> small race condition bug in the driver probe function.
>
> I also pick up the series that converts the dt bindings to yaml
> initially submitted by Linus Walleij in [1].
> I made some minor changes to those patches:
>  - Fixed dt_schema_check error
>  - Adressed the review comments from Dmitry on the original series

Thanks for picking this up!

Have you notices some behaviour like surplus touch events
(like many press/release events fall through to the UI)
when using this driver? I think it might need some z fuzzing
but I am not sure.

Yours,
Linus Walleij
