Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FA8C433F5
	for <phone-devel@archiver.kernel.org>; Sun,  3 Apr 2022 19:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376358AbiDCTmT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 3 Apr 2022 15:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352730AbiDCTmS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 3 Apr 2022 15:42:18 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A2E27B36
        for <phone-devel@vger.kernel.org>; Sun,  3 Apr 2022 12:40:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a30so10352515ljq.13
        for <phone-devel@vger.kernel.org>; Sun, 03 Apr 2022 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HtO1Op4EULGuNh03X4DV2PvRHFpqexefkL4qM7EQ8hs=;
        b=Vva63TToIflctX178TlzjoBSwvG9ymyH8fkUFzsJbWemLSthhs3fmUiyct2jJXfuul
         cBWrmGUChH7mrrtvKlbT+UvTMA1kr4EGroRz89d9ZgRjBKqjhw8b6Pjx9Drm+2KP3ffr
         qCaQcnpudkB1x6f/TsesEIgup+s8tupM0OkNckNeY94nH0LSyoG4CwZboW/Hdt25PAcJ
         sQFqduKzh+wRrNkQBH2bKey2AY958WP2O9dI5/Wdtz/wZ0MDwOZqcOy8Lz7GFJgKEqMC
         KQo46IBKc9PhJAb+EVBtnQVsPyqsfla9tpQgL26rsToQlejCjGBroM2zOCQ3JxObDDsq
         /ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HtO1Op4EULGuNh03X4DV2PvRHFpqexefkL4qM7EQ8hs=;
        b=Lm+uz4MbDqr+fT4u/oZP0KrJcMHFUI4GI8cWF0grMekn3HeM/EhMnw5s5q6ljkeggJ
         LcP6Ar6rLsU/bZABHeFyVwZKMtGbdtlvK0NhTRNqpjWcwvA5Ef0hH5DtM0Yhe3li2qLz
         zQ9xy0fGnYGNo852uM1szH9HeSVcCt0zDGNGKykDTppNU+n+ZFwkDYnFoQ0lxlNklYOm
         4dlh429y380eJUomBUBlcE9OGwDYR8mM+yCckWtcu2556+ubrbZO8SpaFadplcQne89s
         pt0vKj3bPMrcWEcgZaBFVy4Vdaoiyvmm2wXm2tL6HgkeFc0JvDOC+wa2W0bUrwoeiOv0
         FJPA==
X-Gm-Message-State: AOAM530fsQcKPkV1e0UB7xI/hbHFE6oUN0ZM0jyapumBbTFkPoIm9JNx
        BXlQ6ANwLSaWf7BSljFyCi1EGw==
X-Google-Smtp-Source: ABdhPJw7jctSDj8NStIfPObweDUKTSouSVeuWxido0zNdu27djMaTmXtm8LsIEAvN6zkHp/iSjViQA==
X-Received: by 2002:a2e:3615:0:b0:24a:fc28:f0b3 with SMTP id d21-20020a2e3615000000b0024afc28f0b3mr10332615lja.4.1649014821787;
        Sun, 03 Apr 2022 12:40:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e9650000000b0024af767c536sm860592ljh.19.2022.04.03.12.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 12:40:21 -0700 (PDT)
Message-ID: <19015645-86ce-5a7e-e2a7-d4af01417b74@linaro.org>
Date:   Sun, 3 Apr 2022 22:40:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: msm8996: Revamp reserved memory
Content-Language: en-GB
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210926190555.278589-1-y.oudjana@protonmail.com>
 <20210926190555.278589-2-y.oudjana@protonmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210926190555.278589-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26/09/2021 22:06, Yassine Oudjana wrote:
> Fix a total overlap between zap_shader_region and slpi_region, and rename
> all regions to match the naming convention in other Qualcomm SoC device trees.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #db820c

-- 
With best wishes
Dmitry
