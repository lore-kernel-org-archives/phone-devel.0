Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B56C6FD1F
	for <phone-devel@archiver.kernel.org>; Thu, 16 Mar 2023 10:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbjCPK3c (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 16 Mar 2023 06:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjCPK3b (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 16 Mar 2023 06:29:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28476188D
        for <phone-devel@vger.kernel.org>; Thu, 16 Mar 2023 03:29:26 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t11so1690384lfr.1
        for <phone-devel@vger.kernel.org>; Thu, 16 Mar 2023 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678962565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZoXEVHbh4zESyEnp5EA5Zcb4rCYHcLM5oXeCPSUEYhA=;
        b=hPGRGxF+ke8z3JzOJVv+C09Jmuv4N0i5SYgY2ZnNIKaXxFPKIJ7v7rnm2ULALJDkS3
         BN+pVAOZSFrQcXJ72EtdmQLp8W7xIabGTpOC1j1pFwBeGr3S2feU1PHVkEeTqdTutiPw
         aU9vqjmKMMz40gaZ8L2TzgsC/ycD6WoA6uapZvUDjCeahwljPbAPNVSsRefd0Mq9y20n
         fdX4PKenMaxkUbhjaaU7NYQUZYUJL59wmPbtVVOg7gfHNbtejQlMvxNRmrqa60LdbRxE
         2y2ayOBGkrD8bvHM/UhTZZ8TxMdjgvxZpe44qY/YBMkbC6Sfiyj2cTlfsM4hD2W2wrYN
         /TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678962565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoXEVHbh4zESyEnp5EA5Zcb4rCYHcLM5oXeCPSUEYhA=;
        b=mGFc/XCagE6eS5DwIjvYK+NTPVoL+qEiWcQTV0qaK/LzBTU2PEVVPqoMnHzJugc7TT
         DGZH6RUyCta/X8Kaz5HoiUN1AMzXi8S68XSKeocj+E+30tLYAFDAfaXIiwosFclboJYK
         t4rh4ScZnkXaMOoKQir15hypsCy7nOecx0iIZ6czlPMCMIIa2L0DHieBMEGoFeDxiYye
         41CcCyKRBT6qo83iapi+z1vZOo+Cpvx3cRVWuNo1dTMoeBuxfiKMq7K9v39qHXJoQG/p
         uj0JI+uLsuRFmK4hroKeM1mw2pSO+huQy5Eq2So8YX2ovKd5USTo0hgr5lvimqArYNCs
         RfxA==
X-Gm-Message-State: AO0yUKWLzYIB86j9653S52TetsoNTqqrj7bA5uFfWFZkeawDo9KQZgVa
        GJXp6Z6BIayVxDdr55cceqgn9w==
X-Google-Smtp-Source: AK7set8RqMAmh9lKg1cILMKHSx8C7wupxbgS49UmQD0f1euyKuqdXR0j+LcLnHCcQgn5HAX+nmRHtQ==
X-Received: by 2002:ac2:5dd1:0:b0:4e8:4699:d01 with SMTP id x17-20020ac25dd1000000b004e846990d01mr2775148lfq.27.1678962565001;
        Thu, 16 Mar 2023 03:29:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n7-20020a195507000000b004e84896253asm1169523lfe.251.2023.03.16.03.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 03:29:23 -0700 (PDT)
Message-ID: <5cfc6a2b-5b70-c44c-17d4-9c5dfaa33f54@linaro.org>
Date:   Thu, 16 Mar 2023 12:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm: msm: adreno: Disable preemption on Adreno 510
Content-Language: en-GB
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230314221757.13096-1-a39.skl@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230314221757.13096-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/03/2023 00:17, Adam Skladowski wrote:
> Downstream driver appears to not support preemption on A510 target,
> trying to use one make device slow and fill log with rings related errors.
> Set num_rings to 1 to disable preemption.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

