Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B26C4332F
	for <phone-devel@archiver.kernel.org>; Thu, 15 Dec 2022 15:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiLOPNs (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Dec 2022 10:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbiLOPNT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Dec 2022 10:13:19 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE6E31EF3
        for <phone-devel@vger.kernel.org>; Thu, 15 Dec 2022 07:12:41 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f20so10213672lja.4
        for <phone-devel@vger.kernel.org>; Thu, 15 Dec 2022 07:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rn0RaW15PCbv1iZnOn7lxQD1NhmhYoptHXukfEvlnlc=;
        b=x0ru9/MG7H41Yo1GvyZQ9Uuy5hFJQZ/0bS/Z6cgyMoizdorRbA/8LxLgiqGbgv6xKe
         f/Nd8nLPv4AraPILAZqiGBCZycLVXz/3Mn9VeUML/hFHdA8Q28+U6JJuvl295mkjZooP
         nOEF5+6keQ9w2zmT4gOdWuLHSKYSzfGi1J7+m6R0/zHVT+lTYcqRUVKVVKCDmK7bbzrC
         CcHaBkp91EYZM7Vug5hmtKtEPfsl2QqCnmd1V5dijy1y3Nf01/qooMucYRh/krCeZFZM
         2Mlsuwo7/IvJa8DweXvlynyFsyPvnslfkVjsj0YPoJRdN0288r4HQ5c9IXaawcBN1OrU
         ONrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rn0RaW15PCbv1iZnOn7lxQD1NhmhYoptHXukfEvlnlc=;
        b=O988JY3YVlpyHHvOdgpy/FQtNzSZIBLI/HmRICNaKGdSFJ3gFUgCylYAGC5tM3iMMV
         ZmILuTabXIv+Abu3FnWibbZ6guLZPuBXGJ8IGOWYRHgd3kKV6ANjZvdO8ZVrm8op/OFk
         hmfTDztMr5ED4Ca0o6Cu1PmmSnKWi2bDralinKqK2T0tUPtRAH1xoT0icjtztEmwbhua
         Nk6ZZA64QKGdwnF89QaCzoSXuPbyXFqBh14TyhdKqaKAp5WK0Zcx2iiKYkqnHKeeF5+4
         fI50oqhsqweNLZqegODELXS2u7jT5tqiPI+z+5R5/r9zmc7vdJpa5OZpaVHG6rWiIQUM
         p3kA==
X-Gm-Message-State: ANoB5pkxq3YLNHa2Aqtr4nEU2OXgQRNjPuJHicsGSsgyO0Ne6TkDI8od
        TKRHtxgomXVy9pb0bFciEe6bzA==
X-Google-Smtp-Source: AA0mqf450ET8qyKL5V67vM4NujcATbDhymaDU8EkzcrVkIqi6ho8k0R6oYRIKx/hFZAOzih3RrEBbQ==
X-Received: by 2002:a2e:95cc:0:b0:27b:65e3:3e93 with SMTP id y12-20020a2e95cc000000b0027b65e33e93mr2883452ljh.45.1671117160247;
        Thu, 15 Dec 2022 07:12:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f13-20020a2eb5ad000000b00279cbcfd7dbsm861184ljn.30.2022.12.15.07.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 07:12:39 -0800 (PST)
Message-ID: <2e613245-26a1-c51c-cbb3-b34a88f178f9@linaro.org>
Date:   Thu, 15 Dec 2022 17:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 4/8] dt-bindings: arm-smmu: Add compatible for Qualcomm
 SM6115
Content-Language: en-GB
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Adam Skladowski <a39.skl@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20221030094258.486428-1-iskren.chernev@gmail.com>
 <20221030094258.486428-5-iskren.chernev@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221030094258.486428-5-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/10/2022 11:42, Iskren Chernev wrote:
> From: Adam Skladowski <a39.skl@gmail.com>
> 
> Add compatible for the Qualcomm SM6115 platform to the ARM SMMU
> DeviceTree binding.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 9066e6df1ba1..71f8f638a1f8 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -41,6 +41,7 @@ properties:
>                 - qcom,sdm845-smmu-500
>                 - qcom,sdx55-smmu-500
>                 - qcom,sdx65-smmu-500
> +              - qcom,sm6115-smmu-500
>                 - qcom,sm6350-smmu-500
>                 - qcom,sm6375-smmu-500
>                 - qcom,sm8150-smmu-500

Please rebase on top of linux-next and use a generic compatible + SoC 
specific compatible.

-- 
With best wishes
Dmitry

