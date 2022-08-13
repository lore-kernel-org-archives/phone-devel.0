Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB669C25B0F
	for <phone-devel@archiver.kernel.org>; Sat, 13 Aug 2022 20:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbiHMUAF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 13 Aug 2022 16:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239476AbiHMUAE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 13 Aug 2022 16:00:04 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1743F13CDA
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 13:00:02 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id qn6so7251247ejc.11
        for <phone-devel@vger.kernel.org>; Sat, 13 Aug 2022 13:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SqEK3dSOL0OGEhaO3b0fErkGK/VagcMr1SpmxVH4cXk=;
        b=ed2CnEFSDsafYfCoEs0urH2W3kw1Q8GXaSIt46m5U4f07agYes+gkKpVFexkMY52+u
         btR2GK6n/aTgPUQk48FE7N0562Xzacv4PegAsz5pqK/Ghbj2bHNtKcd9Bk4FBhMWfT0Q
         M9v0VWu31bvzyoltKEwtAhd1nGlxvE4nj/cgAXEFevE1yQF2lUHuoEDan4n6OQUAZvtx
         VG24AUpqxzLmvOpt3Gxyf3erNKh+JkBXkIsgGvPbikekWEqX+vPnL1BrW6I6wXXS6FYp
         y76DQ82oH6hN/lE0rarbMALPlEoSlVPzM44sXTTLWs8p9+yut/ey7Ka7QsClH4xN3VB4
         gPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SqEK3dSOL0OGEhaO3b0fErkGK/VagcMr1SpmxVH4cXk=;
        b=61JTk/NZoM7xtgWwoGx4Eya+psdXF/OviMHsuTMnED3yBUSC2RBZhydIBo9iX2eWmD
         dRyQUMfdXAwYdwpa5uK2o1j3dJVah92cpSmnQILC3N2oWsnGednxJlj7ejHYVw0OylTT
         V6KZuGwa/S92E5pQlFVR9nWPPj6YMnAkI45N7xi95xOoLCzBKZuFtdphdITSSEgipoPo
         aCy4De4zHKzND4fP+mwKPNe5cUfr5FxitDcnwXIN95LhqFNfr0mAjbRMCtohXWNHWten
         xAUqLD0CmCRuNE6wL5j5E7LGjNd6DFWvOmoQPQ+wGP2IyIU+2CTU9rAqqbqQR2LWaxA5
         G9Vg==
X-Gm-Message-State: ACgBeo3CleOM5c7e26Gh+ZJvmfuI6W5kza9et70p2sFrMqWMO8nsXhUq
        q3G2ZvoxuhkBNGtrfpgkTkePRqR1aIhFwC+0V8S12A==
X-Google-Smtp-Source: AA6agR6ULIPx7Wq+VpWSTgoMR+Bq3GuaHe93aIu9VStvYfUxhfa3vVhwgsXQwaLQ2w4h9oZAVB/5AryDlgbH0fxkaHQ=
X-Received: by 2002:a17:907:6d98:b0:731:2bb3:8e17 with SMTP id
 sb24-20020a1709076d9800b007312bb38e17mr6256678ejc.203.1660420800573; Sat, 13
 Aug 2022 13:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660337264.git.jahau@rocketmail.com> <1a8bffdb7e807455620a73f2d61981e7f9aab8d5.1660337264.git.jahau@rocketmail.com>
In-Reply-To: <1a8bffdb7e807455620a73f2d61981e7f9aab8d5.1660337264.git.jahau@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 13 Aug 2022 21:59:49 +0200
Message-ID: <CACRpkdaP9hH7LjJ_B2JvkgzmH_UZsW_oB2SYR4xqSp0LYgvBrg@mail.gmail.com>
Subject: Re: [PATCH v6 12/14] iio: magnetometer: yas530: Add temperature
 calculation to "chip_info"
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

> Add temperature calculation to the "chip_info" structure to ease the handling
> of different YAS variants.
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
