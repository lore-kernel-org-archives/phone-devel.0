Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E78C433FE
	for <phone-devel@archiver.kernel.org>; Wed, 16 Nov 2022 17:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238803AbiKPRS3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 16 Nov 2022 12:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238416AbiKPRRu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 16 Nov 2022 12:17:50 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B57359FEB
        for <phone-devel@vger.kernel.org>; Wed, 16 Nov 2022 09:17:42 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a29so30581992lfj.9
        for <phone-devel@vger.kernel.org>; Wed, 16 Nov 2022 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alqzp5129GtCh9bfVu6PcgTAJMBaIsGH0ackHVO6iH4=;
        b=qZWZIXfg5ZtVsKnQJEm1i+qCEHB5ZZR3oxuzQzrKnTBhySsPuP9nPu/gv+d1b2GGaI
         wv8fqDNDVAHGaKX8vmyM/Pt0EAv+9ecr+Gu9MRMP4oXQ+cnQfPNgjahAfatb+Me/P70f
         X2Ac+9ee8/x6z7z9GIj46tTnXTGUnWvz888h5MvOKaQMgRo66lG/pPrAlCDeukhXVL/W
         CAlG+PepnPBUOx2WngwDKe6IvgJzqOmINKMM5tk9nBJxtoQjveOXugCyAXFJmlqv68xt
         yITI4w6Xm5IckeErkPbymu6W12DsgaH8VMpH+ziNO5DAvJRmo79kd1iwlVJzHJw6Zk+X
         GlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alqzp5129GtCh9bfVu6PcgTAJMBaIsGH0ackHVO6iH4=;
        b=5+EQoimzH1nRstW+bmXYgRa+uvC+28EKVKykDnyPNo75sDg6t+ll6tloNcnuajT3uE
         C+LIIxzRy7z88UhRRu4bu5uisVO5u7OAljxeWHSpLls2Q0cpsg984FiSY0SWth7uW4pW
         IEwcWrpZoayB8+20+daF7Z2ZaHce5DlcQc8iLvrl7tpBNl9RAZ63tTd8rjDu/TujFrGT
         rYCsPp89BZ/O+pWYeyVRSV0DyeBXYao+/P8R5cQ4oD9W2YUAgTaSNVvZ4PCZU2NPyQB1
         709pvR42oUXwZmMyS2P52keR1DJEqEq7K3JWBsP5inOuuTVgIW12tXmrjLaekTBed04z
         6JXw==
X-Gm-Message-State: ANoB5plhVz2I0NOxHWpZNor/a7zoNRiheoU3Kx6zBbdQxf/K6S/j703n
        RVqw5/6rQrS3Mu61M4KjTLDtdA==
X-Google-Smtp-Source: AA0mqf4mfYWXPJm86CEx1/xbuui/eMMe7ixvXSC7/8Z4o78CunYpWzPT5PCGccvvhS3LhXyLaSTjIg==
X-Received: by 2002:a05:6512:1dc:b0:4a2:8836:c07d with SMTP id f28-20020a05651201dc00b004a28836c07dmr7123987lfp.661.1668619060360;
        Wed, 16 Nov 2022 09:17:40 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s8-20020ac25fe8000000b00492b0d23d24sm2678048lfg.247.2022.11.16.09.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 09:17:39 -0800 (PST)
Message-ID: <e91a904b-6c86-5904-0c5e-030bed2ed533@linaro.org>
Date:   Wed, 16 Nov 2022 18:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/8] dt-bindings: arm: qcom: document new msm8953-family
 devices
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221116145616.17884-1-luca@z3ntu.xyz>
 <20221116145616.17884-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116145616.17884-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/11/2022 15:56, Luca Weiss wrote:
> Document the various phones added in upcoming patches.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

... but you miss to update the list of exceptions for board-id and msm-id.

Best regards,
Krzysztof

