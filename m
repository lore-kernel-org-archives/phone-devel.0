Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C2FC38142
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 17:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjAWRK6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 12:10:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232095AbjAWRK5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 12:10:57 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A542A5D0
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 09:10:52 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r9so11477718wrw.4
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ye4fqaKuWEQ0VBJGa/puIN6G52G7rZfX+7Sp2w5Asa0=;
        b=AlS6Sy28XmPmahGHyCVVZnddWfq6aZfGYwtLhUOGOyec1e+pMe6bqP7BPl9dY713as
         MJX4cKz6YOw8bn2XwZiOqmaejGMBWD9m9aFGdI25RYHHbDn/EE0865XGFZPYyimqYEiX
         Ohw54jWTPZmbkKVbT6kOZmv3U1teLSUv3hD15eDClAkZFwv2/pBt4EeHLlrrlh8ABgnI
         ddbwTh/KTg+YBE8JZbebMtkU0+2eS4vIbv2MP2wCQKkKt78FWZHJg3J2K/R8gqfuHKjQ
         A5tdKyucw8DNEzT1X0yXdst2/HdRPMTc0X98ogylsAAukdCZgV7AmBibVI/LVaFkx0Zy
         MHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ye4fqaKuWEQ0VBJGa/puIN6G52G7rZfX+7Sp2w5Asa0=;
        b=cakHnnlPoYqHNjn2g5cRxd6GMwmvAXwTm+bCTNqrOewHFWgc3mnXoG6c4UzMxPHME7
         pGI0Dzbyeobt4FStl7Iy/yA2OzKv6QtznVVyA7xbaEGRTx88wIF1B7N+vR71P1wSD8lx
         n9kR958QK2dhGm8F2V1gT1e2HBwlDD6DBJzLF6PZY22Itedp5JwYBzyeVADvClLtAkHH
         3JIfeLNi7l6WJZvefM24jzN9Piz5d9UjiCQXIJdH80VwbKRUXje7zV82AdeGp7gUcGNk
         /87P2/NSyjcWeuQDsaDjtF4o328tYGaO0n+GIfOLn+SwUo6KRRCRRD4GG9T5bIUWkiDN
         Mmow==
X-Gm-Message-State: AFqh2kp78DNL/DBNNV9UUqF8R0VRXJ3dvUC0yfmA/IWVQtH9LHGVEKwc
        r7ukQHbmYUM3pXyhR3g58iJnZQ==
X-Google-Smtp-Source: AMrXdXsJQ6qklnvii5yk83hLv4husOGcpBtpe2KAI5knLsCK/7V4f29aoYZQd+RytVPnb8G58WONiA==
X-Received: by 2002:adf:f0c1:0:b0:2bd:e7a0:6b5e with SMTP id x1-20020adff0c1000000b002bde7a06b5emr22897157wro.40.1674493850759;
        Mon, 23 Jan 2023 09:10:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600016ca00b00267bcb1bbe5sm5304137wrf.56.2023.01.23.09.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 09:10:50 -0800 (PST)
Message-ID: <f67b23e8-a476-7f8c-b692-e85ebbe669f5@linaro.org>
Date:   Mon, 23 Jan 2023 18:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add MSM8926 and Samsung
 Galaxy Tab 4 10.1 LTE
Content-Language: en-US
To:     Stefan Hansson <newbyte@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-3-newbyte@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122144749.87597-3-newbyte@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/01/2023 15:47, Stefan Hansson wrote:
> MSM8926 (also known as Snapdragon 400) is very similar to MSM8226 and
> APQ8026 with the primary difference being that it features an LTE modem
> unlike the former two which feature a 3G modem and a GPS-only modem,
> respectively.
> 
> This also documents Samsung Galaxy Tab 4 10.1 LTE (samsung,matisselte)
> which is a tablet by Samsung based on the MSM8926 SoC.
> 
> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 47913a8e3eea..7a0b2088ead9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -35,6 +35,7 @@ description: |
>          mdm9615
>          msm8226
>          msm8916
> +        msm8926
>          msm8953
>          msm8956
>          msm8974
> @@ -219,6 +220,11 @@ properties:
>            - const: qcom,msm8916-v1-qrd/9-v1
>            - const: qcom,msm8916
>  
> +      - items:
> +          - enum:
> +              - samsung,matisselte

1. matisse is the code name, lte is version/suffix. I don't think they
should be together, because then it looks like "matisselte" is a name.
It actually sounds like one word.

2. You base on other SoC but you do not include its compatibles. Why? Is
it intended? None of the properties applicable to other SoC will match
here, thus I actually wonder if you run dtbs_check...

Best regards,
Krzysztof

