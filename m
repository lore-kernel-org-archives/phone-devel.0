Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DDDECAAA1
	for <phone-devel@archiver.kernel.org>; Sat, 17 Sep 2022 17:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiIQRD4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Sep 2022 13:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiIQRDy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Sep 2022 13:03:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD90D2F387
        for <phone-devel@vger.kernel.org>; Sat, 17 Sep 2022 10:03:52 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z20so29293801ljq.3
        for <phone-devel@vger.kernel.org>; Sat, 17 Sep 2022 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HxlvNOXZLDG+QAIKe3QTAJIirgGJ27Umf7SxlY8og3I=;
        b=wzvdrzIqrI+LUTbx/MmJddxco13vT4hEIDk9erf0mNozNVKNgWDArVxjCVTq73waN3
         B/Wot8PS0C1rCYL6ZTDvG0akTSU/Mu/hmKXsq5BfzRufeqrVtoLdsXym940Vq2Hqhrff
         MCYBSvrddc2I8xRM1/gzbzP2qHxTll2w+fRHwuXYdxE0zLKYlJWh5RFIiuQNKalDvlhd
         qFi9lhlTs7Fa/ZO+OdHk4BPCd7n9WJODCxeMLXyvs8cALKsqqE6YVg6dA/3ITuarAzA/
         v+OMZBeaPicHjW+emkdndPjqXGT5sOPkkiWbgVr+MI2dDrzH68l5fn4HtHi9U7kIK25s
         98hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HxlvNOXZLDG+QAIKe3QTAJIirgGJ27Umf7SxlY8og3I=;
        b=N/LxOu9K2CH9EyAjMAYav5l2Hdu1Y1BZZmwdGM4XiartvqQaMQR9CAkZxOwkq27yHQ
         HiVBpc6HXGj989lEauP+SpxLFi8qyyRscvvvmzi17GTspHbvGSoF3hQ33siCTdROFcWt
         afyqIv/D+tG7hDf6jW3WbXKDuLI+uR69xOx2IQ6VH9qwNOOjXA7CgdcTAbvjCCmg85sM
         Rar77TKNqD4NrYuwiinVdywOWTHb3r9jBnb/v3LupMETde3yz2dQwU2mVS2pI2aGAT+W
         JZQ5wn+9aHTeh+XoaHaniYcPY7KxuRKIUgxsmYrX0JFjVDVlhu3fgaoE+g6C6ItsLqiR
         xTkw==
X-Gm-Message-State: ACrzQf1ghngoMxR0hFZbrrAaESTTgbooBWIA7s+6znkqwhgj3EOSL04E
        rZznWzyqoMN5vgK0qojE81d+Gw==
X-Google-Smtp-Source: AMsMyM7E3ohSRcsc0DEgiFc7auF3agQpdAzdPLS7MkWX0g6/rZVD0aNMJrIwBQNIa2mXTpRMcRNH4A==
X-Received: by 2002:a2e:be2b:0:b0:261:c0d4:8264 with SMTP id z43-20020a2ebe2b000000b00261c0d48264mr2765511ljq.16.1663434231131;
        Sat, 17 Sep 2022 10:03:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f34-20020a0565123b2200b0049f54a976efsm975945lfv.29.2022.09.17.10.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 10:03:50 -0700 (PDT)
Message-ID: <38335ade-d993-c2ee-0921-7a4655e612dd@linaro.org>
Date:   Sat, 17 Sep 2022 18:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document huawei,sturgeon
 device
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220917152829.23568-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220917152829.23568-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 17/09/2022 16:28, Luca Weiss wrote:
> Document the Huawei Watch ("sturgeon") which is a smartwatch based on
> Snapdragon 400 SoC.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
