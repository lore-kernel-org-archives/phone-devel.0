Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21235C433E0
	for <phone-devel@archiver.kernel.org>; Wed, 10 Mar 2021 23:19:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5F5A64FC6
	for <phone-devel@archiver.kernel.org>; Wed, 10 Mar 2021 23:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbhCJXSg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 Mar 2021 18:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233606AbhCJXS0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 Mar 2021 18:18:26 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E92FC061760
        for <phone-devel@vger.kernel.org>; Wed, 10 Mar 2021 15:18:26 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 18so36462783lff.6
        for <phone-devel@vger.kernel.org>; Wed, 10 Mar 2021 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ETYOYkWWuwEOmh8g1BpUkeMpw9R/2k0WlMIbJjFgbe0=;
        b=mywdMmMNJWXNOvpzRYKiSkJnDeJYqEEFyJbe/D/1vTty0KMngDXw1kVVCfQiNgixNp
         XjR6pFSE91kpGFqSKsZ04/LU40yddLUSHofebFzU0prJ4DMhiSHnUo+tqLTLqbSaWGwa
         XGcnB3+gHEtr8Z/o/Dygi76jE3pgQdew6mAhbclLOcxWeBa7qw+3Os8OeaHDhAYJALFd
         aNERZfBzwon883KcCGibf2Xa1cRLUKXI/SVbL3O/aANTfhh7ZlIHP1VMSnFGOTeaU/kk
         MjLDyqPf9nkDvQdELIJGpZpGTB5lQk4kWH0b1uG98uvoply2zwp59obknZGLFl9wPP2P
         shvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ETYOYkWWuwEOmh8g1BpUkeMpw9R/2k0WlMIbJjFgbe0=;
        b=h0C3v8OVPmDMNCZXBes83mYsr87HdEdehW0wJ12W91gVj7w3DdQZErmfmaT+hgnMu4
         xBdo3KPKT8N7SnUH7+W9tlJeq6ua08AJ407j/HBwRCo/0jQEAjUJu6s/KY6RAhLgV3Or
         Cc9ncesqmys7aMHscnAzqVBkGLuB9Ww29EHxo6mNrwHyMUmeA2UtH03Vo56boq7FmHWn
         yb4r/10HQgcif0yvrPjgpbjY4ad1Jf6MNtah1dr8HRVM5Y5L8sXH/1uXthg2X7KBQ8+K
         +tr5AH9Nz6YGrf3tstaTnQ0a20zEUCh9baPiWctY1R9VnHeNvQJTe1xR9l6reHQWtYkH
         3eqQ==
X-Gm-Message-State: AOAM532VJj4OHImE4iOd9KH1e8p7fw4SdNH0ymUAdZAi1fqMsIl7ec9i
        hhKUjr3eTeQKQGL0R++RLg0BMr0TyPjtlOPwDsf4vw==
X-Google-Smtp-Source: ABdhPJwmNWGQITUCTc5qmeWRhSOQqyfgdyu7l7/Uv7dVvTj6QBJ8VXjebkqy9nB3G5/ztId3MDTZN+9ZZg9bIijjy98=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr498944lfo.529.1615418304736;
 Wed, 10 Mar 2021 15:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20210305153815.126937-1-vincent.knecht@mailoo.org> <20210305153815.126937-2-vincent.knecht@mailoo.org>
In-Reply-To: <20210305153815.126937-2-vincent.knecht@mailoo.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:18:13 +0100
Message-ID: <CACRpkdbtwjVjgv-sXG9_-j7+wSiqP_K_=4dS80JhN-F5SDV_Qw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] Input: add MStar MSG2638 touchscreen driver
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Mar 5, 2021 at 4:38 PM Vincent Knecht <vincent.knecht@mailoo.org> wrote:

> Add support for the msg2638 touchscreen IC from MStar.
> Firmware handling, wakeup gestures and other specialties are not supported.
> This driver reuses zinitix.c structure, while the checksum and irq handler
> functions are based on out-of-tree driver for Alcatel Idol 3 (4.7").
>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v6:

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
