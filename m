Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D595C678D5
	for <phone-devel@archiver.kernel.org>; Tue,  7 Mar 2023 17:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbjCGRDA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Mar 2023 12:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbjCGRC1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Mar 2023 12:02:27 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9E95616A
        for <phone-devel@vger.kernel.org>; Tue,  7 Mar 2023 08:58:16 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id a32so13842594ljr.9
        for <phone-devel@vger.kernel.org>; Tue, 07 Mar 2023 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678208295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYPS6T0GQT0YMU3PoBe/ezLSZBLT3NTyr0o7Ri1kY9k=;
        b=UY5DImM1KYh2Pcll+wLQFh6ZZ9XeQVrzKMzij0we3VeD/meacUUkLWEfu9XdsAnuJH
         fKQqrD56jeBFjR/LND7RB3LfloFCotsIPs72SS+/Y1XbOpal1JNSScf8Av1ucq+KmAj1
         W6g7quXpehwu703Puvoqt1yzFOY2Q6bI99Pk941TcN7pZ04BO9AeA0nG+dzLFbXcSQ7J
         J+Nfx3EJOBf5TgQwRgf5JD4QriI8MifmzZzu5hTSS9oCHSpsv4LePN1LJyReVFhlS3US
         2In1jrqo/YgeTLfhMVZuixBzECuWC9i+7oIEILlaqdmbiQZjAjduVLXjM5/kfp/GJrgt
         JFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678208295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYPS6T0GQT0YMU3PoBe/ezLSZBLT3NTyr0o7Ri1kY9k=;
        b=EJWzlSzFuz1IRZD4urkkUS8R71BAqWWLpeirLF9WfwEaR2NEifshBkJmyKz71PLNcD
         jqqb0T0TW30o00a1P58K+uwhJutl3A7tI2eC17acWAfgM/wz6BDmQN9FGIMJRtAzqBoB
         X0jzaNLabvSEZqDnM+iV+qCZkeLeH4y8dFTfsnK6Hr8NN18jwC4BkMWwWsPPxQWp7L+o
         kRTjtvaEJNz+LjIZwXUkgKkPaNhORuXHyXfoLJoBw22R9bCXnSygHP5GiZNwFs9warrY
         mEwZgFHU3306rh4qvc1uIg4Izi+mYJzyOW8veKkjse8Dw7RDqPb6aJCOiD4ricbr3wfc
         AGKA==
X-Gm-Message-State: AO0yUKUtzV4jVaZZOVV8KbBME2IdoO8hGJGqkR1xiU79MfeJmX3neYay
        QX2NxtwUtKZ9vhBO4+q2Xx6jyA==
X-Google-Smtp-Source: AK7set/BvoPPVaX8qUlMUC5WSo8HDQZFTRScfOMiSPiSx0DvSiUNYFHH9jM3kIhnoq2STd3i6igBVQ==
X-Received: by 2002:a2e:910d:0:b0:295:c39c:d8ab with SMTP id m13-20020a2e910d000000b00295c39cd8abmr4207730ljg.39.1678208295021;
        Tue, 07 Mar 2023 08:58:15 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l18-20020a2ea312000000b00290716d65dcsm2236391lje.136.2023.03.07.08.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 08:58:14 -0800 (PST)
Message-ID: <d237d1c6-4b07-2f7f-8812-34365e56380b@linaro.org>
Date:   Tue, 7 Mar 2023 18:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 6/6] iommu/qcom: Add support for QSMMUv2 and QSMMU-500
 secured contexts
Content-Language: en-GB
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        marijn.suijten@somainline.org, kernel@collabora.com,
        luca@z3ntu.xyz, a39.skl@gmail.com, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221115101122.155440-1-angelogioacchino.delregno@collabora.com>
 <20221115101122.155440-7-angelogioacchino.delregno@collabora.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221115101122.155440-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/11/2022 12:11, AngeloGioacchino Del Regno wrote:
> On some SoCs like MSM8956, MSM8976 and others, secure contexts are
> also secured: these get programmed by the bootloader or TZ (as usual)
> but their "interesting" registers are locked out by the hypervisor,
> disallowing direct register writes from Linux and, in many cases,
> completely disallowing the reprogramming of TTBR, TCR, MAIR and other
> registers including, but not limited to, resetting contexts.
> This is referred downstream as a "v2" IOMMU but this is effectively
> a "v2 firmware configuration" instead.
> 
> Luckily, the described behavior of version 2 is effective only on
> secure contexts and not on non-secure ones: add support for that,
> finally getting a completely working IOMMU on at least MSM8956/76.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> [Marijn: Rebased over next-20221111]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 22 +++++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

