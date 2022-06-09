Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762D2CCA473
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242922AbiFII7M (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242926AbiFII5S (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:57:18 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B36443FF
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:57:01 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-30ec2aa3b6cso233651397b3.11
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mBfkHwomqoQVJ5iP1a2Ln1xJk4/FQ1l7KDZnSrjGyvI=;
        b=CYMqNPSHsyef6IYIjtBDYtFTSUn1o6iyPLDe8mf8prTfChI1zGYYhZJMnZbIm8FiUA
         oFLPwxEEaLjzBwYEOVui5kYGjSsgNIAimczfx9M39BGZceNvvn7B+iLjim4VVSBu6fJZ
         2jewT7TUVHYrl9g6+B2+aW4+4YvCT463SN4tgb9YALjUttohTGfZIrscesbKzhkMXkck
         UIj8Em3qDrKGD46Qkwrg0aW6L3yLIueuP8Ui3YA4rbQfNNBg055qfNuYcPIkvwu/l9Pd
         ZS6qlYwxguwdwJaiisIkYOG25JFfCkpxH9QSk8sJQ9B3/x7Xl8O7eO42Kv/QeUMEelcY
         jguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mBfkHwomqoQVJ5iP1a2Ln1xJk4/FQ1l7KDZnSrjGyvI=;
        b=CjaRbXOqnUASAivoU5xRndOwmksIJcR9iDwhfvRoZrCMT1+YYODxVDclGVyVGGpI8D
         Hc/ju/fUgiTu3SSfi9IZH24PfFG+buDlokX7N7iu6Uz7DLZyTRI6r7yUB0PRc+9oeKgo
         ooOPNKt/djNTgtAULVDFNjQh1kq9ZhNrzFYc7TTQp+YQAJa0mP0Y09YkvhttSyg7maAo
         6+LpseiVzfKgtlGUzGcE2InykF+945jZljSS5r2OARpfo4s8Z9AHIfXzKeVAhfwaQ3Nl
         tfikq5sdnDGe2uEYh8vv2UBSqb9wE68fv0mQzYViX5u46M1AGe57a5YPcQETTwjCBfWK
         XT7w==
X-Gm-Message-State: AOAM533466HjmxfRpIaNPgoYC/n2ZJFV9foKY/w+qlrPNasIe/cRvDof
        bcANM7J78PwW1FYPcBuUXyuEPhA+PeTV+MscSuk5+w==
X-Google-Smtp-Source: ABdhPJxNzvkXPmRzVZDJz9jkuJQA/0Aqdy3mgR2XfgBXPstnVV58qlb0sz3vcA2VXVVLiI4X9Riy6fyHeYZoi1rfG0U=
X-Received: by 2002:a0d:e246:0:b0:30c:5e77:7104 with SMTP id
 l67-20020a0de246000000b0030c5e777104mr43630744ywe.448.1654765020379; Thu, 09
 Jun 2022 01:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <a914ca0ea6f0149cd2941d60ae6fa2f49927f66a.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <a914ca0ea6f0149cd2941d60ae6fa2f49927f66a.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:56:49 +0200
Message-ID: <CACRpkdZzHcmGTeeVv+_EiwoPeFdyv4Dv_TOL9ZxjP-7UEoqhXQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] iio: magnetometer: yas530: Add YAS537 variant
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

> This adds support for the magnetometer Yamaha YAS537. The additions are based
> on comparison of Yamaha Android kernel drivers for YAS532 [1] and YAS537 [2].
>
> Functions used by YAS530 & YAS532 only were renamed from yas5xx to yas530_532.
> Registers were renamed accordingly.
>
> In the Yamaha YAS537 Android driver, there is an overflow/underflow control
> implemented. For regular usage, this seems not necessary. A similar overflow/
> underflow control of Yamaha YAS530/532 Android driver isn't integrated in the
> mainline driver. It is therefore skipped for YAS537 in mainline too.
>
> Also in the Yamaha YAS537 Android driver, at the end of the reset_yas537()
> function, a measurement is saved in "last_after_rcoil". Later on, this is
> compared to current measurements. If the difference gets too big, a new
> reset is intialized. The difference in measurements needs to be quite big,
> it's hard to say if this is necessary for regular operation. Therefore this
> isn't integrated in the mainline driver either.
>
> [1] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas532.c
> [2] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas537.c
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Nice work! I have reviewed the drafts before in private and can't see
any remaining issues with the final version so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
