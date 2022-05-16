Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669F6C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 16 May 2022 10:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241070AbiEPKfy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 May 2022 06:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240501AbiEPKfo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 May 2022 06:35:44 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C412ADF8D
        for <phone-devel@vger.kernel.org>; Mon, 16 May 2022 03:35:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u23so24984860lfc.1
        for <phone-devel@vger.kernel.org>; Mon, 16 May 2022 03:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TybrrNwubeiCmJTT/Pt5SvO7o0SXKQNwkYoFAX++S+M=;
        b=ywixI+hrkyjZVveqrBs5WbTfJrk3HXSjXdkw/yG+ZcMSgfRLYwk/qZXOUnJIP1WgXO
         lBVVRcBv8NUHq+A+ubYszRGIn7INTCE/F31x001Db5x3fLnrVpEmL7vSHY882isd5YBX
         IgKxgv7LNqsEwCDn8jKJej8c3eymfGOqJUVqfJZ14cGhIZkaUcMaHExYzZotzDgRMr/G
         /la28vRUa6mnJSrxsNnFK6J9NtRC0I/hUwnzzwLYXrJt8vgGZLdal1yBrwJI1gb2tUfC
         fB4fiIZIahFse2SAC7pVz9X9ne4v2ymyvwkDBWr3JDUMtsIoPd4r5HeyJNHNgB5Gnf6G
         BvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TybrrNwubeiCmJTT/Pt5SvO7o0SXKQNwkYoFAX++S+M=;
        b=Zo6w8BcCeEj8WPCTKxuSKJwqyt3JN+PgRe0WXajgtKn5ADAz/DqnRxndV6Gayov8iX
         LiWDeve8pQfOpAm7B1IhPlpTa749vuS9B3QHzFZYF5vbxRBl4SxAMI2gjPbJtKqK4wIT
         a1mO9ocgO4hN/C/l/p96XgZAeky2lADj3KG3EJtg5yB/FAFubjcCk2NKrnq75MRwZdnN
         zp6wvD3cH89S9VWMauMgtOExh22TUcxQuixgk/rjmSQCbAZaTrCegf1c/GauI6u1+PuH
         DMJKy+ToBpCaoGK9jAi+JyCYTQWrWrWOii0LXjxLeTbYuQXJRCGy9akQYTriu1MT5+sD
         9EBA==
X-Gm-Message-State: AOAM532Uq2enmFd2IjfO2U5z0ci/Zg2mKpMLxnsVb1/O+Nzb5RFAVNjR
        3VZ9sjUm4k+KCZKyajToWTgAzw==
X-Google-Smtp-Source: ABdhPJzsVUrwn0tS3KToBIsJDTgtNs7vd3KqCRuQCih/v/B3esQjDRGT86G4+aNwUBJFRoPzISn/og==
X-Received: by 2002:a05:6512:3ee:b0:471:f84f:7d5b with SMTP id n14-20020a05651203ee00b00471f84f7d5bmr12436445lfq.18.1652697340056;
        Mon, 16 May 2022 03:35:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h12-20020a05651211cc00b0047255d21174sm1265168lfr.163.2022.05.16.03.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 03:35:39 -0700 (PDT)
Message-ID: <13d65ae2-f378-5353-16b9-5bf68883a701@linaro.org>
Date:   Mon, 16 May 2022 12:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: convert to YAML
Content-Language: en-US
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
 <fef5f229-f247-d032-fc76-46ed7083dbf4@linaro.org>
 <CK10OTVFAP75.WCSVY40A7PXO@otso>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CK10OTVFAP75.WCSVY40A7PXO@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 16/05/2022 09:45, Luca Weiss wrote:
> Hi Krzysztof,
> 
> On Mon May 9, 2022 at 10:40 AM CEST, Krzysztof Kozlowski wrote:
>> On 09/05/2022 10:38, Krzysztof Kozlowski wrote:
>>> On 03/01/2022 08:43, Luca Weiss wrote:
>>>> Convert the PDC interrupt controller bindings to YAML.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>> ---
>>>> Changes since v1:
>>>> * Adjust description of second reg-name as suggested by Maulik Shah
>>>>
>>>> @Rob Herring: Hope it's ok to keep your R-b given the above changes
>>>>
>>>> This patch depends on the following patch, which fixed sm8250 & sm8350
>>>> compatibles and adds sm6350.
>>>> https://lore.kernel.org/linux-arm-msm/20211213082614.22651-4-luca.weiss@fairphone.com/
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Luca,
>>> I think this needs resending as dependency was merged. Alternatively,
>>> maybe Bjorn could pick it up through QCom SoC?
>>
>> Correction - it seems that Rob took the dependency in April, so this
>> should go via Rob's tree as well.
>>
>> Luca, can you resend without Rob's Review tag and ask him to pick it up?
>>
> 
> So... since torvalds/master my sm6350 patch is merged through Rob's

If it was merged to torvalds/master, it's not a dependency anymore...

> tree, but there was also a sm8150 patch applied through Linus Walleij's
> tree. This means (as far as I understand) that neither can really
> properly apply this (rebased) patch as one tree will have missed the
> other commit.

sm8150 patch is also a dependency?

> 
> Does it make sense to send a v3 rebased on linux-next now, or wait until
> this has settled down in torvalds's tree?

Conflicts can be resolved, you just need to choose one tree to based on.


Best regards,
Krzysztof
