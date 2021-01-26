Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B59AC433E9
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC0C23122
	for <phone-devel@archiver.kernel.org>; Tue, 26 Jan 2021 14:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391730AbhAZOdv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392778AbhAZOc5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 26 Jan 2021 09:32:57 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871DBC0698C0
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:31:46 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id d18so9318626oic.3
        for <phone-devel@vger.kernel.org>; Tue, 26 Jan 2021 06:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x6tVYXjcGXzNXZxyVCBc4DKHqr1b7rN/QElcPclacOU=;
        b=vSrsycdey3StwHFqJuLGo+R0VECFeYNIRyrxwGUcJSMY4yikk2x1TKsA0/WRyMrAuL
         /+XTLYQJteqJMTnVsffFbl/MRoHqeWXYeZs/d0Jw6ly5CVtg96Q5pZ8zzimOwr7wKqPV
         JBNiU/TRsLJiv2Wgl4hKeqEEHxcP2UpnAGi5j6f4nP09mBACcgdMD7R+Wu16VPokobRG
         4MzQ+X85UKupxPELsqBHJiaSCOaszlNFNggxd4aSktuK0gyoDvQEB4rBzvt9ZpsVmOCG
         wXi/YRcr2+tCTBjow6AqXtVT/+7qQdeUFB3F3xe9dtTV00L18HjOPYbD/p7aETs7yS8J
         ymnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x6tVYXjcGXzNXZxyVCBc4DKHqr1b7rN/QElcPclacOU=;
        b=CBZaYKe7G3IrNY5Wl2FLqZrpzaYSAv0vs6sggqQ6QQPnYxMczGb1pRsWVDiQ92WPaA
         n9jmBGFukR7KY5vc4pS/2KuQvcBc4lu/69Zm0b0vgqw1BfvbeJiERQ445o4N9hdEIn1I
         dNHM1xRQWdny7qo5ea3KTtU+7ol3oI2eYToaKM1bV9+MY8QAKMBFACuw2d14oDxm41qA
         8Vxt8avgyL8xsBbgoQhDggjQZySwtH+pHuJNcvVKx0Ts9Vqq/exoUFEeQZIfqVTIpu0g
         mzCX0wptm1hhFcj5aJBgj7dHbnfnZGdTi5YZOOoq8m0GnDl4hpxptipkaYsdT7WUAhy0
         rpHQ==
X-Gm-Message-State: AOAM531MeBaCt1J/5OlxZRAcNz1rzsofJhhqWtYVa1C9+5++XYlc9tRf
        rJtYghuVmhVmEn1fc8/XIDM7Dw==
X-Google-Smtp-Source: ABdhPJz4Zd2SZhbL/LKNIbsqGw0wOfzJ6aYpWcONYfvPc50JMY/RbxKsyyPuaQEr5ZQiJ7gU6f3YCQ==
X-Received: by 2002:aca:ef46:: with SMTP id n67mr8302oih.103.1611671505721;
        Tue, 26 Jan 2021 06:31:45 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 70sm4125510otf.39.2021.01.26.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:31:45 -0800 (PST)
Date:   Tue, 26 Jan 2021 08:31:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v2 6/9] clk: qcom: mmcc-msm8996: Migrate gfx3d clock to
 clk_rcg2_gfx3d
Message-ID: <20210126143143.GI1241218@yoga>
References: <20210113183817.447866-1-angelogioacchino.delregno@somainline.org>
 <20210113183817.447866-7-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113183817.447866-7-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed 13 Jan 12:38 CST 2021, AngeloGioacchino Del Regno wrote:

> In commit 734bdefdb043 ("clk: qcom: rcg2: Stop hardcoding gfx3d
> pingpong parent numbers") the gfx3d ping-pong ops (clk_gfx3d_ops)

I believe you're referring to patch 5 here, which when merged won't have
this hash. So you'd need to say "in the previous commit (...)" or
something like that.

Regards,
Bjorn

> were generalized in order to be able to reuse the same ops for
> more than just one clock for one SoC: follow the change here in
> the MSM8996 MMCC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/clk/qcom/mmcc-msm8996.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
> index 3b3aac07fb2d..24843e4f2599 100644
> --- a/drivers/clk/qcom/mmcc-msm8996.c
> +++ b/drivers/clk/qcom/mmcc-msm8996.c
> @@ -528,16 +528,23 @@ static struct clk_rcg2 maxi_clk_src = {
>  	},
>  };
>  
> -static struct clk_rcg2 gfx3d_clk_src = {
> -	.cmd_rcgr = 0x4000,
> -	.hid_width = 5,
> -	.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gfx3d_clk_src",
> -		.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
> -		.num_parents = 6,
> -		.ops = &clk_gfx3d_ops,
> -		.flags = CLK_SET_RATE_PARENT,
> +static struct clk_rcg2_gfx3d gfx3d_clk_src = {
> +	.rcg = {
> +		.cmd_rcgr = 0x4000,
> +		.hid_width = 5,
> +		.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
> +		.clkr.hw.init = &(struct clk_init_data){
> +			.name = "gfx3d_clk_src",
> +			.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
> +			.num_parents = 6,
> +			.ops = &clk_gfx3d_ops,
> +			.flags = CLK_SET_RATE_PARENT,
> +		},
> +	},
> +	.hws = (struct clk_hw*[]) {
> +		&mmpll9.clkr.hw,
> +		&mmpll2.clkr.hw,
> +		&mmpll8.clkr.hw
>  	},
>  };
>  
> @@ -3089,7 +3096,7 @@ static struct clk_regmap *mmcc_msm8996_clocks[] = {
>  	[AHB_CLK_SRC] = &ahb_clk_src.clkr,
>  	[AXI_CLK_SRC] = &axi_clk_src.clkr,
>  	[MAXI_CLK_SRC] = &maxi_clk_src.clkr,
> -	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
> +	[GFX3D_CLK_SRC] = &gfx3d_clk_src.rcg.clkr,
>  	[RBBMTIMER_CLK_SRC] = &rbbmtimer_clk_src.clkr,
>  	[ISENSE_CLK_SRC] = &isense_clk_src.clkr,
>  	[RBCPR_CLK_SRC] = &rbcpr_clk_src.clkr,
> -- 
> 2.29.2
> 
