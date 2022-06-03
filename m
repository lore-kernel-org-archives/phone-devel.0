Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA5FCCA473
	for <phone-devel@archiver.kernel.org>; Fri,  3 Jun 2022 22:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349303AbiFCWD4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Jun 2022 18:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348962AbiFCWDz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Jun 2022 18:03:55 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9B72FFDF
        for <phone-devel@vger.kernel.org>; Fri,  3 Jun 2022 15:03:54 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id a64so15994995ybg.11
        for <phone-devel@vger.kernel.org>; Fri, 03 Jun 2022 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jd93PkL+Qw1fhkDXP6mqsI96OC1Y6znysjyGQstvSpw=;
        b=QcSjJ0fKpBx9wmlN43qTWPHjGeaWrwjTmVu3r29kEN5DlMFBCEgDs+d3j1WRqQ+wCG
         4yePdAc5kwY/Wn8dDZj/UlGeaf8zpcUpv8YJswuTY55j+2EXmEQph3mw4MCI2jXw4Nnu
         03kLw4i5PMFTn9ZJ/jkb2+ntFap2VGkzmNlP7DOkFpW1Wzfujf07FMIsSkp/dEn6BxEg
         YPo5y0RXm/voY+Bpz3+SPcFD5gC0Sol43yDtFv2KwL8MH6AxnDzAKo83LmeRigtf8yda
         mqoKls3FJ73AgBsBl3GY5ndk9kkwshcdXjsCDUoS4nC4rAW8w/usc3ht9k/b0Q/kMS0i
         seDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jd93PkL+Qw1fhkDXP6mqsI96OC1Y6znysjyGQstvSpw=;
        b=4b3mYu0jdcO6hHLmwRsGpZUT8xR89ace7ZMhJwXkNEHgMnua1ITH1RpoMV782YK8gu
         8fyucko9FrSRED1EphkmNpVFb2rBnWJqBNkbcYtNHYzgT09pvYb/L0n4hQuW9kB4EgVz
         9RczZ4wrF3ge9XkOHPH/WqNRZ9snGwbi9FVAuwK7CNWq74diAhPiOscMIafpa7FS69j5
         opt4eTjpKnBYszB3qUxqFJ4iDB2YCcBjINlsJZVJwn6EGy4QWZ4GFZwIfAZW9TuHD8VN
         RtaHCgHxJnDHlo5+Ac3kornpLPjYwGqFDowVrVD9T4JLuoV/+qOeQdGzEZP22n941jaw
         sh2A==
X-Gm-Message-State: AOAM533c73172fWarGgNpH0G6IBv4DkGicXcQXYjvomHLNVmIBZDpUAB
        VOia4NadHPwhqNT0UjUNRuKQY0s8xRi26V7iN8kpyw==
X-Google-Smtp-Source: ABdhPJxXJ41+KeG6CWK+9/3U+HnNOWN/7rSJmXAhK3mSPBw+reVg9osrsnA5D1icZH5FxPdwOCtuJzhZ9tGvViA79wY=
X-Received: by 2002:a25:1256:0:b0:65d:6433:7993 with SMTP id
 83-20020a251256000000b0065d64337993mr12835690ybs.626.1654293833687; Fri, 03
 Jun 2022 15:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220601082410.55266-1-jo@jsfamily.in> <BY5PR02MB7009B6FA7F17A3DA36DDA44CD9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009B6FA7F17A3DA36DDA44CD9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jun 2022 00:03:41 +0200
Message-ID: <CACRpkdaZsnB3XgBen4Ws6jTrQztsdgiafEanjHakSj+T6DFpng@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drm/panel: introduce ebbg,ft8719 panel
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Hao Fang <fanghao11@huawei.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Jun 1, 2022 at 10:24 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for working out my suggestions!

Yours,
Linus Walleij
