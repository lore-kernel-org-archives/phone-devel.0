Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECFEC25B0F
	for <phone-devel@archiver.kernel.org>; Sat, 13 Aug 2022 19:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbiHMT5k (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 13 Aug 2022 15:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiHMT5j (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 13 Aug 2022 15:57:39 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEAC13CCB
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 12:57:38 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gb36so7243555ejc.10
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JGYHeKzOnPNjlc3OvvMKt2SLhpqG2CadqQbgqAwYLc8=;
        b=cBu1gX955Ca5O0bgIBvDOeVQmOF+rnz03U2tY9avsgtMrBGu4SqEZOYSQN7zVxHoxp
         zMYINRKP8R63yRW+WUQxe1bY/Ooy3Bw64feqNJ/2kk14MSeUuWOteO+y5r4dN+uzJTK4
         LeoGB0XQM6xHxXKJE51Tz6/NwLY1vhbim6561V54zz9L6PqDmeE6wuCMWnbMkFLuA1bA
         xJPd5CtB+WKYE27WuCUl6vxHmKetIfMF5TISbZRKrmdGsA9wV21lLAPyzPlB4dQaAKvc
         wuP/zW6nWPfXhWAY7kjCeknHDRFiWXF45q5DKjlDVI+/rwSPOt0YBLz4wl8Yuq7rTKbt
         2qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JGYHeKzOnPNjlc3OvvMKt2SLhpqG2CadqQbgqAwYLc8=;
        b=Q07Z2YQJ6YuEq5EGJKav+lcocOqpQNWCxrVqPdTs6HruQHU44ciwRZdV+HtHzmhtcC
         FZJFGWekz1I+QfaOvb2qrG8Ox27DvNBR0Dcu6gUMn+lZgaMi3i4oWL+kb0FCYw8S7228
         wNtOjI19BaKjcwGAYLh0K4bMLIhYCsWamkMRp8gO0KeirItp2TZ1onxsaDHVYSYiuDlX
         SQmeGF40IFwVf6CjL5Ah3A8uHzsr+cvAQDllSMB5zCwejRkER/mPDA0pI5at/39cx/JD
         XJLBkiEc6ll1M9Y8afs+qKg8peTYTciLSyM2mH8GQ1pthBRvZVIN3HLCbgrVtHjysfVY
         xYow==
X-Gm-Message-State: ACgBeo1xTm9IDliyYMFnoPM0/Prx+slvp66tJ1m1H3MlYZcDHIsVfNwX
        JL9amNypLiJ7FqDeiQv0M9cCl0iyFHzWplFCGYeS5A==
X-Google-Smtp-Source: AA6agR6byjWAkLF7RgcR8NnyDLpre6XNFIhaJVHwkXh8pa1vGfcsOAPQBNsnrWL7KbaJndQU0ecWXrunsUrX1jcv9Ag=
X-Received: by 2002:a17:906:5a71:b0:730:aaa1:a9ec with SMTP id
 my49-20020a1709065a7100b00730aaa1a9ecmr6168817ejc.440.1660420656213; Sat, 13
 Aug 2022 12:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660337264.git.jahau@rocketmail.com> <93b50c20adb1b2acb4cddb1ab25755070edd7c07.1660337264.git.jahau@rocketmail.com>
In-Reply-To: <93b50c20adb1b2acb4cddb1ab25755070edd7c07.1660337264.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 13 Aug 2022 21:57:25 +0200
Message-ID: <CACRpkdZbbyiRBbdEGJAZwM7cWDWKaLLxyHV92j263cM6aQKwbw@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] iio: magnetometer: yas530: Move printk %*ph
 parameters out from stack
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Aug 12, 2022 at 11:56 PM Jakob Hauser <jahau@rocketmail.com> wrote:

> Use less stack by modifying %*ph parameters.
>
> While at it, in the function yas530_get_calibration_data(), the debug dump was
> extended to 16 elements as this is the size of the calibration data array of
> YAS530.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
