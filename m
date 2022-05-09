Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854E6C433EF
	for <phone-devel@archiver.kernel.org>; Mon,  9 May 2022 09:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiEIJRC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 May 2022 05:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237073AbiEIIoQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 May 2022 04:44:16 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A5C1AB7B2
        for <phone-devel@vger.kernel.org>; Mon,  9 May 2022 01:40:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w24so7635922edx.3
        for <phone-devel@vger.kernel.org>; Mon, 09 May 2022 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=HxhOGtQf6WluCi49sQ42WpKK1M3738iJw/Ad2aCa2VM=;
        b=XgeTONWuKoYjTxbuoXtsky7Y+hE20RHlkAEEYCCM8PodBuBG0llJK0iXuxQh+f1ihG
         UVTunqpn/uDaBIneesFgNS6IiHb1JZvsE/h9947cJ2A13vmuYGIIir4vsd/sB538mR9A
         86D8zEjUQG6YDgJNBOjUi9ZdWsAHUzf+kxcmuHZlotKFe6mTKsMupDoDXgoEjhr1zPQu
         hBo0wpcrlbr9213/zUh2YaBA2P6P2jiSQieB8n/1y12gM8exgXXTYHC7kJ5t7j4f6lMV
         w1NdXedF2gDek/slQEUHymYx8MoGsFA6vnHiiqt4ocSDGwxM6huL1hOIZSwHYdsbRXIK
         xLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=HxhOGtQf6WluCi49sQ42WpKK1M3738iJw/Ad2aCa2VM=;
        b=45SmCLJUvBN5EwX9nJCDwaGDsBhF+8/GVbuh9cfHZZbKiWHhBndbGCUAccIxN0NI5N
         8Z6t7DGpOBX6jrHtbspc3vCtYBZqBzICh8xAt6mZpWZKdWWoQW1LDyEXIQuzbglTkjbS
         IGmr32aFFarsDUxjuqOqzmSFKyEzwg3qViR0MinZNQRVq14XZoyvR4K8GX5y13WnsuVR
         87vxATMXaSzI6brMTZK3cdvvD6+Au+giK0Z0f6X3o8v3MJ4QjyDLRwpuhyJgWbLsK0F3
         oHbP3ogUCYDC6zPXpNTbJNULSCKiGHqiudpvP5f+lIWeaEeD5iuBR9wTJxY2JDQzH0ql
         Epiw==
X-Gm-Message-State: AOAM531960apquG9xNu7TZNQoy3DNhWBLbZLhiJakgfqKsm/4B3G9/XT
        dWHtianlSpCte6TlOrSp7bupmQ==
X-Google-Smtp-Source: ABdhPJwGm9qVTNeCVY755repJ14G7TtzwPzTGnWz+T7AdDHMM52tb66IK7LZ1siC3g005v4szeEQgA==
X-Received: by 2002:a05:6402:350f:b0:428:43a1:647d with SMTP id b15-20020a056402350f00b0042843a1647dmr16183322edd.62.1652085621304;
        Mon, 09 May 2022 01:40:21 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a12-20020a50f0cc000000b00425d6c76494sm6005508edm.1.2022.05.09.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 01:40:20 -0700 (PDT)
Message-ID: <fef5f229-f247-d032-fc76-46ed7083dbf4@linaro.org>
Date:   Mon, 9 May 2022 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220103074348.6039-1-luca.weiss@fairphone.com>
 <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
In-Reply-To: <bef4922d-4a32-f184-44a1-8f5430190938@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/05/2022 10:38, Krzysztof Kozlowski wrote:
> On 03/01/2022 08:43, Luca Weiss wrote:
>> Convert the PDC interrupt controller bindings to YAML.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>> Changes since v1:
>> * Adjust description of second reg-name as suggested by Maulik Shah
>>
>> @Rob Herring: Hope it's ok to keep your R-b given the above changes
>>
>> This patch depends on the following patch, which fixed sm8250 & sm8350
>> compatibles and adds sm6350.
>> https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss@fairphone.com/
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Luca,
> I think this needs resending as dependency was merged. Alternatively,
> maybe Bjorn could pick it up through QCom SoC?

Correction - it seems that Rob took the dependency in April, so this
should go via Rob's tree as well.

Luca, can you resend without Rob's Review tag and ask him to pick it up?


Best regards,
Krzysztof
