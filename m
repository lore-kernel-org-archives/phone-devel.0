Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0BAC46467
	for <phone-devel@archiver.kernel.org>; Wed, 30 Nov 2022 14:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiK3OTo (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Nov 2022 09:19:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiK3OTm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Nov 2022 09:19:42 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A83E51C00
        for <phone-devel@vger.kernel.org>; Wed, 30 Nov 2022 06:19:40 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h10so4315441ljk.11
        for <phone-devel@vger.kernel.org>; Wed, 30 Nov 2022 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AyScXnxFfxE24p36q1hJ+oZNMxvQckw7RZl7GmCoGro=;
        b=Q5fQyxRxJadMtMT8lfpY846f+mk3m+LAQ7EVCIu0KRuw03/rcZYEkMt6nDOg6M4vQ4
         uKFQ6ajZmn4x/cdM+Cl9myEBsjvjJH/qZU/opZCPQf/ZJbqBnExsYkCjf0AEEjZt/hNP
         UglJZtO4VUA3Uej0ojjhTLha0NfwwC62yfE/osbIBonsES/+wqNMX8noBbMDljDH6E6Q
         bQeYOjuc/vHbLw8QylzlAtnkzMdyUZ6YdCJWBuf0jjak4fLRcR9STEW5PNmeyop+VWM6
         9p5Rs7O9RbmwwiW3MXARlTsS94VToCzx4tcSRaOHl8OssNgzKLSJw+NE8T2LzXoPb1Bu
         Uw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyScXnxFfxE24p36q1hJ+oZNMxvQckw7RZl7GmCoGro=;
        b=PC3s2YHrFxMkU6/JaYQD5MBydIeP7ZrwgLBx53A3GYbiBGFZk813a9S1Lm2cvpMTrm
         mX5Xz8PVemHmO4Gik39W8TQ5maDKMJHJyQorRasVp+zlgV0FrJF6qYRHmHe3mAk4l8kw
         uKd1VsspnVmfDK84zV1yM3jxa18JNAZ2U6hZLXRTHGu7ajqqL2C8ddRWjNd9EKTs0MW9
         fzPKtsn6I+B0iprSUi3lK6s4ByS9Bvs87ACN4UwTbQXAuLCAFmUZY+OrqlBitVAy8JFX
         1Kz0PtZe0lj+bTMW3EgB+plDWeEXfaq8S6OPNv8Cs0en3X68XHbPaETDp+CVBFdkkDYG
         sypg==
X-Gm-Message-State: ANoB5plglXaNRljynJwqoR+VnrYDH6t6HDwfrLycXblDUNUEUiZUFoZJ
        wfLFLSiw7/ltCVyqsd0D19XFVQ==
X-Google-Smtp-Source: AA0mqf6IsejNi9xqYexLJpi1Obsy+wm3B/MFOlYgieClosKGVhxkQoDsC6Y4EoO5U4KwcWyGO31b6g==
X-Received: by 2002:a2e:844d:0:b0:279:c1cd:5177 with SMTP id u13-20020a2e844d000000b00279c1cd5177mr1649954ljh.357.1669817978463;
        Wed, 30 Nov 2022 06:19:38 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id x34-20020a056512132200b0048afb8b8e53sm273719lfu.80.2022.11.30.06.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 06:19:33 -0800 (PST)
Message-ID: <f0f6c137-b083-0174-9ae3-c58405a9c8d1@linaro.org>
Date:   Wed, 30 Nov 2022 15:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RESEND PATCH 2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 NFC
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221128173744.833018-1-luca@z3ntu.xyz>
 <20221128173744.833018-2-luca@z3ntu.xyz>
 <b20432e8-115c-407f-2480-6dd429ce5c25@linaro.org> <3134585.5fSG56mABF@g550jk>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3134585.5fSG56mABF@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 29.11.2022 19:31, Luca Weiss wrote:
> On Dienstag, 29. November 2022 14:29:36 CET Konrad Dybcio wrote:
>> On 28.11.2022 18:37, Luca Weiss wrote:
>>> Configure the node for the NQ310 chip found on this device, which is
>>> compatible with generic nxp-nci-i2c driver.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>> RESEND to fix Cc
>>>
>>>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>>> b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts index
>>> 2920504461d3..fde93cbcd180 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
>>> @@ -63,6 +63,21 @@ touchscreen@48 {
>>>
>>>  	};
>>>  
>>>  };
>>>
>>> +&i2c_5 {
>>> +	status = "okay";
>>> +
>>> +	nfc@28 {
>>> +		compatible = "nxp,nq310", "nxp,nxp-nci-i2c";
>>
>> Unless there was some binding change (that was not emailed to me with
>> this email, I only got 2/2), only "nxp,nxp-nci-i2c" and
>> "nxp,pn547", "nxp,nxp-nci-i2c" are allowed.
> 
> Yes, I've added the double compatible to the yaml.
> https://lore.kernel.org/lkml/20221128173744.833018-1-luca@z3ntu.xyz/
Ok, this looks good then.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>


> 
> I'll try to work on my Cc-script setup, currently it adds the output of 
> get_maintainers.pl for each patch (and adds all for the cover letter), which 
> is based on some script I found a while ago online.
> 
> Is there like a recommended way to put all people in Cc for a series, I'm not 
> aware of anything at least...
> 
> Perhaps I'll look into b4 for sending patches, that seems to have some goodies 
> there.
Check out this reply from Rob Herring here https://lore.kernel.org/lkml/CAL_JsqLubWBr2W3xZPsuPLOGav7CFgBdH=aCfT22F_m0_cx3cQ@mail.gmail.com/

Konrad
> 
> Regards
> Luca
> 
>>
>> The node looks good though.
>>
>> Konrad
>>
>>> +		reg = <0x28>;
>>> +
>>> +		interrupt-parent = <&tlmm>;
>>> +		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
>>> +
>>> +		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
>>> +		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +};
>>> +
>>>
>>>  &pm8953_resin {
>>>  
>>>  	status = "okay";
>>>  	linux,code = <KEY_VOLUMEDOWN>;
> 
> 
> 
> 
