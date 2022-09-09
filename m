Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60673ECAAD3
	for <phone-devel@archiver.kernel.org>; Fri,  9 Sep 2022 08:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiIIIc2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Sep 2022 04:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiIIIc1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Sep 2022 04:32:27 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838C912896B
        for <phone-devel@vger.kernel.org>; Fri,  9 Sep 2022 01:32:26 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx38so949074ljb.10
        for <phone-devel@vger.kernel.org>; Fri, 09 Sep 2022 01:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Dt/NonODblXlWQZIMmh1TH9Id6Q2KvLS2tY6Rp9x0GE=;
        b=LK4ujKxMCcjrLILoyOq47tOhxHDFHBZJr36EmIG+DL7wfnOuez6UZpUub2DUzmpg8m
         FjHIV2sFUEYAlQ7VZR06DLTacKmluOBeKpMaLpTYMKEy0xvviYoD4PIpIiLLmUMx9p1V
         nXoNlnT0TPTvasr+2RnFNcZEnZF1lSIX/xb7PvEBvyM4Hmhggh0V59I/iQoPVXyk85CG
         JQYe9ZolOTQlu9WNzqOd9SOJ5g+G5gzSp0FjWKqqBuKa8ZwzQDoSL3bDc4qVGRc5K+iW
         JSkqxSxKg/A3VEClnK+mUmQOOGMH9ndOU69dWAfvGNfBLHNOyy0/EP7X3wC2izmSTrzT
         RkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Dt/NonODblXlWQZIMmh1TH9Id6Q2KvLS2tY6Rp9x0GE=;
        b=5ecbN2h2LiXJkDFuOKWxi98rMya0hhoWKsVjzmhTJzaywtm3hBfAHhewfaqorkyfra
         TuCiK95QmAlKYzv6c1Tyhqx+pabuhAujRR/8/ChFpAUOEwyl4v++Zu4UOxfCoIZUp19Q
         XG3Mjt/ynm9jJc+hx2tiHvk5M1yMQQKHfyPqNNrcJoZpyRe558IWXHjzwvA11q1ozuBH
         5UuVr5UiR1j+ksK9dx9nwqgjLNN9OFFOyQi3odAsoGo2BhvMPnx2mE+oPiSEQ61Jo0Aw
         /KW5IAVOKBzx3Vp4p1XEaDIz0puT5gL8d5aw4/rXEUvqtZ3jNNOAxjBq0gY02lQB0Y4H
         X6+g==
X-Gm-Message-State: ACgBeo2KJLRQ1gh3dp7yhjKFLHbtihj0DKq7rClCcq2lvBn5ZO+ABEf2
        5fjod+fKrtUNXKp79EDDAQjqSw==
X-Google-Smtp-Source: AA6agR4U5Ig5/kxVx3nY+DEyWJwNAL6wK5OfZHtNrtSiZqTbnHfa42gGKBTceXg6es7hDAr3AFPx1g==
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id g16-20020a2e9e50000000b00261e3fdcdc5mr3594611ljk.56.1662712344803;
        Fri, 09 Sep 2022 01:32:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b6-20020a05651c032600b0026acf2ae007sm192764ljp.89.2022.09.09.01.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:32:24 -0700 (PDT)
Message-ID: <f8ff6cf5-8ec9-b3f3-bae9-e2690e810f6a@linaro.org>
Date:   Fri, 9 Sep 2022 10:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8953: add MDSS
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220906183334.203787-1-luca@z3ntu.xyz>
 <20220906183334.203787-4-luca@z3ntu.xyz>
 <CAA8EJpqjnafKyUrd1ntYFeGTDtRxgEUSu0Mg9wNGxObJ3wF0Kw@mail.gmail.com>
 <12049260.O9o76ZdvQC@g550jk>
 <ab80670a-267a-45d8-92d0-750e7dce5682@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ab80670a-267a-45d8-92d0-750e7dce5682@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/09/2022 18:13, Dmitry Baryshkov wrote:
>>>>
>>>> +               mdss: mdss@1a00000 {
>>>> +                       compatible = "qcom,mdss";
>>>> +
>>>> +                       reg = <0x1a00000 0x1000>,
>>>> +                             <0x1ab0000 0x1040>;
>>>> +                       reg-names = "mdss_phys",
>>>> +                                   "vbif_phys";
>>>> +
>>>> +                       power-domains = <&gcc MDSS_GDSC>;
>>>> +                       interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>>>> +
>>>> +                       interrupt-controller;
>>>> +                       #interrupt-cells = <1>;
>>>> +
>>>> +                       clocks = <&gcc GCC_MDSS_AHB_CLK>,
>>>> +                                <&gcc GCC_MDSS_AXI_CLK>,
>>>> +                                <&gcc GCC_MDSS_VSYNC_CLK>,
>>>> +                                <&gcc GCC_MDSS_MDP_CLK>;
>>>> +                       clock-names = "iface",
>>>> +                                     "bus",
>>>> +                                     "vsync",
>>>> +                                     "core";
>>>> +
>>>> +                       #address-cells = <1>;
>>>> +                       #size-cells = <1>;
>>>> +                       ranges;
>>>> +
>>>> +                       status = "disabled";
>>>> +
>>>> +                       mdp: mdp@1a01000 {
>>>> +                               compatible = "qcom,mdp5";
>>>
>>> Could you please change this to "qcom,msm8953-mdp5", "qcom,mdp5".
>>
>> This would be the first dtsi using the two compatibles then, correct? Are there
>> any plans to adjust other SoCs?
> 
> Yes, this is a long-going plan. Having just "qcom,mdp5" doesn't allow 
> switching between mdp5 and dpu1 drivers. Thus I'd ask to add per-SoC 
> compat strings.
> 
> It's up to you (and Rob/Krzysztof) whether to leave just one compat 
> string or have both of them: a per-soc one and a generic one.

If device can bind to generic fallback ("qcom,mdp5") and still work
somehow, then the fallback is OK. However if generic "qcom,mdp5" does
not work at all, let's just choose something which is matching current
patterns.

Best regards,
Krzysztof
