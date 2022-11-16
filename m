Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A04CC43219
	for <phone-devel@archiver.kernel.org>; Wed, 16 Nov 2022 12:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbiKPM0R (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 16 Nov 2022 07:26:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbiKPM0C (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 16 Nov 2022 07:26:02 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B29148776
        for <phone-devel@vger.kernel.org>; Wed, 16 Nov 2022 04:22:20 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id d3so21618162ljl.1
        for <phone-devel@vger.kernel.org>; Wed, 16 Nov 2022 04:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xljYnYnQPEIox8T8MM9nvvNS3niXSPZfVXSMrwlG7XY=;
        b=XZuqrVaVAtWxSXiEujtNCvoWY32ZxJtglYxJErw6sAxsimQUTKv6R3hzdkwJS/uovh
         yK++rudGgAYYQO+oq4GdMlO16A9iKWRhTk3U4oqNc68QWux0waCXdKhqNPl/vkY+PjTv
         JytbW1ZY+tw6x2Lc8w95J9u+j8kjIlnZ3EHeVXsCPIoWCnUUXMANszFp/c1W27r71Dw5
         r5N2uWXu5wRlqBl5gLkCHvPljr654HO4D/6eY77u8ldMUAwfCRm6EfSaUmOE6sFItfCV
         gdBx7OJ6KiFkKsdpPfp4EhVcUGCEQHcnc44l7VNOjpk+hJ4k2kJzicJWIG5M1hKLD+zS
         G8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xljYnYnQPEIox8T8MM9nvvNS3niXSPZfVXSMrwlG7XY=;
        b=kcjfOd8OP1zmeNR/szEp1QnHVg7G4PIwWvgNjH74pJ4fJ1Ia+3h0VBd9qkVlqcCCAe
         V54cJMwzfpmCWOeEHNAf70G7Uovy/eH2rxntjZud8IFtmYfLlkHcMoZvD7is3X4Jbiqp
         VE99HPHlKGbkbgiK3y+zNSD9lzXWzRkilz2ozGlSf5RqAiwdJdmYX/iRzk8OzouIq3ma
         f4k2KMHSiTrAas8NzdfRtpab8PxBYl44JMVvFWk0eiUrJynrfR8K3TMZnlXPqpl+bDn2
         xnbXIHX5M25FRAuIIPo7CVXxjHIxZEw9corLYKW0ObCMuqcEhkT9wXM18JWKneiW3fqp
         Zt8Q==
X-Gm-Message-State: ANoB5pnQY2cc5ZRi5bzfMytmqPfgkbaXVF0H68cM78KFUtokqCP3BXx3
        zGJo4jQyUpCYHUjxocrzmg3y4Q==
X-Google-Smtp-Source: AA0mqf4AyH2iCKvMUFEi0Bg9zUVmNfqqLJ1Oc+IlY8lQaQWt6ko7D1XFUcumAl5Uw0STphIKazmSzw==
X-Received: by 2002:a2e:b54c:0:b0:276:ff0c:b7d1 with SMTP id a12-20020a2eb54c000000b00276ff0cb7d1mr7943969ljn.164.1668601338933;
        Wed, 16 Nov 2022 04:22:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bd18-20020a05651c169200b002790d8012cfsm1059467ljb.139.2022.11.16.04.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:22:18 -0800 (PST)
Message-ID: <9dcf36f2-ad3c-842d-db72-f534aad8667b@linaro.org>
Date:   Wed, 16 Nov 2022 13:22:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/6] dt-bindings: iommu: qcom,iommu: Document QSMMUv2
 and MSM8976 compatibles
Content-Language: en-US
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
 <20221115101122.155440-6-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115101122.155440-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/11/2022 11:11, AngeloGioacchino Del Regno wrote:
> Add compatible strings for "qcom,msm-iommu-v2" for the inner node,
> 
> Add compatible string "qcom,msm-iommu-v2" for the inner node,
> along with "qcom,msm8976-iommu" as a first user of it and
> "qcom,msm-iommu-v2-ns" and "qcom,msm-iommu-v2-sec" for the context
> bank nodes to support Qualcomm's secure fw "SMMU v2" implementation.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 8 ++++++++


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

