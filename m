Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55AAC4332F
	for <phone-devel@archiver.kernel.org>; Fri,  9 Dec 2022 11:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLILZY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Dec 2022 06:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiLILZW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Dec 2022 06:25:22 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAA06E574
        for <phone-devel@vger.kernel.org>; Fri,  9 Dec 2022 03:25:21 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j4so6603072lfk.0
        for <phone-devel@vger.kernel.org>; Fri, 09 Dec 2022 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0K7eVJj4k3cMvSUFweS+f/J9GwqB4FTC28EsgFNd3e4=;
        b=v8O3IindDPA/6bCVNb+vJbPGFFquksYTufkIL+Vc7fLkAd/9VzB6hOH2SxGv89qjVJ
         cNK9uYg8Oy/rJtYZ/8G8LMuzRhp3Gid70zHybmHW1tZxmRozMR0cJNglctyaw17vBDgZ
         +fzwQWVeI/oQsKm7SMm1faRESIHEDNiLz86aDkwC53wksXi4ccm+VpJJsbzCNj1fZ4iD
         tjwfA1zH3m3vTQH0URH6ln7ISWtYQR2uIGmDXytFFNw0KOwKuHfI45v68zdyc4VpD9jB
         2pNx580WFgQsamVQLtnQA3INsyxfKp5Es7Yezkp5xBefQc8FjwI9VJhqJWhzi5YXrMY2
         hBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0K7eVJj4k3cMvSUFweS+f/J9GwqB4FTC28EsgFNd3e4=;
        b=MM/F2/nEFtJXr7WiJ8DN+eQbS0FnqmFytslWYVG/foa9ctbXJQhjTP43ZUxhXShnRG
         K4QLOOAE333EC4laCvCOLsiimQkS2paykzfcxllkbv0Lg8uv2K0bZ5/fTNdnBEGNjJGB
         1Ex7hsQVvf05qu0nB/59gi59qVI8cgTS2E2bm8AohcTc7dL2twjGAtuuATxMlXsdH4C/
         /XBEpRcbWlVEe/3CPsSLg5FiL0uqan9YRpyxrZcaBsbvbP9JCcgfoLx0P87TMzpxTMnT
         LbqXMSLAcWLnIKcKW+q7dYpWUVEJXJKnrem5zdseBlA2oLpZ5UiFrFpwI3uVY02bfia8
         GoAw==
X-Gm-Message-State: ANoB5pmVP8HpMQlhZ3rm5XlSQ6mAtNLQZXo1lr29LAfUrevAr9uctIvG
        eseJgNt5gMyfzNxKRePNXvb7cA==
X-Google-Smtp-Source: AA0mqf6LfW07j/W9B4V1vwkpcNXcjozq6HyoRYstlaUqh4lqn4eUXH8+9Cn1fFTwacZZFVk5UNKMVQ==
X-Received: by 2002:a05:6512:150:b0:4b4:f212:617c with SMTP id m16-20020a056512015000b004b4f212617cmr1274955lfo.1.1670585119603;
        Fri, 09 Dec 2022 03:25:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e12-20020ac2546c000000b00497a0ea92desm218963lfn.135.2022.12.09.03.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 03:25:19 -0800 (PST)
Message-ID: <79d72425-2188-0a87-4ad3-a334df081005@linaro.org>
Date:   Fri, 9 Dec 2022 12:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] dt-bindings: sound: rt5640: Allow to describe how
 LOUT is wired
Content-Language: en-US
To:     Jarrah Gosbell <kernel@undef.tools>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
References: <20221209105621.39237-1-kernel@undef.tools>
 <20221209105621.39237-2-kernel@undef.tools>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209105621.39237-2-kernel@undef.tools>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/12/2022 11:56, Jarrah Gosbell wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Depending on HW design, som boards may expect mono differential output
> on LOUT. Describe a property that enables it.
> 
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Jarrah Gosbell <kernel@undef.tools>
> ---
>  Documentation/devicetree/bindings/sound/rt5640.txt | 3 +++
>  1 file changed, 3 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

