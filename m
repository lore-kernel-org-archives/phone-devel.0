Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0A4C54EBD
	for <phone-devel@archiver.kernel.org>; Sun,  8 Jan 2023 23:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjAHX3S (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 8 Jan 2023 18:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjAHX3S (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 8 Jan 2023 18:29:18 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC4B10043
        for <phone-devel@vger.kernel.org>; Sun,  8 Jan 2023 15:29:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id d30so5576870lfv.8
        for <phone-devel@vger.kernel.org>; Sun, 08 Jan 2023 15:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
        b=CiuDQBy/qJQ87Xz9VOezGSflqPnj3lXtvtt7iDr+c8eky0iXrkd/ssxJDRvHuhLpXv
         9YLK0p+b1zqAlvG+/kIHdXFdW65Tznz3XJTqmiPB20M8CwSh8GV2RLbwOtplHGn/WImv
         HsJ+dtiXAJP9IwxDjcYDCCIeDpvSwBxsh5fI2fWET8Y9bUyr30bp6uc/TEBSUfttvTd/
         Stg4mG7kChcSNPn51POGjV5/jEl/q2I/q3rgWByVEg6tp8bcv8CmbBVIRTaaK20Oz8gV
         VzNINsauGqt2hsJKATn9KmVqsnGxyai84XgZ7vQiX4ddCrhxjawWojXMYxTz+HARzYyh
         5AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuTC2ch7lBeZqWq+4sA1VXQap+WvF8VB8BdbUaWqcHE=;
        b=3XUqhUt1sUicaKslXM/z3tccEd4Yw2wYjqkpT2VJNuCi53VZY581PU0S3fIfDWU2kc
         xKBSPlpSHNLZIH+9zGYLeD76+C0aIRP89qrfAlmu6vU5/vCY6sht68t+dfXARezxe/nu
         vjdMqRY4gflqoGguNkbxxk07a32Rzh3gYyK53BCGjgy32dFKjLeEAMCq5uEj42o3X1wD
         hXNCcORxZHThf70knktisiSfAWGVeo0O+oqDNwTUw4GWaQfufJSFAgYhlqavU9NYslOp
         iaUE+wqusHc5TwfIjy1tlTMY3hlhBJD3KOZP2mDAsM4ROWefhh+tw+JxM6hJSwKzSOqR
         pueg==
X-Gm-Message-State: AFqh2kpZ2HVN0WobQfVgPvTQ8sy5NVnbcvq90xfFYDguHQKe78UemMR9
        r8n7PWFEADi+6Xi3yF3jgxiyRQ==
X-Google-Smtp-Source: AMrXdXu8t5pfKS4rJQB9w2fmYZWbGOdVt9Co/jrV0noSh0NCRbIwq1U+45wR8Qydaxpx9ytF9YSmoQ==
X-Received: by 2002:a05:6512:22d0:b0:4c0:5798:38df with SMTP id g16-20020a05651222d000b004c0579838dfmr21545854lfu.27.1673220556738;
        Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u18-20020a05651220d200b00494a603953dsm1283513lfr.89.2023.01.08.15.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 15:29:16 -0800 (PST)
Message-ID: <06eab036-7c0f-55d5-2ad1-cfaf5dc0cc8d@linaro.org>
Date:   Mon, 9 Jan 2023 01:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/8] drm/msm/dpu: Reject topologies for which no DSC
 blocks are available
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@intel.com>,
        sunliming <sunliming@kylinos.cn>,
        Sam Ravnborg <sam@ravnborg.org>,
        Haowen Bai <baihaowen@meizu.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-6-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221221231943.1961117-6-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/12/2022 01:19, Marijn Suijten wrote:
> Resource allocation of DSC blocks should behave more like LMs and CTLs
> where NULL resources (based on initial hw_blk creation via definitions
> in the catalog) are skipped ^1.  The current hardcoded mapping of DSC
> blocks however means that resource allocation shouldn't succeed at all
> when the DSC block on the corresponding index doesn't exist, rather than
> searching for the next free block.
> 
> This hardcoded mapping should be loosened separately as DPU 5.0.0
> introduced a crossbar where DSC blocks can be "somewhat" freely bound to
> any PP and CTL (in proper pairs).
> 
> ^1: which, on hardware that supports DSC, can happen after a git rebase
> ended up moving additions to _dpu_cfg to a different struct which has
> the same patch context.
> 
> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

