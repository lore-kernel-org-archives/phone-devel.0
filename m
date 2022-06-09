Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE68C43334
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240233AbiFIIz4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241677AbiFIIzl (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:55:41 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD5F2EF0F1
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:53:53 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id g201so12820441ybf.12
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K0DkjSEsM9B1ipFcPKq7Fh6+GsA8/sySdqZ1Ys1gvV4=;
        b=QKriiGSDS2VWgGPmAw1nqvPXyJmNwsL3NRrcb2lryLC6tAnZ5aoyQVxIzCJUOcWRBp
         PtMoAgDxRCPjLKkhfRwZrSTpo/r4MFrhRmP7n5awnYRjUrLPFTGfM5lvA8qNwNa91Q22
         VJAnrYkTTxWTF9c/u6GTQBrRoUcDPLgdOHFe43b7+pr5QNlj5CByT8zLcr4KU0Ypkioz
         /n5EyIKTJmtufY6l7TiQJFfoMh1g959etPzBhDaAYq83Bg16axcvf1AvVBy536FPUPuK
         DeS7s7flCKwStt53Ncf7TjGXOMyqN1gX7aD32C7ZMzODD8zvHSXQO8jVfwWgZW0afrjW
         +dIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K0DkjSEsM9B1ipFcPKq7Fh6+GsA8/sySdqZ1Ys1gvV4=;
        b=Vrw1N+LPq/7wFIXZANoKg2hTLe/D/OjUzPJHOlzIYWxY+HsknL7Kb78xkxVR08Z182
         hpSTit7VR9CI76bVZuGlEyN395XOlaGSl1zB9cO707M4f0KdiONDJtuF1nmVFE5fpFdF
         Qhi5f6YtoMHlNjr0JJqGCZSjxpjDJ4WzijiuReu8aBuauJc+YRVB8MrQNKtMniNK04nv
         dLydxKQ9xaIqNK185DhGymCS14Pz2rK9n5c3YcWAEZRfwP4aMe8k4F5m5ZpJiwKDRaH5
         IKNA6LIkH2K2T5JlTaNE1EVhI1Qno9kqEN3pS+KPf/6S/afpkO5gZ0jLXNN2o5iTLAR3
         OPsw==
X-Gm-Message-State: AOAM532lwZX4jfESS5Kkw+IXtbdPq++l4yZhtF0JvQ27cj2zzeUJjBIU
        xJ/0IpxMswYm3ZBp8n0rqgAJ76mouO4s/5+u9tql+Q==
X-Google-Smtp-Source: ABdhPJw/lT3kFvT82YWfRN3zvdCibGU7BfkVgqO+vP484iAXxm2EPK1hlCWh2109hp+j7kXJLDEnwFnJVb6yYEI5yO4=
X-Received: by 2002:a25:c506:0:b0:663:edc1:9f98 with SMTP id
 v6-20020a25c506000000b00663edc19f98mr10424592ybe.291.1654764832235; Thu, 09
 Jun 2022 01:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <80d86bb542274dd30be9c5a22dda00736c605222.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <80d86bb542274dd30be9c5a22dda00736c605222.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:53:41 +0200
Message-ID: <CACRpkdYJhDATBZxASS6+QtRbj_9Qf1Hp2vLvohb+keOKE6-XWQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] iio: magnetometer: yas530: Correct temperature handling
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Jun 9, 2022 at 1:38 AM Jakob Hauser <jahau@rocketmail.com> wrote:

> The raw temperature value is a number of counts from a certain starting
> point. The resolution of the temperature counts is different for the YAS
> variants.
>
> Temperature compensation for YAS532 version AC seems to be handled differently.
> It uses the deviation from 20 degree Celsius [1] whereas YAS530 and older
> versions of YAS532 apply solely the t value as a multiplier [2][3].
>
> In funtion yas5xx_read_raw(), add case IIO_CHAN_INFO_PROCESSED. Remove scale
> of temperature as this isn't applied.
>
> Additionally correct sign of temperature channel in iio_chan_spec. It's already
> defined that way in yas5xx_get_measure() function.
>
> [1] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas532.c#L442
> [2] https://github.com/NovaFusion/android_kernel_samsung_golden/blob/cm-12.1/drivers/sensor/compass/yas_mag_driver-yas530.c#L881-L883
> [3] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-18.1/drivers/sensors/geomagnetic/yas_mag_driver-yas53x.c#L856-L858
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Thanks, my temperatures seem more accurate after this on YAS530.
Patch does not seem urgent as the temperature does not see much usage
outside of the device itself.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
