Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C878CC05027
	for <phone-devel@archiver.kernel.org>; Tue, 14 Mar 2023 18:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjCNSik (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCNSig (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 14 Mar 2023 14:38:36 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D188CB3281
        for <phone-devel@vger.kernel.org>; Tue, 14 Mar 2023 11:38:00 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eg48so6665070edb.13
        for <phone-devel@vger.kernel.org>; Tue, 14 Mar 2023 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678819032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4n8ZDqZiPoqxeYd6QYMyRvm/vwvtlHUwxPZLxc39CU=;
        b=RG3iokM/H+V4dfNtmqXcPt28qd3HMftFF/3gVOGdIc/gd+um1IhakY9MRaracGm80x
         rZ624QRJMMAAFpraEeRG0tuPVZAI8YUsTsWfGbandw5wfypLdC/vjcWlic/D6ranH1FO
         JJHsWR2OMzzEqMq3ogIPg4IRbk2t0qVaBrxnYx94jWzt0rkqMibp8Tf10R3Im6FjOQLV
         Gv/TZDg8XIQdotY86rpRsn2cgAQDbs9nSnbxXis8oiB86ENlNjgFAL5/DqImsuliRXgq
         4P7Rtx5gG2NWLJybvNnEEAOSn/W2Qp2GimekfWyMbBhQf4TslM9C/PHAD4gtORkwy+0F
         hJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4n8ZDqZiPoqxeYd6QYMyRvm/vwvtlHUwxPZLxc39CU=;
        b=qSKq/iArL+NdEdNNlXynU9wJt9cny/8awHSm+xf//jZh88nQEWUi9fb+RhjjrfuSxY
         qj53HYCj+rtH1i7gGteCcR/bAMF+8TNch/MZjd0iu4DAco7UjdIiu0b7e9ksyRJR2rQG
         uVhKLZytpzwDAmg+5RNLwu0sVsJrguOZ1xRw3Rhh80ABkCTLEghxtdbDt/drK5Q32Lof
         pYWQINNFzFfzcxj+1t8oZF31eOh3uvTH8wNh0gM/9SURojoBDcsQ7cibHcuc9Q7TVnF4
         MFYBYTbjo4ZR6DW0Fh7W1E1yirbNXm+dMsdCnRxAKLwkCglD0PrS5rRGZn11LdGXBJ+D
         fSeA==
X-Gm-Message-State: AO0yUKUoE8UI9jFZuMMXCcj6c0eni9IuGPqzvLOYVZQLJBYzcZAwG4v6
        n6eCO+X0m2Dg7ARg4x3/O6Rehg==
X-Google-Smtp-Source: AK7set+678Md91PWgDD5ODAtz6aldDFjZ4ZXZIPWxTn/TbLxnYFVm8Ci3CWLdyva+rSKdPmhgJtkJA==
X-Received: by 2002:a17:907:a088:b0:927:8285:18a3 with SMTP id hu8-20020a170907a08800b00927828518a3mr3754387ejc.0.1678819030857;
        Tue, 14 Mar 2023 11:37:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id c12-20020a170906528c00b0092b7c1352dfsm1466771ejm.68.2023.03.14.11.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 11:37:10 -0700 (PDT)
Message-ID: <aadd794f-8881-6ecf-4d9d-51a8a23fe4b2@linaro.org>
Date:   Tue, 14 Mar 2023 19:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: dt-bindings: ov2685: convert to dtschema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        phone-devel@vger.kernel.org
References: <20230206-ov2685-dtschema-v1-1-9e4da3474c10@z3ntu.xyz>
 <167572017056.1564123.13342855865502188090.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167572017056.1564123.13342855865502188090.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 06/02/2023 22:50, Rob Herring wrote:
> 
> On Mon, 06 Feb 2023 21:23:16 +0100, Luca Weiss wrote:
>> Convert the text-based dt-bindings to yaml.
>>
>> Changes from original txt:
>> * Take wording for various properties from other yaml bindings, this
>>   removes e.g. volt amount from schema since it isn't really relevant
>>   and the datasheet is a better source.
>> * Don't make reset-gpios a required property since it can be tied to
>>   DOVDD instead.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>>  .../devicetree/bindings/media/i2c/ov2685.txt       |  41 ---------
>>  .../devicetree/bindings/media/i2c/ovti,ov2685.yaml | 101 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  3 files changed, 102 insertions(+), 41 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: 'clocks' is a required property
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: 'clock-names' is a required property
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: 'dvdd-supply' is a required property
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: 'avdd-supply' is a required property
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: 'dovdd-supply' is a required property
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml

These are errors from the bindings, so they must be fixed. If you do not
want to fix the rockchip bindings, just drop or replace the sensor in them.

Best regards,
Krzysztof

