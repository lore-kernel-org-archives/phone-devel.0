Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30380C25B0F
	for <phone-devel@archiver.kernel.org>; Fri, 12 Aug 2022 21:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbiHLVnc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 12 Aug 2022 17:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbiHLVnb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 12 Aug 2022 17:43:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576E5B08B0
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 14:43:28 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id tl27so4087632ejc.1
        for <phone-devel@vger.kernel.org>; Fri, 12 Aug 2022 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VvRFceTANJWQeLG+LoGv/yVOevHtvwLrEgSV4FirR5w=;
        b=J9cNAKCkzLz4gHqE62ACXGjorUEOL5wrzetBYv50p1cLZtpOhDMC8s7D9e8BOcsHkR
         0TwGB6fPE287eLSlhEtlmy3YimW4uGzDFN0wz+WY2vwOnTaSuRfxT+2I6jgBptmIubHd
         eogHj6RH9rWTNkaNfebzrbgS5glLb0E3CGiqYaN8fUzHiU+4cLt7wIMyUStMqeG30CQw
         xxPznY26NbSM5YYDIrNQsrKrdkpWvtZbbbiRysmYex9p66LBH9rnlUulQefzb6qJis1t
         ZreDDEtazo9VTB/MQEPNgNGL0Zmxwcw815XFrEUa2cUjof0IEo/lTZFLDzWADsl1RDf1
         k/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VvRFceTANJWQeLG+LoGv/yVOevHtvwLrEgSV4FirR5w=;
        b=o3i5DRHUf0tLBLu3bFwviETZmnNbivLdqqgIXF+suF8TUquyysZzkR+bfIIw1lidZI
         vON+lQ11AY2cQoil30uy4+XntNRVlArgybMgMcn1fzcxvrKao8us/2Vx9Es0kmW0r5As
         hJ/q9IfFL/RSIp8z3cNABrIFRBFdxlFWftustrJNT48G4gOCTELAcnMh41ISZypOoBlb
         PoW4eazJpro+JxjAK6k6+x8dVIm01xcGBDP4GEuQesJLKiUQgb+KdhYSFCSpy0jq2IRm
         ay+8jd6GBAnKXbCVoI0B0+adwWeCDka5xyP5pO6Zg69VU8CRs3xB/pDxz3JEEo40EwMs
         SW4g==
X-Gm-Message-State: ACgBeo0WNZsm3iqqrLVscexFt5E7JutVFQM2bay4XU2L5sM2rAK6vR81
        qs6/jW86ka4wLP8+ansJrX+lJ8MId8SDxkPm65/wAg==
X-Google-Smtp-Source: AA6agR6X712x7TRB9fPQH2VDoUCEy1+d1Q7vla31HwrkzpfwMH7RbpdF1avnqsBEW4N6wKOcuAkn2F3m+b4FpR6Gi64=
X-Received: by 2002:a17:907:3dab:b0:730:933d:ae69 with SMTP id
 he43-20020a1709073dab00b00730933dae69mr3899423ejc.500.1660340606911; Fri, 12
 Aug 2022 14:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659909060.git.jahau@rocketmail.com> <a7bc9d7a7bb12a76fb217a1709fb09abd2b45892.1659909060.git.jahau@rocketmail.com>
 <CAHp75VegA6zzvQXEi_9-K3832o+j48Af3X8LivYY47Xav+w-xQ@mail.gmail.com> <850de937-8fe6-ebce-4e9d-35a617c3ade6@rocketmail.com>
In-Reply-To: <850de937-8fe6-ebce-4e9d-35a617c3ade6@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Aug 2022 23:43:15 +0200
Message-ID: <CACRpkdbXNE17cOM2Kd+mUf7JMefZE+NBWxyHt4vkQWEF_3BtjA@mail.gmail.com>
Subject: Re: [PATCH v5 14/14] iio: magnetometer: yas530: Add YAS537 variant
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-iio <linux-iio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Aug 10, 2022 at 1:41 AM Jakob Hauser <jahau@rocketmail.com> wrote:
> On 08.08.22 13:47, Andy Shevchenko wrote:

> > P.S. Do you see now how your series and the end result become better?
>
> The driver improves. Though we kind of get lost in details, I have the
> impression we could go on like this forever.

I think at one point Jonathan mentioned the phenomenon "perfect is the
enemy of good", which even has its own Wikipedia article:
https://en.wikipedia.org/wiki/Perfect_is_the_enemy_of_good

When I feel (for some intuitive definition of "feeling") that a patch
series to my subsystem is getting over-reviewed, I usually just
merge it and tell everyone involved to write and/or request
additional patches if they are troubled by the result. It's a fine line,
admittedly, it's not like I can define the trigger point.

I wished some core parts of the kernel get as much attention
and review as some IIO drivers get.

Yours,
Linus Walleij
