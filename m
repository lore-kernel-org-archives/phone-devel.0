Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6281C77B78
	for <phone-devel@archiver.kernel.org>; Thu, 20 Apr 2023 08:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbjDTIGG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234321AbjDTIGE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 20 Apr 2023 04:06:04 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031E430F4
        for <phone-devel@vger.kernel.org>; Thu, 20 Apr 2023 01:06:02 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-54f6a796bd0so29355707b3.12
        for <phone-devel@vger.kernel.org>; Thu, 20 Apr 2023 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681977961; x=1684569961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nF73EW7KaLWEV4V1D9aiONML0yXojDyO7zMClWna/aU=;
        b=bPDfI9eRhpTNkbg+3/X/aaxLsgYj6teALIjvGi9ObRhXZPvFCl6lyTe1DZ3qQC0L45
         ECFekxHa3S97BYyAuS7L3y0xSf2vRarM1ctf7LcyrTNSUFsKPwcunKO/2tWZzE1Qw8p7
         OnViZZbQayG8mhN8tObaFmv8pDkTKXxVuBTUO2kdNiyv4AYrER1uiCKX34QWVDdSh2Tp
         d8mZ2ciqd6KiT3mTPmTmY7cCSbcjm4RrAJAPCNB7Uazw8x0v2ihiYzU/xDXzePcXwqhF
         gOHWU9T7E4AxPRf9J3cguv996TKbrJBzjCYmPFygn0fdY/2ERO/0ocCxw2A7MQhV90Wp
         Usvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977961; x=1684569961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nF73EW7KaLWEV4V1D9aiONML0yXojDyO7zMClWna/aU=;
        b=iCbzXnhxXEHybjDw5taM6zQf/ivZn9reRarNUisTJRf4DblzShxtrDiyh9N6LusQjm
         jnSswGPh2bG2woyvAAghVhLaI4Q/1d/L0w+uyqOFrXcGoJkPjt4DPQ6Gg+iS93g0wh7/
         xLVOnZ02d59BtzY2dxV0NNfTmAYV5KBL5Mq2akzGzirlt71peQZiYY/51ziUrIMFG7GC
         yhz7/AT4xquPCtUCwzB7Mk/MlguuHD1ERKWhun5pSUANjRd3vbLDnUaB301J//7zCF4x
         wHuKyvx6+3VzRNLXh/wdMCkdfpYsTRZ4ptNxYK8VbSivBrQxVwDvS1SK4CmOBZ6kupdm
         tM8w==
X-Gm-Message-State: AAQBX9fxMuroED2fMp9Anh6OvC5QAdIHZGHI+elKvUm49t5lrdaoKaQk
        0CEnYjQWiutSSg+6A2jhHFjM8Al77SnZu/oD/ZMpWw==
X-Google-Smtp-Source: AKy350Z6rGVhE3LnUUSr7NOdP5BTmzad2DawgJPMUQQYlYN51tsbOtHoOOvrQqh26AmqagNeb++cEGWuoshHZqyLJOk=
X-Received: by 2002:a81:7489:0:b0:552:b9db:f4b7 with SMTP id
 p131-20020a817489000000b00552b9dbf4b7mr247442ywc.3.1681977961239; Thu, 20 Apr
 2023 01:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681646904.git.jahau@rocketmail.com> <a03e3939d733098a40c2ea0522da4e0bae9b2cb8.1681646904.git.jahau@rocketmail.com>
In-Reply-To: <a03e3939d733098a40c2ea0522da4e0bae9b2cb8.1681646904.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Apr 2023 10:05:50 +0200
Message-ID: <CACRpkda4JPe-XE-_m4w_HbBBXrv4nkUtY_HJbexs+LCzcDu1-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] mfd: rt5033: Drop rt5033-battery sub-device
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Beomho Seo <beomho.seo@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Raymond Hackley <raymondhackley@protonmail.com>,
        Pavel Machek <pavel@ucw.cz>, Axel Lin <axel.lin@ingics.com>,
        ChiYuan Huang <cy_huang@richtek.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Apr 16, 2023 at 2:45=E2=80=AFPM Jakob Hauser <jahau@rocketmail.com>=
 wrote:

> From: Stephan Gerhold <stephan@gerhold.net>
>
> The fuel gauge in the RT5033 PMIC (rt5033-battery) has its own I2C bus
> and interrupt lines. Therefore, it is not part of the MFD device
> and needs to be specified separately in the device tree.
>
> Cc: Beomho Seo <beomho.seo@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Fixes: 0b271258544b ("mfd: rt5033: Add Richtek RT5033 driver core.")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Looks correct,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
