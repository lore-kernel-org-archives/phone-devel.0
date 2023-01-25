Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C352C27C76
	for <phone-devel@archiver.kernel.org>; Wed, 25 Jan 2023 09:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbjAYJOb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbjAYJOa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 25 Jan 2023 04:14:30 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC1B43909
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 01:14:27 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z5so16333806wrt.6
        for <phone-devel@vger.kernel.org>; Wed, 25 Jan 2023 01:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hc4egPtkQ64b0FEbo02Uoe7pc1GGb6uUcEvT9CW2GlM=;
        b=LgbgqtQsBGbOy2kKL/s2CXN7B0Va4kyOODgbHl7A68rPZg3Y+DfGPMbi2537c+uaN6
         3TuOYPtEvSvJeiSAkuuEUGpE5NuX01wqY55krQTAHIK7MnowYJC9uijfok3Kt5Id6Wul
         zt4Femiu06/arHYCCSNst1kQvA6t+29+xGx4+Wrc/x7Gr0FHzTUMA5a+yiynBIxwQ0WS
         RMnV6ZqJp/F1UcGfIsPY+q0rG6LnAQB4Uplq8d4P1pabfh7VABlgNquIzuDt4ErCIkbj
         /dCdQ2biMFEeeWM0vKxFHRlIFy3iUo3ue2QuJj9XGBmf3FxzT0uJ1vHY6LkrNQW022RC
         3H4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc4egPtkQ64b0FEbo02Uoe7pc1GGb6uUcEvT9CW2GlM=;
        b=shRR4KJ1FVAPhHtU1Ui6WUiCCNi3Ea7sfadET/V0dhMj616NjHNKCcFy+LmQP/0Um8
         LTvBczGekOIOvBETKVGiu9Vt2Xn0LaW6wS3QbORG3jOpan8NN82jJR5Xe30PY8aZFrNC
         WNtwsdSwhp/WdJvUSQoUVmaEgfXtk3lws9s/Uv/5SxvghLYOVUUV8wi80bSkznoY5rtk
         T1QwTueLx8S+6Pb4imDRYUCLyVw/B0d+H9v3tHHg7lOopUN/RlzvRir2/8vC5A2NGsuR
         IBWuT3JATMwb7lxrLUjpQG8cVWrh5CwDez6M9I3pT37zWGzrNGrtVyPrAGzDjnxqIKli
         r/lw==
X-Gm-Message-State: AFqh2koH9oUhghbs4+kEM8pNu8aOibdZAHcJ7ElfkPJc+v+AzEC/LrXo
        PgZzYdeGbwVhp4menXxa6/B21Q==
X-Google-Smtp-Source: AMrXdXuwxHGrUcOdE1INuh713o6CIr/hcRn6h0E8yd3uD97y7b+mbl27OCR5aakJ9hopl5M/5G07yQ==
X-Received: by 2002:a5d:410b:0:b0:2bc:7fdd:9248 with SMTP id l11-20020a5d410b000000b002bc7fdd9248mr25106933wrp.9.1674638066212;
        Wed, 25 Jan 2023 01:14:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047? ([2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d6acd000000b002bc7f64efa3sm3770776wrw.29.2023.01.25.01.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 01:14:25 -0800 (PST)
Message-ID: <27c57fa8-8fcc-1339-8290-547ecceeb2f0@linaro.org>
Date:   Wed, 25 Jan 2023 10:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/msm/dpu: Add DSC hardware blocks to register snapshot
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230125091315.133283-1-marijn.suijten@somainline.org>
Organization: Linaro Developer Services
In-Reply-To: <20230125091315.133283-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/01/2023 10:13, Marijn Suijten wrote:
> Add missing DSC hardware block register ranges to the snapshot utility
> to include them in dmesg (on MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) and the
> kms debugfs file.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ad08fb7e7105..44648da310f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -930,6 +930,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>   				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>   
> +	/* dump DSC sub-blocks HW regs info */
> +	for (i = 0; i < cat->dsc_count; i++)
> +		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len,
> +				dpu_kms->mmio + cat->dsc[i].base, "dsc_%d", i);
> +
>   	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>   			dpu_kms->mmio + cat->mdp[0].base, "top");
>   

Thanks for the addition, it was missing :-)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
