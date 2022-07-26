Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C3CC00140
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jul 2022 20:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239730AbiGZUmg (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jul 2022 16:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239642AbiGZUmg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Jul 2022 16:42:36 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD1733A19
        for <phone-devel@vger.kernel.org>; Tue, 26 Jul 2022 13:42:34 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id b21so11324100qte.12
        for <phone-devel@vger.kernel.org>; Tue, 26 Jul 2022 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Imn4sxmNV9F8KiWb9MLDPcsE1dh/DZoTX9lMJawPCg=;
        b=ZxxOLVicgZJL947w9Srb8UyZjT6HbnAWkhZhNRAsQFkPOcEOWT4swTRYW+bFrkbLbx
         2zWLznnk7m6IAM2nqfg8OtcJRNg51p5G3BfC73n/fP/oorJ3UjN4mjqPOJ+mLsqLmXeK
         J8oQBH5r/O+POh089Eoiq6oeF+yCbJPH5GEjtAtpHHKODHzmbLdpuGAdGEBj+3NZAxMO
         UedYtcU6UROzRBWqbycPD85XMve7qZKO0ANvZWpOwFljNFApI9c/FzTI2moPaYBq5MDm
         A/IKBNVPyA5Ju7sWatYrHKcZ18nqSbWLmp3uiuu0gqJO6GtoPtHUD34570ZAvmc47/ly
         XJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Imn4sxmNV9F8KiWb9MLDPcsE1dh/DZoTX9lMJawPCg=;
        b=I2IqmaevwJiArZ7pc9ngPgdVBurDDiwAaM/bEHtHdezPTZWCgrfK+a1BFuH05biGRf
         a/B3saQjZN1D6+QrUYmbIV2VhSPo/3SX+hWggVA36Mq9W9wzrI47PbQC2rCqQc/ckwUQ
         IHS6FDFYcT4BQXyRUZ7BK8WbGYki4KGWMUPL5p2H8iiYibwQR3oYIrvGq2pLG+ZrFj+C
         lGla6+Gu8ygFU80LCVHpKkNbfghjHW5ZB6yFfQvwwHybj62WOmCwYoxV9+TSkkbLUgtj
         2mUm4ueeb91FXcPbqz1/oQKMMeT32gqxRcDDmgQVVF/50znnme4Yzc+oT0MYeFNeq706
         yFsg==
X-Gm-Message-State: AJIora/Zc5RDRW5OM3AJzKABzhE8WPXGSDUSXHJI3BvFFBV4tajqAcEK
        C9dDv2/12TY6iE/tnEECqXLolkXlEJKbaOxTfo93LA==
X-Google-Smtp-Source: AGRyM1sScv7bITRdsAKXqkenlEOfOWYJzuPLbg7XR9pEzONkgE+IYjIhOHcKcuxvGW8l9nX1KVyShHZLo6PpJCp7Lmk=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr3329446qtx.370.1658868154010; Tue, 26
 Jul 2022 13:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220726181133.3262695-1-iskren.chernev@gmail.com> <20220726181133.3262695-6-iskren.chernev@gmail.com>
In-Reply-To: <20220726181133.3262695-6-iskren.chernev@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 26 Jul 2022 23:42:23 +0300
Message-ID: <CAA8EJpqB1idqrSek7nApVeAO7uZ-i33nwRdqn9ec3J4fBh_wHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] regulator: qcom_smd: Add PM6125 regulators support
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 26 Jul 2022 at 21:12, Iskren Chernev <iskren.chernev@gmail.com> wrote:
>
> Add support for PM6125 PMIC which is found on SM4250/6115 SoCs.
>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Please fix the order of sign-offs.

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/regulator/qcom_smd-regulator.c | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

-- 
With best wishes
Dmitry
