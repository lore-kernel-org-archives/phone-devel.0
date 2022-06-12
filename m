Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D26C43334
	for <phone-devel@archiver.kernel.org>; Tue, 14 Jun 2022 14:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbiFNOUY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 14 Jun 2022 10:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236158AbiFNOUW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 14 Jun 2022 10:20:22 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3D638A4
        for <phone-devel@vger.kernel.org>; Tue, 14 Jun 2022 07:20:21 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 129so8655154pgc.2
        for <phone-devel@vger.kernel.org>; Tue, 14 Jun 2022 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=resent-from:resent-to:resent-date:resent-message-id:message-id:date
         :mime-version:user-agent:subject:content-language:to:references:from
         :in-reply-to:content-transfer-encoding;
        bh=e1j5oNyWe6LjPGibCsOkD4pe/7KGmuvi3WqbEeyX52A=;
        b=lNlQ+V8h7eS6Gm+XS7iRfwkhqaNJyVnCo94zkxzUAFGm9yXGR3HNwK9JFVCq48DndB
         sPrhtxTXVaXrJNTh86fudw+0MDIAnpLcgKUYmeGxn/1CHhW0Xc956qIkpXzaI09LkRx8
         1YBSgbkn61qECxoVkXGArmsBSakeeSd4/VAotA6Ni8VsnBiJ/Wft3F1ufLkVt5CjvGQR
         /KoCDKweBC+QQjg5/H+hQEhNVT76Shac2eLr+vqSu+bllySiIeRLsp/shKwGdvx2zNjx
         NivbFtOXSmCiJUyfnPYa+hEmeERlD1T87LB0YsML/gbwi2DDD8enUl8NjK1v23+9Ze48
         b3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e1j5oNyWe6LjPGibCsOkD4pe/7KGmuvi3WqbEeyX52A=;
        b=Wb7MCI00IRqeul9ILKp1x9W/RniPEpO3qKbg6X/Wef9gJvQx/HPDBD3N1CdM/rva7R
         kHN6ZSpXppbxdhKRgGyHYB8Qe7I3gE9Xn5nFUYYZhfy73BfNKr8W9KTmqnsKcYC5Qkg4
         l0AWsFPMoVYq8xd9HCUMo4tv5kCMb8xbc0GBxi2rzELe6GqnEU38u3wfcsDKwVwtPbOy
         2SuxoG7dTFAMtV5KG/MYRYR/Ky6ZV3+FtmiIVhmZxAjlmnPGJ42mN3op7qjN2czOp+aW
         vF4Vz2VFPmqiLGpbvQruINJcMa5UaaxfWnFmHeCOaOAMfwTg1vrSsVCUdW5Axq1nHkPO
         24EQ==
X-Gm-Message-State: AOAM532DCmRNsJoDwCVgh7fNVzmjeOzBhX48rN/N/hGa4KeHoTMdo8Xg
        F/2I+yacZwfnCGdGG8SsFu6thUQ3KKZExg==
X-Google-Smtp-Source: ABdhPJyQiUDbnbeFi+KkdWYXorKpn8PZ4AY2kNMQBDXLLY7he0O7xLBF5QZW7/CsBiX+uCXoZZ9nLQ==
X-Received: by 2002:a63:4643:0:b0:3fe:e16a:a01f with SMTP id v3-20020a634643000000b003fee16aa01fmr4594404pgk.91.1655216420516;
        Tue, 14 Jun 2022 07:20:20 -0700 (PDT)
Received: from [172.20.0.255] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id k17-20020a628e11000000b0050dc762819esm7600838pfe.120.2022.06.14.07.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 07:20:20 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id pv17-20020a170907209100b00704757b1debsm2675740ejb.9.2022.06.12.10.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jun 2022 10:06:10 -0700 (PDT)
Message-ID: <f1cc0f5a-12fb-28bc-7345-13ac2bf5b74d@linaro.org>
Date:   Sun, 12 Jun 2022 19:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] ARM: dts: exynos: add function and color to aat1290
 flash LED node in Galaxy S3
Content-Language: en-US
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Simon Shields <simon@lineageos.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>
References: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
 <20220607085343.72414-3-krzysztof.kozlowski@linaro.org>
 <4a7f8ab6-c061-3861-5790-b6c0fbd7cad1@gmail.com>
 <ef62a7bb-2217-2947-17dd-fc4a51acdea5@linaro.org>
 <f1402a1d-a74d-f7b9-b9e2-fc3991781e64@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f1402a1d-a74d-f7b9-b9e2-fc3991781e64@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/06/2022 17:09, Jacek Anaszewski wrote:
> On 6/10/22 12:14, Krzysztof Kozlowski wrote:
>> On 09/06/2022 22:31, Jacek Anaszewski wrote:
>>> Hi Krzysztof,
>>>
>>> On 6/7/22 10:53, Krzysztof Kozlowski wrote:
>>>> Add common LED properties - the function and color - to aat1290 flash
>>>> LED node in Galaxy S3.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>>>> index 72901772fcad..d76f3678dcab 100644
>>>> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>>>> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
>>>> @@ -7,6 +7,7 @@
>>>>     */
>>>>    
>>>>    /dts-v1/;
>>>> +#include <dt-bindings/leds/common.h>
>>>>    #include "exynos4412-midas.dtsi"
>>>>    
>>>>    / {
>>>> @@ -27,6 +28,8 @@ led-controller {
>>>>    
>>>>    		led {
>>>>    			label = "flash";
>>>> +			function = LED_FUNCTION_FLASH;
>>>> +			color = <LED_COLOR_ID_WHITE>;
>>>
>>> Addition of these two properties will not change anything because
>>> the label has precedence. It is deprecated, but if you introduce
>>> function and color to the binding instead of the label, the resulting
>>> LED class device name will change.
>>
>> Which is not necessarily what we want, right? Adding these properties is
>> a proper description of hardware, regardless whether current Linux
>> implementation uses them or not.
> 
> Actually I'd just drop label in addition to your change.
> I don't think it would break anybody seriously - not expecting it has
> any larger group of users and having uniformly constructed DTS files
> in the mainline has greater value.
> 

What about some PostmarketOSos, LineageOS and other OSes?

Let me Cc here some folks - Simon, Martin, is the label in flash LED
node anyhow important for you? Can it be dropped and replaced with
function+color?

https://lore.kernel.org/all/20220607085343.72414-3-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof
