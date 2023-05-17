Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE307C77B75
	for <phone-devel@archiver.kernel.org>; Wed, 17 May 2023 19:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjEQTHP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 17 May 2023 15:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjEQTHO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 17 May 2023 15:07:14 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838A41FF7
        for <phone-devel@vger.kernel.org>; Wed, 17 May 2023 12:07:12 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96b4ed40d97so180401966b.0
        for <phone-devel@vger.kernel.org>; Wed, 17 May 2023 12:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684350431; x=1686942431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjU63skqCTcgfqPTFoQRuF0AORaTbY/dYzoZwYojga4=;
        b=z3HRdzYzgb7UjvGGZLE0de4RfGjaC3dI0a5ll2R9nl/7xPCLVCo6CX8Q+/eerHdHrA
         4tmNsl3Sx/I7IroS6mDSOx6dq1wo8qrru60XTcxUHwPGg3yeYmf7tgbXlZgiAvrioC2T
         diG3ZxUu5VsXgk41DBmU10v8tBjqQAvrecXI6ZsAkiU4yTYwMXO86rxvoVH0fwYSkgrj
         IF85hR4z3BqaWt1enBIlbjTdw9ii3619h0krlsqr+NNP6I1hQjehH0zS0c1gADaIBKg7
         97WLq08U44+9SpvlzXtiT44t7eFJdS0f9+qxVOxWiO+f16TT67aOJtSm9Axabe69fh0P
         BJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350431; x=1686942431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjU63skqCTcgfqPTFoQRuF0AORaTbY/dYzoZwYojga4=;
        b=dZvsfTNMEY/H5FmYeB7YUzkqYAvdDeBgcp8X+9zJ8fjlTShanzAcFgpzYmKXPlRsL9
         xGsp9fbU3MwmKCwTQtg1X8CLfpdH4oVhOspz1FuXbq1GuNy0O++nhiIqxvo57iDSO63Y
         9y8Jpa8g477FeALxJ5azEQXIdX6SidsWNk58NPsXM6gYqrCaT9ARtX6wJO1SpV7Mer7a
         og5tIkwy13s5gVHQpOF2jCLIpoTHZDyobCsTOCbNfnWl64OjmRcGaufMivz1RsktNzug
         GmRP98R8IqaW+szDCXI+PhaKBQdD+eQqmSguuy/sN1r+mu1zrxsk0dKOmaev570e4ITs
         0aXw==
X-Gm-Message-State: AC+VfDyAGlBRz5yuRCoja2a4gUaVOi7HcyOFVEbt3J8yjeUFs5qaJJHE
        eETu6CR6CaC+E4MCLM5i3U3Zrw==
X-Google-Smtp-Source: ACHHUZ5B92EqkTOQwxl3OS8GU6Zy19JKsxA9kUMtqvA27n8/1/XjFdFaEe6RdAnyp6Qb4IEtOSqE5Q==
X-Received: by 2002:a17:907:7b98:b0:947:55ad:dd00 with SMTP id ne24-20020a1709077b9800b0094755addd00mr40841052ejc.26.1684350430968;
        Wed, 17 May 2023 12:07:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7a:e7cc:21b3:c435? ([2a02:810d:15c0:828:d7a:e7cc:21b3:c435])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b009534211cc97sm12663542ejc.159.2023.05.17.12.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 12:07:09 -0700 (PDT)
Message-ID: <a10695f5-e7d6-7fac-695c-a5b1c17ad56a@linaro.org>
Date:   Wed, 17 May 2023 21:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: pmi8998: add flash LED
To:     Dylan Van Assche <me@dylanvanassche.be>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        amartinz@shiftphones.com
References: <20230517182133.72590-1-me@dylanvanassche.be>
 <20230517182133.72590-2-me@dylanvanassche.be>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517182133.72590-2-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 17/05/2023 20:21, Dylan Van Assche wrote:
> Qualcomm PMIC PMI8998 has a 3 channel flash LED driver which is used
> by many phones for 1 or 2 flash LEDs. Each LED can be used in flash mode
> or torch mode. Add the flash LED node to PMI8998 DTS.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index ffe587f281d8..89f959353ad5 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -60,6 +60,12 @@ pmi8998_lpg: pwm {
>  			status = "disabled";
>  		};
>  
> +		pmi8998_flash: led-controller@d300 {
> +			compatible = "qcom,spmi-flash-led";

This cannot be alone.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

