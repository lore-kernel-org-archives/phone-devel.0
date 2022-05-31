Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE09FC433EF
	for <phone-devel@archiver.kernel.org>; Tue, 31 May 2022 09:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245340AbiEaJj6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 31 May 2022 05:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245346AbiEaJjy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 31 May 2022 05:39:54 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A92695DFC
        for <phone-devel@vger.kernel.org>; Tue, 31 May 2022 02:39:50 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id v106so15949413ybi.0
        for <phone-devel@vger.kernel.org>; Tue, 31 May 2022 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=owik/ERIKQ/Xn0y08fcg1q8jOY8cbMmZRyuaUyU18sA=;
        b=lQQ96cMxOA4G9iVLjQ4z6e2m7ZJQpJFgBxCrdGn/ioTtmBrwPLWuH5n8fDoP8/GAlq
         WrFsT2wBmih+5WcNUVwYVfUuC3xdE/uwnVd7D9zQybSFIJu8Yn+KkYCM9mOfy5e2WHit
         7YyYNk6XvJpPs7ZcV/IJHCWxPpXQ+vP7mBOAe8jIu6TneEQW0ha6Z4LKRQ0dSXpWZPno
         Sx42g/lk+HqSaAAeF9geGAOlGAA/i8HoBxIUZH9O37RvveMM9nozLDC4p8bMfbS1+8Is
         ILFHFv1n18ekK70DyNN4VL8spINVIQ/A4NZWL+0C49tdaEDoVVkpOznurGQzq4Wzgr93
         11bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=owik/ERIKQ/Xn0y08fcg1q8jOY8cbMmZRyuaUyU18sA=;
        b=rhLo4GZwfa9cYRa5rDAqMAMKsy1DZ/ehYmjPQhc70QPUOFupk26P538/gTYOn112Vq
         6fFubRgsfdXxS3BweLBqcTF2m9fGxn1mzTLIKWsvCQKFcLF2/57YkwcXAlqE/URKobwn
         sWfmGdREiMPxY8FSG+6vyHQjy5BTr43F/xJfLGlUlL8P1jjwwTzQsU2XO3QZp0rvEgXr
         z+3lhPAEnvhY/fD5JOAfYVIAL4QUeXFv55bwqH20OoAnqvtbZTXLIV9+RXha2fk9memM
         hiFIH4TW83+4wQ2Tjm/WO4qDiXGrz/54n6TKWm1HLsodtzOK5eSzr2z8dciRz39zFZU2
         QBaQ==
X-Gm-Message-State: AOAM530Yradz4cL35ZeU+F0R+WfmophdRq7WLb0D45cxG1OP52a9wMME
        wYd5euHb8FXKnGQ/FCVS/bhg8J5T+SgaIMTHOokQoA==
X-Google-Smtp-Source: ABdhPJzJ5ytNhC9HvdgLcAnnUu0XWT4XYNnYlfIbRfnZZFTub5PI7q+eBt5ywXskTbAQnXYM+BDjueQa7AkpkbKiHvQ=
X-Received: by 2002:a25:df50:0:b0:65c:e053:3449 with SMTP id
 w77-20020a25df50000000b0065ce0533449mr9534101ybg.291.1653989989529; Tue, 31
 May 2022 02:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220530160753.100892-1-jo@jsfamily.in> <BY5PR02MB7009301398881E89033F1DF0D9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009301398881E89033F1DF0D9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 May 2022 11:39:38 +0200
Message-ID: <CACRpkdZO6yB4SZzMgORv=1LCxbiaabfv=UyOQksn6F_WxgGa=w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel: introduce ebbg,ft8719 panel
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
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

Hi Joel,

On Mon, May 30, 2022 at 6:08 PM Joel Selvaraj <jo@jsfamily.in> wrote:

> +#define dsi_dcs_write_seq(dsi, cmd, seq...) do {                               \

Please name it mipi_dsi_dcs_write_seq() and...

> +               static const u8 d[] = { cmd, seq };                             \
> +               struct device *dev = &dsi->dev; \
> +               int ret;                                                \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d)); \
> +               if (ret < 0) {                                          \
> +                       dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
> +                       return ret;                                             \
> +               }                                               \
> +       } while (0)

My suggestion was to add this macro to include/drm/drm_mipi_dsi.h, just patch it
in there under the other mipi_dsi_dcs_* functions.

I think a few other drivers could make good use of this macro.

Yours,
Linus Walleij
