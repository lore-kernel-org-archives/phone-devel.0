Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C45C3DA7D
	for <phone-devel@archiver.kernel.org>; Sun,  1 Jan 2023 04:18:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjAAESs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 31 Dec 2022 23:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjAAESq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 31 Dec 2022 23:18:46 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B836352
        for <phone-devel@vger.kernel.org>; Sat, 31 Dec 2022 20:18:44 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 1so37258420lfz.4
        for <phone-devel@vger.kernel.org>; Sat, 31 Dec 2022 20:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69gDuhyvyskPxkoiJfXY3XwAwa6ovH+bzxQjyk8p6KY=;
        b=l75jACFlTzZ9CieQRawrOxUg5PWkxRFz+86CrBn677QHCKCfG2gPbyJASTfn/6+uBm
         BM6oD3FiM0qTj8qhD5xcn6xRGIvWhmCt5PGXYOpQUEiWbNKDUgTnZOca63a9Q/xqQf0E
         PNyLL15uP4oXeFivahExuqn4zvti81uw7NUuUfILsnzXclFaIi6aijc0oBElIYhzih5/
         KXqmS5ZFpxkKDOAsK/n4QERCbvUalyKmWjagkcbRmJb4hyaRQUJktAFBwrYAzy5V285R
         Wdp3OCprWRMEOYj8OgHJ9cz/tX/eglUbOmoN8/oGWtmttI4p1GoF1mBKdRPGnqf574Cx
         Uy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69gDuhyvyskPxkoiJfXY3XwAwa6ovH+bzxQjyk8p6KY=;
        b=qbfev6DUfcV3zeB5ZxulWKNTLk0Ml9I4/OruT/rdVrEMngCE0koYJs4CHfrmOl8Xs9
         joFayfWyR5FpB3YwxwKUFpiu0JHJcgkEN/xRi5XhqmwPrZU5i2RXrGyKN09XyNyg8/0N
         36aPoQveq0X5KkbqmSZRTQNJZTYtCoBPljzrPH2FxueIokfaT+2SFLML6qiSR13svZ0P
         piMhV+5KHdJ3ymGTbuFqNZ93ZE8/iM7D6FKPtYBhh40N6X0ZvC5rGOnr5w1dzn1KNAc5
         +qCf62ErC3gAnAorXLzK69NIyC7eyD3vyDjV3BuoWM1jTZ/NpaGcx6YC06EhYrNNpSKn
         idVA==
X-Gm-Message-State: AFqh2kpxnNj1FSBfJRTHWChhSAEmY8QJtUjjJXawkK/79ZDlpZnOpNl2
        NIuqElezthVE1peLvqEeH4tfdiXjtZoNYAJS
X-Google-Smtp-Source: AMrXdXuE4021vfsazj1mMsaa3Yx8JAAGxKmqnSmp/m8F5gbAZyIiSwE+7HkewlYDM12pbtMgJpxSuQ==
X-Received: by 2002:a05:6512:2385:b0:4b5:90be:33c8 with SMTP id c5-20020a056512238500b004b590be33c8mr11384536lfv.48.1672546722649;
        Sat, 31 Dec 2022 20:18:42 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p2-20020ac246c2000000b004b5a85e369asm4047378lfo.252.2022.12.31.20.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 20:18:42 -0800 (PST)
Message-ID: <1f887a99-8184-44f7-204e-ff0a2dd98ec5@linaro.org>
Date:   Sun, 1 Jan 2023 06:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 1/7] drm/msm/dpu: Remove unused INTF0 interrupt mask
 from sm6115/qcm2290
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
 <20221231215006.211860-2-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221231215006.211860-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/12/2022 23:50, Marijn Suijten wrote:
> Neither of these SoCs has INTF0, they only have a DSI interface on index
> 1.  Stop enabling an interrupt that can't fire.
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

