Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30D5C19F2D
	for <phone-devel@archiver.kernel.org>; Sat, 13 Aug 2022 20:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239476AbiHMUAp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 13 Aug 2022 16:00:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbiHMUAo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 13 Aug 2022 16:00:44 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264DF13CFB
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 13:00:43 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id s11so5020662edd.13
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EM9tI5o7cu4wiEq6j04Cmkui79kRpVPDeO3r11cZxe8=;
        b=sqniazV4HfGYr6Y5lGr2w+nYv0ovRj9lWzyMN64iOs9Wa7m3iMZDUV3sS75x9OClGZ
         14HtY+kNYJIOLVkgcundqpwuv6VfKfvHqNn87AokRB/xnROLzdbOvrR1b7hDEgu2cVkb
         2KOlRSfbd7dqK+HKObEyYmpzum2lPGGwJSgbQwUy/jx9Wl53DX8Nt4ffjGq+QOaSruNL
         6sL0Nfk3bkkHpYEnr6g/Qxc/9Z+BFYzR05FQb1ZWoKmBU0fX5kr85haaGGob29g++1sb
         SaAGndii+xVTXNoy21M9zs44NQPsLPnsTAJ82HDoPRbyWDYoKIqzG27oOGmvIB0wdKnt
         Rniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EM9tI5o7cu4wiEq6j04Cmkui79kRpVPDeO3r11cZxe8=;
        b=zH87IgeXGHT1qKfffVd5uyMr0nhC/e4EGySIVeyEXKsgZ4StfZ9tL/AWjpII5zHaAR
         EztJp3Hxw4gvbHK4xVYTnxZjX5cQOpTAr3k8TsmXVbr2SJFOHtD8YLXKXhf0eRcwtsXT
         UBB0h/7jyQD3y3q2TZ44jnF6xuXDfuyMttQyNDprOLPtIenukB54NLYC4wzi5pOFV/eN
         1FXtnFxjCZwk1ZWF2zUaOvGqvthrKnpmYbGYTb69eoLYTQ5oqlOEx9t9io89HXIZhnDk
         o6OXvLur+R1KVrwLEc+BPGHlttposPTOqiD9sgRDGaGL2Ra2qHQrZ5NpE9A0RnbzmPM6
         Wefw==
X-Gm-Message-State: ACgBeo1gwRZYPbuw372my5XVvZD4Eahs2R0hyHyVVnyUxmr66rCzfvPT
        hRaVdHfx+H/UAXeUC7rzh3V6E2FUDFeeXUFbx9LIhA==
X-Google-Smtp-Source: AA6agR5xbJj3LSaTKcgbzrjTmuTwsd1hRBucjpSNxpitKDsathpH/EhPgeF0Iy6dS2vaO93Zx86YvqcnHdurVa2nWWA=
X-Received: by 2002:a05:6402:4312:b0:43d:b9c0:65ee with SMTP id
 m18-20020a056402431200b0043db9c065eemr8490816edc.205.1660420841724; Sat, 13
 Aug 2022 13:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660337264.git.jahau@rocketmail.com> <4bd3f96262e0132b7f9720521a801da3c18abd95.1660337264.git.jahau@rocketmail.com>
In-Reply-To: <4bd3f96262e0132b7f9720521a801da3c18abd95.1660337264.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 13 Aug 2022 22:00:30 +0200
Message-ID: <CACRpkdbs-8GbDkrN3=QKvUrUd3Erm2JZtCqSC=W_5EsDMYr9dw@mail.gmail.com>
Subject: Re: [PATCH v6 13/14] iio: magnetometer: yas530: Add function pointers
 to "chip_info"
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

On Sat, Aug 13, 2022 at 12:05 AM Jakob Hauser <jahau@rocketmail.com> wrote:

> Add function pointers to the "chip_info" structure to ease the handling of
> different YAS variants.
>
> In the function yas5xx_probe(), the function call for "measure_offsets" was
> added as a conditional "if (ci->measure_offsets)". This is a preparatory step
> for YAS537, as this variant doesn't need an offset measurement.
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
