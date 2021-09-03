Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90080C433F5
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 18:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B761610C8
	for <phone-devel@archiver.kernel.org>; Fri,  3 Sep 2021 18:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346546AbhICSZH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbhICSZG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Sep 2021 14:25:06 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D4DC061757
        for <phone-devel@vger.kernel.org>; Fri,  3 Sep 2021 11:24:06 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id h1so181028ljl.9
        for <phone-devel@vger.kernel.org>; Fri, 03 Sep 2021 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
        b=qkHognoxURfD5dM1rhFf+ejqDj4AodnjjnIF1fbS7miJaIFBv2d/cjNFUxR8VJyJwW
         lnzREYn5RxDERjhpg7YuKd9sehvjNbCoUvLo4jQhVDbY7p6ErcqHr8ECQ7M3xzi+D76A
         LVuweIsCoAAdrnOsmRcRcWUWvZT6p2QZBVfUqKqKzEhZ6mnet9eMgu3x/BXf8LMk4fu0
         wtJiRevjC5awf8fEkww+Jn96XQ1ssiYUYr8GSieEJMC4ejhv4XVPi05LNfX1/Lq1hjjI
         aaRMmxpebkxUEWopvuZKq5LY/W/UtOYlhpg19nkeuAcTNTH9RQiLsvaJ4oPY3PDWvLNb
         W+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9rEOZFgWRRBzTrjc1sgzKvt3j7Y9HuVgaQyFS26IehY=;
        b=jRk23RaQ/gJ9ng9B0CkinpgESEOE8kYViktwUi2AnW2WOUVV7XgIRfbibHV0no2wh2
         l1NITZ8kWLFS+Hqh7++FpCBHs5o+vBO/oSSiHjSOvx/wmjJJO9Coar09NgbFF+uo0nWu
         vy0+Cs5uJu/NuA2Enpc/ChwKp8sOJTh0Y9WVOA5rs4Coi9LH/k4kjSa0xIPyqzcuvndz
         Yl0iSnqstcyCd6wXKhNxpBpW2mXAEf5oU0ZwXnaseWUR2rCrgVaE3uIXRa6dH+9mukTc
         617zTNPyh9N0qGOTgBAq8avq6qkDm0ez0f+MJpVUTy9VQ3QZwcRfL6cSwzg1Zs7X9b+Q
         FzLw==
X-Gm-Message-State: AOAM532x50xAuom+VpTT7yFFJdRRO89re4nwvqwECyG8R3CQ1Zb4TXSS
        3B7EL55TAxf/UvG95Qcy2ArBzg==
X-Google-Smtp-Source: ABdhPJz6vIY3BKpngT9hBro3h/w+4cLaEvhEKm7lFcDxED6un/1W/8r+MNrcUUM3Mi0WXbnil6rxGw==
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr235236ljh.403.1630693444412;
        Fri, 03 Sep 2021 11:24:04 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w18sm17659lfa.50.2021.09.03.11.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 11:24:04 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/msm/dpu1: Add DMA2, DMA3 clock control to enum
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        devicetree@vger.kernel.org
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2efd8a35-10af-473c-b6d4-81a757949c40@linaro.org>
Date:   Fri, 3 Sep 2021 21:24:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/09/2021 21:11, AngeloGioacchino Del Regno wrote:
> The enum dpu_clk_ctrl_type misses DPU_CLK_CTRL_DMA{2,3} even though
> this driver does actually handle both, if present: add the two in
> preparation for adding support for SoCs having them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a27cfa..059e1402b7d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -432,6 +432,8 @@ enum dpu_clk_ctrl_type {
>   	DPU_CLK_CTRL_RGB3,
>   	DPU_CLK_CTRL_DMA0,
>   	DPU_CLK_CTRL_DMA1,
> +	DPU_CLK_CTRL_DMA2,
> +	DPU_CLK_CTRL_DMA3,
>   	DPU_CLK_CTRL_CURSOR0,
>   	DPU_CLK_CTRL_CURSOR1,
>   	DPU_CLK_CTRL_INLINE_ROT0_SSPP,
> 


-- 
With best wishes
Dmitry
