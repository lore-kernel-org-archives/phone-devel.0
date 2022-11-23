Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E6CC433FE
	for <phone-devel@archiver.kernel.org>; Wed, 23 Nov 2022 21:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236859AbiKWVFr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 23 Nov 2022 16:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235853AbiKWVFq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 23 Nov 2022 16:05:46 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032299A248
        for <phone-devel@vger.kernel.org>; Wed, 23 Nov 2022 13:05:45 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id x21so22709203ljg.10
        for <phone-devel@vger.kernel.org>; Wed, 23 Nov 2022 13:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzqt331g8T68TbUv6sgzKml0DHljiiwCg07CtnYVk1Q=;
        b=rdQUXwcIP0uEWh7Ulyhf+ky26BtMT19RFWwVxD33CSMIhC7n8iasJ+6WnsStWbiXxR
         /NLZCPKKcYPaYV0VIQqmFRXFsEqXhHsMvfquefe89IdzwtezCPskcFJMLWu81RllkmtH
         xe1TMNwABc2QWkw7JDNigKcjKX8uE8dPc69sqZNkNqFZCE3wtn6TMSknX3leib+edtnz
         dStnp+uThASYAQTfly6odXol9Co5iXJTMoxwKt2w2Zec66aHBHHNlvfwTGbg/wnqGgcL
         E/9TI/cKucsMIZLCArdgG5BeKCHsyh3iLwx/kJOgFX4zxrItqr1hbf/KFX18i8lqYQEP
         SHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzqt331g8T68TbUv6sgzKml0DHljiiwCg07CtnYVk1Q=;
        b=pyn/RprX4fujJ5Y+XuVi8HxC/O2QiZRk/7p9gogcrkzuflZepjG69pRgJqs9kfj5h3
         q23eCPAYYaicvHiXN7DlGNqDtyvmeKS3PCS/UOsGeMZG0lJuXRIgsCzYhm1SHv8EXqnm
         EAvlqGOoTaK7MATLZjotNeoLGqIgmojNNONFpAZI77w7JY2ICo/cyxV6bGWT0+RtFcUW
         GWZsC8Pe0r7UCQPKyzDpc92TEpAHpRicCOnjZlJ5wswIH+Ff49UAJMFjoFKknL6Yli3D
         UP/PFMdiDZutwOYboEpfHCGgAOMasB2wqtdmaecdT6AcDFRhfItaz3SCVvoiSTYepNVJ
         vhJw==
X-Gm-Message-State: ANoB5pnfrzUfLlXdT5J1UAGDmGRbH1a8fv9Ix4u/iH3+ncqu9vj7FpJ3
        tgHicbNfCiTO28yn3S0XadpBnA==
X-Google-Smtp-Source: AA0mqf4vdFElVVd26hcrflnM3jwAKdLRue0OvT56EcJoe77rqn9gFdAxg0vHma8xxGawZfkoLjfBgg==
X-Received: by 2002:a05:651c:b0f:b0:277:ba3:ca71 with SMTP id b15-20020a05651c0b0f00b002770ba3ca71mr9097106ljr.146.1669237543343;
        Wed, 23 Nov 2022 13:05:43 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 6-20020ac25f06000000b004a91d1b3070sm241096lfq.308.2022.11.23.13.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 13:05:42 -0800 (PST)
Message-ID: <ab9c9915-3e56-c72f-8102-eb9a0d36c4be@linaro.org>
Date:   Wed, 23 Nov 2022 23:05:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] drm/msm/disp/dpu1: add support for display on SM6115
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Jason Wang <wangborong@cdjrlc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221120133744.24808-1-a39.skl@gmail.com>
 <20221120133744.24808-3-a39.skl@gmail.com>
 <f39ae6c3-e156-7366-6802-c392f1b1246e@linaro.org>
In-Reply-To: <f39ae6c3-e156-7366-6802-c392f1b1246e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 23/11/2022 01:54, Dmitry Baryshkov wrote:
> On 20/11/2022 15:37, Adam Skladowski wrote:
>> Add required display hw catalog changes for SM6115.
>>
>> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 87 +++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 +
>>   drivers/gpu/drm/msm/msm_mdss.c                |  5 ++
>>   4 files changed, 94 insertions(+)
>>
> 
> [skipped]
> 
>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c 
>> b/drivers/gpu/drm/msm/msm_mdss.c
>> index 6a4549ef34d4..86b28add1fff 100644
>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>> @@ -280,6 +280,10 @@ static int msm_mdss_enable(struct msm_mdss 
>> *msm_mdss)
>>           /* UBWC_2_0 */
>>           msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>>           break;
>> +    case DPU_HW_VER_630:
>> +        /* UBWC_2_0 */
>> +        msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
>> +        break;
> 
> According to the vendor dtsi the sm6115 is UBWC 1.0, not 2.0
> 
> Could you please doublecheck?
> 
> Looks good to me otherwise.

After doublechecking:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
>>       case DPU_HW_VER_720:
>>           msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>>           break;
>> @@ -509,6 +513,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>       { .compatible = "qcom,sc7180-mdss" },
>>       { .compatible = "qcom,sc7280-mdss" },
>>       { .compatible = "qcom,sc8180x-mdss" },
>> +    { .compatible = "qcom,sm6115-mdss" },
>>       { .compatible = "qcom,sm8150-mdss" },
>>       { .compatible = "qcom,sm8250-mdss" },
>>       {}
> 

-- 
With best wishes
Dmitry

