Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7188BC47088
	for <phone-devel@archiver.kernel.org>; Thu,  1 Dec 2022 10:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbiLAKiX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiLAKiV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Dec 2022 05:38:21 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C814AF3B
        for <phone-devel@vger.kernel.org>; Thu,  1 Dec 2022 02:38:20 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id s8so1816740lfc.8
        for <phone-devel@vger.kernel.org>; Thu, 01 Dec 2022 02:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ir3uvErgUob4NFVyXZ4JMzbDFyUKCFAp6JFwnKMpYXU=;
        b=sDiCfmTwLAL+IKSK6fOyjJI03hKdZIxAwTN23mUq3iwImjKp2FQBCLSi5GOXxBPsHz
         BdYaxRl6VVlyvlU6jG9NE6ZG8rv3Yj0JnmFXHJTRlzsuIL78G6czmw1vTpU9BjChZF3M
         rmMJqL65R3fZNXf0/E6oOy/hBWLN3/iir5072tqA+HRaWY7fBEiO0FbK5YJ6YijcnQ8a
         +mTJELLZsdyHs4cGNDjena94bfmGvZYxnw5jMqOsrOF0BvuaxqpN8pcLqOkR+sqcjRqy
         tsqki7IGeJr9MY0ED0VxJTG89l+ku1voRYszZZ+iJsbbJXKsZ69oEGGy6biAIZwn2wYU
         wjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir3uvErgUob4NFVyXZ4JMzbDFyUKCFAp6JFwnKMpYXU=;
        b=6CL6avc4CqHLTVqMMpcwNptNt7XzGxzbhWzIONG5GOdOoulaNTWlt6h7VXZpunDQMQ
         HPqQYxG/mJBLqrTXwIA2rzI9uC0qO+vZwPWyQGKg2h/XL2dIrQlWSeLMAtMDz0rrU3fP
         WPMQquGiX868l9bkQFUR7WN0ilE1xJFARF4/qmGiFFmdxjZH8VVmuUbh1vPXI3ycg338
         Gh8S9EM4tCZZUqvUKw2hhXV4zBy1eVaSOcazvjDYIvAwBCdsNczaBMSfTZKi5kO4h6IG
         rRPVXQjjffxmHRSyNeUnuluNdZBjiXe0h0rUGRtkOnC20MexCAHExjzN+W08LwhmTu3n
         XvQw==
X-Gm-Message-State: ANoB5pmZdsDk15vB19XH1c2Z9ORJharDizDslZnKoT/05RDvHDAH0BAg
        ZppVdRaNWbFzxkqSoLkdgS2M5w==
X-Google-Smtp-Source: AA0mqf5fOBE5NhPN7Xd+BTF4xDsWEodGVKp8iN4/HOQ8OyxhgwJEhznyaRqPwZeYHiXu0T46gbRvmQ==
X-Received: by 2002:a05:6512:3983:b0:4b4:f88:90d3 with SMTP id j3-20020a056512398300b004b40f8890d3mr23278296lfu.37.1669891098347;
        Thu, 01 Dec 2022 02:38:18 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k29-20020a192d1d000000b004b5138d82b3sm601559lfj.76.2022.12.01.02.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:38:17 -0800 (PST)
Message-ID: <382df687-c535-4dd6-125a-5f3b6022cbd2@linaro.org>
Date:   Thu, 1 Dec 2022 11:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sm6115: Add WCN node.
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-12-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130200950.144618-12-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 30/11/2022 21:09, Adam Skladowski wrote:
> Add WCN node to allow using wifi module.
> 

A nit: Drop full stop from commit subject.

Best regards,
Krzysztof

