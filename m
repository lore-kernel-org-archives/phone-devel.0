Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C92C4332F
	for <phone-devel@archiver.kernel.org>; Fri,  1 Oct 2021 21:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B502061ABF
	for <phone-devel@archiver.kernel.org>; Fri,  1 Oct 2021 21:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354855AbhJAVLE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 1 Oct 2021 17:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353832AbhJAVLD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 1 Oct 2021 17:11:03 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AFFC06177E
        for <phone-devel@vger.kernel.org>; Fri,  1 Oct 2021 14:09:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j5so38688606lfg.8
        for <phone-devel@vger.kernel.org>; Fri, 01 Oct 2021 14:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IebbO+ma/A1unpbrZ8oEgbjXE5CUx4OQ3cw7YGHtnpM=;
        b=MmcVHRWhjWn9KKZ/McV6/+Uoq6LupKzHXYCrxqBnqPPByl9LyIApmjQdSArX5IS1wv
         BDDVCN+9yflaCTtMHYwZQ+4iARy/KJH+03vwJWdUSqHCbaR8P4hY6Fu5VcgIiWf9nJg+
         pRCmia4gT/fFJcgBptVySNk7evnIS9V1A20AeUhyqGO1gGfzw/TPA0Lk/xoNQSvF0Jws
         qEWVvp4fE9+kqg5rgO8UrLQZZad35dzpWxvcgyhHeiQLr6Sjwi/y5KDKrEuL7tII4ejq
         M0V94nquYSxGjWFn4H+ppA51fLS2INdCJs5U4TA5NqAG1rv7v4OALlsTqL6J+Y63pW1B
         2NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IebbO+ma/A1unpbrZ8oEgbjXE5CUx4OQ3cw7YGHtnpM=;
        b=yH18cn+0VrARICeLDES4jmPOeYzLZ8HkF64uRWFChgd+Fm7kH4XVfCJlvavWX0Kq4O
         pj/uHqYa9IGo0IKJWhNK6HzSPDxz453wN0qvHGGocw4CXDslwL24xrc5lKVCHuXplZOH
         oHLam1H0Vj4eg90zANLqLO9e+ojT77NDusVV16OWTaSMokGxpEWOgm0chqExDLAl5DTm
         gTdJOtVY2KDAS1EQ5057oqknTnBzgNMwoUTFYt2Sud+QgXskVWRVwVUNU0tnXQ/Aw8cx
         /anVOcoL6K/o5llnFMQbpFAih4YsduyDPGhsxpnAAjh2ikdFYzU2Sn/XC4KsKVz9kish
         Kj4w==
X-Gm-Message-State: AOAM533h8kVCTBBg38VJxmW8ky4TSULRtZlendQZaDHFZk6+ImmuYmTN
        e5zWZ61+ng5wnn2zlfyBFf24/Q==
X-Google-Smtp-Source: ABdhPJw3pmsNgv9RYeS4huOp4qxuDaNliY0fsFTacMOU3A1X25G6Gt/OxqhoGbmcF5nk6N3Rx5wpkw==
X-Received: by 2002:a05:6512:1399:: with SMTP id p25mr199919lfa.277.1633122557113;
        Fri, 01 Oct 2021 14:09:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u25sm846522lfr.279.2021.10.01.14.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 14:09:16 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] drm/msm/mdp5: Add configuration for MDP v1.16
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        James Willcox <jwillcox@squareup.com>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
 <20210928131929.18567-4-sireeshkodali1@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <06a40d0d-da39-ba0b-e932-d4435c0735d3@linaro.org>
Date:   Sat, 2 Oct 2021 00:09:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928131929.18567-4-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 28/09/2021 16:19, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> MDP version v1.16 is almost identical to v1.15 with most significant
> difference being presence of second DSI interface. MDP v1.16 is found on
> SoCs such as MSM8x53, SDM450, SDM632 (All with Adreno 506).
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++
>   1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 9741544ffc35..0d28c8ff4009 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -752,6 +752,94 @@ const struct mdp5_cfg_hw msm8x76_config = {
>   	.max_clk = 360000000,
>   };
>   
> +static const struct mdp5_cfg_hw msm8x53_config = {
> +	.name = "msm8x53",
> +	.mdp = {
> +		.count = 1,
> +		.caps = MDP_CAP_CDM |
> +			MDP_CAP_SRC_SPLIT,
> +	},
> +	.ctl = {
> +		.count = 3,
> +		.base = { 0x01000, 0x01200, 0x01400 },
> +		.flush_hw_mask = 0xffffffff,
> +	},
> +	.pipe_vig = {
> +		.count = 1,
> +		.base = { 0x04000 },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_SCALE	|
> +			MDP_PIPE_CAP_CSC	|
> +			MDP_PIPE_CAP_DECIMATION	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			0,
> +	},
> +	.pipe_rgb = {
> +		.count = 2,
> +		.base = { 0x14000, 0x16000 },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_DECIMATION	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			0,
> +	},
> +	.pipe_dma = {
> +		.count = 1,
> +		.base = { 0x24000 },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			0,
> +	},
> +	.pipe_cursor = {
> +		.count = 1,
> +		.base = { 0x34000 },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			MDP_PIPE_CAP_CURSOR	|
> +			0,
> +	},
> +
> +	.lm = {
> +		.count = 3,
> +		.base = { 0x44000, 0x45000 },
> +		.instances = {
> +				{ .id = 0, .pp = 0, .dspp = 0,
> +				  .caps = MDP_LM_CAP_DISPLAY |
> +					  MDP_LM_CAP_PAIR },
> +				{ .id = 1, .pp = 1, .dspp = -1,
> +				  .caps = MDP_LM_CAP_DISPLAY },
> +			     },
> +		.nb_stages = 5,
> +		.max_width = 2048,
> +		.max_height = 0xFFFF,
> +	},
> +	.dspp = {
> +		.count = 1,
> +		.base = { 0x54000 },
> +
> +	},
> +	.pp = {
> +		.count = 2,
> +		.base = { 0x70000, 0x70800 },
> +	},
> +	.cdm = {
> +		.count = 1,
> +		.base = { 0x79200 },
> +	},
> +	.intf = {
> +		.base = { 0x6a000, 0x6a800, 0x6b000 },
> +		.connect = {
> +			[0] = INTF_DISABLED,
> +			[1] = INTF_DSI,
> +			[2] = INTF_DSI,
> +		},
> +	},
> +	.max_clk = 400000000,
> +};
> +
>   static const struct mdp5_cfg_hw msm8917_config = {
>   	.name = "msm8917",
>   	.mdp = {
> @@ -1151,6 +1239,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
>   	{ .revision = 7, .config = { .hw = &msm8x96_config } },
>   	{ .revision = 11, .config = { .hw = &msm8x76_config } },
>   	{ .revision = 15, .config = { .hw = &msm8917_config } },
> +	{ .revision = 16, .config = { .hw = &msm8x53_config } },
>   };
>   
>   static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
> 


-- 
With best wishes
Dmitry
