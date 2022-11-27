Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFD6C47089
	for <phone-devel@archiver.kernel.org>; Sun, 27 Nov 2022 12:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiK0Mo1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 27 Nov 2022 07:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiK0Mo0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 27 Nov 2022 07:44:26 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F2BCE13
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 04:44:24 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p8so13484380lfu.11
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 04:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0wTjTX8oc9gsfhtWKd9yy7AK5Y3/IIhH17ZCu5fZx4=;
        b=T/PL1EZcdBp8VeEM1MTO7c2sNbEGNsfFvC9mNUOM5rg1dhvuw49Aw7AGDlZSYcT6T3
         jFHpNBuykUv9RlbpWubxI86pJNYVdnCrZ0/MerOYOcjk0Hkb0tqC2//5aAsDFqTLbdJo
         mz/8WeBpO73qlZ6UwPE/3u9wEYgoxvsP5M6knVNKmL7bH0EgZNu6LiMsiY8YcINwbqbL
         OjIeQ1i+tDaaKpq+DBRU7bIk/0T5OUDXIOQ3XPGz15fhoOXgvMHnwWVr24vOwx9eMwKa
         WBijznVtw8MqvbmeCgoyF1iwH0U1Kq/BvmZLJAmQCiOw/agPQruZ5LTMlZI7nlSjAbKl
         SYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0wTjTX8oc9gsfhtWKd9yy7AK5Y3/IIhH17ZCu5fZx4=;
        b=U0q35GsM3JTHwfl0CMnYt+mrcsapyR7diOsVS1796wsR06aNLpii7o6QseA5k7xO8M
         glzHSXwK09vROzrye2zgkXy94O4vl0h9Zg1dHGt+Uo5DHgvyXSQmnwaEeM6WaZSBUV3E
         eVgGYGqx0/ts2GZxrU6TVFbuMCyak8otxmRJwYd+NBpkdQgR+hwQcojfjcjUeDIdIgZI
         5HQ4OHCePHX3tWQDPIoTN7LBT98qhIfSTGYzqIzymCDXHNHO7oivKwYhM+agn9FWlp0h
         x8DUvhOEi7d8iANkgH9l68muMVwB8wuCUQleIrBlnj5Role6UmlkembnpX7h4AF6aT8I
         8x2w==
X-Gm-Message-State: ANoB5pnCgai9ttRJxUOG0U4D26uM0ND2twfLZE/X+0YZ5EHBp8eVBxAx
        jNJqR2Xaye8rlnw9rbslxPUd8w==
X-Google-Smtp-Source: AA0mqf49suwCpWlASIE/0UTr+rlkpTx39rlWSFK+oskELfLcmKeB0DbRwxLGwAPoErfjqYD77rZcOA==
X-Received: by 2002:a05:6512:258b:b0:4b5:c8f:2b59 with SMTP id bf11-20020a056512258b00b004b50c8f2b59mr1812375lfb.536.1669553062933;
        Sun, 27 Nov 2022 04:44:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m9-20020a056512358900b0049468f9e697sm1273347lfr.236.2022.11.27.04.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 04:44:22 -0800 (PST)
Message-ID: <a4ea3bd0-b716-5bda-c6c7-cad06e964fa1@linaro.org>
Date:   Sun, 27 Nov 2022 13:44:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: Let STM32 define Ux500 CRYP
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>
Cc:     phone-devel@vger.kernel.org, Stefan Hansson <newbyte@disroot.org>,
        Lionel Debieve <lionel.debieve@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221125223217.2409659-1-linus.walleij@linaro.org>
 <20221125223217.2409659-2-linus.walleij@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125223217.2409659-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/11/2022 23:32, Linus Walleij wrote:
> This adds device tree bindings for the Ux500 CRYP block
> as a compatible in the STM32 CRYP bindings.
> 
> The Ux500 CRYP binding has been used for ages in the kernel
> device tree for Ux500 but was never documented, so fill in
> the gap by making it a sibling of the STM32 CRYP block,
> which is what it is.
> 
> The relationship to the existing STM32 CRYP block is pretty
> obvious when looking at the register map, and I have written
> patches to reuse the STM32 CRYP driver on the Ux500.
> 
> The two properties added are DMA channels and power domain.
> Power domains are a generic SoC feature and the STM32 variant
> also has DMA channels.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Drop the second (new) example.
> ---
>  .../bindings/crypto/st,stm32-cryp.yaml        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> index ed23bf94a8e0..6759c5bf3e57 100644
> --- a/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> +++ b/Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml
> @@ -6,12 +6,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: STMicroelectronics STM32 CRYP bindings
>  
> +description: The STM32 CRYP block is built on the CRYP block found in
> +  the STn8820 SoC introduced in 2007, and subsequently used in the U8500
> +  SoC in 2010.
> +
>  maintainers:
>    - Lionel Debieve <lionel.debieve@foss.st.com>
>  
>  properties:
>    compatible:
>      enum:
> +      - st,stn8820-cryp
> +      - stericsson,ux500-cryp
>        - st,stm32f756-cryp
>        - st,stm32mp1-cryp
>  
> @@ -27,6 +33,19 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  dmas:
> +    items:
> +      - description: mem2cryp DMA channel
> +      - description: cryp2mem DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: mem2cryp
> +      - const: cryp2mem

Usually these are called rx/tx, but I understand you are documenting
existing usage from DTS or driver? In such case:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



Best regards,
Krzysztof

