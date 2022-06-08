Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548AEC433EF
	for <phone-devel@archiver.kernel.org>; Wed,  8 Jun 2022 10:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237808AbiFHK6k (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Jun 2022 06:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237741AbiFHK6h (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Jun 2022 06:58:37 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3241F5C41
        for <phone-devel@vger.kernel.org>; Wed,  8 Jun 2022 03:58:34 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id m20so40621036ejj.10
        for <phone-devel@vger.kernel.org>; Wed, 08 Jun 2022 03:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=gd7ElMzuea/7WFuTveFKUDfWtUvONcRLR/cPLStaT6k=;
        b=ImyH37uZmroZDm8Ibmf/gwlQtzRGgCAjvAHZ9R19uYBVO37QwDEpJpKHAUY19Er8hv
         xf8NeuAiMgptI7pjnlTqNkHKOlHDmFqdoTyjy9pwcrjZJNjbnGnvX4+5h/UqsLckfb0w
         hAIKchwZWJvpufh67WSy2nZZ8oTsWLv6+yxv8nkR6N3b1JN/Vo6FyV7Cp+NZUM8pfNu4
         I8/WM4l9BArNKXGqPjACdz9Nv9hGjV2PpYTu/asfEzy07iiaDGv/Oh8nHgjb1tYxGVBt
         gaDgFQ4XxqmZnj35L07tPRS9nUov2cEgA0YsGvZDytiZysJqTrTpkJN9v5R77DWi7MjE
         IRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=gd7ElMzuea/7WFuTveFKUDfWtUvONcRLR/cPLStaT6k=;
        b=begZpO7JeTLd4uJBJ1MB1xzABCqWWIE/0mrB94mg6/QBcUzBOVhv56vEOIbPdcUmk1
         JGxyj5XfM5cU9g9APMd8ussHCB646pV3C11P88gYZbhCo3NbxKwH0aU1y+YQERuXn+vg
         wtW56oFN7z3SJMQezq2U/YKco+7nUJx1WoIrfBXgjvVV20wmF74o4Sy2Sxjk4UFlPX76
         idMiZjnKKvjR4A252Vql/H2UBmXq2rzs8YJp0ROZOM9v1dGmrgAXhe0G0QhvKdb/j9OO
         VyopC2/QpC/dMTdhBrYTQ4tPTcuEJk/6j3k0FFxn/kCW1L9ORKCaMc4MmqTCyxB0MZbX
         W7dw==
X-Gm-Message-State: AOAM5320JMnsWMG3VBHyGUELwH8vyvoLuss1rpZLOBR7gt+MfD4l//7A
        ZwB9Wu26TUPdAVcB6NNe20KkH1RwoGaKSw==
X-Google-Smtp-Source: ABdhPJwDxpg4GB4ylDf87fh2wwlHAOiYNc8gpqBa20Av+fJoAUsf0So0Lr4u5yX1ZYdZrJHzw1UUqw==
X-Received: by 2002:a17:907:1c01:b0:6f4:2692:e23 with SMTP id nc1-20020a1709071c0100b006f426920e23mr30864951ejc.243.1654685913423;
        Wed, 08 Jun 2022 03:58:33 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ft29-20020a170907801d00b0071145c2f494sm5246407ejc.27.2022.06.08.03.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:58:33 -0700 (PDT)
Message-ID: <07398b52-cd1f-c53a-ace0-6baf81ed8455@linaro.org>
Date:   Wed, 8 Jun 2022 12:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add sdm845 compatibles
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Stefan Hansson <newbie13xd@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20220603201341.94137-1-newbie13xd@gmail.com>
 <3930eabd-4ca8-d644-e27a-588b189cf1ae@linaro.org>
In-Reply-To: <3930eabd-4ca8-d644-e27a-588b189cf1ae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/06/2022 12:55, Krzysztof Kozlowski wrote:
> On 03/06/2022 22:13, Stefan Hansson wrote:
>> Add compatible for SDM845 and all supported devices that use it.
>> ---
>>  .../devicetree/bindings/arm/qcom.yaml          | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 129cdd246223..6436b79dc60a 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -235,6 +235,24 @@ properties:
>>                - xiaomi,lavender
>>            - const: qcom,sdm660
>>  
>> +      - items:
>> +          - enum:
>> +              - google,cheza-rev1
>> +              - google,cheza-rev2
>> +              - google,cheza
> 
> All these were already sent:
> Google by Doug, other by me:
> 
> https://lore.kernel.org/all/20220521164550.91115-7-krzysztof.kozlowski@linaro.org/

Just to be clear - please rebase on top of it.

Best regards,
Krzysztof
