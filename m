Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE67C4167B
	for <phone-devel@archiver.kernel.org>; Fri, 23 Dec 2022 08:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236051AbiLWIVY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 23 Dec 2022 03:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiLWIVX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 23 Dec 2022 03:21:23 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0AF34D05
        for <phone-devel@vger.kernel.org>; Fri, 23 Dec 2022 00:21:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g13so6184417lfv.7
        for <phone-devel@vger.kernel.org>; Fri, 23 Dec 2022 00:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y+a3E/WsPht2OzFwjCL5xU/bureLMTsu06UItSpCOeI=;
        b=gYlcHa7/P3MqkCaku/u5VWO4JjTkTe9UtThg5QFuKr2GukWCj2kAhaiMiOvCBBBd6f
         GLaOq8uYxKuBRsK4y925kG6ZXRH1fKjLbYikSenfrZgpm9owLK3V037Px1tfarNcoGkr
         HORH/xHQGZe4Lpyjq0q5YBthSvhm4p9Wz4OAK3wdmSqWJ8/xpW6UIHeF/M7AFt8gTyf6
         oRpuXKBSmcGvzK7Bbts5PfVWG5b1WRXCWu3QhvSmxA4K3mbkbtTq3O2tqmaTVgmK5v7T
         mWJITwgEKNx/rBpJzAGHr/v+Of+QoWGwjcJWbAUw+SWcsJvfUZzubfIxdeib+j/sRCFV
         6dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+a3E/WsPht2OzFwjCL5xU/bureLMTsu06UItSpCOeI=;
        b=vx43XHt7hr/167MhpezGogFAsKJqdTbk87yj8uEBiwPxBBHSpiLDniY/+WR01AX/Xa
         Ltry/is9t5UvYxRDNCnQl36mffpmeLFrtgnKcwga5WDWLmql8RuWRpOkJQGRBcXmZFYN
         /AyBw1QUuWlOWojhM8KAytPgMTtaG7lWEeleXEapPy935UoQAdGuWByFdxmlZq9CLkiG
         4vMapDYJY5D7YgqMkA3naEYHLHX35VxbfepiLeSOdUbAIwGPrpGrvt3IdRKGwQqpraWO
         Ixhc3RbGv1IpVUtA9N6BwdEjRckoIYLCz/gm1spc6xGn8Lk8vw55KWGXzlygxTubcmWW
         WaPQ==
X-Gm-Message-State: AFqh2kqc63Q2kzMhKTRVxY4HNjQc+EZ2/H8i0lltmWkS5xUo+VKlicUu
        vEi96l9n+9PhrvrFAbrmZw1XAA==
X-Google-Smtp-Source: AMrXdXvwJCJKbgnY/TzJ7r09IRwavsCP0pYsBXAK2+HyDem66Dnw9GndXvejtz8/3+6YZjtrTmyKsQ==
X-Received: by 2002:ac2:59da:0:b0:4b6:ea42:de0d with SMTP id x26-20020ac259da000000b004b6ea42de0dmr1948549lfn.39.1671783680552;
        Fri, 23 Dec 2022 00:21:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e29-20020a19675d000000b004b5812207dbsm426219lfj.201.2022.12.23.00.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 00:21:19 -0800 (PST)
Message-ID: <089247cb-9723-6834-bc6c-cd795ada87c6@linaro.org>
Date:   Fri, 23 Dec 2022 09:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/4] dt-bindings: arm-smmu: Document smmu-500 binding
 for SM6125
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221222193254.126925-1-marijn.suijten@somainline.org>
 <20221222193254.126925-2-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222193254.126925-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/12/2022 20:32, Marijn Suijten wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Document smmu-500 compatibility with the SM6125 SoC.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> [Marijn: Move compatible to the new, generic, qcom,smmu-500 list]
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

