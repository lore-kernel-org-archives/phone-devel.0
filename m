Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF78C433F5
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD8886120A
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242623AbhKIEm1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237416AbhKIEm0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Nov 2021 23:42:26 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832EBC061764
        for <phone-devel@vger.kernel.org>; Mon,  8 Nov 2021 20:39:41 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id u2so31508119oiu.12
        for <phone-devel@vger.kernel.org>; Mon, 08 Nov 2021 20:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Pz92NevhlQIIHyCP8oFIg+pYIGx0bc+HYq2+R7qC0s=;
        b=VXV3qFd6feUoGA0Dj9phwKZpS6bnzrgOGgkh4jB6zxhBHGrJWiE6ZPWQgiOL0hf+4y
         qPFNTS07kLxXPEKjgkJZzla9vgUarIHavmn1Ebk5vhwk+FFIBNaaOlm6pzP9GD2NL2Ao
         C0CyaC3M/FdxyahUSp/7HVE4/xD8h5YPBFjhow+/rSFRhtkFwEb84oV98XeX7HDzDfJU
         dxozTPS9XosCvtTuDh4cAldDz0QIS5FIGEnB1k0U2Hj1fzrgwxhka4ppO18Pujf+CBPR
         yZzAQaLyzeGmKVuwpo731edvn++wOhyMWouW06nGXaBFbnfau+FdLMn5PFgKordxB1wv
         0eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Pz92NevhlQIIHyCP8oFIg+pYIGx0bc+HYq2+R7qC0s=;
        b=vN3mSZvE3ZiYe4+79LRfbmsV9CFiVlw8/+jsLd4OyeirpaULqyilXWAVPnlt2S8/z6
         hZo3w5d9whDjmFknOEa4Kc9YSedTOJTKaV894mgJJJNbvGzfkUL6MXzEWxVVZPNn1UgQ
         BWRDCa4kk896GtT9QXI37pOEdY2md/X56/XPoxSomL/sNWWiNsdcvtLjBB9iX3UM9nBJ
         KuufsLoJ+P0i55KK+I4rgJS0wdtcGp8Tu6ONeIVxAv3XObRHF5B3t0Pjd7wXG2GuYPES
         mchpTJboCgu2CS5N846r7qMCBT/PxFKoFATuE7kleKVttD5qdc6dyepywQ8/Nyh5h1c2
         Ph4g==
X-Gm-Message-State: AOAM533NHax8p4wO5jaQUw4HZuVdfk9ZukINARSUab4+s9Yi/9CZXK0K
        o5zoPY0kq54yd3MUT5o+siX2e2C91VWC0aYGsvKUEw==
X-Google-Smtp-Source: ABdhPJx4wXgHEOdy5PVg8KK2lc3tL/e4WuUSdMvP/hxe2OguXf8K6B7xBS6H6P73oUEw7ixFmlMFF5XtvO0seM32+74=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3108464ois.132.1636432780940;
 Mon, 08 Nov 2021 20:39:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-3-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-3-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:39:29 +0100
Message-ID: <CACRpkdb1LJkKd8L6XtbDbvenV7=nSLPBqKYkfiVH4UNO64c=Hw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: input/ts/zinitix: Convert to YAML, fix
 and extend
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

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> This patch was previously submited here:
> https://lore.kernel.org/linux-input/20210625113435.2539282-1-linus.walleij@linaro.org/
>
> Changes since the original patch:
>  - Use enum for compatible list instead of oneOf + const

Thanks for picking this up. I was meaning to get back to fixing up the
Zinitix driver but haven't had time.

Yours,
Linus Walleij
