Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58D5CDB465
	for <phone-devel@archiver.kernel.org>; Mon, 16 Oct 2023 11:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbjJPLGW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 Oct 2023 07:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbjJPLGV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 Oct 2023 07:06:21 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADC295
        for <phone-devel@vger.kernel.org>; Mon, 16 Oct 2023 04:06:18 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507adc3381cso1310970e87.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Oct 2023 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697454377; x=1698059177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXEVQS6bjiXAKpDplUeSAZwBvte/3ftCu9KDPLrWwj0=;
        b=hjMQKLVCSNc4Z/e1tRujtYEocZEJ4C6FPbrlXV7pniRimHFQO/+Di7bmXM+q84CMZC
         ICLLJ1Q45GmCpCpmbDuBMh/dDZt2Ncfo6g27lcJDjSYdA+2xaCqo+3w/4OJqZVY+g0B6
         j/qiIvRs9s48QLGOwcEsKNxZuJ5VzJ8X+ewZCfVWWBbqEFigiUv+gKsObK/sFLGxF1/f
         8VUHgLB/cutHSHCtPP4Mw3wUXGkLntKPtp8mOVGHhxwiBwEZQmMhPqHMGj1zeZsJnjPy
         9ccJ6A/1U8UyE4PtFTjsFcKwQeg/L0NTroPjDFQ3sZP8nA8azUW3CvHaPPnDhINIKkLo
         Si2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697454377; x=1698059177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXEVQS6bjiXAKpDplUeSAZwBvte/3ftCu9KDPLrWwj0=;
        b=Fdlkl9ZysAONg1v85VhPnzx7Du2xMpXqM/Um1x8FpNH+70v7E3tA87rvQ/T28OifL3
         FkslVw/8dVLGvWfmQA8ualpJZjCS1xqerOtYHz7ikWh6UW9z6dEAwzL7IHJDfAfujVFi
         usNHTO6iwQnuIdcbV2Z5JY+GUF1Xb5tDZNuH4IhrCcI/xLtLLArvQ6s7R1Dmrc6XfDLc
         TJJADb5DrTjGCEmp6bM5bEgVC02Hf6I4fJFgcUGiPg5lM7pJw3bsblh2XGJgzekxDF0V
         hxLKODg5Rph511QsXCD+d1Z5Aby6r63bQLtjc2D4yB0a98uIZQi4c+snxqThz+M/66sn
         V+8Q==
X-Gm-Message-State: AOJu0YwUdFhGmSEISDIwe7pPdqhwtiOvNbX+8N95yzEaC8vO4waiGpPp
        Qz8XtL6ldhxgzRMeRaPKzuzrwE7Ib88HXOmKO5Ce/A==
X-Google-Smtp-Source: AGHT+IEYyBsPUxOh4md1Gs8glUia+ByhRldm5segshEthvDKHCAiPDGq5a3hP8xxDBKzG69zoztWBw==
X-Received: by 2002:a19:ac0b:0:b0:507:a40e:d8bf with SMTP id g11-20020a19ac0b000000b00507a40ed8bfmr4130555lfc.7.1697454377148;
        Mon, 16 Oct 2023 04:06:17 -0700 (PDT)
Received: from [192.168.1.15] (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b0040646a708dasm6843691wmq.15.2023.10.16.04.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 04:06:16 -0700 (PDT)
Message-ID: <77aa8c48-42da-46eb-92c1-5950c9bdfec7@linaro.org>
Date:   Mon, 16 Oct 2023 12:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
 <20230929-caleb-rmi4-quirks-v2-1-b227ac498d88@linaro.org>
 <42709208-6f3b-4ae0-a7bc-f23be6370171@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <42709208-6f3b-4ae0-a7bc-f23be6370171@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 16/10/2023 06:31, Krzysztof Kozlowski wrote:
> On 15/10/2023 23:11, Caleb Connolly wrote:
>> This new property allows devices to specify some register values which
>> are missing on units with third party replacement displays. These
>> displays use unofficial touch ICs which only implement a subset of the
>> RMI4 specification.
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>> To: "Jason A. Donenfeld" <Jason@zx2c4.com>
>> To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>> To: Rob Herring <robh+dt@kernel.org>
>> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/input/syna,rmi4.yaml | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
>> index 4d4e1a8e36be..1f4a2179e4d3 100644
>> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
>> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
>> @@ -49,6 +49,21 @@ properties:
>>      description:
>>        Delay to wait after powering on the device.
>>  
>> +  syna,pdt-fallback-desc:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-matrix
>> +    description:
>> +      An array of pairs of function number and version. These are used
> 
> You nicely explained what is expected to be here, but what is the
> purpose of adding this property? Please add it to the description.

This property is to provide some "expected" register values to handle
hardware where registers that should have values are empty (MCUs running
dodgy firmware pretending to be an rmi4 capable controller).
> 
>> +      on some devices with replacement displays that use unofficial touch
>> +      controllers. These controllers do report the properties of their Page
>> +      Descriptor Table (PDT) entries, but leave the function_number and
>> +      function_version registers blank. These values should match exactly
>> +      the 5th and 4th bytes of each PDT entry from the original display's
>> +      touch controller.
>> +    items:
>> +      items:
>> +        - description: The 5th byte of the PDT entry
>> +        - description: The 4th byte of the PDT entry
> 
> Missing constraints on outer level:
>     maxItems: 1

There can be (technically) an arbitrary number of pairs here, it should
align with the number of Page Descriptor Tables supported by the device.
This is basically meant to done on a best-effort basis. The OnePlus 6
has 3 pairs here.

I'll give another pass at the description and see if I can explain this
better heh.
> 
> 
> 
> Best regards,
> Krzysztof
> 

-- 
// Caleb (they/them)
