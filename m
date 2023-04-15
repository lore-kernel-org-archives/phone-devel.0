Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CEAC77B76
	for <phone-devel@archiver.kernel.org>; Sat, 15 Apr 2023 10:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjDOKmB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 15 Apr 2023 06:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjDOKlt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 15 Apr 2023 06:41:49 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1449EF3
        for <phone-devel@vger.kernel.org>; Sat, 15 Apr 2023 03:41:36 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2a76535995dso3033941fa.0
        for <phone-devel@vger.kernel.org>; Sat, 15 Apr 2023 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555294; x=1684147294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OE0tiBedvvvMl7tGzJDJSOxX+DvzTjuV5LZpnvcNSA=;
        b=BTN6+yhtvhXDPIzJuF1zJSeIWVBMAs90iKQ6yQz0rBheHMw/XHG536+/6Fij0xIJHF
         iwsJhezVlfZ+NUj4X0IrOtddXKlTIEGtKAdnGJvv4xNfXaKOYdrgbTwPy/WkRT/bExG7
         gBHBcAPOL/BVFvq8Lvfe1xQ6kqAW8JiGxac3GddmiTBgdvfex85w3ewzLEC+qNl1HMOW
         lTDjJs9SfKkCXpoeZx6cKHaFukaVfW17p4dH+MXW60sSLa1bXT1z8zrp8EFeXZkAcelt
         jnYJbOOKXKrwJonOjgLOxF3ZS6Paxl/uC1UKpqC5Kr/O3hFuC8/j4Fey6Y0C0wjIVeqa
         60sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555294; x=1684147294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OE0tiBedvvvMl7tGzJDJSOxX+DvzTjuV5LZpnvcNSA=;
        b=KgJDlPM9h6Mab7uFrmVCNFc4A7M6ZPpV8GAwZ0EaFTsvoFU+dpae1/868P/meQaoR9
         f8aTNVrs8iKA12vIyi/RhGO5iSwtK6GwmhNUrXK5ld2dnNRLIYpcXIIDE4eVo0zCQyrI
         XllWKxR52m69IRJy2FzAul55K8ffC4nHITBYDf8UkywmIKFYotTQGfWwf5NpdyphsY0M
         qysgPK3e/eTIciNXl48SkOgZ84Y2RPKpY+cjHzm3EnS/x+7IRKo9qxzi4XSSJG+p72fe
         vkvXUpwe/uYGGV5G6PKSVSPF9vxLmRH78vcpRWfN3YuXXM1k+XN/L0nZy7psPSbNtiA0
         ph1w==
X-Gm-Message-State: AAQBX9fUM9oj0DyaH8U2NddxIcHMGPT7r5rr42LavHAH82rzYhxMmFVI
        Dwh/8KEuiJnATO0HfzORindf6Q==
X-Google-Smtp-Source: AKy350ajyPgQvIV0O8hiDt6qZRVc1die/WObUcgV4uGq1lLwbb9wAc87RJ1NTklugxdFcuEUrDMQdA==
X-Received: by 2002:ac2:5633:0:b0:4ec:8853:136 with SMTP id b19-20020ac25633000000b004ec88530136mr405409lff.12.1681555294309;
        Sat, 15 Apr 2023 03:41:34 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id s21-20020a2e2c15000000b002a76e690aa9sm1266974ljs.73.2023.04.15.03.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 03:41:33 -0700 (PDT)
Message-ID: <1125104e-802a-b582-e279-fd4e9dd1bf97@linaro.org>
Date:   Sat, 15 Apr 2023 12:41:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230415020222.216232-1-joelselvaraj.oss@gmail.com>
 <20230415020222.216232-4-joelselvaraj.oss@gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230415020222.216232-4-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 15.04.2023 04:02, Joel Selvaraj wrote:
> Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
> touchscreen. Also add pinctrl configurations needed for touchscreen.
> These are common for both the tianma and ebbg touchscreen variant.
> In the subsequent patch, we will initially enable support for the focaltech
> touchscreen used in the EBBG variant. This is done in preparation for that.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
Bit weird to add everything except the touchscreen, but okay..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../qcom/sdm845-xiaomi-beryllium-common.dtsi  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 5ed975cc6ecb..b34ba46080ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -268,6 +268,10 @@ &gmu {
>  	status = "okay";
>  };
>  
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  
> @@ -376,6 +380,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &sdhc_2 {
>  	status = "okay";
>  
> @@ -481,6 +489,35 @@ sdc2_card_det_n: sd-card-det-n-state {
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	ts_int_default: ts-int-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-pull-down;
> +	};
> +
> +	ts_reset_default: ts-reset-default-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-high;
> +	};
> +
> +	ts_int_sleep: ts-int-sleep-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	ts_reset_sleep: ts-reset-sleep-state {
> +		pins = "gpio32";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
>  };
>  
>  &uart6 {
