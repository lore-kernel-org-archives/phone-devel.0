Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24D4C7EE2F
	for <phone-devel@archiver.kernel.org>; Mon, 29 May 2023 09:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjE2Jao (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 29 May 2023 05:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbjE2Jan (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 29 May 2023 05:30:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB62B2
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 02:30:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so3244680e87.1
        for <phone-devel@vger.kernel.org>; Mon, 29 May 2023 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685352639; x=1687944639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KyHfudo4b5TFn5O3tYqPvRN35MhP/kAWViGgyfDq0OE=;
        b=sol+0yQVe6Uw//FE4mNQqqhzK+yc7QOnajXBLFZxWk4duvYv2iXjZyrZffs1+e0UlX
         Je8gBQ8Ed+RqRxzwMGonZTuZ2hU49b2WG+ySsPgCwq5uFiBWErxSFVIxjRk7DbjFF5Ik
         V2pLtmuiSw9/oZxhOijBBgP1zsDwDKYOil16R8yQ6JAla8pe9xS1mMjBlxoNnnWg5JBH
         RM0gCLjmcrPIAWdIhewsqXC9GkGMPF0hk688nKfWe7626A1ydVwCi9CEuBPIJpHwe4Sm
         uqjbUEBtJl2B5mHO+9+qisISqkqLRGp7AeHqM8ShmepP+vz5X+oYsx6070VGx0+Vvko7
         /ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685352640; x=1687944640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyHfudo4b5TFn5O3tYqPvRN35MhP/kAWViGgyfDq0OE=;
        b=Wdm1Po11qL1XnbTkjTaPfcTBAWOYmCOhI2jNepRmiCXuz1CN4AHyxkrxF3V7vz6x7R
         8dWqD2yoI94qORCLOzhX20r9qhgtq0Wwdj/fdkoqfFFmHf6YcAl3veattKpSCgGr75FH
         M1/h35SeaNhp6c//ohBuCuThX3Ga5zMz8iG3nVFofeIPQKqJVzih59h/UOxe8phCRUaG
         L5khnTkdzu3var3ugdcY8io/7Y3jDclSrIG9o+e2sve5BYAEhypuQB32zGnR/WMb0Ehn
         j2gVCeDC4KF22zMNcKdwkpNZVQvTl0RWlP16z+o0RPndcpdH9b7GlNwBeoxfGuZUFyMl
         DaKg==
X-Gm-Message-State: AC+VfDyl18kqLIrmw1kNoIGfNWxytMMnhpoFma50+36Aj/9kcu6lQVNz
        ckT9JqrvggNQTls2xaZG3tpCDA==
X-Google-Smtp-Source: ACHHUZ5k9o8butmOUqb926RoVGoX0+CW/fSe3h4lLMdHZKYr1xAJD8lHZYjb0pffs8nWmV0yvg9ndQ==
X-Received: by 2002:a19:750e:0:b0:4f3:80a3:b40a with SMTP id y14-20020a19750e000000b004f380a3b40amr2937493lfe.69.1685352639705;
        Mon, 29 May 2023 02:30:39 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24469000000b004eb274b3a43sm1892015lfl.134.2023.05.29.02.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 02:30:39 -0700 (PDT)
Message-ID: <dc9442f4-d1c5-37f1-a8be-d19162cd0dbe@linaro.org>
Date:   Mon, 29 May 2023 11:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] soc: qcom: ocmem: Add OCMEM hardware version print
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230509-ocmem-hwver-v2-1-8c8793a07dfc@z3ntu.xyz>
 <cac92fae-310f-79b1-7204-ac9deb2c3319@linaro.org>
 <2680722.mvXUDI8C0e@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2680722.mvXUDI8C0e@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 29.05.2023 10:38, Luca Weiss wrote:
> On Freitag, 26. Mai 2023 21:39:44 CEST Konrad Dybcio wrote:
>> On 23.05.2023 22:32, Luca Weiss wrote:
>>> It might be useful to know what hardware version of the OCMEM block the
>>> SoC contains. Add a debug print for that.
>>>
>>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>>> ---
>>> This patch is depends on [0] but could also be applied in the other
>>> order, if conflicts are resolved.
>>>
>>> [0]
>>> https://lore.kernel.org/linux-arm-msm/20230506-msm8226-ocmem-v1-1-3e24e27
>>> 24f01@z3ntu.xyz/ ---
>>> Changes in v2:
>>> - Use FIELD_GET macros for getting correct bits from register (take
>>>
>>>   wording from mdp5: major, minor, step which hopefully is sort of
>>>   accurate)
>>
>> Qualcomm uses that (or that-ish) nomenclature for many hw blocks, so
>> it's likely spot on.
>>
>>> - Link to v1:
>>> https://lore.kernel.org/r/20230509-ocmem-hwver-v1-1-b83ece3f2168@z3ntu.xy
>>> z ---
>>>
>>>  drivers/soc/qcom/ocmem.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
>>> index c3e78411c637..9f7c3348cbb9 100644
>>> --- a/drivers/soc/qcom/ocmem.c
>>> +++ b/drivers/soc/qcom/ocmem.c
>>> @@ -76,6 +76,10 @@ struct ocmem {
>>>
>>>  #define OCMEM_REG_GFX_MPU_START			0x00001004
>>>  #define OCMEM_REG_GFX_MPU_END			0x00001008
>>>
>>> +#define OCMEM_HW_VERSION_MAJOR(val)		FIELD_GET(GENMASK(31, 28), val)
>>> +#define OCMEM_HW_VERSION_MINOR(val)		FIELD_GET(GENMASK(27, 16), val)
>>> +#define OCMEM_HW_VERSION_STEP(val)		FIELD_GET(GENMASK(15, 0), val)
>>> +
>>>
>>>  #define OCMEM_HW_PROFILE_NUM_PORTS(val)		FIELD_GET(0x0000000f, (val))
>>>  #define OCMEM_HW_PROFILE_NUM_MACROS(val)	FIELD_GET(0x00003f00, (val))
>>>
>>> @@ -355,6 +359,11 @@ static int ocmem_dev_probe(struct platform_device
>>> *pdev)> 
>>>  		}
>>>  	
>>>  	}
>>>
>>> +	reg = ocmem_read(ocmem, OCMEM_REG_HW_VERSION);
>>> +	dev_dbg(dev, "OCMEM hardware version: %ld.%ld.%ld\n",
>>
>> reg is an unsigned long (u32), this should probably be %u
> 
> I can make it %lu, just %u gives me this warning
Right, grumpy compilers care about types that have been meaningless for
longer than I've been alive.. 

Konrad
> 
> drivers/soc/qcom/ocmem.c:363:22: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'long unsigned int' [-Wformat=]
>   363 |         dev_dbg(dev, "OCMEM hardware version: %u.%u.%u\n",
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Will send a v3 with that.
> 
>>
>>> +		OCMEM_HW_VERSION_MAJOR(reg), OCMEM_HW_VERSION_MINOR(reg),
>>> +		OCMEM_HW_VERSION_STEP(reg));
>>
>> Nit: one per line would make this the tiniest bit easier to read
> 
> ack
> 
> Regards
> Luca
> 
>>
>> Konrad
>>
>>> +
>>>
>>>  	reg = ocmem_read(ocmem, OCMEM_REG_HW_PROFILE);
>>>  	ocmem->num_ports = OCMEM_HW_PROFILE_NUM_PORTS(reg);
>>>  	ocmem->num_macros = OCMEM_HW_PROFILE_NUM_MACROS(reg);
>>>
>>> ---
>>> base-commit: 8705151771af822ac794b44504cd72eebc423499
>>> change-id: 20230509-ocmem-hwver-99bcb33b028b
>>>
>>> Best regards,
> 
> 
> 
> 
