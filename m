Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C631EC433EF
	for <phone-devel@archiver.kernel.org>; Thu, 19 May 2022 12:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238104AbiESMwO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 19 May 2022 08:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbiESMwN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 19 May 2022 08:52:13 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0979A7E1C
        for <phone-devel@vger.kernel.org>; Thu, 19 May 2022 05:52:11 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id f16so8875134ybk.2
        for <phone-devel@vger.kernel.org>; Thu, 19 May 2022 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eYHvw/JfgdFF38mVmeyZqvOLi39VF/O3hfS7MsPbrq8=;
        b=fjXRUPtsRIN/w510M8vc9HtNrrYEKR0jfxnFcBGW6DJhVOLuBww01ZkeIoKqqFFGV5
         Mbt3UKwMkev3bNDjbMeP+7J4dsqOZfJ2g0EdZAUfrhH35t0Rohuf7J+TKllHUCmKTeOG
         v5uZWL9qsUNKsYujTwQ5JRhIqtTHC/TG7ztG78QKRdvQZHewOhLORlit3nDcbiDOmfeY
         VrGVE1WKq5kwygGjcQg5fNmK0uz0SelDOSED9QaOnhjNtXboZwVGwA0uxijoUJANWbGk
         6rfQ/9o+agfSEk1SXUK4MGXc2Wh2QkGCfEaTSMJkKEo3h3GX6WmVtMcNIJJ7wq29dbFh
         b8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYHvw/JfgdFF38mVmeyZqvOLi39VF/O3hfS7MsPbrq8=;
        b=qYjokWlKAXgCu9YkHJXeUVFHBym1oYbbK9WdRoGQ43zwFYOK+uY5W5DprEUjPnvtBH
         RqUv0S8ApG2JkSyiOIjBKEiJ817UVxz00L4y5JzEvAhI3okepB5+/l3Bs8INzMLuDb4P
         DGGejj9qe5Peo26r0WM5+6naN2P352q+XkCnRD7SeV+D/OW45sSMO0V2+McYmSDM6MnJ
         JPfJjFLER4tQqvLOl+n9b31EPyBTSxEYtOCQNIlwMCIWD6jRAnDffP9EqBao/lFyuh0F
         UFOIY1Zr60kjX7RM67KFs+xGtq5WWbmglGwYV6kmdjOw6Db332HoU2wpxWKocNjcoDPK
         lmvQ==
X-Gm-Message-State: AOAM532IbCx2z8GlGNaP4BbbT7xTCZoIJP1Cmb+nD4UE4qz6WB+NIzB7
        i9YOQln0EM8LBQ/ufWTKCJuGJtE98NcT1yB9zMn/VA==
X-Google-Smtp-Source: ABdhPJx9yMsWBarHPBxLQAxxFY3f/PggaV5qHdtzVRcIGew3O1hnPU38nLAFXsswEDlbsMrR1trfkXPVJ8F1LJKSAUw=
X-Received: by 2002:a05:6902:704:b0:64d:f270:22b0 with SMTP id
 k4-20020a056902070400b0064df27022b0mr4294931ybt.626.1652964731100; Thu, 19
 May 2022 05:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220511220613.1015472-1-marijn.suijten@somainline.org> <20220511220613.1015472-3-marijn.suijten@somainline.org>
In-Reply-To: <20220511220613.1015472-3-marijn.suijten@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 14:51:59 +0200
Message-ID: <CACRpkdZoZMmTOMB3EzYtVPKoNt355Um+EFFZMAS2m+hgMkWozA@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125 compatible
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, May 12, 2022 at 12:06 AM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> The pm6125 comes with 9 GPIOs, without holes.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

This patch 2/7 applied to the pinctrl tree.

Yours,
Linus Walleij
