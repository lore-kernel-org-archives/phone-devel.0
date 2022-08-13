Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1E9C19F2D
	for <phone-devel@archiver.kernel.org>; Sat, 13 Aug 2022 19:58:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238008AbiHMT6x (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 13 Aug 2022 15:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237727AbiHMT6w (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 13 Aug 2022 15:58:52 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EE613CD5
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 12:58:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id uj29so7329143ejc.0
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 12:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XrQDftGXFitjUNFRGu6XrmPWtayrmeolUFYvl4ZLhX8=;
        b=f6NNe38/mu8L4AMIl5mKB6wFR3FloILWt5ehAIU46pwGmINSBG/+cygTh7SPtFvCfp
         8G7ShN2LDFnlRbtJL7EuWgr3oc5o+TcQNnF5yDWn5hz1Yo9cbPAN7WOJI82o2P6sktjT
         sxdFr/THihygFKsLsMGX3P6cxmF8vLM8+37Wh9evQtp8F/P8Xxf+fy7vYMhzPhqjkBxK
         0gcww8x47eZUEaFylkoGGSNgRoDWn1A7ZgGBO0wH3OcH0ykqqtJ4zuN9X8MefN3KZTaR
         nsiwE4w9cvSN8qS6BjQr1nlm5Niq68UlAuLC4OZG8sZldNZM35sk4Lnwui6QePbaHpMX
         f16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XrQDftGXFitjUNFRGu6XrmPWtayrmeolUFYvl4ZLhX8=;
        b=zsIIikgyV39sFdXZOkWVC/Onc6/AvHpX+AOU2X2iW9UcKs7Jp15dOv2abcQRY8NVpC
         3LUWDBPCs+1tG/DzzjP7Axt+5/mHWTNLBcAbtu/zZiHzIUsqtJ99A+V/nZA7WLhKYZe9
         X9oUrOYRSm0CLFXwLji8rZwv6bz2xsLeKxFepaUU3TMQnsu+AO5bF8FNaqHBlF8duq6h
         O0toUFOWeJFd+TU+zlMibKO7sbM8I/UXvqiBLC/6+gd2NPg9xjUpp3ITxu4OOZ6CRp80
         BQ5aYwQnBUtblulCjnTecvm7KDZwXP0PijxtgsP1Hdw9j55T31oJXiB/EQkiy/h4SDYC
         LBZA==
X-Gm-Message-State: ACgBeo2DuWVfkplRXPSdodpxe04qtzNUJnJcaoCu3LobL+t9hItQ02r0
        iw4IIFUaYwHA4hzX/JGJNvB0rHnwnHQMJPIHoXUHOw==
X-Google-Smtp-Source: AA6agR4R7jyOAmdjkR6jEntGSuSattb6nI27wPdG/jrhMqpgkvVMkNU/fSXnW/Dq7xX0dHAwqyvvO7ibImcC8ukYAZQ=
X-Received: by 2002:a17:907:a055:b0:730:a432:99d3 with SMTP id
 gz21-20020a170907a05500b00730a43299d3mr5958066ejc.690.1660420730089; Sat, 13
 Aug 2022 12:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660337264.git.jahau@rocketmail.com> <aeba3877933ba9d2c920b459a9037d9186c15a4f.1660337264.git.jahau@rocketmail.com>
In-Reply-To: <aeba3877933ba9d2c920b459a9037d9186c15a4f.1660337264.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 13 Aug 2022 21:58:38 +0200
Message-ID: <CACRpkdb6PHoqwGHbNXCmjp_oCoqdPGYTtKwrmM+j4jVXkgYaow@mail.gmail.com>
Subject: Re: [PATCH v6 10/14] iio: magnetometer: yas530: Add volatile
 registers to "chip_info"
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

On Fri, Aug 12, 2022 at 11:59 PM Jakob Hauser <jahau@rocketmail.com> wrote:

> Add volatile registers to the "chip_info" structure to ease the handling of
> different YAS variants.
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
