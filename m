Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2EAECAAA1
	for <phone-devel@archiver.kernel.org>; Sun, 11 Sep 2022 10:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiIKKHz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 11 Sep 2022 06:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiIKKHy (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 11 Sep 2022 06:07:54 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7065B2BB11
        for <phone-devel@vger.kernel.org>; Sun, 11 Sep 2022 03:07:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bt10so10263297lfb.1
        for <phone-devel@vger.kernel.org>; Sun, 11 Sep 2022 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eX+5//Qd0qiSGwhAdD53iMPOZ01D21SlUbjRrzVLFVc=;
        b=h0koii7fb1oT1Vgdrhf0gQ9jd9ilSYjBDM8UqO5+Cm+C0BHn1/1fmWk/ljpw6QiPVY
         Gkvm8OhkNcO/nz20CcNvR0eELLUZaWUJYeuNQycAIBTC4NPVRlebf40qNQqcT8Q+YaM+
         uEKWgHoX8XPzmTSdLEO7h+l53zjL1pJcEndP2KWHiifv7XLZtasW1bSVxEuEPMb1dZtn
         1kuYB//4c7MYGIZ29UbP6RnWRBdaZ+IRlO2gBqz6Ho3vG21dTzvGRg1EepZwDLmcztpk
         bFsy76jngPxmmFiY8mhQnISFcNmQTXJkWxIVmQR7zlOO5bEVMwF5xzrvN8NhwI75ngeO
         p3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eX+5//Qd0qiSGwhAdD53iMPOZ01D21SlUbjRrzVLFVc=;
        b=RxliUGosZntjB1Zlu2uER3lqIAmPLIFhJmLqKo/kzvzE8kF+3KwycumypplO71nA9L
         9E/Z/7RqI3BDfvT7Htz4rNxN5KE2vBog8UqgvsHceyHbb3WPv/vQnjXsRwGasliUlZoW
         DRoX3dvQtk8wq0qw5PyGEPo89BWwn4EpehPY8dVjEkg/8gyImOQ2YEW5syHqgVOZ1yI9
         PL9N9HNkzGxZuTMRXK0mD17mb50aCVYNH0qahhAol4sv78Z4534J9m/UCl0ofQftMz3i
         tWyaQ61sbqr7sBiyOkA9OT8SEaFQzoGiSSmDyz2ZQ002OZGvc5YKJBqf1h19o3/2sukw
         6b/w==
X-Gm-Message-State: ACgBeo0y0jh4vGMyr4wpwivrDxlg9SbcbZG4TEP30Wmgt1Ps5zbHFZ8x
        frVvikKcZJxVG7mj85NQGl16YQ==
X-Google-Smtp-Source: AA6agR6A1V3CcXvwvEZeblw1I30gk4e6QrGX06JYml79blEXygiH9sh4/BbGUWmJnqZGus5TWgAb7w==
X-Received: by 2002:a05:6512:a87:b0:498:fbeb:daea with SMTP id m7-20020a0565120a8700b00498fbebdaeamr3993625lfu.632.1662890870806;
        Sun, 11 Sep 2022 03:07:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s12-20020a056512214c00b0049480c8e7bcsm558548lfr.176.2022.09.11.03.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 03:07:50 -0700 (PDT)
Message-ID: <7e5eb29f-913a-7540-c618-fb6c5a493d5d@linaro.org>
Date:   Sun, 11 Sep 2022 12:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: sm6115: Add basic soc dtsi
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-8-iskren.chernev@gmail.com>
 <d51b0a89-a151-dd5b-b026-4291031fe1ea@linaro.org>
 <ad940df1-6876-0c38-81c8-7d7ca97046de@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ad940df1-6876-0c38-81c8-7d7ca97046de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/09/2022 11:09, Iskren Chernev wrote:
> 
> 
> On 9/11/22 11:40, Krzysztof Kozlowski wrote:
>> On 10/09/2022 16:32, Iskren Chernev wrote:
>>> Add support for Qualcomm SM6115 SoC. This includes:
>>> - GCC
>>> - Pinctrl
>>> - RPM (CC+PD)
>>> - USB
>>> - MMC
>>> - UFS
>>>
>>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>>> ---
>>> pending issues with dtschema:
>>> - for some reason, using pinctrl phandles (in mmc) breaks the pinctrl
>>>   schema (4 times)
>>>       .output/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: pinctrl@500000: sdc1-on-state: 'oneOf' conditional failed, one must be fixed:
>>>             'pins' is a required property
>>>             'clk', 'cmd', 'data', 'rclk' do not match any of the regexes: 'pinctrl-[0-9]+'
>>>             [[26]] is not of type 'object'
>>>             From schema: /home/iskren/src/pmos/linux-postmarketos/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
>>
>> It's the same as 06367559766b7c9bd96d2baef8bfc5a9bb451e25. I propose to
>> fix it the same way. I can do a biger change for all pinctrls, so here
>> you would need to add "-pins" prefix to entries (see patch
>> 4fcdaf4b0320f93d0ccb4d36b795ed258fb07b27).
> 
> OK, that makes sense. One thing that is a bit odd -- the current pattern
> "(pinconf|-pins)$" matches anything that ends in pinconf OR -pins (so it could
> be sth-pinconf). 

Yeah, I am fixing it to ^(pinconf|.*-pins)$

> Also, if you only have a single block, isn't the idea to just
> list it in the -states node.  I mean we either force everybody to nest with
> a pinconf, or we allow -pins for nested stuff and directly in -state for the
> non-nested. Just my 2c.

I didn't get this one... We allow exactly this, don't we (in PMIC GPIOs)?


Best regards,
Krzysztof
