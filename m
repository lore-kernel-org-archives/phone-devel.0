Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFCEC04A95
	for <phone-devel@archiver.kernel.org>; Sat, 22 Oct 2022 15:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJVPej (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 22 Oct 2022 11:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiJVPec (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 22 Oct 2022 11:34:32 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A187638A4
        for <phone-devel@vger.kernel.org>; Sat, 22 Oct 2022 08:34:29 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-13b23e29e36so6392014fac.8
        for <phone-devel@vger.kernel.org>; Sat, 22 Oct 2022 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3o9axZvDdNOgS/Y6RutGIDFfirmDxC5Ep1Oj1cF5cFU=;
        b=SKqAgiasw1BvwBJOekncF5FlZsqh/+Kkp4NboMpFweBcIbRHqWDAyL9k8Az1f1oYU7
         Fh7aKCcbcOPdhTneRjBp3jbA/kqKNgx4k+FWyIO9LIH1WqcQrFQvlpllhz9nphkz+zTL
         Cv5LLPm8ZE7i2ClXsNMgpZFGCVZMpPKCR7CVftNqCL4hmrH2smpzqhJ7lu1UZWxzKb8/
         0NyOGPDX6x4HPes7O7UWABNKQNewG8ULuNLnDVWib8cXvFZgQtTFVRbFTM4jsgDzj4m1
         TySH7EVBWL6SRMMmQ4TGZJzz/cSuuw2ml1hwG1c44r0x4BQ5P1LM+Gjm1ocFjPL1PMur
         xddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3o9axZvDdNOgS/Y6RutGIDFfirmDxC5Ep1Oj1cF5cFU=;
        b=PBIwxVpVsRCUdE64eyffl9QOz5TqELEpckRSU6J2aXkXaGKZr6d12k8thOjEXKNkPD
         X3EbadpJEaMBjcuU6NMD6Nnnv3c26/SeLtHMeQ4R6+LlscpR+GwFIrGYwDwhfgxjwkFx
         N9bP9W64Cv7ZSQw8I36P4t7rnqRANyNJ5wEDPmYeuEwZhguWmotPIqazHpcOpcPxbZu0
         dbyqK5pC23NE8vdMiU5urY2hxPqQXsUEHnVEieapJBX/8vurLDKJM19r1QBIaM77pKnv
         02QWrx+cDlBZd7mvJQluRKphiJA+9uQVEf0V09/eIwbHJWjGrMA+eFUWX6pS+qj5jhTZ
         NO+g==
X-Gm-Message-State: ACrzQf0p9ughgJVdBYILE4OHC9aQjqpStzVBHV3I3pi7drCdX9WYmE93
        Yj6tijL1WEfvCsz9HcN+miVMSw==
X-Google-Smtp-Source: AMsMyM4Ya6r3OGi5EmBpVTCW2N9T2L2PUiMY6fnLJKk+7HzTi4EaAUg3uENnAa7k4pvbJPXEt7PYEw==
X-Received: by 2002:a05:6871:288:b0:13b:13b:22e1 with SMTP id i8-20020a056871028800b0013b013b22e1mr8200018oae.115.1666452868811;
        Sat, 22 Oct 2022 08:34:28 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id p34-20020a056870832200b00130e66a7644sm11617519oae.25.2022.10.22.08.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 08:34:28 -0700 (PDT)
Message-ID: <9faa50c1-9d09-6507-7b28-7a02a8c253b2@linaro.org>
Date:   Sat, 22 Oct 2022 11:34:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8996: add support for
 oneplus3(t)
Content-Language: en-US
To:     Harry Austen <hpausten@protonmail.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221021142242.129276-1-hpausten@protonmail.com>
 <20221021142242.129276-5-hpausten@protonmail.com>
 <78a117d5-b4be-8389-c909-9f8525b151d8@linaro.org>
 <wqHFrd3UmaUsRa21931VRDSHnIiusqzv3AIu7nynQkRhvAloHPmNaDvpCCGkdZoeKtZBDI_Rl9As8ehNW4EwpN47yhFJnY3-6hQkurhWy48=@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <wqHFrd3UmaUsRa21931VRDSHnIiusqzv3AIu7nynQkRhvAloHPmNaDvpCCGkdZoeKtZBDI_Rl9As8ehNW4EwpN47yhFJnY3-6hQkurhWy48=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 22/10/2022 06:38, Harry Austen wrote:
> On Friday, October 21st, 2022 at 3:44 PM, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> [...]
>>> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
>>> @@ -0,0 +1,794 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>
>>
>> Are you sure this is GPL-2.0 only? Didn't you derive it from downstream
>> OnePlus DTS?
> 
> Yes development of these devicetrees was aided by downstream DTS, all of which appear to have
> GPL-2.0 only headers, e.g. see msm8996-mtp.dts [1].

OK, but then below copyright is not correct:
> 
>>
>>> +/*
>>> + * Copyright (c) 2022, The Linux Foundation. All rights reserved.

... unless you work for The Linux Foundation?


>>> + */
>>> +
>>> +#include "msm8996.dtsi"
>>> +#include "pm8994.dtsi"
>>> +#include "pmi8994.dtsi"
>>> +#include "pmi8996.dtsi"
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>> +#include <dt-bindings/sound/qcom,q6asm.h>
>>> +#include <dt-bindings/sound/qcom,wcd9335.h>
>>> +
>>> +/ {
>>> + aliases {
>>> + serial0 = &blsp1_uart2;
>>> + serial1 = &blsp2_uart2;
>>> + };
>>> +
>>> + battery: battery {
>>> + compatible = "simple-battery";
>>> +
>>> + constant-charge-current-max-microamp = <3000000>;
>>> + voltage-min-design-microvolt = <3400000>;
>>> + };
>>> +
>>> + chosen {
>>> + stdout-path = "serial1:115200n8";
>>> + };
>>> +
>>> + clocks {
>>> + compatible = "simple-bus";
>>
>>
>> This is not a bus of clocks...
> 
> Will remove in v2.
> 
>>
>>> +
>>> + divclk4: divclk4 {
>>
>>
>> Use common suffix or prefix for node names and generic name.
>>
>> This clock is anyway a bit weird - same frequency as sleep clk.
>>
>>> + compatible = "fixed-clock";
>>> + pinctrl-names = "default";
>>> + pinctrl-0 = <&divclk4_pin_a>;
>>
>>
>> This is a PMIC pin? So is it a PMIC clk?
> 
> These two clocks are described in the same way as other current MSM8996 DTs (e.g. apq8096-db820c.dts
> and msm8996-xiaomi-common.dtsi). Happy to change if you think there is a better way to describe them?
> Yes, these clocks originate from within the PM8994 PMIC as per the datasheet [2]. GPIO_15 is
> configured with the DIV_CLK1 alt function and routes to the MCLK pin of the WCD9225 audio codec.
> GPIO_18 is configured with the SLEEP_CLK5 alt function and provides the SUSCLK_32KHZ input to the
> Atheros QCA6174 WiFi/BT chip.

So this is SLEEP_CLK - a PMIC generated 32 kHz clock, which is quite
typical among many PMIC designs. Representing it like this a bit
hack/workaround and proper way is to have proper clock driver.

But on the other hand, this is much easier and already such pattern was
introduced with MSM8996 Xiaomi, so fine by me.

Just name the nodes generic.	


Best regards,
Krzysztof

