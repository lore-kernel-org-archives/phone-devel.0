Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8079EC4332F
	for <phone-devel@archiver.kernel.org>; Wed, 14 Dec 2022 18:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbiLNSmP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Dec 2022 13:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238671AbiLNSmN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Dec 2022 13:42:13 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097575F43
        for <phone-devel@vger.kernel.org>; Wed, 14 Dec 2022 10:42:12 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p36so11942049lfa.12
        for <phone-devel@vger.kernel.org>; Wed, 14 Dec 2022 10:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzjlbWiuT+IWIg/5Yap5dEXs/ERTMU8woVUGsrNbhC0=;
        b=ZPXAGAfz8BylSpg3nsb4juFTw1S6nqe+dXuo3ZOrLyCCx+Elw4c0DlIjsFGwqzMZra
         pDJAEVkHsy5/S8BqY4dERLkd+BXXu4xJOXpcTp9hPG2z26KyrA9gyIROtj0yNsaAx3a+
         dBlDFIlBmBLFEW2UqlBQVFhYSPe8mZGyW/j1sOgHXJSGAFZ5oHdcSo1hvr3DlirOjZ6x
         8Bc4ib641r9PJkAXnblRIvhBJaKiY9zvz61xD6NcJ4xZpECQSVSUL1eZylnBhKiX2EWO
         1UA6FrVtFzC1vSg9AhglhCWos4VLSQpbBVfLOemH81sBfEPVGZhPLul8D6kLvkAW3scH
         OOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzjlbWiuT+IWIg/5Yap5dEXs/ERTMU8woVUGsrNbhC0=;
        b=5T31Fyj6vN3JfB9ML4UtI0hGwFrCMqA9rqOwDzDKMrmbn0iZuZdR9vPbep2AV/D+bA
         Ebx26hrR1CRtvdSEdmCWZGSgxEIqX0wo24Z6iz4DV0L3YsFDCdupGZ9qwY/fKSdII5eD
         GtH99piOdU+ROp0aczfy2P5PiKHWPcmxHCGrnnjS+B9AfaLWBtI+u2kjyjJVxJrKH8UA
         /DxkTWmmM16l4Dqe4G60Vw25dEnaSW0zoBCumaVwANk3yAUhsLKEMgxbGcUb7hunUXKN
         q9EOX8qOMRwoFf8xH/vDu3yMw4TEITdxOBuqgX7THnxJtx5cIix9oP6PmQ41ZYzWXouT
         kGtw==
X-Gm-Message-State: ANoB5pmGga7rouSApdQaCw33lBHqtM1bjhmYIfm3Qcg7mbfQmPp5Lsgs
        59XTCvhTbqIFVsB3ispPFwbWPg==
X-Google-Smtp-Source: AA0mqf4h7STmUyPUoDyvAzFw4Emks7KOjE5Q2BcruCIb4Ut83gdOi0blwBN0TgypuFEfN2PlYRfQjQ==
X-Received: by 2002:a05:6512:31d:b0:4b5:5fc1:9d1e with SMTP id t29-20020a056512031d00b004b55fc19d1emr6990525lfp.44.1671043331341;
        Wed, 14 Dec 2022 10:42:11 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g26-20020a19e05a000000b004b094730074sm897061lfj.267.2022.12.14.10.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 10:42:10 -0800 (PST)
Message-ID: <13784faf-20d4-5b4a-efb3-e59edda0a550@linaro.org>
Date:   Wed, 14 Dec 2022 20:42:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 2/6] drm/msm/dpu1: Add DSC config for sm8150 and
 sm8250
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
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-3-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 14/12/2022 01:22, Marijn Suijten wrote:
> These blocks on CTL V1 support setting a PINGPONG idx to send pixel
> output to.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 23 ++++++++++++++-----
>   1 file changed, 17 insertions(+), 6 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

