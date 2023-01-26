Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB97C05027
	for <phone-devel@archiver.kernel.org>; Thu, 26 Jan 2023 09:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236343AbjAZJlc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbjAZJlb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 26 Jan 2023 04:41:31 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F025CFE4
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 01:41:27 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id fl24so731409wmb.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Jan 2023 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWbckZbLscUSiQK6kSvhvYmXnDbgSSyOehKbYKBrl+8=;
        b=bQUVcZ6Rt7OTd6EQSbi8KR7R+YlACETTdb8AerLmjoGgGdRJyrkFQKUSawGn698Wp/
         8COeb+kXxWr0ert8SlZoOetmJtVtS9s97CEFZiW46wqD1XD7Bgeb6HbEt488SuVczmK0
         TRlm2/p4EmqWIc5WWXwG/STtBjpdf9JniVJbIaZ9ayXTTlkEaB3eOge9rI/EoBgqxR7f
         iOzVaqa6K0rpg5kXbPFcj7HiVGaPqgUaYAXbhP2aWqxAlfzYtKWXxna5VnQAnOyEcn9A
         XQMalvQBICYrskkqIpmALsrocd790cwDPAhueTwwgZsO/ykTtfRBKYvOb/Bz9gXW2R+d
         cQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWbckZbLscUSiQK6kSvhvYmXnDbgSSyOehKbYKBrl+8=;
        b=1QM0JgSElFcY3nUafNbukmM7bRUd6UFaOhacZvtXAYvX95zplbtTQPuoC6Sh7WT/o+
         +0YoYvik9ZTCzxpml+RXbxDMNdPNNJSIfmSZdZtFR/Ex5LZegm6040blPeY/eaTvO9Hf
         MQMJjwm2mthfniiq1Rfj1W5Kt1jbgp6nkniW688bbiYlV6B4J4aqgBV4sAcX+04Ukwax
         wHsiGJ6tprRzxHJ5M/6FYo4E8Y94W5GBfNUv8uMs3J8Tm9csvLHW4Y5b6EMCl+E3C9Eq
         JEcxT+qgYNMCCg4fkwEmn1t3DMSKbz8nEC7gblPQROfH0w4ukxkevoYdTpbWAjOcR3eK
         FAfw==
X-Gm-Message-State: AFqh2kpR68mhIaveaAYWNRbSgo0S4jE9aGLDEuys9vmVUEW3FqmVBsOP
        1jvb8oauCwTyDzrpStAo/qvA/Q==
X-Google-Smtp-Source: AMrXdXvSx2my3NGGu6iqTh8FJBDjJRGEoIXP9s1KJSvSez8DU8+sI6sZ3tPjsNy2pNFH1/hC0DXKtQ==
X-Received: by 2002:a05:600c:4e08:b0:3db:1a41:663a with SMTP id b8-20020a05600c4e0800b003db1a41663amr29235114wmq.20.1674726086529;
        Thu, 26 Jan 2023 01:41:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i20-20020a05600c071400b003db0ad636d1sm4018509wmn.28.2023.01.26.01.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 01:41:26 -0800 (PST)
Message-ID: <dbfa802a-968f-0504-a131-59e2a8f52c9f@linaro.org>
Date:   Thu, 26 Jan 2023 10:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974-oneplus-bacon: Add
 notification LED
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230122-msm8974-bacon-features-v1-0-4049f565c24c@z3ntu.xyz>
 <20230122-msm8974-bacon-features-v1-5-4049f565c24c@z3ntu.xyz>
 <02e5bf79-3e2d-02c8-67e7-61bbff32ba29@linaro.org> <4455893.LvFx2qVVIh@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4455893.LvFx2qVVIh@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/01/2023 21:51, Luca Weiss wrote:
> On Montag, 23. Jänner 2023 18:18:16 CET Krzysztof Kozlowski wrote:
>> On 22/01/2023 17:48, Luca Weiss wrote:
>>> Add the node describing the sn3193 that's used to provide notification
>>> LED.
>>>
>>> Unfortunately the driver currently supports neither multicolor API nor
>>> using the properties function & color, so we use label instead.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>>
>>>  .../arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 28
>>>  ++++++++++++++++++++++ 1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
>>> b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts index
>>> ffb486ceb6a6..a672c45d7070 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
>>> +++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
>>> @@ -114,6 +114,34 @@ led@0 {
>>>
>>>  			default-brightness = <80>;
>>>  		
>>>  		};
>>>  	
>>>  	};
>>>
>>> +
>>> +	led-controller@68 {
>>> +		compatible = "si-en,sn3193";
>>> +		reg = <0x68>;
>>> +
>>> +		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		led@1 {
>>> +			reg = <1>;
>>> +			label = "red:status";
>>
>> These should be colors and functions.
> 
> Hi Krzysztof,
> 
> please check the commit message for this. I tried using it but it didn't work, 
> the driver in general might need an overhaul at some point...
> 
>> Unfortunately the driver currently supports neither multicolor API nor
>> using the properties function & color, so we use label instead.
> 
> Or maybe I messed up but pretty sure this was the case when I wrote the dts.

I don't understand how driver is related here - it's not the driver's
property, but LED core. If the driver "supports" label, then it supports
color and status.

Best regards,
Krzysztof

