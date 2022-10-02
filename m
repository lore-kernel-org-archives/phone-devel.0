Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697E7C433FE
	for <phone-devel@archiver.kernel.org>; Sun,  2 Oct 2022 13:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiJBNT0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 2 Oct 2022 09:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiJBNTZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 2 Oct 2022 09:19:25 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EAF459A6
        for <phone-devel@vger.kernel.org>; Sun,  2 Oct 2022 06:19:22 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id 13so17470877ejn.3
        for <phone-devel@vger.kernel.org>; Sun, 02 Oct 2022 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=j5VIVRriTeMDEX6uw2Y4xbQwFPhK4bKzLdrKvFJvgWY=;
        b=eD/dIrkrEXHvc6HN3YLNoYEkOWq089SFWTiGMpQW+NmuNbxs8b0sWgmUdIpFvqLBPo
         4RhQPeYXGWkqL1N4TDA2cYcj3cRwX3euqIMvKVb17pn2rZBNFezeAtTJV4GnFQeDFaR8
         LO5IiLsc4XuDQn7jL7c+FIOGOO7fNGBKZtEKrLOpjqyWi3/obHGDjr+skM3tDOdCgA3b
         /bGmYcOJY1VqunFv9y3Q3Re+j5Y1e3nyZ6PVy3MvQ9Jm6UIVo5miBkOQn0GAIRPv+9cX
         qasPpzvU6HiOXbzeWfWikuRG6ZNOB26FymdDuZw/NewlyX3YibeMWJmKN+TvwW5vUUAl
         HHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j5VIVRriTeMDEX6uw2Y4xbQwFPhK4bKzLdrKvFJvgWY=;
        b=jQnu+Fsh5Hcwr4E2MO54f4hZ0nhVJ3csmXymmJO/1FfFVKe0GQM3tKQdt/IWrgdmqe
         izPpDOKp1bKFONedJYb/LrAcvTuqgktJXb2e2u4xGPn5RLaRP7oeVJGnv7Z6K3cLzPMR
         QWlEgbGuS/bXyVYesJuhreKPkVfRvIkCsUTAsDmlfNb+2qdzaK96gWZEjWZZ3dsbYDRe
         ORKJVIf3MV3pI+8PhbzpVLcO7TJzVfewhf1NLks2K6tG58ucSuAKuzOci5Es8EspocbR
         deMBd4FF10zelNQGQITVAzxhCYAIPf3909rh3bx0xeCzyFnWjMg4kzHleQbFhhLcBw7h
         JSSA==
X-Gm-Message-State: ACrzQf2ryOld3sRydB62IhLPd0qWiz+4m9qXgGkaz0TL+D4Gc5sOi34b
        zQ8yGi8v668CMhnKCht2gkYYqf+F9pKuAv0ZMJ5jd8U380k=
X-Google-Smtp-Source: AMsMyM6iABEfAOs5DtiWbQTwYgEPjrgjh3sVpQ1UOTEoRS7Z3axNDaneB55QeVHNVhkv9tJs8L5HL/ahTxM5gVH2O38=
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id
 ww3-20020a170907084300b0073a5b0e8352mr12396036ejb.438.1664716760535; Sun, 02
 Oct 2022 06:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com> <20221002122859.75525-5-matti.lehtimaki@gmail.com>
In-Reply-To: <20221002122859.75525-5-matti.lehtimaki@gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Sun, 2 Oct 2022 15:18:44 +0200
Message-ID: <CAMZdPi99qiCagqehoTyCuE19CeP-WvvePgHaSqGku-qBHg0xvQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] i2c: qcom-cci: Add MSM8226 compatible
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rayyan Ansari <rayyan@ansari.sh>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 2 Oct 2022 at 14:29, Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.co=
m> wrote:
>
> From: Rayyan Ansari <rayyan@ansari.sh>
>
> Add a compatible for MSM8226's Camera Control Interface, which is
> similar to the one used on MSM8916.
>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index ea48e6a9cfca..87739fb4388b 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -807,6 +807,7 @@ static const struct cci_data cci_v2_data =3D {
>  };
>
>  static const struct of_device_id cci_dt_match[] =3D {
> +       { .compatible =3D "qcom,msm8226-cci", .data =3D &cci_v1_data},
>         { .compatible =3D "qcom,msm8916-cci", .data =3D &cci_v1_data},
>         { .compatible =3D "qcom,msm8974-cci", .data =3D &cci_v1_5_data},
>         { .compatible =3D "qcom,msm8996-cci", .data =3D &cci_v2_data},
> --
> 2.34.1
>
