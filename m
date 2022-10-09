Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F785C433F5
	for <phone-devel@archiver.kernel.org>; Sun,  9 Oct 2022 18:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiJISxO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 9 Oct 2022 14:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiJISxL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 9 Oct 2022 14:53:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581EF2A414
        for <phone-devel@vger.kernel.org>; Sun,  9 Oct 2022 11:53:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 10so13832880lfy.5
        for <phone-devel@vger.kernel.org>; Sun, 09 Oct 2022 11:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBU+42WDJEw6kYLIwt2kumcImvZMC7HZo1MXSpkSR94=;
        b=jDJ3EXLInv+837QzF0uKei/b0nAwTmwMivjyWNvCSqsaUS5uGhZZ5p+9jqAD8B9UlB
         8EdqhKcYmnv2hL2QCErhihJMyZC89I3f9/nawFnuOCrl9PWS4h+5E6ni6rRBnibTZnsK
         v/9HwSotctDB0P/t9DvGueCCURctvR2IZ5zRPxT6vptb8gZoYriT45raWFk8Jz33QN0n
         K3p6q99y/AZC8YwNtpEfMkRE4ukJTFv3r81u1OM0D0Tgahzhn/K1Z3jYZJFTrQjufJDy
         aCwh5EMRWN59hWihxffQwUdCLGqdq/Y39bod3Hx0ZeTSNP6IZmQM8l88zVl1lJp0Edox
         2jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBU+42WDJEw6kYLIwt2kumcImvZMC7HZo1MXSpkSR94=;
        b=F3XFH4r9G85Dlqfi8ratQ6R9/rVV5wzMEHes9TE/LCShT5fg0/li3JPj9EYrqZN7sM
         81tpI6ozo2doWhJ32AdzaEJKYkbfrRsAdBKdDvc0NdkemAbqizeXgRCvYmtghm3z43As
         f7JZPtsl0Wvw6WWAxn18/CKreqs1VoZ33XfArZX/5BHgoZMpDRGd+e6PMVoNsJNF9zwX
         yLEz/5ACYVAzru0jQFOcjSdpCo09MZLDWkHh+9giHDeDv4gwSH61X1svmoGGWaEmhzWR
         dLuRa1IdD5Uxw7hLLjB7pEy3IsKd0uyvoZn1pmNLbSZQO8wP4VqsIOeKYgSiKRpXyy9l
         I8cQ==
X-Gm-Message-State: ACrzQf1wwEcLq6de+DD0dcHWbxGJSiKzMxuYRRNJn19Jl7BsW1S5s7GP
        gaBDwGiHa2W1c3uCwcNd4KKwoQ==
X-Google-Smtp-Source: AMsMyM5aRVZkqZutaU0TMyEyIn4HXU3OyOVthzdxUsMrTnMrF4JH7w04zVBoJnyuKWcnF8FF4wsqsg==
X-Received: by 2002:a05:6512:252b:b0:4a0:5642:dbc5 with SMTP id be43-20020a056512252b00b004a05642dbc5mr5643306lfb.436.1665341588751;
        Sun, 09 Oct 2022 11:53:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h5-20020a2ea485000000b0026e059a3455sm1367718lji.51.2022.10.09.11.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 11:53:08 -0700 (PDT)
Message-ID: <f3d9bfac-507f-64e6-bbf7-29a3d9dfef31@linaro.org>
Date:   Sun, 9 Oct 2022 21:53:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 02/10] drm/msm/dsi: Remove repeated calculation of
 slice_per_intf
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
        Douglas Anderson <dianders@chromium.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009184824.457416-3-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009184824.457416-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/10/2022 21:48, Marijn Suijten wrote:
> slice_per_intf is already computed for intf_width, which holds the same
> value as hdisplay.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

