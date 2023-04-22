Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BCFC6FD18
	for <phone-devel@archiver.kernel.org>; Sat, 22 Apr 2023 12:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjDVMDD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 22 Apr 2023 08:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDVMDC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 22 Apr 2023 08:03:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA501E69
        for <phone-devel@vger.kernel.org>; Sat, 22 Apr 2023 05:03:00 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4efea4569f5so237706e87.3
        for <phone-devel@vger.kernel.org>; Sat, 22 Apr 2023 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682164979; x=1684756979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMpowFFCWmM3rVMyXfWNb/dLjegfYdzz7y/Qzjd515w=;
        b=asLj9VLy8P3Y58bBWycscKgWy2tu0GhHMrGwj6GeKRghTEArysetbEHTP6cLhJrwAo
         mnhYJp6SHzs0m6a1I7ZQHaewhcqiH1HMGH+etz6RsrNUNiH+uqg5Hd12XlZ0JeNlXT6N
         A/nAf6OKdO8nfNw1Dk6UIxpLhC9IN957sozdiGsjLzZ7HqUH0lH9jguAfzZz5dNVMKEU
         675CVLKzUgid3s41+EIQwu8gQRPbDc8PU8dTshwn5De3mRzf/yqJQAeel+Hpi8W5eRq4
         ZAmSOf1Ql6rSbmGdGS9Rdi0jvwDjPS+Tx+Cy8v18hBWuYFXmnWbLVN3DE/nBQ1vapk+y
         kB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682164979; x=1684756979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMpowFFCWmM3rVMyXfWNb/dLjegfYdzz7y/Qzjd515w=;
        b=gxgmWcwq7ni7XtcTD68sgXP6j/Qaeaih534aJVMCmpcuLBJQGvFKXaia3qXCA1NXen
         9bshe7T7MMtPcD9qFAGkjMMBJM5XaNP1TEfQrcass/UZRPDngeiIMMEvddXwcJgd6EGY
         eKPK8Lbe2D6uzCfBwY5xBAkfPcc3k0LbdZ/eKzX5NNGbC7ni6NQZ7rVeZcb84pup1a6f
         3XAjpCDH5QOWSwxHf8RZQmGe5noTGq6i9GyWHwdBz0LxtdllzebkTgYBaWAri/Jc/2km
         0VagWW23VjCwKgDMe/aSGrnNfVQ2kllyUPTNMv6rYnpL/kCOcKgwa6Nnc5zdhhdROnln
         VvXQ==
X-Gm-Message-State: AAQBX9cRGUq8LE55WNoS1aRe4rkLLeFEp59oe42H0tA0ptWoPAp4bnm8
        XQBbgWIRQikQwaLS0+G8ZHgc31cXDXohjwQiYts=
X-Google-Smtp-Source: AKy350b48bJnbPxK8Ol5pthEK65hc0r6cDf5IGtM0H/TGDsEa5YleAfBhwrSrPh6CK1XZohjbp473g==
X-Received: by 2002:ac2:44cc:0:b0:4ed:c4c7:e63a with SMTP id d12-20020ac244cc000000b004edc4c7e63amr1994193lfm.6.1682164979188;
        Sat, 22 Apr 2023 05:02:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id z6-20020ac24186000000b004edc0fc3c35sm884804lfh.5.2023.04.22.05.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 05:02:58 -0700 (PDT)
Message-ID: <bfd77567-9375-2bd6-2f4e-df0c2ba8fe2f@linaro.org>
Date:   Sat, 22 Apr 2023 14:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: Add BLSP DMAs for I2C
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230422-msm8953-blsp-dma-v1-1-0024801bb587@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230422-msm8953-blsp-dma-v1-1-0024801bb587@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 22.04.2023 13:39, Luca Weiss wrote:
> MSM8953 has two DMA controllers for the various I2C, SPI and UART
> busses. Add the nodes and configure all the I2C nodes so that the driver
> can use the DMA.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 48 +++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 602cb188a635..c9b589353918 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1274,6 +1274,19 @@ opp-200000000 {
>  			};
>  		};
>  
> +		blsp1_dma: dma-controller@7884000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x07884000 0x1f000>;
> +			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			num-channels = <12>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,num-ees = <4>;
> +			qcom,controlled-remotely;
> +		};
> +
>  		uart_0: serial@78af000 {
>  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
>  			reg = <0x078af000 0x200>;
> @@ -1292,6 +1305,8 @@ i2c_1: i2c@78b5000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			dmas = <&blsp1_dma 4>, <&blsp1_dma 5>;
> +			dma-names = "tx", "rx";
>  
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_1_default>;
> @@ -1310,6 +1325,8 @@ i2c_2: i2c@78b6000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
> +			dma-names = "tx", "rx";
>  
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_2_default>;
> @@ -1328,6 +1345,9 @@ i2c_3: i2c@78b7000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
> +			dma-names = "tx", "rx";
> +
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_3_default>;
>  			pinctrl-1 = <&i2c_3_sleep>;
> @@ -1345,6 +1365,9 @@ i2c_4: i2c@78b8000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP1_AHB_CLK>;
> +			dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
> +			dma-names = "tx", "rx";
> +
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_4_default>;
>  			pinctrl-1 = <&i2c_4_sleep>;
> @@ -1355,6 +1378,19 @@ i2c_4: i2c@78b8000 {
>  			status = "disabled";
>  		};
>  
> +		blsp2_dma: dma-controller@7ac4000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x07ac4000 0x1f000>;
> +			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP2_AHB_CLK>;
> +			clock-names = "bam_clk";
> +			num-channels = <12>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,num-ees = <4>;
> +			qcom,controlled-remotely;
> +		};
> +
>  		i2c_5: i2c@7af5000 {
>  			compatible = "qcom,i2c-qup-v2.2.1";
>  			reg = <0x07af5000 0x600>;
> @@ -1362,6 +1398,9 @@ i2c_5: i2c@7af5000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP2_QUP1_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP2_AHB_CLK>;
> +			dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
> +			dma-names = "tx", "rx";
> +
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_5_default>;
>  			pinctrl-1 = <&i2c_5_sleep>;
> @@ -1379,6 +1418,9 @@ i2c_6: i2c@7af6000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP2_QUP2_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP2_AHB_CLK>;
> +			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
> +			dma-names = "tx", "rx";
> +
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_6_default>;
>  			pinctrl-1 = <&i2c_6_sleep>;
> @@ -1396,6 +1438,9 @@ i2c_7: i2c@7af7000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP2_QUP3_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP2_AHB_CLK>;
> +			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
> +			dma-names = "tx", "rx";
> +
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_7_default>;
>  			pinctrl-1 = <&i2c_7_sleep>;
> @@ -1413,6 +1458,9 @@ i2c_8: i2c@7af8000 {
>  			clock-names = "core", "iface";
>  			clocks = <&gcc GCC_BLSP2_QUP4_I2C_APPS_CLK>,
>  				 <&gcc GCC_BLSP2_AHB_CLK>;
> +			dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
> +			dma-names = "tx", "rx";
> +
>  			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&i2c_8_default>;
>  			pinctrl-1 = <&i2c_8_sleep>;
> 
> ---
> base-commit: 347e9b4e41bfff51993807962eb1082f6d8ab439
> change-id: 20230422-msm8953-blsp-dma-1174277859f2
> 
> Best regards,
