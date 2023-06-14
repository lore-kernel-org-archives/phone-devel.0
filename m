Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9241EEB64D8
	for <phone-devel@archiver.kernel.org>; Wed, 14 Jun 2023 12:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244664AbjFNMnP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Jun 2023 08:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244309AbjFNMnO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Jun 2023 08:43:14 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52614E57
        for <phone-devel@vger.kernel.org>; Wed, 14 Jun 2023 05:43:13 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b3424edd5fso8641641fa.0
        for <phone-devel@vger.kernel.org>; Wed, 14 Jun 2023 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686746591; x=1689338591;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xr1V+LWyB4E+pek0N0wXhqnpk/YR1ub+Or3UrIkXcKI=;
        b=PGxMzcjVZYyTBmQOF9zIRR0zm+DlJgLIlP9J0TWHajoDvdi0hI0JmUEWi7thCwJVrC
         Q4K5+vhUdx49saBKXzfUrqGF8ujAsUAAie/VNrKdgtIrS6qga1jaM7Xyk6pDXUNT0yOf
         HyH7B8hmCLYmvRkxrA50SR6QS2dqi1fdvcHA02dMMnTBwJDyh2ynq5GZNfVaiRSAexN6
         NSa0h51Aa0Hpt07UiGJeQclXIC0AEaDio3FEzZlgbByyAccQneXReeXYU+l26moMhO7K
         uokJwOH9mKG66m08DRTtmqykJFWYkh9PncTjgWci07j8iDWqNjCH4ukigoJstCABVk3k
         5DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686746591; x=1689338591;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr1V+LWyB4E+pek0N0wXhqnpk/YR1ub+Or3UrIkXcKI=;
        b=gz4ZhXJXujgRwbZ9El6Zx8LYdjb12HxqPjdo572GWmYtXf3ROsn7kLaPURnhdXy4Vb
         MeN0YvCWdcF3r5gzTxSL5J3oHYRlvtExSnGUlUOVOwFdeIbT0VVGb9FpGpadVcQWSeHH
         X6ronl7Aw4JDePikULjZTCxq3CBozb613P7n+eCLhDasgXISg/ENBYALE+eG2jeYg5Cm
         98F4vjtm09wCQiQF5/tT+XzW1xxuneVymhTFt064UVQSzw50TlTq6v7rpLHTpWA+F2ga
         e1tswqq80DxM4WzxWy8sJ7XmbCK9jcWMuS1V/483xG/bCtv8YJAaNvj3PPwHnISMiEsk
         ypyg==
X-Gm-Message-State: AC+VfDy5Me7Z4L4YHnbFemjqB13c7PODTILWz1pCmCSQxZ9daVlFw7Pj
        8tbCaM8ezTzqlMJd+J2Amr5qNQ==
X-Google-Smtp-Source: ACHHUZ5S2yiBeIt59h0C1TIhl4JhTlqn2abkd9/fXxKTCTRgVVrD7qbazgxRVkXsPdlmcRQj8Y5GJw==
X-Received: by 2002:a2e:990d:0:b0:2af:bf0d:e1c8 with SMTP id v13-20020a2e990d000000b002afbf0de1c8mr6882838lji.12.1686746591578;
        Wed, 14 Jun 2023 05:43:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id h8-20020a2e3a08000000b002b200d9838bsm2480460lja.104.2023.06.14.05.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 05:43:11 -0700 (PDT)
Message-ID: <8d91dfc0-f6c0-813f-de9c-1befdd0ccfdf@linaro.org>
Date:   Wed, 14 Jun 2023 14:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8250-edo: Panel framebuffer is
 2.5k instead of 4k
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230606211418.587676-1-marijn.suijten@somainline.org>
 <974f68dc-b667-c9a7-94c4-1023ef271fab@linaro.org>
 <a69ddadd-8d59-e784-ddce-16c83a7f13a6@collabora.com>
 <kdu6apwgp7nu6mwqatufhxvnbunwodr4iu2uaqjacbjgbmmy5y@zh53imtpqfgs>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <kdu6apwgp7nu6mwqatufhxvnbunwodr4iu2uaqjacbjgbmmy5y@zh53imtpqfgs>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 14.06.2023 14:40, Marijn Suijten wrote:
> On 2023-06-07 09:15:08, AngeloGioacchino Del Regno wrote:
>> Il 07/06/23 00:52, Konrad Dybcio ha scritto:
>>>
>>>
>>> On 6.06.2023 23:14, Marijn Suijten wrote:
>>>> The framebuffer configuration for edo pdx203, written in edo dtsi (which
>>>> is overwritten in pdx206 dts for its smaller panel) has to use a
>>>> 1096x2560 configuration as this is what the panel (and framebuffer area)
>>>> has been initialized to.  Downstream userspace also has access to (and
>>>> uses) this 2.5k mode by default, and only switches the panel to 4k when
>>>> requested.
>>>>
>>>> This is similar to commit be8de06dc397 ("arm64: dts: qcom:
>>>> sm8150-kumano: Panel framebuffer is 2.5k instead of 4k") which fixed the
>>>> same for the previous generation Sony platform.
>>>>
>>>> Fixes: 69cdb97ef652 ("arm64: dts: qcom: sm8250: Add support for SONY Xperia 1 II / 5 II (Edo platform)")
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>> And so I derped again.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> I would've liked more to see a commit saying "replace simple-framebuffer with xxxx"
>> (where xxxx is DSI panel, etc) but that will as well do for now... :-)
> 
> Fwiw we could keep it around as MDSS "gracefully" takes over when it
> probes a little bit later with fbcon over DRM/KMS, and it sometimes
> helps reading what is up when something fails before or during MDSS
> probe.
I believe we should do this. Perhaps even add some early code to drm/msm
that'd read out the address (and other configuration) from the mdp hw and
set it up automagically.

Konrad
> 
> - Marijn
> 
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>>
>>> Konrad
>>>>
>>>> Changes since v2:
>>>> - Rename griffin (copy-paste from related patch) to pdx203 in comment.
>>>>
>>>>   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 7 ++++---
>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
>>>> index 3d22be747f042..8f867f841cb83 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
>>>> @@ -54,9 +54,10 @@ chosen {
>>>>   		framebuffer: framebuffer@9c000000 {
>>>>   			compatible = "simple-framebuffer";
>>>>   			reg = <0 0x9c000000 0 0x2300000>;
>>>> -			width = <1644>;
>>>> -			height = <3840>;
>>>> -			stride = <(1644 * 4)>;
>>>> +			/* pdx203 BL initializes in 2.5k mode, not 4k */
>>>> +			width = <1096>;
>>>> +			height = <2560>;
>>>> +			stride = <(1096 * 4)>;
>>>>   			format = "a8r8g8b8";
>>>>   		};
>>>>   	};
>>
