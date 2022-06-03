Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86691C43334
	for <phone-devel@archiver.kernel.org>; Fri,  3 Jun 2022 09:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241320AbiFCJ4I (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Jun 2022 05:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbiFCJ4H (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Jun 2022 05:56:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A652D3AA50
        for <phone-devel@vger.kernel.org>; Fri,  3 Jun 2022 02:56:03 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id s12so7705270ejx.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jun 2022 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zs/Snm7wBkBvkKLKDEJnB4SYZuuEuwpMYd9uLaVIwAE=;
        b=DdIngkecu9AmD2BzAJfyBpoShkPBVC4nsP1yeLLlFehRqlWKi6JVSb1+elF2xPskEf
         vvEcXeBkkwygEIXvXZGY3hePMwnnpjO2MX+j9sMHvqik1O/pDV+UoFKabvYpubHyphLo
         bMxjmCxJHhKhbbxt2s3KMyDBnMp73jgsYJmTz1sU6mQSnDkJo86g1qcwSpyfpzz5IDzb
         zzOc0o2/VgHg4Ivm/SG9gCVH4M0uuSW192XTP2pA8qL3gtlp6HOm6z0XMDxx6noVDfLO
         oM2qN+XVjNQONM5KIoANhvk7OTFgReUPj5K38EiorCx4wAioCrlZ+bMSx7ljGVt505nm
         n6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zs/Snm7wBkBvkKLKDEJnB4SYZuuEuwpMYd9uLaVIwAE=;
        b=heG03ZM0SqfH8qUikfsCyxxenfCtIJq75kNMIwCKcyc/LM1ny8lTkQT017Zdt9HUUu
         IXYTKeMrlE7D8QXsnDkJ/PwKg/3g5RFICGOU3NJb/xC8UqTXY1GFFSf/Ui1sdcZ3XXba
         P/lpHCsWCw4oHlObmCQF8cW569qS/rwaerFyTrtHOwE+Nw783iaGfS0v+/gaSIulfDvk
         iwjer+HNvBmLimpx7CJh2pGHxQYLvxh6Hv5paL76VIBUmdEn78mRzGmnz3cseXH0Xppv
         vgF0bbGyNbQWq8gGHuZngHOgWSeGgeBSjRsF2oRTvERQKUpyCJaIX+nojXBQHp37Q83+
         tTng==
X-Gm-Message-State: AOAM533Cd86D3sK/oiBFJ2x0KoFv1IcLnZyCU3v/tBrllVsTGHP4Rtk2
        tax6SHLuKLrrKpex5fm86LjVbg==
X-Google-Smtp-Source: ABdhPJyLZEXgasjK1iNOh+v508745d/SULGzUUJKtECcrWud9tCUDwBjEhia6wGu5d/38gtONk+/Ww==
X-Received: by 2002:a17:907:1686:b0:70e:895b:7ba0 with SMTP id hc6-20020a170907168600b0070e895b7ba0mr1731808ejc.484.1654250162255;
        Fri, 03 Jun 2022 02:56:02 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7c3cf000000b0042bdb6a3602sm3520334edr.69.2022.06.03.02.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 02:56:01 -0700 (PDT)
Message-ID: <173ad8d6-44b3-444b-c72d-f35e83d7ed1a@linaro.org>
Date:   Fri, 3 Jun 2022 11:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] arm64: dts: qcom: add device tree for LG G7 and LG V35
Content-Language: en-US
To:     Stefan Hansson <newbie13xd@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Cc:     Anton Bambura <jenneron@protonmail.com>,
        Gregari Ivanov <llamashere@posteo.de>
References: <20220602120727.197491-1-newbie13xd@gmail.com>
 <b99033fd-ca3c-49bb-d46b-c9ca1cb0c386@linaro.org>
 <6927df15-54d1-bf1e-0e34-9524e79e3f0a@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6927df15-54d1-bf1e-0e34-9524e79e3f0a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/06/2022 11:47, Stefan Hansson wrote:

>>> +	gpio-keys {
>>> +		compatible = "gpio-keys";
>>> +
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&vol_up_pin_a>;
>>> +
>>> +		label = "GPIO Buttons";
>>
>> Is "label" really a property of gpio-keys node?
>>
> 
> I tested these dts:es with dtbs_check and I do not see any errors 
> regarding labels. If you prefer me to delete this I can do that. I 
> understand it is rather weird to have this here if it's not in the 
> schema. I am rather new to writing device trees, so I think you are 
> better off making the call here.

Thanks for reporting. Indeed current DT schema won't detect this. Anyway
it seems gpio-keys driver already uses it and since it appeared in DTS,
maybe better to document it. I'll work on this, so feel free to keep the
property.


Best regards,
Krzysztof
