Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D57C43334
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239455AbiFII4z (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242773AbiFII4X (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:56:23 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7977E15EA76
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:55:57 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-30c2f288f13so233869317b3.7
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YQv5IHKS/Xq1nMBFmHNfBkfz9md7MY0lyVvFRrZc0DY=;
        b=XRRHqGnAqOBQ84tBrj9wC8wQ7Y9vKI6Im80+NZQtea6d5zDrM21gQKGAe0EZYhUxi2
         NdKzFqYxN6C4SCounbVFRqFuDGZd0zfWIhOQXrwf/CHx1b+a9GTQWe9Eno/yadSe97sb
         8xsJywepKgtGYbShWy9VUgaeNbEqdAbqKjXKNInos0VC6YxooTNg213FKKLumlDqfKBP
         0uS28v7Uv6tnpzc8q9XxyaQXxjXjv1eKFoz/eBO9/TVAm3bUMw/vTHAkOoDjBOpWAD5L
         dCzw0Q+qebhDw7igIZoleVxKhXp6aqX498oqM4oSazTvGckqmzDXkDFIowRM/hQ6B1rB
         08RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YQv5IHKS/Xq1nMBFmHNfBkfz9md7MY0lyVvFRrZc0DY=;
        b=nTBFXT4W5Hm+kMLycZ4oVOugvlW7bzaJfyMrtqp2zNwwFW0HJMFGpDg1psmUQ95Q1V
         CBY416KqQEUKP2o+DdU10iGnWqOFONUrDqrLeeKg8kmyp7D1nEt4OjRSsMBiUjhQ2CUe
         Mz//wg2UOuO2pXI6wg172RmoArKoJARb8n4uepH5nuosb/uxJ5OO2ZIryaMTxqo2AqH3
         Ddsta5K/xWFCxoHQFaDFT8e0UBpSWrpZ5DwzjGyTccKZgIlxmeHctKrIknU8IEI1maT+
         I9xa6ViexBmnSBhljaKzM7bf+/teHj4SPYk+TXJhBz+DnAZQJPUo0gVNYXgfxITI2zqZ
         agdA==
X-Gm-Message-State: AOAM532kD3FK9CnuiOfOOB59uz0SDzqBWyimIO/s7HO7G3GV2okOD9hK
        QeGYGeiAu58ULRDjh4TyMcv4I6zxqtexZ4+3zMrp+g==
X-Google-Smtp-Source: ABdhPJzYDsP+eH1L8OwT9ZaJDGbZWOYXDBP5LAhASPHy5wsNl4hkBJWT/yOlHskNuzzx/aENd9YGJwpvvGRp12PF8fw=
X-Received: by 2002:a81:1154:0:b0:2fe:d5a4:f26b with SMTP id
 81-20020a811154000000b002fed5a4f26bmr43330621ywr.140.1654764956789; Thu, 09
 Jun 2022 01:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <5ae4b9dda3032acba8b8b0e39352e9e3953e3f88.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <5ae4b9dda3032acba8b8b0e39352e9e3953e3f88.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:55:45 +0200
Message-ID: <CACRpkdbzrqmj-XvL6ut1f4h-8J4Yz7981xUKzGrzSmsX91QUxg@mail.gmail.com>
Subject: Re: [PATCH 6/7] iio: magnetometer: yas530: Remove redundant defaults
 on switch devid
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Jun 9, 2022 at 1:39 AM Jakob Hauser <jahau@rocketmail.com> wrote:

> This is a preparation for adding YAS537 variant.
>
> In function yas5xx_probe(), there is a switch statement checking for device
> IDs. If the ID is unknown, it exits with a device error. In later functions,
> it's not neccessary to check the validity of the device IDs again.
>
> When adding YAS537 in a later patch, several of such switch statements will be
> added. To make it more uniform, the redundant ones in YAS530/532 get herby
> removed. This is done in a separate patch for better history control.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

No big deal for me, this works fine.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
