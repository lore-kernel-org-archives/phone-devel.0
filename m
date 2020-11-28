Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D82EC8301C
	for <phone-devel@archiver.kernel.org>; Sat, 28 Nov 2020 22:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1FF24073
	for <phone-devel@archiver.kernel.org>; Sat, 28 Nov 2020 22:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wsgvqs5K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbgK1Vu0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:50:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730843AbgK1Spj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 28 Nov 2020 13:45:39 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00295C02A183
        for <phone-devel@vger.kernel.org>; Sat, 28 Nov 2020 03:33:26 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id t22so8970219ljk.0
        for <phone-devel@vger.kernel.org>; Sat, 28 Nov 2020 03:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKPvFn4lbegJK70IF9mRAT16SFZjn/X0197EAhYHLLQ=;
        b=Wsgvqs5Kfz10ZOSGhgSWRHsxlR0h5Ya/M0vcDGuOwEQYH8DHkbAMphjiG/YF76u6wP
         PqbYjgFl87K+F/iulXDoEqDEjn6g6S2JCktEQow/uZ42luigGWnAGA7/CxEu/g9cbOPB
         264Cx67ayUyEoEquIiXqne748PDFuloELOujwO/OHLmLEeQPWGrxRlUWHefyJRJMOi5y
         apnQsNBn8m7liJFvQYlWtn3s4/vfvqFljR1V8nZyIypbiBGcYWL7Gdp4JmfIlJJPmv2J
         WN/JtGU7q/01o9qsXLDGB9Uz3p6oPSKP66I2e9CPGBVi7duntPyvCE0TrtH8buhUTpRT
         XEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKPvFn4lbegJK70IF9mRAT16SFZjn/X0197EAhYHLLQ=;
        b=Qqe0V/F9k/XQrR62TedmqUOzFNwxllKZnvF2uLnKKR7OLpFXA+bFUqLpmZySUwo6dv
         Q/DZOAVCFpVm6MWUt84HbJL3eEUjpjIX8EzPdAwViSz5psma77aghxZnwJVRd+KwW/iT
         qoTWjp36XHfL1Xjix4xTXQT6ksDxYGo3kNZH5+kkfsBdadkDjD8EJQAw6vJZop2Brctg
         IONj8UTrREmhkUzT9I4Dot0xudBLaSS9VRcHcRn8EPmp/gvGCzvVVzM7vHCsS45RtV7C
         e3JCXO2fD0EdEw7Xoq+e8jPlU3jhiKzlhsW7TAlsF0HHMEIpK4OIrMhfVliL3LBxzazk
         DJLg==
X-Gm-Message-State: AOAM532fPEoHeVd8D0mHxYSUUYILB9OggsY4RCesHblIdSGm3BFrUuVh
        wT0mIAbjTLuJybrUnsG/rkEie9V9v/v8q8gHKQ0YYw==
X-Google-Smtp-Source: ABdhPJwGY8O21QclJ7LQgaZvcNRsXUjT7S6+h39sfyyDVX1y8W6wzFa9fT/PJBGV3iEIX7G2FYuo5NBIlw6LoFBgaM4=
X-Received: by 2002:a05:651c:39d:: with SMTP id e29mr3999203ljp.144.1606563205299;
 Sat, 28 Nov 2020 03:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20201128004038.883289-1-linus.walleij@linaro.org>
 <20201128004038.883289-2-linus.walleij@linaro.org> <X8HNcg4fQKbo8yd5@builder.lan>
 <20201128112735.57398b74@archlinux>
In-Reply-To: <20201128112735.57398b74@archlinux>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 28 Nov 2020 12:33:14 +0100
Message-ID: <CACRpkda=_hSfbgTJNCkrHfQ3K7OHhPwbWnvVw0MDNxh-Xdggdg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] iio: magnetometer: Add driver for Yamaha YAS5xx
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat, Nov 28, 2020 at 12:27 PM Jonathan Cameron <jic23@kernel.org> wrote:

> Even better to use FIELD_GET
> which does what Bjorn suggested under the hood.

I didn't even know of the existence of that thing, and I was still
looking and scouting around for something like it.

I'll rewrite the thingie using FIELD_GET, no problem!

Yours,
Linus Walleij
