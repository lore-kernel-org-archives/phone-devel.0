Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EF8C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 28 Nov 2022 20:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbiK1U7O (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 28 Nov 2022 15:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233004AbiK1U7N (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 28 Nov 2022 15:59:13 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BC312D15
        for <phone-devel@vger.kernel.org>; Mon, 28 Nov 2022 12:59:09 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f13so19353421lfa.6
        for <phone-devel@vger.kernel.org>; Mon, 28 Nov 2022 12:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amrhtMYz1fcMT4774lJ3IkoPUekKuEb1D1Fr4wm8cyE=;
        b=mWJIJPx7w727Kxagcg85gL8GhE0Wr+zkYB2aPxVBSV5pvOgLtAJI/kgxjI3Vhyg9cg
         A6cqL0mdiyD57ho0wUaz++izY8F1kQFBy4jA2e8FGggxpDqVISTqT8VVLC+/62vTnaQv
         QHt2rfZNGfIiloqZ8Zlos1JwmlZJ/T7qou+VH/xP9qcnim8A6se9w+aCSDiXu42hnkR7
         MWRTdrILBKUFyezpukTfgPqd38c0hTxWBHxf4cKiJiA+IUdVN+kX7LHIU7RYxS6TE/tZ
         hK1rfxLtEKS22EfUd+3bvxeTy1vl7F7OV+H7maVfaLUHFazPo+x0KPIaB6uAFXx1kAU0
         kf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amrhtMYz1fcMT4774lJ3IkoPUekKuEb1D1Fr4wm8cyE=;
        b=qSug5qdkwFd4F9sHhafn3EDiiD8+vMTMGqy8Xxk3dFEboJzoqr3zOdaJjjvNlwAoWQ
         Fe6y2MzQc/slgJA5NIPqSdLXR5ZEsWcuRn4IUxgvHawHprKeEVwMZux/vIVZOIpiIHMc
         hczLpqQA0eENPrJHsTlS81NbDZVs2IQJGRXdWNUmgf7mLvYOnIskLZA9tTdpN5rfB3/A
         Bn5gh4dw3O2jrMdM78m7kyGi6xL5OFrk6AfNkSbe0VTPm4lNhH5CZE3hKHAvBX+AbFKx
         tpVOLhpWIuqqR9knJ0SVfuUPEzHdaeRWESObuSZJ2PK6KOJVf5w8jOP0O4yoqKuYPmM2
         A35A==
X-Gm-Message-State: ANoB5pnrK6H7qOgSe+mbKJrZJCx/WNev8I/Nwk+XouArm9UlWQxtaOwb
        71HDd6VN3AFfH9RAmmIy4NT2rBfBM0hfeQ==
X-Google-Smtp-Source: AA0mqf6oWRYjzBqJxXLUJBEC/gj0sxdcJPuMtpZ1+2l0/UHjHaaDlf6ek+9eTPQ9E3umSLeOAbPFew==
X-Received: by 2002:a19:791c:0:b0:4b4:dd9:1880 with SMTP id u28-20020a19791c000000b004b40dd91880mr12162177lfc.289.1669669147898;
        Mon, 28 Nov 2022 12:59:07 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id q21-20020a056512211500b00492dc29be7bsm1872005lfr.227.2022.11.28.12.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:59:07 -0800 (PST)
Message-ID: <cce01dbd-e2b7-3d6b-9c83-af3790f3ee89@linaro.org>
Date:   Mon, 28 Nov 2022 21:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-samsung-matisse-wifi: Enable ADSP
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221125223400.94515-1-matti.lehtimaki@gmail.com>
 <a64d31a5-5e55-35b9-57e3-bb4214fe3e28@linaro.org>
 <90d231c6-1f16-74ea-ddf7-5e09a51a93ea@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <90d231c6-1f16-74ea-ddf7-5e09a51a93ea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 28.11.2022 18:01, Matti Lehtimäki wrote:
> On 28.11.2022 16.41, Konrad Dybcio wrote:
>>
>> On 25.11.2022 23:34, Matti Lehtimäki wrote:
>>> diff --git a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
>>> index 1c52337af560..859e91c16c61 100644
>>> --- a/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
>>> +++ b/arch/arm/boot/dts/qcom-apq8026-samsung-matisse-wifi.dts
>>> @@ -133,7 +133,8 @@ wcnss@d200000 {
>>>               no-map;
>>>           };
>>>   -        adsp@d900000 {
>>> +        /delete-node/ adsp@dc00000;
>> Please delete nodes by referencing the label like so:
>>
>> /delete-node/ &adsp_region;
> 
> When I created the devicetree I was asked to do the opposite for the
> smem_region [1] which I had originally deleted using the label near top of the
> file but then moved next to the relevant node, where I cannot use label
> when deleting it. Should the smem_region also be moved to the top of the
> file if I move this delete-node there so the file would be consistent?
In [1] you were asked to move the delete-node statement, not to alter
the argument. Referencing nodes by label is allowed globally in the DTS.
The removal should stay inside reserved-memory.

Konrad
> 
> [1] https://lore.kernel.org/linux-arm-msm/CAA8EJpqUH_v1GXEYF62Z3DBtFu_305_h4D36aCnBr38bo5HoJw@mail.gmail.com/
