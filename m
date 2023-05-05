Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EF9C77B75
	for <phone-devel@archiver.kernel.org>; Fri,  5 May 2023 11:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjEELvs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 5 May 2023 07:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjEELvs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 5 May 2023 07:51:48 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9CA2D6A
        for <phone-devel@vger.kernel.org>; Fri,  5 May 2023 04:51:46 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-559e2051d05so23473477b3.3
        for <phone-devel@vger.kernel.org>; Fri, 05 May 2023 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683287505; x=1685879505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+erYGuzVel6Wt0GXIzw1tiExd3TT8UKse0/nxpknnw=;
        b=EekaU10y4mPaDuwkIsS+ze7K2LN+h46tvg0V5OHhGTeO7KmtTDKMkkCdIH1ptIrMhk
         Vadr1560duuxogcdD7Y5Xvm2CUAY1fFRMaFx/Sv0/4kcSLG/cYNoC1hMEjhqo40f4SPe
         PjjO8F2PcunZER2BHewKHIsWmdtJJHvQ7BlgLlfKRHKd4JclX0IfkfT8DYV6BHXxOvfq
         XJEIhLbQ0189I4pRlf3WohiZoYxYx+zlWr5oVYw6Zhl2EQzTFhsiEqLE6adAXD69UJ6T
         Mzity5p4MbDJh26qyVQNAoyb252ewbu9/UP7xC9J/gdwlpAA1ivddTk3iaoHLSOep3jA
         0oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683287505; x=1685879505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+erYGuzVel6Wt0GXIzw1tiExd3TT8UKse0/nxpknnw=;
        b=ZzW6r2KdL5Rqvyy6s7bWvhPHH9JlzeORsbufUZvxqMLdDRKtMhAMs4snYeKz0wqQ0J
         N4sif7SBr1h+bnwSJ+oI1tU8/yCgSIyZ1MhRwMGIMS58ecGyRe2+IU5ApVQ0x/UaaMog
         SJAU1b5iw/spMQwr9hEoXSO7O2ne1Okzh7woUrW7WSUYaYsMjW1tKmGTUnh/hrd1p8/T
         QO00nt605fngbpX6oPG9HlThRNDdx9jkKV9ldRrDDn7I08Hy1eDOiHKIv9LZfF4s8uOG
         A82ZdHbQvz3/Y3LsI3O7Ebkb+hxftmaSb62su1XcZ+TpUo2mxHgPd9MJ9R3x5mClcOYD
         k6OA==
X-Gm-Message-State: AC+VfDwI35+XxdixAerqoKx0BYknUzGDoHgaRosFuqKArDdfkCHFfNjB
        0GxOqxQjQVw67cuL4RDs76Pv3nN+IDwVofN+Gk5Jig==
X-Google-Smtp-Source: ACHHUZ72VZFro+QtTbr7MzxxcYK8XCqJtk/0gqzbSspfOgrWdA9IaMs98R7MewYhJdrzh0UgXP7iKkPM25YuT7m+nAg=
X-Received: by 2002:a81:5456:0:b0:55a:5ce4:aff2 with SMTP id
 i83-20020a815456000000b0055a5ce4aff2mr1302691ywb.39.1683287505527; Fri, 05
 May 2023 04:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682636929.git.jahau@rocketmail.com> <0070da504581081906a30d1095b104c4c2930e86.1682636929.git.jahau@rocketmail.com>
In-Reply-To: <0070da504581081906a30d1095b104c4c2930e86.1682636929.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 5 May 2023 13:51:34 +0200
Message-ID: <CACRpkdYrCtSmuQmg5qbeXfgHGwsMxyfyB=95SGZ33QB6fh=Utg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] power: supply: rt5033_charger: Add RT5033 charger
 device driver
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
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Apr 28, 2023 at 1:30=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com>=
 wrote:

> This patch adds device driver of Richtek RT5033 PMIC. The driver supports
> switching charger. rt5033 charger provides three charging modes. The char=
ging
> modes are pre-charge mode, fast charge mode and constant voltage mode. Th=
ey
> vary in charge rate, the charge parameters can be controlled by i2c inter=
face.
>
> Cc: Beomho Seo <beomho.seo@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Raymond Hackley <raymondhackley@protonmail.com>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +       ret =3D power_supply_get_battery_info(charger->psy, &info);
> +       if (ret) {
> +               dev_err(charger->dev, "failed to get battery info\n");
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       /* Assign data. Validity will be checked in the init functions. *=
/
> +       chg->pre_uamp =3D info->precharge_current_ua;
> +       chg->fast_uamp =3D info->constant_charge_current_max_ua;
> +       chg->eoc_uamp =3D info->charge_term_current_ua;
> +       chg->pre_uvolt =3D info->precharge_voltage_max_uv;
> +       chg->const_uvolt =3D info->constant_charge_voltage_max_uv;

Code reuse, exactly how it should be! :)

Yours,
Linus Walleij
