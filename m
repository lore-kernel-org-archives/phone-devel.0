Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A06C433EF
	for <phone-devel@archiver.kernel.org>; Thu, 26 May 2022 12:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344205AbiEZMju (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 May 2022 08:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238496AbiEZMjt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 May 2022 08:39:49 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBE92F03F
        for <phone-devel@vger.kernel.org>; Thu, 26 May 2022 05:39:48 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ge11so1679805pjb.0
        for <phone-devel@vger.kernel.org>; Thu, 26 May 2022 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PAgySFjjrXbq5SnypDUn3gSGjEm9mJyq4TSnOevWuVs=;
        b=fFzvaHs3iNbKVchOm1fWwluu42QmnaWq/VjYTWgFzfrpcfb0nP0cm/saZVO5L/LgAk
         B7FJZC0cQqpwGNchJJXUIs+azCRYi9004eAqc+jBVP5B7aizJp6M3l8UhN7lJMfCBe65
         e87zhwBB9X5Y7ri1ivrGtqLcNDuqglT0WXNNxw+T7WzWc68o6BmGGDraLsTha6AwHsst
         rOnzFb2MbZx2Y3AopP4t/fTEr9mO4LOreM/HqfpcXFPnvfBi+MePqKhxxrtvFwsrRnO5
         Cn4H+GLGTwbLkrOW18bXUygIyTjHHy7p6uUXPg8dIwIQU8ZH72c7rx1fXM2GO9X7C1pE
         qGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PAgySFjjrXbq5SnypDUn3gSGjEm9mJyq4TSnOevWuVs=;
        b=1teiRwdGZF0k3+7C368kE4mhsTcwiMcP6CIX9nord1FFQ26mbKzBR0sVuEPDN2PUmh
         0Afp8XBQEtwHF7Kpl65l86uXcFK8uOi0tRZUl7i09R9y/34YdwryOx3sM2DevaPDZZsE
         kN7RmlGjsyr3YqvsH6+4KqYwAI/ME7ezn8saL5P3l6vVBJsr+f7rCRbU1iTG3bH0PIqz
         rbqHKH1vF40jeQXN/5HvxyWZLWxAv2Nh6lKRal6WFR4IJDU7Es2lPXnu+WwgQccXSlWt
         KrHCDrmAaaJ9WTL2BHLQprhykpLCy0gWC8nZlgtyOxljoEL2SLtpEX/HLs/1BlDJZJqt
         SaMg==
X-Gm-Message-State: AOAM533lOZerwFwvz6R+cWFl7qr/2ezghexEhJ8DEnEoi86OS55OL/9+
        FddfA0o+Zt6qM5RKlmXQNnvXwHPBLIYb7CgC/iV7tQ==
X-Google-Smtp-Source: ABdhPJxbK0FI2sjZIRhUfteouuZoQvBGEr0IT00KISTBOhLm01vxyInDHScBacjG7bM4mg1i6kHtwevuRMjWmd8+xG8=
X-Received: by 2002:a17:902:8f81:b0:161:f4a7:f2fc with SMTP id
 z1-20020a1709028f8100b00161f4a7f2fcmr30791402plo.117.1653568787664; Thu, 26
 May 2022 05:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220522162802.208275-1-luca@z3ntu.xyz> <20220522162802.208275-7-luca@z3ntu.xyz>
In-Reply-To: <20220522162802.208275-7-luca@z3ntu.xyz>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 May 2022 14:39:36 +0200
Message-ID: <CAG3jFyuZzvvf+Y-EAbaq4ucwv94PJh1oSFC2UU9-bHdYmPna0A@mail.gmail.com>
Subject: Re: [RFC PATCH 06/14] media: camss: ispif: Add support for 8x74
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
> ISPIF hardware modules on 8x74, 8x16 and 8x96 are similar. However on
> 8x74 the ISPIF routes data to two VFE hardware modules like 8x96 but
> formats are similar to 8x16.
>
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/media/platform/qcom/camss/camss-ispif.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/me=
dia/platform/qcom/camss/camss-ispif.c
> index 4ee11bb979cd..693807bf3c6b 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -1112,6 +1112,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>         if (camss->version =3D=3D CAMSS_8x16)
>                 ispif->line_num =3D 2;
>         else if (camss->version =3D=3D CAMSS_8x96 ||
> +                camss->version =3D=3D CAMSS_8x74 ||
>                  camss->version =3D=3D CAMSS_660)
>                 ispif->line_num =3D 4;
>         else
> @@ -1126,7 +1127,8 @@ int msm_ispif_subdev_init(struct camss *camss,
>                 ispif->line[i].ispif =3D ispif;
>                 ispif->line[i].id =3D i;
>
> -               if (camss->version =3D=3D CAMSS_8x16) {
> +               if (camss->version =3D=3D CAMSS_8x16 ||
> +                          camss->version =3D=3D CAMSS_8x74) {

CHECK: Alignment should match open parenthesis
#37: FILE: drivers/media/platform/qcom/camss/camss-ispif.c:1131:
+        if (camss->version =3D=3D CAMSS_8x16 ||
+               camss->version =3D=3D CAMSS_8x74) {


>                         ispif->line[i].formats =3D ispif_formats_8x16;
>                         ispif->line[i].nformats =3D
>                                         ARRAY_SIZE(ispif_formats_8x16);
> @@ -1163,6 +1165,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>                 ret =3D devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
>                                IRQF_TRIGGER_RISING, ispif->irq_name, ispi=
f);
>         else if (camss->version =3D=3D CAMSS_8x96 ||
> +                camss->version =3D=3D CAMSS_8x74 ||
>                  camss->version =3D=3D CAMSS_660)
>                 ret =3D devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
>                                IRQF_TRIGGER_RISING, ispif->irq_name, ispi=
f);
> --
> 2.36.0
>

With that fixed:
Reviewed-by: Robert Foss <robert.foss@linaro.org>
