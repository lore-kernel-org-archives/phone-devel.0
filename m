Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B236CDB47E
	for <phone-devel@archiver.kernel.org>; Fri, 13 Oct 2023 23:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjJMXNh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Oct 2023 19:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbjJMXNg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Oct 2023 19:13:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDA9BF
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 16:13:33 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507975d34e8so2032322e87.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Oct 2023 16:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697238812; x=1697843612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjdlyeP+tUZpGPJVvoQ6uVyAvLdwDdzr6rSJ+TTmEaM=;
        b=prXNXxrlJtgmjrwcXp953ZszfYnKQxJmltegBCuRxdPk/o0PmmVIwTpbEYtd/E49I2
         5UOKEkXPfx9tYAs6ak1y87RVKRJ1qEXP5do5cfj0i4g75c7CuHO8OLHk9evIll8VviL1
         1/cVOOArST/puCa1Mf+0yBuDKGAxWzVGXak/hNLMDjZ9NdHCXk/1e6IVZuRfzY8BQW9w
         CM33bUT/GMOWRE1suA61IuMScZJFb2Nfpvu+UXA/ci6pUaQPt8qsLR1gCJaqyuhmOIMT
         9Rzf3RpFCmIOemjOzMKBoNDGjdiylrLDRDM5euIxP3hnt30vElXO8QiDKHUPtHuFuLI8
         sTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697238812; x=1697843612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjdlyeP+tUZpGPJVvoQ6uVyAvLdwDdzr6rSJ+TTmEaM=;
        b=kZRbhCB/A9kP0Q5BZ+7uggvFrKq8PCzFeiOu0lHk8Ifc2BsufOfB9hzyLhPprIFoty
         zcLts3447066hS5TM4+sFUY826JFvYmB8Nr24Zp9gNuxEbZHuPR0ywFH7RI2TVxtvoo0
         zWV7pcF+9QfUSlyaK5hu4OyRAxl7OJHShtVrUlTB37zYV3SpSmRw98O2jHITw2lP87lM
         htJLyd/a9QB7UGjc5pIw3O9mxlW2dp7dnFlVQgfwpr13F+tQe0CiUHLT35URhf/qCchh
         RGuIrCsh7r/2jkybBg9+rFB9emMv6P9Zdb2svdIqH4ROMyKfRCAdRefZe1IPbwpnly1W
         m/og==
X-Gm-Message-State: AOJu0YwTxNmdEEGRiHz4ABJDBQ+5lV5GTn0WjZs7oawdvRwVFnKu3aRh
        ugGzKHPS3l+vylbtiLyBAK2V+g==
X-Google-Smtp-Source: AGHT+IG+1u/Gyc5mY1nzfYdzpFrgx1R5i2vWat40BYSCFhJKS40jsgZI8VENFkur0qpscTHcSRPQQg==
X-Received: by 2002:a19:f015:0:b0:4fb:9168:1fce with SMTP id p21-20020a19f015000000b004fb91681fcemr21779934lfc.59.1697238812075;
        Fri, 13 Oct 2023 16:13:32 -0700 (PDT)
Received: from [192.168.4.141] (178235177169.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.169])
        by smtp.gmail.com with ESMTPSA id r1-20020ac24d01000000b005042ae2baf8sm3553655lfi.258.2023.10.13.16.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 16:13:31 -0700 (PDT)
Message-ID: <34da335e-cbcd-4dc2-8a86-f31369db1fcd@linaro.org>
Date:   Sat, 14 Oct 2023 01:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PM7325
 thermals
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org
References: <20231013-fp5-thermals-v1-0-f14df01922e6@fairphone.com>
 <20231013-fp5-thermals-v1-4-f14df01922e6@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231013-fp5-thermals-v1-4-f14df01922e6@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13.10.2023 10:09, Luca Weiss wrote:
> Configure the thermals for the QUIET_THERM, CAM_FLASH_THERM, MSM_THERM
> and RFC_CAM_THERM thermistors connected to PM7325.
> 
> With this PMIC the software communication to the ADC is going through
> PMK7325 (= PMK8350).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 117 +++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2c01f799a6b2..d0b1e4e507ff 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -9,6 +9,7 @@
>  #define PM7250B_SID 8
>  #define PM7250B_SID1 9
>  
> +#include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> @@ -137,6 +138,20 @@ afvdd_2p8: regulator-afvdd-2p8 {
>  	};
>  
>  	thermal-zones {
> +		camera-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pmk8350_adc_tm 2>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
are

> +		rear-cam-thermal {

> +					temperature = <125000>;
you

> +		sdm-skin-thermal {

> +					temperature = <125000>;
sure

about these temps?

Konrad
