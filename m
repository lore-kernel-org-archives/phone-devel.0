Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBABC05027
	for <phone-devel@archiver.kernel.org>; Wed,  1 Feb 2023 17:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbjBARYc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 1 Feb 2023 12:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231892AbjBARY3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 1 Feb 2023 12:24:29 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9DE77DE2
        for <phone-devel@vger.kernel.org>; Wed,  1 Feb 2023 09:24:28 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 7so8094703pgh.7
        for <phone-devel@vger.kernel.org>; Wed, 01 Feb 2023 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ4gk63LToCuSDUH/6EK6xaX1kBgO8Ejb/2RDU6gVvs=;
        b=kj3L6Beq6PcPoZqMWkoHDZdfQ5JjcXoRFNpr0/MOUzFqoT9RlYhkR1Dv8n/UuHXsFN
         uaQ9iniLQBFbVeaVYyvHgRW+kZDgVCyUvlshj0ccVLehz0VaUeclZi/p3hVItAZKOQBk
         O7lh/ky+wtTo3rhc8gCrcR9MHFyxfPaO45N4el3+0AiS62ndKAfZm//0bClgf7LC0JZW
         gUwbuwNsYCOj7UVJbWO1f1WwSQ5BLh1m0ImxDNM7w0+lKEYj8gWev8GVMozMST222cNE
         jEY7gb27ffLVHOJgZ7+u2TpPAPRUCRWb4STc9zSAWABj6YSKbE7awQHxuMvy7t2ndjd4
         /GcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQ4gk63LToCuSDUH/6EK6xaX1kBgO8Ejb/2RDU6gVvs=;
        b=AoaVfU5TqNhgi8yh+904fYz3RqGk9Z6yWNs6a/iR5iJc8RXr9wNlqrU0TLfd2KKGFQ
         QdGlJwlaDMsM7KqdI+f2GoQ5ycaHbbC2rjl8BERpfHHYdaE1VJIX2LKgrEn8Zvc/W4ZQ
         8Vx6nljPF3rxmSRKt55lrzMBt9JEjrC6BtXOcT4Okg4hB3e3lw+PLUnXzclttrrsOo5H
         L42/qP327xuu2abgXYhS143QEr55tEd5QG6JANC09vBWgzgJ9+lhcQor/NXt3aWIMQ7s
         IWghQewiDkOZ0CNrPKJdImngb86PGcAYMKRNGgOJo39RCC6e7QTkyNjXCyScI8GKHSZN
         5HdA==
X-Gm-Message-State: AO0yUKW86ua/j4l1wcvqtFgCLPVLPjGxA2crPI69Bo0KNKkALMfZDV1+
        iP8DC4hjTwLtZLF7ypARIgfkeCNV9N2T9xLp84mdgp8Ixt3D4F9j
X-Google-Smtp-Source: AK7set90UWFosYNGBdl3XnZox3OHXkp0JWRwDy4zr/pT39pNeg0ySvcYQ0fE6vha6vSNRUyUsrWy+QXylYFKpmREb/M=
X-Received: by 2002:aa7:94b9:0:b0:593:1253:2ff5 with SMTP id
 a25-20020aa794b9000000b0059312532ff5mr725570pfl.14.1675272267889; Wed, 01 Feb
 2023 09:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20230129-ov2685-improvements-v2-0-210400f2b63e@z3ntu.xyz> <20230129-ov2685-improvements-v2-1-210400f2b63e@z3ntu.xyz>
In-Reply-To: <20230129-ov2685-improvements-v2-1-210400f2b63e@z3ntu.xyz>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 1 Feb 2023 17:24:10 +0000
Message-ID: <CAPY8ntDvviyCox5_WpmOcgMgHuok9LcF1NSgRkfcHFcSgGVuSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: i2c: ov2685: Make reset gpio optional
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Luca

On Wed, 1 Feb 2023 at 17:07, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> In some setups XSHUTDOWN is connected to DOVDD when it's unused,
> therefore treat the reset gpio as optional.

The binding doc [1] says that reset-gpios is a required property.
Making it optional should therefore have a patch for the binding
first, and then a patch updating the driver.
Unfortunately my understanding is that means converting it to YAML as
well due to the txt docs being frozen.

I know the pain - I was doing exactly the same thing for ov7251 earlier today.
I haven't run the dt schema checks or had them reviewed yet, but
"media: dt-bindings: Convert ov7251.txt to YAML" and "media:
dt-bindings: ov7251: Make enable-gpio optional" on [2] may be of help
to you.

  Dave

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/i2c/ov2685.txt#L10
[2] https://github.com/6by9/linux/commits/rpi-6.2.y-ov7251

> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/i2c/ov2685.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
> index a3b524f15d89..a422f4c8a2eb 100644
> --- a/drivers/media/i2c/ov2685.c
> +++ b/drivers/media/i2c/ov2685.c
> @@ -734,7 +734,7 @@ static int ov2685_probe(struct i2c_client *client,
>         if (clk_get_rate(ov2685->xvclk) != OV2685_XVCLK_FREQ)
>                 dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
>
> -       ov2685->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +       ov2685->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ov2685->reset_gpio)) {
>                 dev_err(dev, "Failed to get reset-gpios\n");
>                 return -EINVAL;
>
> --
> 2.39.1
>
