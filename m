Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3A9C77B7C
	for <phone-devel@archiver.kernel.org>; Wed, 24 May 2023 19:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236120AbjEXTxd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 24 May 2023 15:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbjEXTxc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 24 May 2023 15:53:32 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CF2F5
        for <phone-devel@vger.kernel.org>; Wed, 24 May 2023 12:53:31 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6cbdf16d2so834835e9.2
        for <phone-devel@vger.kernel.org>; Wed, 24 May 2023 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684958009; x=1687550009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKLOePL4OAg+r6dzbxYL4zr/grlcbs4JHq6CfesRtKs=;
        b=HtyvFiuXmlulj52UN8WIibnuu+FrhAeSp5F31Y7UJ1Tf4FZvQh2gkfMpcLvQeMkfH3
         uhgkzkjO20sQe8gp54PaVJC5LnOHKU883099+t1dllJXJhsS/NZmtD97wjaF4PCyu/JR
         IxELgR7otGPzMu29SAfuJwV2anzgUwEjKijZmZYfNp23VeBDjmYYktlOPY+YvAKnY0fs
         GVSEztu9is9+XP8uDkN0rv110AdvW854KGp2f1/VhgYXrsKt/FX33uxRzqUU3VxYmPVp
         2hngPYDcFSahFXYDhsGf8FbIlfjm/zAGDQPC7HrLkkcCmqJUSn9K90qmtfrmeC93k4iz
         Pbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684958009; x=1687550009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKLOePL4OAg+r6dzbxYL4zr/grlcbs4JHq6CfesRtKs=;
        b=BAjAWGJVh2qGSR1xvv9+EcBFGddX2CzawIjdYgXpkLpPH/4zHpKaYpvpgCU8y+VA/m
         YiVwy2QxKqNwYx9zCC/mH9xuZfeTkPpHudvKNVSz4/HKxLZvfqVyV7vQeBePW23rDYDa
         OMq3TAr3uwSoJU1rFl3b2WWBG7XstHRSmIn43uDi2p//FHWAFbau4lnWpYJkIrXVbqqP
         hvvdBLGdztph4H0S1ndZDlWzvKMpkFrRFl+vxDDPF4VkQUTmvGbvh4Rc1W5XJhgTiw9+
         edgNEYr4lirSp7opht75k/XXXw4uhZP2kpCMxOpuhKvjxtAAX789dUoNXd3eOk6YE4tW
         uVmA==
X-Gm-Message-State: AC+VfDwxUuTAxiiWkkAcM6BdGkQs90mGCouLNJJXmp58VclDFdv5Heog
        aOt5UMtGJg4c56WMB/SoK/60dw==
X-Google-Smtp-Source: ACHHUZ513A1o+GABKQdBT4cMLxgaoiizyUUbRxyVFc1B1mscQGNfU1woLTJxy3gSqifY/56qoHw/aA==
X-Received: by 2002:a7b:c302:0:b0:3f6:8af:414 with SMTP id k2-20020a7bc302000000b003f608af0414mr540499wmj.30.1684958009550;
        Wed, 24 May 2023 12:53:29 -0700 (PDT)
Received: from [192.168.0.79] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b003f60514bdd7sm3481249wmi.4.2023.05.24.12.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:53:29 -0700 (PDT)
Message-ID: <221cbac5-c882-0f5f-0b5b-d1fc9cadc2d7@linaro.org>
Date:   Wed, 24 May 2023 20:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: qcom,spmi-pmic: Document pmi8998
 charger
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
 <20230524-cache-gonad-fde614bbea50@spud>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230524-cache-gonad-fde614bbea50@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 24/05/2023 20:02, Conor Dooley wrote:
> Hey Caleb,
> 
> On Wed, May 24, 2023 at 06:38:52PM +0100, Caleb Connolly wrote:
>> Document the new pmi8998 charger bindings
> 
> This commit message looks a bit odd compared to the contents of the
> diff. Did you forget to git add something?

Well, it's not my finest commit message... The binding is in the series
linked in the cover letter (or [1]), I missed this addition when sending
that.

Would it be better to just squash this patch into the bindings and
respin the other series?

[1]:
https://lore.kernel.org/linux-arm-msm/20230524-pmi8998-charger-v8-0-b87ffcd9864d@linaro.org/
> 
> Cheers,
> Conor.
> 
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index 36de335a33aa..44590dc112be 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -133,6 +133,7 @@ patternProperties:
>>      oneOf:
>>        - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
>>        - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
>> +      - $ref: /schemas/power/supply/qcom,pmi8998-charger.yaml#
>>  
>>    "gpio@[0-9a-f]+$":
>>      type: object
>>
>> -- 
>> 2.40.1
>>

-- 
// Caleb (they/them)
