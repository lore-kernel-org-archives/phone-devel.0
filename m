Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B960C77B7E
	for <phone-devel@archiver.kernel.org>; Mon, 29 May 2023 11:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjE2L7l (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 29 May 2023 07:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbjE2L7k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 29 May 2023 07:59:40 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41010E0
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 04:59:37 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af2b74d258so33603711fa.3
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685361575; x=1687953575;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXVPUyboz0ykS8Ed+FHN0BdXbIB6yMoKQQ93vLHxG5o=;
        b=ZBuTbEFfvpcpoTU1OUY8m4CyXkMoIdifioeYmwrVauitCM0SNNcSUb7oRFr3UtCL/7
         10HeWNR42H6Xxxe70igvrCLtWo2a3fkckFceFHI+qxIR08z//wockJoiQoexe6fx51Kc
         Alw5vjCOgYoQSclZYYHIe512Om8K5u6POSL4fVNhL8F6cG1/HRxZePMaUz1wkHL0dGBJ
         SsRHfQA26XiyWY1fC6GV6Rs0yc2qOOxrSwQlcL2BXcg+sDwxUX+V00gTxztNPgt1Ahx+
         lT4Nm388NfGTeb6RYQF/Gfdoa5NI5lIvx4ARtupAMhblH+pLaxYoxj+Js0v4tznZKWgA
         aTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685361575; x=1687953575;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXVPUyboz0ykS8Ed+FHN0BdXbIB6yMoKQQ93vLHxG5o=;
        b=kjCReEbclFsczNsxxAoZAgQHA2T3ODNwFxBavKkXr+ZASZG2LMFEwBuz+z48juhAPv
         9P8b6R0NKGkdGoLAnE1GuGE3Mq+0XHGhdksJinN4d+68hYK1zzr7JnRVranf3TXxVLGd
         tZ01KGVAOli16+I7ARPhdXcqAnTL5xVu3K2ub/w/KeiwCIrGn6Of+D76IhSjhrCCP1w6
         Qg8xkfN6x0OmGcZyFIsaUfaTLF2A39Ycfh6bLEO2LTxuR2VjG8Ekwwv5ikVrr7FzK1U9
         2EpGCTXEeieTpgHbmxAm3Af72o+QLm1+BoaEO5laHYMCf/lDo7u17K3FOxf7Ll7g6L1a
         9ZAA==
X-Gm-Message-State: AC+VfDzwZskrw+/BioMaiLgoO0+/8jFIy4qWeGrsy+egHl7swlURw/i4
        tIcOP4rdVX/RoCT/fWZ0J8/Z/Q==
X-Google-Smtp-Source: ACHHUZ7o0f8xF9lxwcW/IO09XH9XCio/3KVnZQVQDvWkbK1gKBtutVfadeIKLFyPoSro7o3P50BxIw==
X-Received: by 2002:a2e:9b99:0:b0:2a8:e7f9:c33f with SMTP id z25-20020a2e9b99000000b002a8e7f9c33fmr4330713lji.30.1685361575515;
        Mon, 29 May 2023 04:59:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id j18-20020a2e8012000000b002ad95392147sm2404665ljg.118.2023.05.29.04.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 04:59:35 -0700 (PDT)
Message-ID: <9858de8d-54ae-aa0c-35d8-fe8c1c8473b7@linaro.org>
Date:   Mon, 29 May 2023 13:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 4/7] drm/msm/mdp5: Add MDP5 configuration for MSM8226
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-4-679f335d3d5b@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 29.05.2023 11:44, Luca Weiss wrote:
> Add the required config for the v1.1 MDP5 found on MSM8226.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 82 ++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 2eec2d78f32a..694d54341337 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -103,6 +103,87 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
>  	.max_clk = 200000000,
>  };
>  
> +static const struct mdp5_cfg_hw msm8x26_config = {
Luca, this patch looks good as-is (without diving into the values).

Dmitry, I see some things that we may improve here..

1. Rename msm8xab to msm89ab or something, it's really inconsistent
   with other drivers

2. Some values seem very common / always constant.. perhaps we could
   add some #defines like we do in DPU?

3. Can we add some magic defines to make flush_hw_mask non-cryptic?

4. We can probably use pointers in data structs and deduplicate identical
   blocks!

Konrad
> +	.name = "msm8x26",
> +	.mdp = {
> +		.count = 1,
> +		.caps = MDP_CAP_SMP |
> +			0,
> +	},
> +	.smp = {
> +		.mmb_count = 7,
> +		.mmb_size = 4096,
> +		.clients = {
> +			[SSPP_VIG0] =  1,
> +			[SSPP_DMA0] = 4,
> +			[SSPP_RGB0] = 7,
> +		},
> +	},
> +	.ctl = {
> +		.count = 2,
> +		.base = { 0x00500, 0x00600 },
> +		.flush_hw_mask = 0x0003ffff,
> +	},
> +	.pipe_vig = {
> +		.count = 1,
> +		.base = { 0x01100 },
> +		.caps = MDP_PIPE_CAP_HFLIP |
> +			MDP_PIPE_CAP_VFLIP |
> +			MDP_PIPE_CAP_SCALE |
> +			MDP_PIPE_CAP_CSC   |
> +			0,
> +	},
> +	.pipe_rgb = {
> +		.count = 1,
> +		.base = { 0x01d00 },
> +		.caps = MDP_PIPE_CAP_HFLIP |
> +			MDP_PIPE_CAP_VFLIP |
> +			MDP_PIPE_CAP_SCALE |
> +			0,
> +	},
> +	.pipe_dma = {
> +		.count = 1,
> +		.base = { 0x02900 },
> +		.caps = MDP_PIPE_CAP_HFLIP |
> +			MDP_PIPE_CAP_VFLIP |
> +			0,
> +	},
> +	.lm = {
> +		.count = 2,
> +		.base = { 0x03100, 0x03d00 },
> +		.instances = {
> +				{ .id = 0, .pp = 0, .dspp = 0,
> +				  .caps = MDP_LM_CAP_DISPLAY, },
> +				{ .id = 1, .pp = -1, .dspp = -1,
> +				  .caps = MDP_LM_CAP_WB },
> +			     },
> +		.nb_stages = 2,
> +		.max_width = 2048,
> +		.max_height = 0xFFFF,
> +	},
> +	.dspp = {
> +		.count = 1,
> +		.base = { 0x04500 },
> +	},
> +	.pp = {
> +		.count = 1,
> +		.base = { 0x21a00 },
> +	},
> +	.intf = {
> +		.base = { 0x00000, 0x21200 },
> +		.connect = {
> +			[0] = INTF_DISABLED,
> +			[1] = INTF_DSI,
> +		},
> +	},
> +	.perf = {
> +		.ab_inefficiency = 100,
> +		.ib_inefficiency = 200,
> +		.clk_inefficiency = 125
> +	},
> +	.max_clk = 200000000,
> +};
> +
>  static const struct mdp5_cfg_hw msm8x74v2_config = {
>  	.name = "msm8x74",
>  	.mdp = {
> @@ -1236,6 +1317,7 @@ static const struct mdp5_cfg_hw sdm660_config = {
>  
>  static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
>  	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
> +	{ .revision = 1, .config = { .hw = &msm8x26_config } },
>  	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
>  	{ .revision = 3, .config = { .hw = &apq8084_config } },
>  	{ .revision = 6, .config = { .hw = &msm8x16_config } },
> 
