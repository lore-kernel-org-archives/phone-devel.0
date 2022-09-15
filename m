Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97480ECAAA1
	for <phone-devel@archiver.kernel.org>; Thu, 15 Sep 2022 14:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbiIOOwx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Sep 2022 10:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiIOOwv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Sep 2022 10:52:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF8A4CA31
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 07:52:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a2so6771718lfb.6
        for <phone-devel@vger.kernel.org>; Thu, 15 Sep 2022 07:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MGF6Hdj1kAaXiRS0wW3SjCRTt2IYAVcbko6YhwAB5Qo=;
        b=yCYk4vNdr4C7RcK23GqAdk23sl1W1M6nzJ6UyseDQohU4rFxHRMWsaYzZUQ+rCGSMy
         c1a5rz6hVTbAkvWNoKrbMZEPmPDBXH11JUs8Ctc/iGOTIyjr7zmD7BXw3IJyeUNCsjOn
         OB+lMz9q0uXB1Y7ZzTzdG1qo+C3yyYSfFpbZTt4x28o3QDOrCn9mguaqnjqYfTVF6bK1
         s0EYz6bGlVBroTtBxMUIvfojXIXdsJvYjdWwPj+xzK3EYTkrRrhAs/c2C9T4m2uwhXu1
         /TZXbduLThrlxenxoeJP3jems/lOWXNvEAfwPQUYz/lgWmnkr2DrMigEoNaU3llrlIkC
         La1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MGF6Hdj1kAaXiRS0wW3SjCRTt2IYAVcbko6YhwAB5Qo=;
        b=gU4utNVqEvv4APUXvAqj6i9xp+H29LVwhGTqWKHC+COCR47Qz4f+3maMNaRcrcayjF
         P+CJacO+GW8O8ysKQsINrMT3JUKWBhw6Cr52TKANE7b0/R9dg1drT/MwwoIJhkvSvph6
         pD06XOh4mkIFKIOS+J46hI0VpkIkDiWhCb8k3bd2Z1gXzYy6/YYvhxqJS0ZlobD1dRkO
         24JWAfSeQS7hDJBmrRKsxlzW0wkFsJ3h0h64lrLe5aXb/leSE9Tgg1h9d3tfbRk6paZS
         Cy3M2nkvNept43whqvhlJW3B8YESUY+IevvfVYgeW8INzfKjd4bb0BjEGVhX1AVAOI3+
         W6yA==
X-Gm-Message-State: ACrzQf0ArwKkC74yYAQ1MXM7jBy0POUAf1C2aHDOsr7Y8ABCPlP49fl6
        TJ7F8UCfBKQodlBoSlBFUR4uWw==
X-Google-Smtp-Source: AMsMyM4cRt2dHuWVj44Cc+swIEBBJ8MIf5gkhzKpuNJRcpuXbfDMvrLjiInXFw4elSjYO91zE/DVIQ==
X-Received: by 2002:a05:6512:b28:b0:49d:ca3d:5935 with SMTP id w40-20020a0565120b2800b0049dca3d5935mr98480lfu.608.1663253567721;
        Thu, 15 Sep 2022 07:52:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s13-20020a056512214d00b0049311968ca4sm2999809lfr.261.2022.09.15.07.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:52:47 -0700 (PDT)
Message-ID: <a59b7a9e-95ec-9e44-01af-6a35f2e300f8@linaro.org>
Date:   Thu, 15 Sep 2022 17:52:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] mfd: qcom-spmi-pmic: Add more PMIC SUBTYPE IDs
Content-Language: en-GB
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
 <20220915113523.44074-2-luca.weiss@fairphone.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220915113523.44074-2-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/09/2022 14:35, Luca Weiss wrote:
> Add more IDs that are found in the downstream msm-4.19 kernel under the
> path include/linux/qpnp/qpnp-revid.h.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Changes since v2:
> * Convert hex numbers lowercase
> * Remove SMB* IDs added in v1, given it's not sure they're actually spmi
>    pmics or just i2c pmics (keep SMB2351 because it supports spmi)
> 
>   include/soc/qcom/qcom-spmi-pmic.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

