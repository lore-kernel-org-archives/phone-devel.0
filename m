Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98252C001B0
	for <phone-devel@archiver.kernel.org>; Tue, 27 Jun 2023 20:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjF0UvB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Jun 2023 16:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjF0Uu6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Jun 2023 16:50:58 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B622919A9
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 13:50:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f86dbce369so6885554e87.0
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687899055; x=1690491055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7YRn2Ql253Qd3RuometLtXbYmsBE972h8wXY4rZFeI=;
        b=sCObIklLxiAMjnOKSwhjb14UqHeEu/5/np/ljjhZOMGZUW/RQ/LFSMhHq6cdFveBgp
         17tanj1A6mvxqRKxihuoJTGCrKnKmTlSotypzhZakKIH+C3SxfXCzEkujXIcTpXdvV1D
         H6mOHB1nWuORY652G+nhTsjwdHsJln4rLuOe40I0qpi8iTU1Y61t79U/YcTmHZ2fATq9
         /dv4mKFjCEHMUVev97DN9Sziha1j8TiRsIJRS7mPlGdXRD+VpJtmb5UBEiAU8FkqBFry
         cEsQ7l9QC1Iv1txl3BSB4pvvCrpEzn4uzdBRNJmDmpXHBJvZB5am6GgPsRuTnCZkBe+7
         LGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687899055; x=1690491055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7YRn2Ql253Qd3RuometLtXbYmsBE972h8wXY4rZFeI=;
        b=Rm0OXSiUc6z7Jvt93NIXiOPniMtShGXz+Vmc0tYkCx8O5ClNnA2T/tYL8OPfPL68MY
         4t/OVt0FQrgy9K8xPHxc8aTQy3MHX/R/imb8goyR2odAC03FX9DeZIRJ9lm78phiPSZM
         ITDnf/+HWPCVF//uOXO5NoopDBk7P08OF1cO7lL5+AZZUlteSxMeSzx2kpsFW29ghJyf
         JWHNm0bJqSMRmkmbVIXquSfafcblsS4NBXCgIMQ/ax7SwMogy9kVwd4luj/qZVgcPnU0
         cHN0IuYUFM/P4BWltdtAsGM3md6Tqv81H9yjaAh8DDlfL22fjduDR4ZmMPdGWZRJHbix
         LcSw==
X-Gm-Message-State: AC+VfDxj3TFzdfqp6xsG5v5t9sTRJQ3LPr9OzYX2ChqHunIiVtIKX7c/
        +PYw9AMtbUNpU9hGTyzfiwnz3myT00dTt4/6N84=
X-Google-Smtp-Source: ACHHUZ7MdkJZfcyEUu5CzdxDWVAeTR1oUCUmjQDxMVLw+JaxMHfJHhxiTGplkyMA4dpmBKEBe3qJOg==
X-Received: by 2002:a05:6512:36c2:b0:4fb:52f1:9ab4 with SMTP id e2-20020a05651236c200b004fb52f19ab4mr4758694lfs.50.1687899054905;
        Tue, 27 Jun 2023 13:50:54 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id r15-20020ac252af000000b004fb78959218sm774277lfm.200.2023.06.27.13.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 13:50:54 -0700 (PDT)
Message-ID: <51953ba5-c24f-eba2-2eda-675933987789@linaro.org>
Date:   Tue, 27 Jun 2023 22:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974: sort nodes by reg
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230627-msm8974-sort-v1-0-75c5800a2e09@z3ntu.xyz>
 <20230627-msm8974-sort-v1-2-75c5800a2e09@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-msm8974-sort-v1-2-75c5800a2e09@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27.06.2023 21:45, Luca Weiss wrote:
> Some nodes weren't sorted by reg, so fix that now. Now all nodes inside
> /soc should be sorted correctly.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
might conflict with Dmitry's SAW/SPM changes

https://lore.kernel.org/linux-arm-msm/20230625202547.174647-1-dmitry.baryshkov@linaro.org/T/#maf3c226ca76f1dee37464c465c2429d9bb1dcbb3

still

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 70 ++++++++++++++++----------------
>  1 file changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index c6475837eda3..9aa8f9a273a8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -334,6 +334,12 @@ apcs: syscon@f9011000 {
>  			reg = <0xf9011000 0x1000>;
>  		};
>  
> +		saw_l2: power-controller@f9012000 {
> +			compatible = "qcom,saw2";
> +			reg = <0xf9012000 0x1000>;
> +			regulator;
> +		};
> +
>  		timer@f9020000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> @@ -393,52 +399,46 @@ frame@f9028000 {
>  			};
>  		};
>  
> -		saw0: power-controller@f9089000 {
> -			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> -			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
> -		};
> -
> -		saw1: power-controller@f9099000 {
> -			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> -			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
> -		};
> -
> -		saw2: power-controller@f90a9000 {
> -			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> -			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
> -		};
> -
> -		saw3: power-controller@f90b9000 {
> -			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> -			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
> -		};
> -
> -		saw_l2: power-controller@f9012000 {
> -			compatible = "qcom,saw2";
> -			reg = <0xf9012000 0x1000>;
> -			regulator;
> -		};
> -
>  		acc0: power-manager@f9088000 {
>  			compatible = "qcom,kpss-acc-v2";
>  			reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
>  		};
>  
> +		saw0: power-controller@f9089000 {
> +			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> +			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
> +		};
> +
>  		acc1: power-manager@f9098000 {
>  			compatible = "qcom,kpss-acc-v2";
>  			reg = <0xf9098000 0x1000>, <0xf9008000 0x1000>;
>  		};
>  
> +		saw1: power-controller@f9099000 {
> +			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> +			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
> +		};
> +
>  		acc2: power-manager@f90a8000 {
>  			compatible = "qcom,kpss-acc-v2";
>  			reg = <0xf90a8000 0x1000>, <0xf9008000 0x1000>;
>  		};
>  
> +		saw2: power-controller@f90a9000 {
> +			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> +			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
> +		};
> +
>  		acc3: power-manager@f90b8000 {
>  			compatible = "qcom,kpss-acc-v2";
>  			reg = <0xf90b8000 0x1000>, <0xf9008000 0x1000>;
>  		};
>  
> +		saw3: power-controller@f90b9000 {
> +			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
> +			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
> +		};
> +
>  		sdhc_1: mmc@f9824900 {
>  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
>  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
> @@ -1051,6 +1051,15 @@ kpss_out: endpoint {
>  			};
>  		};
>  
> +		bimc: interconnect@fc380000 {
> +			reg = <0xfc380000 0x6a000>;
> +			compatible = "qcom,msm8974-bimc";
> +			#interconnect-cells = <1>;
> +			clock-names = "bus", "bus_a";
> +			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> +				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
> +		};
> +
>  		gcc: clock-controller@fc400000 {
>  			compatible = "qcom,gcc-msm8974";
>  			#clock-cells = <1>;
> @@ -1069,15 +1078,6 @@ rpm_msg_ram: sram@fc428000 {
>  			reg = <0xfc428000 0x4000>;
>  		};
>  
> -		bimc: interconnect@fc380000 {
> -			reg = <0xfc380000 0x6a000>;
> -			compatible = "qcom,msm8974-bimc";
> -			#interconnect-cells = <1>;
> -			clock-names = "bus", "bus_a";
> -			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> -				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
> -		};
> -
>  		snoc: interconnect@fc460000 {
>  			reg = <0xfc460000 0x4000>;
>  			compatible = "qcom,msm8974-snoc";
> 
