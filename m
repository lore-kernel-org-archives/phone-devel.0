Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F22AC433EF
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 22:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4563661102
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 22:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344398AbhIGXAC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Sep 2021 19:00:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47944 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243371AbhIGXAB (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Tue, 7 Sep 2021 19:00:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631055534; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YHLJt++Yk8SoMmB1dGCCJS5cBmhjYlM8QhmxUbhnFP4=;
 b=dkVgVqZVUpd+DtsMWn4GrHQen61/CFo+BQsxALg+JpDe4TOgTaRXjSILq2dUoD1sfdGR0cOI
 /VkK4CJltmLw/uxxjundA5cnqVQEcafPSHtIKyxu6sO6zaV3jBCtqPWRGCBm/1FFc5M2z/Rg
 YowYQe46NdValPQG8FgadZq1FLc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5OTczNyIsICJwaG9uZS1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6137eeaec603a0154f94beeb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Sep 2021 22:58:54
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC9C1C43618; Tue,  7 Sep 2021 22:58:53 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9FACC4338F;
        Tue,  7 Sep 2021 22:58:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 07 Sep 2021 15:58:52 -0700
From:   abhinavk@codeaurora.org
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Use division result from div_u64_rem in 7nm
 and 14nm PLL
In-Reply-To: <20210906202535.824233-1-marijn.suijten@somainline.org>
References: <20210906202535.824233-1-marijn.suijten@somainline.org>
Message-ID: <37d3d27f56787ebe608121ce05bb2ad0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2021-09-06 13:25, Marijn Suijten wrote:
> div_u64_rem provides the result of the divison and additonally the
> remainder; don't use this function to solely calculate the remainder
> while calculating the division again with div_u64.
> 
> A similar improvement was applied earlier to the 10nm pll in
> 5c191fef4ce2 ("drm/msm/dsi_pll_10nm: Fix dividing the same numbers
> twice").
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 3c1e2106d962..8905f365c932 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -213,9 +213,7 @@ static void pll_14nm_dec_frac_calc(struct
> dsi_pll_14nm *pll, struct dsi_pll_conf
>  	DBG("vco_clk_rate=%lld ref_clk_rate=%lld", vco_clk_rate, fref);
> 
>  	dec_start_multiple = div_u64(vco_clk_rate * multiplier, fref);
> -	div_u64_rem(dec_start_multiple, multiplier, &div_frac_start);
> -
> -	dec_start = div_u64(dec_start_multiple, multiplier);
> +	dec_start = div_u64_rem(dec_start_multiple, multiplier, 
> &div_frac_start);
> 
>  	pconf->dec_start = (u32)dec_start;
>  	pconf->div_frac_start = div_frac_start;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index c77c30628cca..1a5abbd9fb76 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -114,9 +114,7 @@ static void dsi_pll_calc_dec_frac(struct
> dsi_pll_7nm *pll, struct dsi_pll_config
> 
>  	multiplier = 1 << FRAC_BITS;
>  	dec_multiple = div_u64(pll_freq * multiplier, divider);
> -	div_u64_rem(dec_multiple, multiplier, &frac);
> -
> -	dec = div_u64(dec_multiple, multiplier);
> +	dec = div_u64_rem(dec_multiple, multiplier, &frac);
> 
>  	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
>  		config->pll_clock_inverters = 0x28;
