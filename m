Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A87FC4708E
	for <phone-devel@archiver.kernel.org>; Sun,  1 Jan 2023 12:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjAAMh3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 1 Jan 2023 07:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbjAAMh2 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 1 Jan 2023 07:37:28 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6EE75FA4
        for <phone-devel@vger.kernel.org>; Sun,  1 Jan 2023 04:37:27 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j17so28617952lfr.3
        for <phone-devel@vger.kernel.org>; Sun, 01 Jan 2023 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jUwhBT0HEy+w8/7x0rV0cF/18t9AsTlAgTmMKYlGiAA=;
        b=NwRWs9TNy3ZZTSkNCG3P6pyld0/m0H/Z/q8+dt6x7LRWUC6KnUIKc5Q44yzkGoKqhs
         XVFgW08IJ9Y494napjEdx2NoHgVvkWKOhMc8YEJlpkdvzq8Vd2vs4tyQnCGbQmxe7YFH
         mR326j4DTaQgQvVLxeCjGYriBQkBHJFBjrBo+vw8t8SwIV7BIDwEFdL/tQkzgSJtUt8q
         xdLCJGfF3qVVmTw6bfakiwdWQExuNLK0I9nryCgSbIGo4fyoIVZGVfdZReI7d5Bqh1Dv
         kWkA4lN6jQ03peh/qdQZH4EA0HnO31Q9du4ONyg0QwmMkmg5jmWSd4uGBwwzsyFape+4
         rSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUwhBT0HEy+w8/7x0rV0cF/18t9AsTlAgTmMKYlGiAA=;
        b=D+lhvAd2/5GJ1qtrLvn3dOom2t8kH1nBPnXz43r5hVIXFJzVXpubw8NafLMKd4VOfQ
         7h+GCINfAcBuIq8FpConR8v2fOZSpIjju/ZeXg4gJl1mTWmcS4j+LzgNVC2LrWmv1mPA
         uM6w0Mjt97zMf07tR45BQPvmoougSakqAaCU8vNq3TgyxbKnVhL1RbgSB9vK8XBligUF
         x7YGYl1cmcM2Lma4D1HQJnis6EPzJV8zlzMRjcYahf7/X15JbJ1BDHu7W1L5YzAkpLNX
         4q/jFwrla6QABbfB1slO3n6VP0id1ArVFwGZx/BuLMk5dmHqRwa73pmC8bAJvj3NQDhQ
         VhnA==
X-Gm-Message-State: AFqh2koz/5Ml7O7cNWpHon4QbnjCxNXz0V8FII21bX0ZFleBAeZ9fUwg
        qKAL1G5b5yyRRHKTTYEpff4xww==
X-Google-Smtp-Source: AMrXdXurlJQff+dDmDW8g3Xq0c5Fk0JYKoF6Cfb6PWUPzdD8nLmpEu/D4fuNrfY4vVcD7AtoHVFEuA==
X-Received: by 2002:ac2:528f:0:b0:4b5:6504:a556 with SMTP id q15-20020ac2528f000000b004b56504a556mr9877674lfm.61.1672576645937;
        Sun, 01 Jan 2023 04:37:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512361100b004caf42eb04csm4049513lfs.138.2023.01.01.04.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jan 2023 04:37:25 -0800 (PST)
Message-ID: <0ac4e53b-069e-a9b1-bfd2-2e62325182c1@linaro.org>
Date:   Sun, 1 Jan 2023 14:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 4/7] drm/msm/dpu: Move
 dpu_hw_{tear_check,pp_vsync_info} to dpu_hw_mdss.h
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <20221231215006.211860-5-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/12/2022 23:50, Marijn Suijten wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Now that newer SoCs since DPU 5.0.0 manage tearcheck in the INTF instead
> of PINGPONG block, move the struct definition to a common file. Also,
> bring in documentation from msm-4.19 techpack while at it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> [Marijn: Also move dpu_hw_pp_vsync_info]
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   | 46 +++++++++++++++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 22 ---------
>   2 files changed, 46 insertions(+), 22 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

