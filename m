Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ADEC7EE24
	for <phone-devel@archiver.kernel.org>; Tue,  2 May 2023 10:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbjEBKjh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 May 2023 06:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbjEBKjQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 2 May 2023 06:39:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8971D10CA
        for <phone-devel@vger.kernel.org>; Tue,  2 May 2023 03:39:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f00d41df22so27393590e87.1
        for <phone-devel@vger.kernel.org>; Tue, 02 May 2023 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683023953; x=1685615953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfApgfkvfKa0zHY7COCQ25fltZLWlP80il9qIf2gk38=;
        b=i/VabHSiZcXg+qtH7T6Zx/wUpNCbz5CC7Y/wzTiHYu4jVuPlfKQPFc3Iq2UR0mc/cf
         3XF3U8tNh+1Keb3TKi0Awm4wfDctOlRxXJQ0AAnHTWymY34R+PYWcOSE7WZq8y9K5XN+
         QqfRHhdxpkkv45U9C2cZU96bjMveYgTmEWWcBhurZCAKtonLtUHz1rsTOhVLeE11afbF
         28H/YsGYHl8nwIKeCqjkGkUO51rMlDez/ZwMCUjhKqjuiQ39UVJi5aeWs/jEOyT5fcxR
         t0pdes+teZYn40Uu1dfokTvAxReMsY10GxF5q0e/LXS+nvl06gQpaoLshwOVmCSzJJH+
         28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683023953; x=1685615953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfApgfkvfKa0zHY7COCQ25fltZLWlP80il9qIf2gk38=;
        b=REBMvy9CpS7118ohekQ2eTWXuOPvXAUxr1uQq7hTGW5qCWAW1C7wEaJltljoPNynuj
         9FIb9NMzmfTiXIbW2CZnygXcNu3yTx0axBDwGJxR3Wor1yQgOLc+kbYR4e33xCrS7L+w
         T6H7v7XiHoXSP+23z7ee67Bbtj26Sfxh7g1bvabJtFN7J3NMNorQU2Nw6spKuWqM7hG3
         j7zH436s6x9gdDkqzGGdu2UizjynLe713WwJjN/wd0hRbLO1kO4Y4fUUvfQzvNZt4kDR
         pNa84WmluVexfn7FU0XqxlPcqD5oF2s1Gl82eu4lpkHQOVoyRcSejhjb47wPltwP1rRF
         Cp4g==
X-Gm-Message-State: AC+VfDxqm6wNE1suttK2SFSaZ+VeoYpqsf72M5FUBrzbgPZEgKDpOpUC
        kVdPTu7NLPe7rsF3Vnsrh8GLOQ==
X-Google-Smtp-Source: ACHHUZ4ibU291EnaEYZSAU8X9eaDv/XrNqaT8luwOQFNrvkj6gGfjpZyNvAi/9lSSfCRUw4pKQxbJg==
X-Received: by 2002:ac2:44a2:0:b0:4ec:9310:ad4e with SMTP id c2-20020ac244a2000000b004ec9310ad4emr4833335lfm.33.1683023952816;
        Tue, 02 May 2023 03:39:12 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id w3-20020ac254a3000000b004f0c9120a41sm1349688lfk.214.2023.05.02.03.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:39:12 -0700 (PDT)
Message-ID: <8a54d0ec-8a22-9ffd-43a4-55da988fbeb1@linaro.org>
Date:   Tue, 2 May 2023 12:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/4] Input: pwm-vibra - add support for enable GPIO
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, Brian Masney <bmasney@redhat.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-3-e87eeb94da51@z3ntu.xyz> <ZEsFV6F4CEh2/av8@x1>
 <8250064.NyiUUSuA9g@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8250064.NyiUUSuA9g@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 28.04.2023 18:06, Luca Weiss wrote:
> On Freitag, 28. April 2023 01:29:27 CEST Brian Masney wrote:
>> On Thu, Apr 27, 2023 at 10:34:28PM +0200, Luca Weiss wrote:
>>> Some pwm vibrators have a dedicated enable GPIO that needs to be set
>>> high so that the vibrator works. Add support for that optionally.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>
>> Hi Luca,
>>
>> Thank you for picking up this work!
>>
>>> +	vibrator->enable_gpio = devm_gpiod_get_optional(&pdev->dev, 
> "enable",
>>> +							
> GPIOD_OUT_LOW);
>>> +	err = PTR_ERR_OR_ZERO(vibrator->enable_gpio);
>>> +	if (err) {
>>> +		if (err != -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "Failed to request enable 
> gpio: %d\n",
>>> +				err);
>>> +		return err;
>>> +	}
>>> +
>>
Looks like your email client messes with the replies.. perhaps it tries
to round them to n characters forcefully?

Konrad
>> Take a look at dev_err_probe() to remove the -EPROBE_DEFER check.
> 
> The input subsystem doesn't like dev_err_probe for some reason, you should 
> quickly find examples of that being rejected on the mailing list (or see   
> "git grep dev_err_probe drivers/input/")
> 
>>
>> With that fixed:
>>
>> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Thanks for the reviews!
> 
> 
