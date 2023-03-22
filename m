Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEDAC6FD1C
	for <phone-devel@archiver.kernel.org>; Wed, 22 Mar 2023 07:36:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjCVHgb (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Mar 2023 03:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjCVHgT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Mar 2023 03:36:19 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3857F5CC39
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 00:36:13 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id i5so22179846eda.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Mar 2023 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679470572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uV97OTONSxnGEyV7uO8OnMJG0g0QG+ETuEfWA/XgJlc=;
        b=PGSo4SIkDysijZW+Nb0UtNdfJBM6YH+rR5SG3c21IjzKSh4MGWnrr9YkU/SDC5POk3
         jQltAPsr2pcOlhSACMu5bVLiitpiqT8JSv2ciEWwUttYxEg5I5m4EmLMmAnctcIlRSPX
         72qFxluE6ZdM1FBgos9TBMDKEvc4MgyEcS5B4Wlres9EC7nO+4XOM7VtZRSBwlu+fang
         JqwTwKeRY9hTWzc0vcc67VQUYCih31Q/BNXzsm7Ekene6GpgSIBlJ1mT8tO7+gIZ8MkH
         PR2aH1kOB5SJuMk2NYb2S0GG7IL1XAi5/tCLpECL2iq2YVyFyHoAJxKvtu2kn1zRJEMk
         yIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679470572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uV97OTONSxnGEyV7uO8OnMJG0g0QG+ETuEfWA/XgJlc=;
        b=uFNIIxqgNtyqHXruzBDsNH4ek1e255A6lufiGR/J0y/Y8dZHtNqlJMy20VzVZxwP0f
         G98kKnc3zp8fakNOS/FnEHCU3W7GPUaPfZZfx2TTafGZhbK8jYODuMHMh13LgOI6nT02
         gQhEWILKZkxH/yOxmbLihE9xE8/m002a7eokj8AHnNLcOZHzfUKWIKeiFuh7OgMtw301
         eWz8MV3WtufoJvbB8DgI4scjwFB8cAFEmpl7E+e5zdHbT+Q2R4ApHkAHlQc67rJMZTTP
         u/EERMqax4LGDy0VYiFn3ERsGz1P4bumVqRxrAwnHtuWZ9/WIZwUhpZivPxDHhLnVTlp
         ahRA==
X-Gm-Message-State: AO0yUKX5NMEB2aV6EQr25Iu2/RdA7CFOcp0Z0LtGSDSA73sZ5I9bK3V2
        Zs/Tzi5wbb99rLxdf/yMYNqnig==
X-Google-Smtp-Source: AK7set9zlFgHEYh7EBKB/Bq2zpzCToe8YappDSA+j6UYFnxOE7JXrPRmTTfy3WKchUJ4BYgi5XUEQA==
X-Received: by 2002:a17:906:ece4:b0:930:9385:ce51 with SMTP id qt4-20020a170906ece400b009309385ce51mr5666192ejb.68.1679470571686;
        Wed, 22 Mar 2023 00:36:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id qh7-20020a170906eca700b0092bea699124sm6768128ejb.106.2023.03.22.00.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 00:36:11 -0700 (PDT)
Message-ID: <a4e0a256-4db3-543a-f133-852beb4cf726@linaro.org>
Date:   Wed, 22 Mar 2023 08:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/3] media: dt-bindings: ov2685: convert to dtschema
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230129-ov2685-improvements-v3-0-d9737d0707f6@z3ntu.xyz>
 <20230129-ov2685-improvements-v3-2-d9737d0707f6@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129-ov2685-improvements-v3-2-d9737d0707f6@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 21/03/2023 19:03, Luca Weiss wrote:
> Convert the text-based dt-bindings to yaml.
> 

Thank you for your patch. There is something to discuss/improve.

> +  - Shunqian Zheng <zhengsq@rock-chips.com>
> +
> +properties:
> +  compatible:
> +    const: ovti,ov2685
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XVCLK clock
> +
> +  clock-names:
> +    items:
> +      - const: xvclk
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply
> +
> +  avdd-supply:
> +    description: Analog Domain Power Supply
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Reset Pin GPIO Control (active low)
> +
> +  port:
> +    description: MIPI CSI-2 transmitter port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            maxItems: 1
> +
> +        required:
> +          - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dvdd-supply
> +  - avdd-supply
> +  - dovdd-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3399-cru.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c7 {

i2c

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

