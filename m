Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343ADC3DA6E
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 15:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiLQPEY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiLQPEX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 10:04:23 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDFAE0D3
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 07:04:20 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id y25so7698302lfa.9
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 07:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fyQwYotwFo1Kdd3TcYj4RcjJFej1hnlZ4LHTPyy+j+w=;
        b=yKDOg0iOz8aWkF1+IMWego2W/bWGiArJesQTAtUgW65j8ZHfOu0qZ9jSJfsJAhECYT
         W4rD6HxpFqRfakp8VTJnGhh6ftpSq8sbEvIMYD0Wz37KzCibJVWqb3ilcGCp1m8iPoLf
         nWiduzZfM9s/gFzCvBPwnSdOw42O0vpleFBxMN/wamWSvEMBYdXRe2RO6XQrMWC84RvM
         +mAu3N/NlsBrQaIIliSVFh/bktm38Pg8hp6ZCRGJ/m1sBh9iUhZq8senySYjRuPCyvGE
         ttSPap5yuDDAE9iJuToTnwHN8UrOWjuu9EDiwf2pEcXAeuXOzZ8afSwvaqB9DxTBxOLv
         F9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyQwYotwFo1Kdd3TcYj4RcjJFej1hnlZ4LHTPyy+j+w=;
        b=0zKupWJstQc5dJU5NU/Go14H6YIcW7f9KchuQ+Y5bkL6tNsCx7QCfNU3jx5WwXuPMx
         ncWYWmQYahL0gRibUJTMycvB32UrhfAs6G+/GU+jTIaXUBJbn6cbq2QpFZxvorMjA11F
         nyZveyaAvZ82Oc8pWRpr1Pu0wa/4OON3ISA8i4BmnYJhqSZpRMtOLDb9sUY0wxYCvEMn
         UlWbqJaq7U0nVvNyhnxyADeD60Sri5/ifKcBHYXoND8Qd95M831t8z2yd579Kpzqwd22
         al2/3pebdfLyY1h3PASgqE4F5oClyGMDi3Mc/NNsFfecPGLMtlCUoCDbnl4oqiLsbmMf
         VdmQ==
X-Gm-Message-State: ANoB5plFAubFPmHR3Bsq3G5r6H6yoRm+RX2R9VJxbt5sLYPC3RiMKR3L
        K0ICIK8rm+90PWi2+uLNuLc42w==
X-Google-Smtp-Source: AA0mqf5pCMMfp2ZmMFhqcQt8HIDrPtQG40+9L6xOvOth/N/wgUZdVsdomUJF2saefgPyykgUAes8bw==
X-Received: by 2002:ac2:4283:0:b0:4a4:68b7:deb7 with SMTP id m3-20020ac24283000000b004a468b7deb7mr9908501lfh.19.1671289459199;
        Sat, 17 Dec 2022 07:04:19 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id n7-20020ac242c7000000b00499bf7605afsm530708lfl.143.2022.12.17.07.04.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:04:18 -0800 (PST)
Message-ID: <11174eb6-0a9d-7df1-6f06-da4010f76453@linaro.org>
Date:   Sat, 17 Dec 2022 16:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-seine: Clean up gpio-keys
 (volume down)
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221217100455.52593-1-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217100455.52593-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 17.12.2022 11:04, Marijn Suijten wrote:
> - Remove autorepeat (leave key repetition to userspace);
> - Remove unneeded status = "okay" (this is the default);
> - Allow the interrupt line for this button to be disabled;
> - Use a full, descriptive node name;
> - Set proper bias on the GPIO via pinctrl;
> - Sort properties.
> 
> Fixes: 82e1783890b7 ("arm64: dts: qcom: sm6125: Add support for Sony Xperia 10II")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 20 ++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 1b9e40d3d269..8c7c9331fd21 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -41,17 +41,17 @@ extcon_usb: extcon-usb {
>  	};
>  
>  	gpio-keys {
> -		status = "okay";
>  		compatible = "gpio-keys";
> -		autorepeat;
> +		pinctrl-0 = <&gpio_keys_state>;
> +		pinctrl-names = "default";
>  
> -		key-vol-dn {
> +		key-volume-down {
>  			label = "Volume Down";
>  			gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
> -			linux,input-type = <1>;
>  			linux,code = <KEY_VOLUMEDOWN>;
> -			gpio-key,wakeup;
>  			debounce-interval = <15>;
> +			linux,can-disable;
> +			gpio-key,wakeup;
>  		};
>  	};
>  
> @@ -270,6 +270,16 @@ &sdhc_1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <22 2>, <28 6>;
> +
> +	gpio_keys_state: gpio-keys-state {
> +		key-volume-down-pins {
I see no need for defining a wrapper node.
The other changes look good!

Konrad
> +			pins = "gpio47";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +			input-enable;
> +		};
> +	};
>  };
>  
>  &usb3 {
