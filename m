Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F34C43334
	for <phone-devel@archiver.kernel.org>; Thu,  9 Jun 2022 08:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237448AbiFII4N (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Jun 2022 04:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbiFII4C (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Jun 2022 04:56:02 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A1A2F5AB7
        for <phone-devel@vger.kernel.org>; Thu,  9 Jun 2022 01:54:17 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id v22so40665843ybd.5
        for <phone-devel@vger.kernel.org>; Thu, 09 Jun 2022 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=46B8xqgLyA2nIxxCyJgy2mwyMAn4omtDFOknFYC1OSo=;
        b=ypJShre3mVtGuITyKsNvvLFGwgERn/nfK1UfwvJGpR1pD12miAvWPE/i9FoXF+TKx4
         bchH7OIGTVVKu6xaHAlFkCdxPBmAlGqEO+/b0ALwQGHI0KNJZMB/AJyuTfw1HSHXJ/gg
         TlV3P8LEVi0I8RuQ4JRlQGD0OpdZ9boZe3F4iAv9XIy4t6e+klPYTEBisJzskHJCXzcG
         F6jC5SkxvUiviRtu/yYrwcJHuvHns13yet7Ae2JWtDxgNBtAWwS74zVf6QfNxH0z3RgD
         DtQNCqPy+zhby7JCAsEvYy02Y/VX71aSXPIeC5VD1NE//SD4ulUf5yNfaOZ3ZMDaY0bY
         +/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46B8xqgLyA2nIxxCyJgy2mwyMAn4omtDFOknFYC1OSo=;
        b=qSWkILIKDku9LGc7I+wY9Ct3DSbMEdyI5rgppRf1cg4JUPZXO/4YNDUBR2CDwi98Rn
         4Aaz/9GoxJPoceu8uQYXqzCMoI/WOnRr3HPFraeo0M8oIyWMRp6LlwBTNG9V+L0Fw7EI
         AVtJv08O6yI/pPMqvwXV0uAC6FPsLVbiZ/bXzJsQRHeX1UQ0nGUompaTtkaCvpHIGUs3
         0rDP4C6fADLr65DSL4Nx7U6oQLvgVvjMvqVVvDU6hxHp0qKgENqcUa26aPa+tY56FYFl
         i1JVObsjMhOZJuWvUUq1bAeuoZzvm9wM+5+aRR2AsEjVa2/LVYdRvCNSY3J/cNJ76flA
         lM3Q==
X-Gm-Message-State: AOAM532Y3q88AvsgKx5aQwRUvlLonmx/L1eIl7802zbsA1Q5aiiqpWNx
        N46uHd6zrrCEvEoc1FP65l08CdBXRD5xTN2cg2WR5A==
X-Google-Smtp-Source: ABdhPJxuEA/NjpHEQHsLDGdROeL0iVH20a4K0OemuI+2q7iVzFAizFSdq6JiVCmXYBIgKbh0SgJRRuN24JI//rkgc2s=
X-Received: by 2002:a25:b686:0:b0:664:2b6:8e13 with SMTP id
 s6-20020a25b686000000b0066402b68e13mr6741653ybj.533.1654764856347; Thu, 09
 Jun 2022 01:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654727058.git.jahau@rocketmail.com> <1b6e152e1dda138c68ea8c207e46f91337989d35.1654727058.git.jahau@rocketmail.com>
In-Reply-To: <1b6e152e1dda138c68ea8c207e46f91337989d35.1654727058.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Jun 2022 10:54:04 +0200
Message-ID: <CACRpkdZJkG98feCSB2EUELRSNBocEV+x_1q3MtkZufJbPMfiqQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] iio: magnetometer: yas530: Change data type of
 hard_offsets to signed
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

> The "hard_offsets" are currently unsigned u8 but they should be signed as they
> can get negative. They are signed in function yas5xx_meaure_offsets() and in the
> Yamaha drivers [1][2].
>
> [1] https://github.com/NovaFusion/android_kernel_samsung_golden/blob/cm-12.1/drivers/sensor/compass/yas.h#L156
> [2] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas532.c#L91
>
> Fixes: de8860b1ed47 ("iio: magnetometer: Add driver for Yamaha YAS530")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
