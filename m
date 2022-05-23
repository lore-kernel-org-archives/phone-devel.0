Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C17C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 23 May 2022 22:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiEWWpn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 May 2022 18:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiEWWpm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 May 2022 18:45:42 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48315ABF73
        for <phone-devel@vger.kernel.org>; Mon, 23 May 2022 15:45:41 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id hh4so13620913qtb.10
        for <phone-devel@vger.kernel.org>; Mon, 23 May 2022 15:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nopxt4XwsFRcjRroEc1RpomTVU9NSywZXrOA9daUnOA=;
        b=o0zCSPCGjVwpCsbTDL8/HcIaeqS8fYCO4SL570ZBv9w78NFCvfRuSAAw6rMbj5cqQO
         Nh1J9vi7v8MDYmGaNBJo0mjvOmzaVF88daDfNDjXbuqckC//C6SgYs2eyiZfI01fQMGV
         jC1QmRuLQkcDb+291niZCSZqNmyOEryfkkCZLQkswVkH/Qp7J1a5c7XAsuYRQn55myFq
         f//oxnuGT6Oox/KRkOPchhD3n8WFJmdlTdmHsY0WMQqVJz7qoH+QsLyVkBHZP9FLSXGd
         L5MBPAsKUo7NDrEOvt/iknFwpb4MvF4vBF/G54drN0u4j4j3UnZIGF+/GaWjS/y1AStK
         iLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nopxt4XwsFRcjRroEc1RpomTVU9NSywZXrOA9daUnOA=;
        b=Vs1P7qzWsENY8HjlMF/m/L9NyzRLD2/PGcBelfvkOqMoz4k6pue79wYFlgGL7h9Uk5
         9EkoOTu9BbwV4flpnl2bhxYLHR7Qsq+U++yD0FovgeNgLA37qacHpt5X7DjR+vdYx9W5
         CbYov8SM7m9nGrWIuHwik7o0h6EUIBI6+7dBKMzpPsKar1Y7Kk2UZT9w1fpQBlqG+ENx
         f32uIwcZ6pXj2X6G+t2S2miA8Wh/B/vut0McPOPbO/Q0e/iFstV5HXbrZa0JOJCpgS2a
         41sbF4KYAhCDoN4aY7D4OFGJW3exLl0S9hera1BBMAaGpNK2EJQPdMuHlfJ59c1cHyGD
         IGnA==
X-Gm-Message-State: AOAM5318xi+JdFynYSm6dV5yaKLApnNp76gAyHMKk1YTXDdREHhFzaSf
        1TNO6S/GN16g5C/l61WOQ3H3c/8l55Dp+8VnP1dJfg==
X-Google-Smtp-Source: ABdhPJxviAgpH40GcN8RqQXsVDkwFlmeEiohAphnoVRJGd8mfAwe+K5VvwHS3Qg4VCOkTu1PQXrEEcD2nTGC84T5HCs=
X-Received: by 2002:ac8:5e54:0:b0:2f3:f4ee:efbd with SMTP id
 i20-20020ac85e54000000b002f3f4eeefbdmr17736764qtx.295.1653345940458; Mon, 23
 May 2022 15:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org> <20220523213837.1016542-7-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-7-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:45:29 +0300
Message-ID: <CAA8EJpqhqtc1A0SJqAhOveZcdsBEjPNZLpR3tTM2L3+p3QtiWA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dsi_phy_28nm_8960: Use stack memory for
 temporary clock names
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The clock names formatted into the hw_clk's init structure are only used
> for the duration of the registration function where they are kstrdup'ed,
> making it unnecessary to keep the allocations alive for the duration of
> the device (through devm).
>
> Just like the other DSI PHY PLL clock trees, use a stack-local char
> array and save on memory outside of the pll_28nm_register function.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: we can use clk_name instead of vco_name too.

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 943a7e847c90..554978fc434d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -383,7 +383,7 @@ static int dsi_28nm_pll_restore_state(struct msm_dsi_phy *phy)
>
>  static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **provided_clocks)
>  {
> -       char *clk_name, *vco_name;
> +       char clk_name[32], vco_name[32];
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref",
> @@ -404,14 +404,6 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         if (!bytediv)
>                 return -ENOMEM;
>
> -       vco_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!vco_name)
> -               return -ENOMEM;
> -
> -       clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> -       if (!clk_name)
> -               return -ENOMEM;
> -
>         snprintf(vco_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
>         vco_init.name = vco_name;
>
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
