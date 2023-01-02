Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAEEC46467
	for <phone-devel@archiver.kernel.org>; Mon,  2 Jan 2023 09:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjABJ3N (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Jan 2023 04:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjABJ3K (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Jan 2023 04:29:10 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2B625D8
        for <phone-devel@vger.kernel.org>; Mon,  2 Jan 2023 01:29:09 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x37so21685042ljq.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Jan 2023 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54SvQg7V4G/yUh34P1HenewD+ErkpsXyiXw5J7ZoDjA=;
        b=W1dFFFJQ94xENzXF4W1kr5P5CDMV8x20VuJoghbLlglWHn8ADNBIL1ONLGH6XssNvK
         MmNu50NfeWZOPQWTnAJzGDkxCHPZwPtcZ6rNWwHAQDDmAqROm5vmUFaAQ5PFi3fKfwbA
         xhI+mjiOf3ELU3c8DGzfPxENe1Egg34m+dkG1X/JF6XvGHU8pFJuygYiE7V8OudPWTOJ
         lR/MDOBNGq6xFTZse/m7bzxf3Mq2fpo2qOFXFNe7BQLgz2twsRpKbgt7iKQjqihx0FR5
         KRUq5hR4Iqz4DKedaBFWF3vDe7hwwuMA1FnJ/GwMMgzuH/YT0BK2iqDO/hO8nKQy02KO
         s35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54SvQg7V4G/yUh34P1HenewD+ErkpsXyiXw5J7ZoDjA=;
        b=vuFfQLVS2dUCc50Fdss7aD5LySSa3UjqltXOPOy0xgIpnJyEv7WlixzKHah6B0mvAx
         QrFTIULrRGSydGC99M+/sRmoCywAMePqy3/jmcY1Ki+MBslXoYddeSsQKKqY06SNDChK
         5iSWGRjrVKDOwJ8J6REU9xU6h335T+OEIjunum1Lksg4PXqSvWxtle+MnwT3TO3XJXG9
         PvKeyUn7WsZA//kqHD1Jevwnt+c/yKW1BAKZGIwhu+vyHeTdkDhFU0ioOZPVDIUsahr7
         s04CLCChrhC2NeA1SxYR4Ybb9E+YOCChFfseM/4w58i05wUbsIhsibiZZnnL/wkiD5fA
         Ao+Q==
X-Gm-Message-State: AFqh2krobV0EN1nTqHWiyzIZuIr/XJ17x+AARfb/h829dBxqA8sGw/qE
        edIaJopyqm7w4BGGBwD4NQeF8g==
X-Google-Smtp-Source: AMrXdXtedchdcPFKbA0yA741M6X/8cIi4PDMmyDbu2yHmKpgVk0+RWUIRZS0TRgijzMsK4XvP6/xTA==
X-Received: by 2002:a2e:8396:0:b0:27b:5596:1e4d with SMTP id x22-20020a2e8396000000b0027b55961e4dmr9977811ljg.34.1672651746779;
        Mon, 02 Jan 2023 01:29:06 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id h21-20020a2ea495000000b00279e41de7e6sm3216902lji.3.2023.01.02.01.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 01:29:06 -0800 (PST)
Message-ID: <62310fb8-4159-36e1-07cc-21b248daf198@linaro.org>
Date:   Mon, 2 Jan 2023 10:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 1/7] drm/msm/dpu: Remove unused INTF0 interrupt mask
 from sm6115/qcm2290
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-2-marijn.suijten@somainline.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221231215006.211860-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 31.12.2022 22:50, Marijn Suijten wrote:
> Neither of these SoCs has INTF0, they only have a DSI interface on index
> 1.  Stop enabling an interrupt that can't fire.
Double space.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Konrad
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2196e205efa5..9814ad52cc04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -90,6 +90,11 @@
>  			 BIT(MDP_AD4_0_INTR) | \
>  			 BIT(MDP_AD4_1_INTR))
>  
> +#define IRQ_QCM2290_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF1_INTR))
> +
>  #define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>  			 BIT(MDP_SSPP_TOP0_INTR2) | \
>  			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> @@ -1884,7 +1889,7 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.perf = &sm6115_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = IRQ_QCM2290_MASK,
>  };
>  
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
> @@ -2008,7 +2013,7 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
>  	.reg_dma_count = 1,
>  	.dma_cfg = &sdm845_regdma,
>  	.perf = &qcm2290_perf_data,
> -	.mdss_irqs = IRQ_SC7180_MASK,
> +	.mdss_irqs = IRQ_QCM2290_MASK,
>  };
>  
>  static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
