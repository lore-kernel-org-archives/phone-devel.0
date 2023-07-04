Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9573BEB64D9
	for <phone-devel@archiver.kernel.org>; Tue,  4 Jul 2023 18:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbjGDSGZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 4 Jul 2023 14:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjGDSGY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 4 Jul 2023 14:06:24 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CFC10C9
        for <phone-devel@vger.kernel.org>; Tue,  4 Jul 2023 11:06:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so9471998e87.2
        for <phone-devel@vger.kernel.org>; Tue, 04 Jul 2023 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688493982; x=1691085982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNIWfih+PFK3OLIF8G59ioAmdnhh2DrduAI1lh/uY1U=;
        b=O94hBhVDk2edtOpkmJVM4EEoGpOXzzJ5Rg1g3pUi+QQMBdAN1my4vlUwZokzsFZJjd
         egHsvmcO3NLC0jzdPEHfzBtc5w2ZJDdyZsd/tND/3pU0S3BkZux5W9+f2c0vSevu/VYd
         Py52sSlgsSY+x4AsQqn016OpFEwdXNk7RxgGDUBdqNdU2HPOTI1jGsoj0dn7Jm5eDyWy
         YVl8UwE0tBvXHBTx6ahL+pYaRlmmEIHZlIjhVTf6BXpoTKHN3loSEzO6ee066as79jMi
         bM7U720DnZOT8VSYLUbpaXnM8Dqmr0jRvqakX+Mo7tkw8OJyci6nMm4F2nUNdvtKChKI
         lTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688493982; x=1691085982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNIWfih+PFK3OLIF8G59ioAmdnhh2DrduAI1lh/uY1U=;
        b=kO+mLbMipWHJgS+UjuxYNwQKpEegX25tHjcKMF9yztuAfrTyzT+jjNNE23Q7cY4KnW
         JCxrONojs6sFQBjJLEE+G5F2FVqgIXWYs7WGG2tzBp7p5ckpJvjy+WadX8MIr45ca1A6
         CRFbJtGWvHEG20kWm6cuL+Pi6dLrts8P6qHniTgP00aLNWtxg4pe6CbN71iXjD1UC2hO
         wtXqO8ZbOlvsfAx3iXOHWqDWvW2jnUbkA0n1J0it0UWSSKkIe0vY6kwDvOeNjntiRSex
         Zd+VR0OgCtB5eO0C45xW4PE1jtRzTmYrZtv4L/frJTExCcYvQ8twrl915MaNl2cQjbu4
         zxaA==
X-Gm-Message-State: ABy/qLYltpE7EC8PMDWrbVzK5R8R4h0m5fdjiHutrwCzZ/ncN10NMaG+
        q9/1QQ8grEbD7LZpCxIgptYX7g==
X-Google-Smtp-Source: APBJJlFpq1//36blgYI1RKgH0YiOTAjo4RhWReAooBPYyGIAbcZ28qb6BvaS4m9NBUlcEow3dp+djw==
X-Received: by 2002:a05:6512:3f1:b0:4f7:6976:2070 with SMTP id n17-20020a05651203f100b004f769762070mr8485265lfq.40.1688493981774;
        Tue, 04 Jul 2023 11:06:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y25-20020ac255b9000000b004fbb20791f3sm1456202lfg.31.2023.07.04.11.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 11:06:21 -0700 (PDT)
Message-ID: <8ba85d65-51b7-8a66-f721-edb68e7617a8@linaro.org>
Date:   Tue, 4 Jul 2023 20:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm6150: Add resin and rtc nodes
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-7-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230704163848.169853-7-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 4.07.2023 18:31, David Wronek wrote:
> Add support for the RTC which is the same as on other PMICs and add the
> resin child node to the PM6150 PON device and disable it by default.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> index 2e6afa296141..9a7c532f7a12 100644
> --- a/arch/arm64/boot/dts/qcom/pm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
> @@ -53,6 +53,14 @@ pm6150_pwrkey: pwrkey {
>  				bias-pull-up;
>  				linux,code = <KEY_POWER>;
>  			};
> +
> +			pm6150_resin: resin {
> +				compatible = "qcom,pm8941-resin";
> +				interrupts = <GIC_SPI 0x8 1 IRQ_TYPE_EDGE_BOTH>;
0x0 (GIC_SPI is a property of the ARM GIC, SPMI uses the interrupts
field in a rather hacky and specific way)

[...]

> +		rtc@6000 {
> +			compatible = "qcom,pm8941-rtc";
> +			reg = <0x6000>, <0x6100>;
> +			reg-names = "rtc", "alarm";
> +			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
IRQ_TYPE_EDGE_RISING

Konrad
> +		};
> +
>  		pm6150_gpios: gpio@c000 {
>  			compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
