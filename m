Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9535C38142
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 16:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbjAWQuM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 11:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbjAWQuJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 11:50:09 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ABE42D161
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 08:50:07 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id g11so9820841eda.12
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 08:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWCI2M5MRTLd+nORwrHWu4yoS6PIWa3IEl2T22HQAmA=;
        b=mW2XjebZvisk2ij/kthEbIC2eqFxOWbI4ADgSd4W5aqwEFnK9mkmrZMJVkaduZ1w/G
         GBWz1hlnUYLRYLH7rH8HM86b+nt/w5mqtISoQYZvsBVyZ0Tqo2/ZA7cDtSXjPHoOwAlq
         1UfxgIvB81O4V7EeKgtJ+TMpD7mA7R6VX6dy/XMsWFu1+LUSdRfkHkeaS3MDH8Zn8vTf
         OFyRev0RDxo5HX7+R5LXZ3QmK9MBkNdoVm+2K6twK9gV4W9JNJpfyJcFPFon6WWJWjoQ
         F8nDBqEa3XklYw9dLy2nL7/krXOnt9KqNFsMPHBroX1BqkqAECiSnkcbPzUi5N2NgvIM
         jioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWCI2M5MRTLd+nORwrHWu4yoS6PIWa3IEl2T22HQAmA=;
        b=Wqyyl+Wd7RzGTnY7akDPfG4COfkzFGbJk2jcgFtptZLtR5zqsRSkU2HVOU9x4L+wls
         7DevWq9INgo4hCFQH476YfjGnNKrdLcE4/T1MjhAm/1lxlDKiJtdAyAHVxj07YCet6DA
         29iqmjqQ2GbaAKIazUGAIH1yvBcKbtI2KquBUyFl+xcMnBX16HF8BU7adyB2e0OW5K/+
         cvAzer8hPPb3AkK49a/NHCOHNa+bxyCLwJqlHzvvjX1m9crNEI86mz5aXrV/WH/DbPxR
         FRcjPOqoR3dN9nZ6j4n8KPotKRwtp5oLWEFg6q9Hj9mSoTyx95o5F4FKwSs0aEEKY+ij
         E7CA==
X-Gm-Message-State: AFqh2kpgPYMdex5AcUOu3Tq3py8R9ruqsyj7FrYgwX8bndF6ElnhzK8I
        5SQBziGcx1ncGIVuJn+DSWL86A==
X-Google-Smtp-Source: AMrXdXscKM3+EaCOCzMlfENTh1GzycpQBpDW2I7dFrhsdfeIC6t63AC/KVM27bK2DzVnqlmzBE70fw==
X-Received: by 2002:a05:6402:1f85:b0:45c:835c:eab7 with SMTP id c5-20020a0564021f8500b0045c835ceab7mr28003140edc.37.1674492605945;
        Mon, 23 Jan 2023 08:50:05 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id m20-20020a056402431400b0049ef70a2894sm4385926edc.38.2023.01.23.08.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:50:05 -0800 (PST)
Message-ID: <f74fb2da-bf01-479b-0bb6-9281f9948ec0@linaro.org>
Date:   Mon, 23 Jan 2023 17:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] ARM: dts: qcom: Add support for Samsung Galaxy Tab 4
 10.1 LTE (SM-T535)
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Stefan Hansson <newbyte@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20230122144749.87597-1-newbyte@postmarketos.org>
 <20230122144749.87597-4-newbyte@postmarketos.org>
 <a373c719-a4f7-20d1-1b97-efdd5c350035@linaro.org>
In-Reply-To: <a373c719-a4f7-20d1-1b97-efdd5c350035@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 23.01.2023 17:48, Konrad Dybcio wrote:
> 
> 
> On 22.01.2023 15:47, Stefan Hansson wrote:
>> Add a device tree for the Samsung Galaxy Tab 4 10.1 (SM-T535) LTE tablet
>> based on the MSM8926 platform.
>>
>> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>
>> ---
>>  arch/arm/boot/dts/Makefile                    |  1 +
>>  .../dts/qcom-msm8926-samsung-matisselte.dts   | 39 +++++++++++++++++++
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index d0c07867aeab..e1fad9eb0d26 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1061,6 +1061,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>>  	qcom-msm8916-samsung-e7.dtb \
>>  	qcom-msm8916-samsung-grandmax.dtb \
>>  	qcom-msm8916-samsung-serranove.dtb \
>> +	qcom-msm8926-samsung-matisselte.dtb \
>>  	qcom-msm8960-cdp.dtb \
>>  	qcom-msm8974-lge-nexus5-hammerhead.dtb \
>>  	qcom-msm8974-sony-xperia-rhine-amami.dtb \
>> diff --git a/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts b/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
>> new file mode 100644
>> index 000000000000..6df568f1f36d
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom-msm8926-samsung-matisselte.dts
>> @@ -0,0 +1,39 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2022, Matti Lehtimäki <matti.lehtimaki@gmail.com>
>> + * Copyright (c) 2023, Stefan Hansson <newbyte@postmarketos.org>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "qcom-msm8226-samsung-matisse-common.dtsi"
>> +
>> +/ {
>> +	model = "Samsung Galaxy Tab 4 10.1 LTE";
>> +	compatible = "samsung,matisselte", "qcom,msm8926";
>> +	chassis-type = "tablet";
>> +};
>> +
>> +&pm8226_l3 {
>> +	regulator-min-microvolt = <750000>;
> This is identical as the common value.
> 
> 
>> +	regulator-max-microvolt = <1350000>;
>> +	regulator-always-on;
> This value already exists in common.
Nevermind, I misread the diff. That said, you can
commonize them.

Konrad
> 
>> +};
>> +
>> +&pm8226_s4 {
>> +	regulator-min-microvolt = <1800000>;
>> +	regulator-max-microvolt = <2200000>;
>> +};
>> +
>> +&reg_tsp_3p3v {
>> +		gpio = <&tlmm 32 GPIO_ACTIVE_HIGH>;
> The indentation here seems off.
> 
>> +};
>> +
>> +&sdhc_2 {
>> +	/* SD card fails to probe with error -110 */
> Maybe this SKU has some different pin properties or
> needs some external GPIO/regulator?
> 
> 
> Konrad
>> +	status = "disabled";
>> +};
>> +
>> +&tsp_en1_default_state {
>> +	pins = "gpio32";
>> +};
