Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EDDC433ED
	for <phone-devel@archiver.kernel.org>; Sat, 15 May 2021 23:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9298D613AF
	for <phone-devel@archiver.kernel.org>; Sat, 15 May 2021 23:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhEOXGG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 15 May 2021 19:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhEOXGF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 15 May 2021 19:06:05 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E05BC06174A
        for <phone-devel@vger.kernel.org>; Sat, 15 May 2021 16:04:50 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 131so2793253ljj.3
        for <phone-devel@vger.kernel.org>; Sat, 15 May 2021 16:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OIu8Q4sgkPhmvMjd1jdK3ceBv8MZIPFNfCveUuP/nXw=;
        b=ZAmyTQq+43IOcBhnWLVn47XdIoRwtk0gVIMI4rFsN3bPiDWhZi0EVmlO7HSPttROXs
         joJR8PNw5g5dkNHzx2vN4FneuEVxYh7/iFDB1j3VopR9p24h8Jy1blZvywqoYSl9NHwU
         gWL3deAvHtyMYomPNwfz0xLqIH40y4fNN5p7A05xbwpIuwkCRuJKtFpq7pGP503PGrlI
         ECG2Nzv2DNjX3F5P7om8WxfpqA6P5wwlb2AOWbkFeN2S9k1J1y2GO9MtvY1d16YROogM
         5iqsSS8NXp2ZwJllBvWrOJ4seW9iV7k6J+wos+KWRkP/qbBNsYZEnLsum6Pm3/VNDood
         Gxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OIu8Q4sgkPhmvMjd1jdK3ceBv8MZIPFNfCveUuP/nXw=;
        b=Fg5LHnVV8DfF6qb3K7nV0EM2oqP8Eg2T6JhPBqpe2adOaCnxgfTAxoForebmHRZ1zd
         U6J9MxAtRlXGq4XCxZV+Z3IIivgLwGh58UKntOO5qo9yKZmr+3ipDtXy+jSlVUwd2S7m
         NTi7RCL2/bRChMvCtrikkHqgLpW/K8w3bHutZnb0OhZZbZ+C8H3N6HMiGUV08Toba42c
         hnM+RqEqDcSpQKYVrN1KAeV0S3Rj4Ai6/4f91YKmrqjXvkE7GWJr+g6LdFnzQjyJlTXL
         x75KMGXebVMfyvA1pLjwR2LLJin+/uk3d//n/Xa3QOOc4n/p0Wqh96jf8qkhXydVZ7+J
         iL6w==
X-Gm-Message-State: AOAM532oKVEvavU/njeIdjVj0Q+/a1qwC6MqJ5JMKnf8wEXW3j7pLec7
        +G8YjSo4TOo2uFWYL4HpfAyOoA==
X-Google-Smtp-Source: ABdhPJy1quJvaV/nck7SUQ5ex6Rk/kzi1csbr7LsYS9BiSb09QbHjGoll6VpORSW9HvLGlmtZIisWg==
X-Received: by 2002:a2e:8708:: with SMTP id m8mr8691010lji.383.1621119888679;
        Sat, 15 May 2021 16:04:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q19sm1472998lfu.105.2021.05.15.16.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 May 2021 16:04:48 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] Qualcomm DRM DPU fixes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ca8dbaa3-a510-d75c-e1cc-c4b964c90e5b@linaro.org>
Date:   Sun, 16 May 2021 02:04:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Angelo,

On 12/01/2021 22:26, AngeloGioacchino Del Regno wrote:
> This patch series brings some fixes to the Qualcomm DPU driver, aim is
> to get it prepared for "legacy" SoCs (like MSM8998, SDM630/660) and to
> finally get command-mode displays working on this driver.
> 
> The series was tested against MSM8998 (the commit that introduces it to
> the hw-catalog is not included in this series, as it needs to be cleaned
> up a little more) and specifically on:

Any updates on submitting hw catalog patches? If they are not yet fully 
ready, could you please send an RFC or DRAFT patch for the reference?

> - Sony Xperia XZ Premium (MSM8998), 4K dual-dsi LCD display, command-mode
> - F(x)Tec Pro1 (MSM8998), single-dsi OLED display, video-mode
> 
> ... And it obviously worked just perfect!
> 
> Changes in v2:
> - Dropped patches "drm/msm/dpu: Add a function to retrieve the current CTL status"
>    and "drm/msm/dpu: Fix timeout issues on command mode panels" as the
>    second patch was wrong.
> - Fixed patch apply issues on latest linux-next and 5.11-rcX
> 
> AngeloGioacchino Del Regno (7):
>    drm/msm/dpu: Fix VBIF_XINL_QOS_LVL_REMAP_000 register offset
>    drm/msm/dpu: Move DPU_SSPP_QOS_8LVL bit to SDM845 and SC7180 masks
>    drm/msm/dpu: Add prog_fetch_lines_worst_case to INTF_BLK macro
>    drm/msm/dpu: Allow specifying features and sblk in DSPP_BLK macro
>    drm/msm/dpu: Disable autorefresh in command mode
>    drm/msm/dpu: Correctly configure vsync tearcheck for command mode
>    drm/msm/dpu: Remove unused call in wait_for_commit_done
> 
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 90 +++++++++++++++----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 49 +++++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 ++++++
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  9 +-
>   5 files changed, 147 insertions(+), 41 deletions(-)
> 


-- 
With best wishes
Dmitry
