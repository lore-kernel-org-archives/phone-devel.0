Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C846C6FA8E
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbiIZIpC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbiIZIpA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:45:00 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91894140F5
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:44:58 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id n12so9032666wrx.9
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=Q2VHep0+S40i1p+8tHTWFQVTsADjWZtNk4KlaS/+6IU=;
        b=B8wU22HEQEXAoRs+kdf3JbXUeTaSc0ydIHClfeu61HSRqXlKiO8URjQP6ty6JInOBt
         Pd0eXvz1Blg1WTYNtiUJ1NFcEzg+5tpRi7VNdCULHguXlxxFbumUm+oA2YjDh96nGLQf
         vO1PwqMjzefS9TEIpW4j9k7nPUewthEUaOvHxku+wmvIsyXze8g7XVy1nZxKEmiIwoop
         2CN5fQK0OA4psjRdAx4AintQNC7X3WDmMPbHBgVmqmByn8FGx2/LYYxS1TU2LqHxNzSQ
         PKQI2wAjxOBptEccG+I0XibmnO8TblKFc1oEuSo6CTm8+MiEg/QxAoButs3/06SXg3IS
         9Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Q2VHep0+S40i1p+8tHTWFQVTsADjWZtNk4KlaS/+6IU=;
        b=NBbnBAwSkqoDQEg/lKjK1gkDqHbFx/51zYqQLyow3nxFQOTPZJtZXh1QVUC6ryZHLA
         GodCK5iNFJBQfpO8rSjBFamd48k9EtHBCv7pnyecoGU9DQ3kw8/Wtxxrchp9KFrN/gt/
         fnffzjeNe946wIcKzHNkUd3jADc7YoRq9YK9bvmyE+iBtL9feqQBDbSqaq1kQE8MXsKc
         FBUD1YiPmXwuPy+B2L9f8F0Vr7744GKxi84r0GF5hUfB1vahibWBiTwM65cIYIc8Bm2u
         7cmV0V4oXOZFV/phcfIJKX9DyRHbaAQMJhijo8FrDZyC1oZejEUko+TxEgVT6eOjPKYd
         b/uQ==
X-Gm-Message-State: ACrzQf37KgLXygF3FYEcX5GoDkG0NJ505roXWTOzVShOfjjDjzMeVc9N
        3WB7tZ15/N+59XBXXeeD+pltKA==
X-Google-Smtp-Source: AMsMyM6QE5gySzzoBXOvadp7NTp1YMUx5JraXDuA/09ie0hE1RG7ZEgUl3WI1WJ8+id0uyygQ7DlKw==
X-Received: by 2002:a05:6000:14c:b0:22a:c14a:29f8 with SMTP id r12-20020a056000014c00b0022ac14a29f8mr12623103wrx.588.1664181897129;
        Mon, 26 Sep 2022 01:44:57 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id ba30-20020a0560001c1e00b00228655a5c8fsm13767785wrb.28.2022.09.26.01.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:44:56 -0700 (PDT)
Message-ID: <638ca37e-2d2f-0247-8584-01002dea7e06@linaro.org>
Date:   Mon, 26 Sep 2022 10:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: pm8941: fix vadc channel node names
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161821.78030-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925161821.78030-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 18:18, Luca Weiss wrote:
> Node names for the channel are supposed to be adc-chan@REG.
> 
> Use this format and at the same time sort the nodes by reg value.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pm8941.dtsi | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 9cd49deb9fa7..3c15eecf2f21 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -101,26 +101,33 @@ pm8941_vadc: adc@3100 {
>   			#size-cells = <0>;
>   			#io-channel-cells = <1>;
>   
> -			bat_temp {
> -				reg = <VADC_LR_MUX1_BAT_THERM>;
> +
> +			adc-chan@6 {
> +				reg = <VADC_VBAT_SNS>;
>   			};
> -			die_temp {
> +
> +			adc-chan@8 {
>   				reg = <VADC_DIE_TEMP>;
>   			};
> -			ref_625mv {
> +
> +			adc-chan@9 {
>   				reg = <VADC_REF_625MV>;
>   			};
> -			ref_1250v {
> +
> +			adc-chan@10 {
>   				reg = <VADC_REF_1250MV>;
>   			};
> -			ref_gnd {
> +
> +			adc-chan@14 {
>   				reg = <VADC_GND_REF>;
>   			};
> -			ref_vdd {
> +
> +			adc-chan@15 {
>   				reg = <VADC_VDD_VADC>;
>   			};
> -			vbat_sns {
> -				reg = <VADC_VBAT_SNS>;
> +
> +			adc-chan@48 {
> +				reg = <VADC_LR_MUX1_BAT_THERM>;
>   			};
>   		};
>   

Here aswell, I don't see where this is required, bindings doesn't mandate this naming:

patternProperties:

    "^.*@[0-9a-f]+$":
Neil
