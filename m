Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7963EC47089
	for <phone-devel@archiver.kernel.org>; Wed,  7 Dec 2022 08:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiLGIyd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 7 Dec 2022 03:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiLGIxo (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 7 Dec 2022 03:53:44 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7516D2F023
        for <phone-devel@vger.kernel.org>; Wed,  7 Dec 2022 00:51:28 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id i15so15733224edf.2
        for <phone-devel@vger.kernel.org>; Wed, 07 Dec 2022 00:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqiGB1qJo9i4koQEznwBgARqYhiQjawzilyF1S0bHz0=;
        b=wsHiGoBkGiPkzXqlVpyDN2/RMMe2GW3aN+QhETuRef17+VhfDR9NfC7Kw5j0MF5Xpa
         TqmDEw2O8IffSj2VHuUXm9iiSuSwILYc+FSv478+5PIvl9NSQXOq9mba98wIexLCyYB+
         KaNP+koWBDEfaPpMHSF3CB6a6/npu2ofBSEAJ1rOHVVbrS2YUyvmMoGYPyjQ/7w0ltRZ
         7byp9rRO4DYe+U0iYr4uQolUGnjfYx/z1ThfuoGiSDLGVkE1avZg/NlBgG8AFOfAhWPh
         /onJqmHr+moB1qLDV3kFyC8Ua/4d4ogE2rU4lqwB2NPG3jfS6RcicEUBoeapVqUjg2Tb
         yqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yqiGB1qJo9i4koQEznwBgARqYhiQjawzilyF1S0bHz0=;
        b=Yey08g9+KrQq6/xGjv6GLsDklyk0VGtbcz/LLKhE6TjG6eaiHP3PVfKuTNOFKqkdzT
         jrXW8us72oB4u4GfNoAPwg6VmMPYSL3UqCK/+pBVBjZqqk4FN/Yqc+2ULJ3KKztx3yil
         mD5qXsxixWfJkktqt2ObQintmvdwzvXRK27ugdlVaiVHOfyt5MoVSX6zm8Y4cMieBVEb
         GY6Fhesc/V1DMdvmivx0HWfpnkvsm/A0CN59ieO1JqXK33u+BMXlT30FqGLDs7vfTtH5
         A1fq50viNedFAGi0MeGsqnerpRua8SNBO6HkAuV5WNWoqlMfi/5cw1hSZmrLVC9VKBN8
         7aOw==
X-Gm-Message-State: ANoB5plbRyvhH8MNf+infDGwY7whGmU1Xglyt25fwH8EyR3Brlu+iVYV
        CSYxj+Y3C2CrxvVAyQtJaOSvwy2kIBfz0iCN
X-Google-Smtp-Source: AA0mqf4cJuZ4p+FwV2w7V2vdjr+9c6izYEMwlgbF5R3fZ2L2kiE8ij15YV0H5jQgD8QD4jZoerSqhA==
X-Received: by 2002:a05:6402:1f87:b0:468:7df:c38c with SMTP id c7-20020a0564021f8700b0046807dfc38cmr15246278edc.150.1670403086998;
        Wed, 07 Dec 2022 00:51:26 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id a2-20020a170906684200b007bf71053d97sm8328805ejs.40.2022.12.07.00.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 00:51:24 -0800 (PST)
Message-ID: <50e6cc79-d2ca-7e7e-c7e0-f0561af40c96@linaro.org>
Date:   Wed, 7 Dec 2022 09:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221207084045.270172-1-luca.weiss@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221207084045.270172-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 07/12/2022 09:40, Luca Weiss wrote:
> The PMK8350 (which is actually a PMK8003) is used for the RTC and has
> ADC for thermals.
> 
> Since the adc_tm compatible used in PMK8350 is not yet supported, skip
> configuring that and the associated thermal zone for now.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index c456e9594ea5..df05e5dc8696 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -5,7 +5,11 @@
>   
>   /dts-v1/;
>   
> +/* PMK8350 (in reality a PMK8003) is configured to use SID6 instead of 0 */
> +#define PMK8350_SID 6
> +
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -13,6 +17,7 @@
>   #include "pm6150l.dtsi"
>   #include "pm6350.dtsi"
>   #include "pm7250b.dtsi"
> +#include "pmk8350.dtsi"
>   
>   / {
>   	model = "Fairphone 4";
> @@ -426,6 +431,20 @@ conn-therm@1 {
>   	};
>   };
>   
> +&pmk8350_rtc {
> +	status = "okay";
> +};
> +
> +&pmk8350_vadc {
> +	adc-chan@644 {
> +		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "xo_therm";
> +	};
> +};
> +
>   &qupv3_id_1 {
>   	status = "okay";
>   };
