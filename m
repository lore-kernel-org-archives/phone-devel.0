Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE98BC43334
	for <phone-devel@archiver.kernel.org>; Wed, 22 Jun 2022 08:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354016AbiFVItR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235117AbiFVItP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Jun 2022 04:49:15 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283496578
        for <phone-devel@vger.kernel.org>; Wed, 22 Jun 2022 01:49:14 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id w6so29009119ybl.4
        for <phone-devel@vger.kernel.org>; Wed, 22 Jun 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h3DXofTTLpzI/TjWwuQqQFpuNkc2XNdmD7En35ZxJTI=;
        b=DSxnLgcLtwEK+8xC/wAI4hy0XWVJyozvRHgM/P1PRri9OR0vAE41oLzJWNs6tSh+d6
         R1VlnSLbwHfh5J8W1RRNqIs/7slA/2yXXM7j9oyVPxPeB9YkRSjjdvZSe9O7H9MHz7tU
         LFsAPiUMBOCqLhz9bITJneV+ol9NUab5mk7MZyr5IqPD7OnAcidcQVMdmk6kNbZqw92l
         7YD8/GxiZzmXIm1urIK9V76rlwBLAdYL23WHbvF7tQm9UIk0WC2jrIsfupvY0YvKHzPh
         x5UYXcMGKpsoo23BlEWzYM7Fh/Ly4MWWJXklMWM8AZcI7Z7wPgrj4zri+B++Z1eH7+68
         RSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h3DXofTTLpzI/TjWwuQqQFpuNkc2XNdmD7En35ZxJTI=;
        b=rrkBydd90smJ+DfSSN/HXpzTUxlPSKCVPxo9xCLM7KAAMusbwyMAmqDyqNHJBdSNfS
         F/G8WlWDPflv8sxsYPpDJvlMoTcpLRU/PxZFWDqEz7xWgR067pRMGHsXEfoLI+M2vQpF
         ZZJweYc/9Oges+jaw2cLOsMTMz/38Sa5/mKTANYoc/D/+mDhtr8c1t0tCuYwG9YZFhVn
         qNmz35BW7zOAQO8dZPr75HsqsClTlLSyxIGmG659toDF/bHUhBgSqCIuSNcdlBJHfVYa
         RFRRkAvRUXl/lvWDhOq8V0GMJoeqaLinSTuKH/PNGCC425IA/rcxlhxrrBx46QnBDP7Q
         qaOQ==
X-Gm-Message-State: AJIora9f5Kpmy4C8dJ1Wlgqi3hmQOgqywrDvWE4KwEOd2IYP90TLqWrK
        He7jd82GnICseJfREaZUeWJwtsFDKgSVdXdGsvnX0Q==
X-Google-Smtp-Source: AGRyM1viKiISxQ8Egb+XkUDnqCFWJBQSB+E1CgmBQX6W95Tae4PDllQKTdZPoQBkh2q+f9xPXlJG8LG/mgZw6ik0cv0=
X-Received: by 2002:a25:7255:0:b0:668:a372:b433 with SMTP id
 n82-20020a257255000000b00668a372b433mr2451551ybc.626.1655887753451; Wed, 22
 Jun 2022 01:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655509425.git.jahau@rocketmail.com> <18f223776f6942d52af2e41dd10160e220a23311.1655509425.git.jahau@rocketmail.com>
 <20220618155618.18996d0c@jic23-huawei> <10c06f21-23d3-d3a8-5a6d-8290cf2971cb@rocketmail.com>
In-Reply-To: <10c06f21-23d3-d3a8-5a6d-8290cf2971cb@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Jun 2022 10:49:02 +0200
Message-ID: <CACRpkdbpz0LPXgW5as3g-pVyHe42R_EtdY4=zaroGxkE6kq5SQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] iio: magnetometer: yas530: Change data type of
 calibration coefficients
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

On Tue, Jun 21, 2022 at 2:51 AM Jakob Hauser <jahau@rocketmail.com> wrote:
> On 18.06.22 16:56, Jonathan Cameron wrote:
> > On Sat, 18 Jun 2022 02:13:13 +0200
> > Jakob Hauser <jahau@rocketmail.com> wrote:

> > Ok. If this is harmless to existing drivers fair enough, though my personal
> > inclination would have been to take the easier approach of making the
> > new variant sign extend on variable load (sign_extend_32() and similar)
> > just so we didn't need to check the older parts weren't affected.
>
> I didn't know that operation :) Let's take this.
>
> Not sure how to handle the "Reviewed-by:" tags. Even though it's a small
> patch, it gets modified a lot. Therefore I'd remove the tags of Linus
> and Andy.

Keep mine.
I very seldom disagree with Jonathan (or Andy) so the default to any comment
from them is to keep my ACKs/Reviews.

Yours,
Linus Walleij
