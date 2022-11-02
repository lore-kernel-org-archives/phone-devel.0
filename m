Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9237AC4332F
	for <phone-devel@archiver.kernel.org>; Wed,  2 Nov 2022 18:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbiKBSdn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Nov 2022 14:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbiKBSdm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Nov 2022 14:33:42 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382F02C667
        for <phone-devel@vger.kernel.org>; Wed,  2 Nov 2022 11:33:41 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id i9so9571587qki.10
        for <phone-devel@vger.kernel.org>; Wed, 02 Nov 2022 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q92riiS7ubzxoWF6UuL2jfQgGcw0qGoG//c8sRPlZ6Q=;
        b=kGcLjV7SmNNbbGA/s5728760o5U/Yl+OT//qiK+lbm1ZFISPUnYEn8Gi1sB78euRC8
         vszdivvxXScOtJ1ZFruWtROVGOoHJ0As/vBBHiwRZrQyUCENP770io+HaedrF9VMiZvP
         uq0YYkkB1g/zE4DSaz1E9mNmI/Fwubaj7oVYqEZl7yr1Mlxqv+DGVt6lv9auwZEKlWZ0
         BshgmtK3Ko3qg950J6/jr+hJWnQWCCpfZfB5xf8R1w36/bh7O/Xa979/DozoS7RwRcxT
         /XgllTzxF0MZNp2G5hkr+JhWfDvtdGmmV2WUgtYtYfyx6WDXOrYQeqnWs7Cg9SKMUO/V
         Zp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q92riiS7ubzxoWF6UuL2jfQgGcw0qGoG//c8sRPlZ6Q=;
        b=Qy01nG9h4TOuQGhzS0QKSB61cDnzVkDhlHPPah2lZoH0UGVMhYa53rMlCF7nRWG0tT
         We1Jz3Qlb8jJ1MibjF4rRkvtr1h0IaTRhIzwexqpK8+sqgl0CfYNywEsuCm5LGzZrFsC
         ROTVGOpkjiYTMRhvexZ7rlK6ImgYy2QpSDKYAjz7b5eSlyZq0nS5QNWuqF5hK1x6t9Yd
         Vtf9D6sXJ/19M9JC006JDQjwlu/pfiesDTYccZP1ALQfrp5e/uIV3l1NDc35vnxossmf
         SShrXTO3IZY2Hheke38Te+360mGlnyOnTNnDkA1dZFVxu7cum1G3DpY48g2urVQrwc7x
         KwfA==
X-Gm-Message-State: ACrzQf0XsJHuUzjuTfteZN0BqHp3r98VBPkZyaj2+yteEDKcn4NuUmBH
        K6HwM5/ODFnWIV6ce0+nWojhnA==
X-Google-Smtp-Source: AMsMyM6n+O//qDHsWRWUhV8NoPCYi8OjtMbiw8u1VyQm+AKGMgDct3y60PhFqUC4AGL9jpSTDfaFcQ==
X-Received: by 2002:a05:620a:ecd:b0:6fa:2bb0:7d86 with SMTP id x13-20020a05620a0ecd00b006fa2bb07d86mr12957581qkm.296.1667414020390;
        Wed, 02 Nov 2022 11:33:40 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id cm8-20020a05622a250800b003a530a32f67sm3506976qtb.65.2022.11.02.11.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 11:33:39 -0700 (PDT)
Message-ID: <9619c472-4fad-c71c-591c-12f5ef7e0a79@linaro.org>
Date:   Wed, 2 Nov 2022 14:33:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] dt-bindings: iio/adc: qcom,spmi-iadc: use double
 compatibles
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221031182456.952648-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221031182456.952648-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/10/2022 14:24, Luca Weiss wrote:
> As in other bindings, let's use specific compatibles together with the
> fallback compatible. Adjust the bindings for it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> * New patch

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

