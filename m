Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F72C43219
	for <phone-devel@archiver.kernel.org>; Thu, 26 May 2022 12:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbiEZMh1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 May 2022 08:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239553AbiEZMh0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 May 2022 08:37:26 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007C9CE17
        for <phone-devel@vger.kernel.org>; Thu, 26 May 2022 05:37:23 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d22so1316002plr.9
        for <phone-devel@vger.kernel.org>; Thu, 26 May 2022 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JAxAACxBj2q0ltIXtWhvJ9IfIUtpHHM/k3TqNqpi9jI=;
        b=bErNgXmLKViICLrEnIeno5fYz2WooLua67X61GN+2o2APHOtjZDSXIXAJv/CEQJ73J
         dQTbrulXYfbF+Xex6TH20mOoCYQLl2QEEc3S1CgTeYyeuqMpO+8Y252ATbOOLgFg1Otd
         2rv1K9uvBvXvn4cbNO9FuK1lMLkbIgSyCmf2CrDQ9aMIIunTB/GfDrF0ui7+UyKm/A26
         yOknmC6wJKcOmFMbDGhJgug4S2w8TsO8Nh2MP9i982Ddidy6JPr1CdvwLoX0sD6CAoZ0
         vZyens1PIEoFH/hshr6sseFHphZ9EIaoNEpShlz21dfAI/OyMgcGakHo2hoXhmJD5+R/
         BfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JAxAACxBj2q0ltIXtWhvJ9IfIUtpHHM/k3TqNqpi9jI=;
        b=nRulzhRTOG/c1CzTAuedrFettuOKEhZjooosxdxDE1nYqchKe2k6SkXr0YJD+HGUWo
         FqPOfdsDo+9DDQQxbUg3euHgsQFsDw6qs9+xxgMkV0Vm3zC1V/s+DEt6JRm+ORedlRXC
         OoJTffnHol9+9ryICewkWkn8/2ntMIUiONx7U+kcRQVixoZfH7khm9iRIRhQi0sfYjee
         0tCBW90elGmR2+pd4iWKCsuYdawiawe0bICTWz0eRKjSIpqvnEmbOtX5WHfowHS78zb+
         7kVjg4c4Dj6VHzpOODYQOo6SzPxqxSnGjmxae33KcfI8XJXdYJ9kQfHtcHzTVIwix7BN
         4FsQ==
X-Gm-Message-State: AOAM532SUCADVS9VMzPQ+TTLR/gSUdw2PQuyLmYfrDIwy10L8yFkvsFz
        5pSFTXkYGqbdxfmVFYNSG3Z5tR2Kxi9KeEReRXLRxg==
X-Google-Smtp-Source: ABdhPJwKF+1aH/9eGrn4tZxuy+lgadweE9lupgree9wFgTOe2AKXT+u75FlJ9iqSVzbPiyU/JpDcxoxA47JCbo7rz5k=
X-Received: by 2002:a17:90b:4d91:b0:1df:f18f:7836 with SMTP id
 oj17-20020a17090b4d9100b001dff18f7836mr2481285pjb.152.1653568643465; Thu, 26
 May 2022 05:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-5-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-5-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:37:12 +0200
Message-ID: <CAG3jFyv5OL6hJZeCSrLVUKJPiGXEs_gmP6COMQv98HhmxZrDQg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/14] media: camss: video: Add support for 8x74
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, 22 May 2022 at 18:28, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>
> Video formats in 8x16 and 8x74 are similar.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/platform/qcom/camss/camss-video.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/me=
dia/platform/qcom/camss/camss-video.c
> index 307bb1dc4589..ca955808fd6d 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -990,7 +990,8 @@ int msm_video_register(struct camss_video *video, str=
uct v4l2_device *v4l2_dev,
>
>         mutex_init(&video->lock);
>
> -       if (video->camss->version =3D=3D CAMSS_8x16) {
> +       if (video->camss->version =3D=3D CAMSS_8x16 ||
> +               video->camss->version =3D=3D CAMSS_8x74) {

#27: FILE: drivers/media/platform/qcom/camss/camss-video.c:994:
+    if (video->camss->version =3D=3D CAMSS_8x16 ||
+        video->camss->version =3D=3D CAMSS_8x74) {


>                 if (is_pix) {
>                         video->formats =3D formats_pix_8x16;
>                         video->nformats =3D ARRAY_SIZE(formats_pix_8x16);
> --
> 2.36.0
>

With that fixed:

Reviewed-by: Robert Foss <robert.foss@linaro.org>
