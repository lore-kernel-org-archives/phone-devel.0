Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34739C6FD1F
	for <phone-devel@archiver.kernel.org>; Mon, 13 Mar 2023 15:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjCMPpa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Mar 2023 11:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCMPp3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Mar 2023 11:45:29 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB59F360B7
        for <phone-devel@vger.kernel.org>; Mon, 13 Mar 2023 08:45:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z5so13071192ljc.8
        for <phone-devel@vger.kernel.org>; Mon, 13 Mar 2023 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678722325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/tx4J6LJimmOalWj5bK2cKRpn0NIEM6z3rrObStaYA=;
        b=Ya6YjiCHxnUQfVRSZBJJBiXWXj/k+vMAMip290SDX1t1E+Mpq2ahwSuTyxkXsvdJUU
         P37COhxgFaDM1j+SaRPssUYIUGKSyIL1aWTdSO7fyEMpRbE57rk2QMiuMC1BZMd1u3BQ
         W55H46dz8MAYQDDQeSaJ0igdH6NjPrHIOAu6ZRt9MiWKnARGPPZ9jrci0vI1NN6Jzapo
         Tzyt1/G/qlkZN5p24YYHI5n77ug5G3uNwIw8c9wTtgL5PZA5VEEf5F3MRKqVIosmpLWj
         nQFaQdedqLdgJThvop0rlTh2Qo3zf/CsIuzs1zpwn2197HgsD/AmLRtScJqvC2WRiVWB
         pHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678722325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/tx4J6LJimmOalWj5bK2cKRpn0NIEM6z3rrObStaYA=;
        b=eRABqmqUjHAry6NGjlq7boUKFI0L2o3TEtys5VnNgX/BoDSbYQ5qWZBeo2ASHTA3Qw
         PgA6Dv5lrO2yQCXtenUrSCaHRRSFWsiz1IcTAtszNGfG9sR8jZXAEAwhprV1MS6lj26A
         8m8e6eY8Z5FzHlB6eNZl5ZdWjb2vUijhQ4lee3Ev+ZOPrHH2m1YRvIrbyg555mvFXKbn
         I7wHWn4lEYEX91u8ypNhESXsrtEevQA/FAcZDHaGsgCBn5djqt67lugF7LB5+bEMzoL9
         YbEV9Y9Gp7cn9hAre4oMbyYYikQK2Qqvb7ndUbwzD/WNm3jYowtfiZsGVAxkZWbNj3+h
         CHfg==
X-Gm-Message-State: AO0yUKUUb6B6SHM+L2Yg9Agfy+WulL3yI8eFTXI7hYQTCTtXytkS/ZB0
        q8v576nXDLX6HHzJ4OuuIphbsg==
X-Google-Smtp-Source: AK7set99IMiMkFYO61NIAvCQKMsK1kLV8VnRO2EYGJDE55ut0yKSLyZJp7D/M6exdw1vpZfmhZVAnA==
X-Received: by 2002:a2e:b94a:0:b0:293:1565:4353 with SMTP id 10-20020a2eb94a000000b0029315654353mr10480143ljs.10.1678722325079;
        Mon, 13 Mar 2023 08:45:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e87d3000000b002959b1162f0sm35426ljj.96.2023.03.13.08.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 08:45:24 -0700 (PDT)
Message-ID: <9305de1e-1ee7-af9f-80b8-ee013108b131@linaro.org>
Date:   Mon, 13 Mar 2023 16:45:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: add
 notification LED
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230313154226.136726-1-joelselvaraj.oss@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230313154226.136726-1-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 13.03.2023 16:42, Joel Selvaraj wrote:
> The Poco F1 has a single color white notification LED. Enable the
> Qualcomm Light Pulse Generator (LPG) driver based notification LED.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in v2: (No functional changes)
> - Fixed the inconsistency in the commit title prefix
> - Minor update to commit message.
> 
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index e0fda4d754fe..9d11502e5e0e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -2,6 +2,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
> @@ -322,6 +323,16 @@ vol_up_pin_a: vol-up-active-state {
>  	};
>  };
>  
> +&pmi8998_lpg {
> +	status = "okay";
> +
> +	led@5 {
> +		reg = <5>;
> +		color = <LED_COLOR_ID_WHITE>;
> +		function = LED_FUNCTION_STATUS;
> +	};
> +};
> +
>  &pmi8998_wled {
>  	status = "okay";
>  	qcom,current-boost-limit = <970>;
