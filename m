Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F7EC433EF
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jul 2022 07:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiGLHv2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jul 2022 03:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbiGLHv1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jul 2022 03:51:27 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38DD9B57F
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 00:51:25 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t25so12574074lfg.7
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZrFIt8F9N1X4RMbtLQXEkQDymA1m5MwO6fwtCs+pTX4=;
        b=Pylb32qF3GILfB+lcn/tDTMiqu5neaXiJd+TjKPouepYd8WxRXX8JpC9EBGwA4UFq9
         DUagA01g8oamdd+u1ceBFohbpjco9W0aFbpOVGkKkmXAQF6MW/gUR3vXZzUO9Jvll0pX
         UeqjyPTC6k12R0J/0Qpt+SuY0+Hk4wBdXqyPxz4Ohuor6rR9Q1DzIUsQTNT5v/89oTGx
         VnbVkxVCEx6Xy5Zrw7ZC2vTb0fJ1xhV1lWrd98KRKoa0z+R6kft+KU3llIfw0LA6tFPd
         rIUt7Cmcgh2/sWAiQlnSxSGLN01cGXHk6ve+pEn/JA5UyE8LdJefxw+Gt9/AjYrnL42/
         /w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZrFIt8F9N1X4RMbtLQXEkQDymA1m5MwO6fwtCs+pTX4=;
        b=6XBN+/bVuW/dBMkuC0Zj/QugGVUSF584wJeCDhUGhtHfvKKeQfdCvw9rAnHGFzIbIK
         uUDpUqop0Sofc18/1hbBttMFOAr5kPaz+oL6IMZyaUNQKE6K5bh4bAolW09i022y4gsP
         +zPrjsnvaxHk2PbHfDOWOz7CRHYjUJWN8C9BKALLBozuw6TZFSW/QxaXjfwWr7EJpIUR
         M6IIDh3G12YtwUNiLPMKeR4ncxa1BCiLRQSfiZA9AdE0BUZbc07Hp68l2jjlnIAWABF7
         ZWy1I9wG9/DmrU7zXuWtu2e3+7p0jCg9Z/ZKt/ePYVDBdUCbsM6H2A/2v5ZKFrfQun8c
         +Fdw==
X-Gm-Message-State: AJIora/MYx954l9UfWh+yqvzKlu9H14JNE4t+tsC7o89Gni3PZhBLqrr
        mTJ81x1tS8obnihPn7Rp9K+bSQ==
X-Google-Smtp-Source: AGRyM1tYy/NNy4lhCjH90yu62C6nKh4qLFcJwq/30YuIninxYAiD5F+EuvrofzBlQW3iPC7Ege9GLg==
X-Received: by 2002:a05:6512:2210:b0:484:f174:bd51 with SMTP id h16-20020a056512221000b00484f174bd51mr14689892lfu.482.1657612284305;
        Tue, 12 Jul 2022 00:51:24 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id g7-20020a056512118700b0047f647414efsm2034115lfr.190.2022.07.12.00.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 00:51:23 -0700 (PDT)
Message-ID: <fe4dd875-c223-e70f-c935-064b0574fae2@linaro.org>
Date:   Tue, 12 Jul 2022 09:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/2] dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s
 bindings
Content-Language: en-US
To:     MollySophia <mollysophia379@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220709131935.50708-1-mollysophia379@gmail.com>
 <20220709131935.50708-2-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220709131935.50708-2-mollysophia379@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/07/2022 15:19, MollySophia wrote:
> Add documentation for "xiaomi,polaris" device.
> 
> Signed-off-by: MollySophia <mollysophia379@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 129cdd246223..80dff09bdc83 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -235,6 +235,11 @@ properties:
>                - xiaomi,lavender
>            - const: qcom,sdm660
>  
> +      - items:
> +          - enum:
> +              - xiaomi,polaris
> +          - const: qcom,sdm845

I propose to rebase on:
https://lore.kernel.org/all/20220524020411.GA2602849-robh@kernel.org/
or:
https://lore.kernel.org/all/20220628092253.21905-1-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
