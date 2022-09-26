Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E90C32771
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 10:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbiIZKEU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbiIZKES (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 06:04:18 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F288357FC
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 03:04:16 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id c11so9338942wrp.11
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=sTAPIVJNbp4iICt5sfzGH6YEb6tzSO6KPzd55XSaBdY=;
        b=c4mAGGxhECtHjTjrRnn3HOx1EiKljfJ1NXJYEaKtgI2W3TMnIj5nbJDrkv0lDfDQTe
         9FPk9F+P8sNDeHu7vqmwLL3jQwsv5ZDk5FjYHS0YQj6EJuBex7Zafz18ORwWbqt8dZtx
         g/mScToh/dwCUDkcSGfsetgo1+AEjH2d/OjqBI6jUbGNBPCkeFa7eUDDGFmTf9Aiy0fb
         XGFVmJh9BxNerYm+4FeOdDGQEDGh9llgwwRoAjWOhjd9A2DUifpkVz3LkKBj7sgNBv9q
         pySYMYrvA7yM7PVrMv5sLTYK41F8G1u5tjR1jNWBm4a5fLWapJL9DXs2AJi5m2nwMUkv
         yG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=sTAPIVJNbp4iICt5sfzGH6YEb6tzSO6KPzd55XSaBdY=;
        b=5mPc1dVGmsjZqHJ+UNYICozkTsymccqIpUX3BVPsQWAL4Cv1LsoqQhuqjmh42xNqZu
         Od7ZD15mMuz08s1MHq/PzpVCuYcz3nTwpI7GaLEHUzZZwQT6Te35g4Ld1R3qNKtTl3fp
         QX2wZ+0VPzKEhVo8xSjHoVv6zqpS2Yyb8FoESzimfPQCoyAXpHvUwjhKX3YgwVK6SMGh
         eOdzTx5tI4xLFqenR7DjTc5+kexb2kCV31pFYzV6qssEMxt7n40Se20mOWL8v2I6Y4Rz
         ORzOV1vyRrpx6wfh8fook9h/iBxJJynZRujkcEDtNe3ECgOw+IrF057uccnXSQmWbk8E
         9cYg==
X-Gm-Message-State: ACrzQf03QGBascgXDnRC3ogbweqF9p3Ggrvx8ipY7rDoHdKKEXkY42ez
        LC6V4xB1aUAyzxJ+/aZGsLehBw==
X-Google-Smtp-Source: AMsMyM4ES3y+zy1qMG1o3vbqYnbjhuFHSDXFP/iGUf6v7wgMwvvhoB8/maq1VdkF1IcTpccGNUCYyg==
X-Received: by 2002:a5d:6d07:0:b0:22a:3f21:3b56 with SMTP id e7-20020a5d6d07000000b0022a3f213b56mr12562644wrq.679.1664186654836;
        Mon, 26 Sep 2022 03:04:14 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b003b492338f45sm12043677wmq.39.2022.09.26.03.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:04:14 -0700 (PDT)
Message-ID: <3070538e-fa8d-4506-bbf8-c2770d092eb5@linaro.org>
Date:   Mon, 26 Sep 2022 12:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <20220925210229.128462-2-luca@z3ntu.xyz>
 <ec8cc121-9814-cd52-fb49-c33ab1376f89@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ec8cc121-9814-cd52-fb49-c33ab1376f89@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 26/09/2022 11:22, Krzysztof Kozlowski wrote:
> On 25/09/2022 23:02, Luca Weiss wrote:
>> pm8941-misc should be called 'extcon' and pm8941-coincell 'charger'.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> ---
>>   arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
>> index 33517cccee01..01f14d5f314d 100644
>> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
>> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
>> @@ -27,7 +27,7 @@ pwrkey@800 {
>>   			bias-pull-up;
>>   		};
>>   
>> -		usb_id: misc@900 {
>> +		usb_id: extcon@900 {
> 
> Why? extcon is Linux specific name and should not be added to DTS.
> Anything requires it?

It matches the current dt bindings:

Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml:
<snip>
    "extcon@[0-9a-f]+$":

      type: object

      $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
<snip>

Neil

> 
> 
> Best regards,
> Krzysztof
> 

