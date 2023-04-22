Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07344C77B7F
	for <phone-devel@archiver.kernel.org>; Sat, 22 Apr 2023 09:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjDVJ4l (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 22 Apr 2023 05:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjDVJ4j (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 22 Apr 2023 05:56:39 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8843199F
        for <phone-devel@vger.kernel.org>; Sat, 22 Apr 2023 02:56:37 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ec81779f49so2641916e87.3
        for <phone-devel@vger.kernel.org>; Sat, 22 Apr 2023 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682157396; x=1684749396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDQgb0udGi4TgE1jwB/Uj7tuQtIfaUvyOe998bYU7/g=;
        b=PeyUjnRlP+n1PSyJQg8r/o4a3qsGPFuQeRlzl3dNs8XBPOq63Kp24A2TnJH+iSjJmA
         0OdvWXXAu3dl6WqC+hWIvz2SworqCPnLLJ0aDIDoev0s4BiveJ+7Uj8AtATn81OoZziD
         5Zr6Nuwo/XTa4hJNPgSS/PBuwT5FKswlkSKTQX/YYcJUADyjlnpr8pqylvaLUV8Ccja/
         CvR9VGSAX2zDkMzmVJNKop3bEcHtFcKe8XDujzJVkZhbQmwHMGR4Yj+E4aVV5W0IkXuk
         o7S3fS59b54kJiPxVkGsmDg8J6VwgLJmZoskjSBFWNt2VmBwYuTN5McfR5bsUz3o7+qZ
         EgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682157396; x=1684749396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDQgb0udGi4TgE1jwB/Uj7tuQtIfaUvyOe998bYU7/g=;
        b=eDsnwxd1LXr0W14WfYcOQWhOYUUxxoSbXiPgnfSIT9K7J5T7yiDvq82J5wANhjZD4c
         NW8XO+jLG4Ki4EEPGfPULcc0X5mb9JujKhKmkisfXiFA7teQrjFYmO0V8yvyvtA7IFBK
         KB7cLuHdQ2OYFShNgyMYrKuIBcfazXSq7DquJ3ym9+xub2nD9nxRkvKDbE1Ufe00bGuB
         EoQme13kv9KKynou0wg2KCls6vafNrteXtRl4QakSGUQcGIbnrgIfmcXiGpeTgG/KFjY
         3Dw9hglcdtYyezC8I/WolgShKzUY8/3hE4V0MoNefeGNwKE9Gz8OtVGykkR2NegsxvYz
         m0CA==
X-Gm-Message-State: AAQBX9dexBct5qfawcZlXHXPmng2vEW+1vyERkbhGo0HM8NJ58kDCWUp
        GyNdFbiZVOEXdMk9XiYbnAW5mp3g8vC/fa7iuQI=
X-Google-Smtp-Source: AKy350ba+xIzdatXazTSlEA/wKsneXtw4QIKpv/3TBdA/Kc+aOgterKahyAD8iJ0SzPHXPwb3CXICQ==
X-Received: by 2002:ac2:46cf:0:b0:4e8:d733:fde6 with SMTP id p15-20020ac246cf000000b004e8d733fde6mr2005270lfo.60.1682157396034;
        Sat, 22 Apr 2023 02:56:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512024a00b004edc3bd7fa1sm837323lfo.201.2023.04.22.02.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 02:56:35 -0700 (PDT)
Message-ID: <ff2dd271-71f7-47e0-b200-4edd2d692e71@linaro.org>
Date:   Sat, 22 Apr 2023 11:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8953: add GPIOs
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230421-pm8953-gpio-v1-0-3d33e2de47e3@z3ntu.xyz>
 <20230421-pm8953-gpio-v1-3-3d33e2de47e3@z3ntu.xyz>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230421-pm8953-gpio-v1-3-3d33e2de47e3@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 21.04.2023 23:56, Luca Weiss wrote:
> Add a node for the GPIOs found on the pm8953.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm8953.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8953.dtsi b/arch/arm64/boot/dts/qcom/pm8953.dtsi
> index a1d36f9ebbd2..2268daf27fa7 100644
> --- a/arch/arm64/boot/dts/qcom/pm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8953.dtsi
> @@ -79,6 +79,16 @@ rtc@6000 {
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
>  		};
> +
> +		pm8953_gpios: gpio@c000 {
> +			compatible = "qcom,pm8953-gpio", "qcom,spmi-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			gpio-ranges = <&pm8953_gpios 0 0 8>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>  	};
>  
>  	pmic@1 {
> 
