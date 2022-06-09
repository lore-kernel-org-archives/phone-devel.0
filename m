Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F8CCCA47D
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242825AbiFII4c (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbiFII4U (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:56:20 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7879151FE3
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:55:15 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-3135519f95fso63843037b3.6
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TuMz68s5Fg6EuYHopZIT7HJlCZTmw82TFxcZiT0Ql1I=;
        b=o/CoGKvPKJ3XW3jtB5IFQK0EhzqnRlx1qUyYGd4S358pQxdqNgde7doTTF1bt/+lR5
         1ubUCjRvzG15oP294uZp+UN1X3DnZi7atvmYN9E0xm5d+bjw5teF3e/44s3Hzy4mRSEF
         WlSYgwweQQ6gFl6VUO4Ci7ozNKhXWxpkHStZb2JSKig/Dd6f70PJ3ZcWjZe8eSSgoUdI
         0O2X9M7YU+jy5FOOen24EsnV3HNyr9TyO7fD4pxDpiY6L7QWX/slPbUb26N1Cp74FA2w
         JbdBLfLuz7nh74WyJvNttz5kLIYCyw9nQB7W4YevlO5rgBejjRYqmeJYxQLiwm4giQAR
         vuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TuMz68s5Fg6EuYHopZIT7HJlCZTmw82TFxcZiT0Ql1I=;
        b=nhcBu5asOSTqtT2CE97rYvpFnl9vVOPVigfzQRwW4x/qXpmhP2QPm/LHWpp2lNItZE
         jLtpIBXs6xPaMiMgUHR0qMdKn42vFEtmZ3ZET8vRS+/ZcyIU8PM74/RA0xQLVRtAautY
         GNE+RUaKsmLmlshfE3rflt+7AEcrFSTVhoLXF85fYEBSrx1pv05XhuS5Uf2QheuJEWKb
         A3/Ng7yvMhSv+VNgik3tiVbw2hmtOPypFuI35KrhDBdYOKFuvoaLuv/OsEq0K1Ivz7hD
         dU4W1t0+6+emt7a/L5teoMdU14bzB4PBxfVHCx2Cmf7meYcWGAUvQQWeoiD+hPGrQv5F
         iZgQ==
X-Gm-Message-State: AOAM532BP/C9zzUBQUcp9HCLLAcLAVeZ4Girzw2OPfrdXNbpPgbLGd6z
        12sI3TlO7UJrpLKt5Ff3BNMZF5CyLlUxWe37ga2rTQ==
X-Google-Smtp-Source: ABdhPJxVNYAv/+ZaABH73RIztHnTR1ak8UfaOI2+wg1nUy0DqcfFKrR/QLtehwRc17anuMWy+ybL9xot1E94J8cCuWA=
X-Received: by 2002:a0d:ca44:0:b0:30f:a4fd:2ae7 with SMTP id
 m65-20020a0dca44000000b0030fa4fd2ae7mr42796069ywd.151.1654764914930; Thu, 09
 Jun 2022 01:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <b2e1c3e59b72f83c51701470091560f9375ebc61.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <b2e1c3e59b72f83c51701470091560f9375ebc61.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:55:03 +0200
Message-ID: <CACRpkdYvFdUjpJjEAYJ9gwZFOThhxoBwfWpuo1CVZ=GGcSdwLw@mail.gmail.com>
Subject: Re: [PATCH 5/7] iio: magnetometer: yas530: Change data type of
 calibration coefficients
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
> YAS537 uses other data types on the calibration coefficients [1] than YAS530 [2]
> and YAS532 [3].
>
> On YAS537, at least for a4 and a7 this could matter because 8-bit unsigned data
> from the register gets stored into a signed data type, therefore this should be
> 8-bit as well.
>
> For YAS530/532, on the other hand, it doesn't seem to matter. The size of a2-a9
> and k is smaller than 8-bit at extraction, also the applied math is low. And
> Cx/Cy1/Cy2, now being defined as signed 16-bit, are extracted as unsigned 8-bit
> and undergo only minor math.
>
> [1] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas537.c#L76-L78
> [2] https://github.com/NovaFusion/android_kernel_samsung_golden/blob/cm-12.1/drivers/sensor/compass/yas_mag_driver-yas530.c#L526-L527
> [3] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas532.c#L76-L77
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
