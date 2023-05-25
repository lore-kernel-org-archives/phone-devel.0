Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAC3C77B7E
	for <phone-devel@archiver.kernel.org>; Thu, 25 May 2023 23:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241745AbjEYXjy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 25 May 2023 19:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241648AbjEYXjv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 25 May 2023 19:39:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3628212F
        for <phone-devel@vger.kernel.org>; Thu, 25 May 2023 16:39:49 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af2e1725bdso3575611fa.0
        for <phone-devel@vger.kernel.org>; Thu, 25 May 2023 16:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685057987; x=1687649987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3ShwMSx7Uo4NT4nhrrIA5wjOwvMR7I73Ygk+ShVDI8=;
        b=g/i9fav5m2QDxpBgCAs52QBCggiW5t0N9Dl9y/a81ODrgx+XfMQvxqdKQdFJaQu0Rg
         f+ZAqBVd3HsY4l2IPebxNmeh04i5EEUQkkimcZH3uSLbw9nZ1V5AS+rItivqKzsZzCNc
         g50hOyRJ5xlXA6uBhLhJe+Mc3DIqveib01Z2dxHFC17Xa5rnQvN9zdYyNeQHd0CQgBvq
         2RYxtBtIxDEOUXwmGhIh+46FYhnHvJLa13uyaBTylvDK3x4B+6y+sxxSo6A+ZiQgsn6K
         ht4UeTu68dge2pqM03orfXkr5C8tC13NVRqzS4ZmvkO5Wf0AnaMZ27eysq92e7cAEeYo
         YqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685057987; x=1687649987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3ShwMSx7Uo4NT4nhrrIA5wjOwvMR7I73Ygk+ShVDI8=;
        b=JVYBAsPCi52RsVJvQi/gnDDHzo1ZsM4b1pEsqTJDepsR3rIdImIvsRNicS9lls+4r6
         9i/reF9mzDpNWqux+g9lNjvdclRA9sVcub5t/aEMA59mPwX4Qs7gWW3E1s7NGwZ20s8k
         JT6aZulz9WSvOCvcuAcwYAguX8Y7e2EBdO3CO9jG4bewiY5zhnUYJ+8Am8OnAUdYW260
         vK9I4IV6411oZjr25xdg5lTJLAX982JWhH24D8rrHbcwSs6JjdltDu9Erq6zMVrvUYbn
         2Pbs6Oh2/GIuWUsemBdoOtvXzONqlcGzlEnvc3Cd3HlqHy0KnbN9dPupnzrFgw0EvZTA
         ixQg==
X-Gm-Message-State: AC+VfDy/DYbE4qxymtnYXz3Jc7i/rGrvliiCxRyBMFNzkvBf+87ziX1g
        ub8/CuzDsDq1ViA6e1hQkAAL2g==
X-Google-Smtp-Source: ACHHUZ4dG/us25PBxwby+47FvpimKaqgiXwMzX9fQaa/ANCtEgtlZuH7c4RAlNOPbmyNzbTmM6As/Q==
X-Received: by 2002:a2e:b625:0:b0:2ad:9edd:4e2 with SMTP id s5-20020a2eb625000000b002ad9edd04e2mr1273646ljn.20.1685057987456;
        Thu, 25 May 2023 16:39:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e9c18000000b002a8ae16ac8csm437988lji.18.2023.05.25.16.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 16:39:47 -0700 (PDT)
Message-ID: <ea53525b-749b-25e2-6dde-662a8e273597@linaro.org>
Date:   Fri, 26 May 2023 01:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8916-pm8916: Mark always-on
 regulators
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230510-msm8916-regulators-v1-0-54d4960a05fc@gerhold.net>
 <20230510-msm8916-regulators-v1-8-54d4960a05fc@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230510-msm8916-regulators-v1-8-54d4960a05fc@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 17.05.2023 20:48, Stephan Gerhold wrote:
> Some of the regulators must be always-on to ensure correct operation of
> the system, e.g. PM8916 L2 for the LPDDR RAM, L5 for most digital I/O
> and L7 for the CPU PLL (strictly speaking the CPU PLL might only need
> an active-only vote but this is not supported for regulators in
> mainline currently).
Would you be interested in implementing this?

Ancient downstream defines a second device (vregname_ao) and basically
seems to select QCOM_SMD_(ACTIVE/SLEEP)_STATE based on that..

Looks like `struct regulator` stores voltage in an array that wouldn't
you know it, depends on the PM state. Perhaps that could be something
to explore!

Konrad

> 
> The RPM firmware seems to enforce that internally, these supplies stay
> on even if we vote for them to power off (and there is no other
> processor running). This means it's pointless to keep sending
> enable/disable requests because they will just be ignored.
> Also, drivers are much more likely to get a wrong impression of the
> regulator status, because regulator_is_enabled() will return false when
> there are no users, even though the regulator is always on.
> 
> Describe this properly by marking the regulators as always-on.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts     | 5 -----
>  arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> index ab8dfd858025..1c5d55854893 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> @@ -358,11 +358,6 @@ pm8916_l17: l17 {
>  	};
>  };
>  
> -&pm8916_s4 {
> -	regulator-always-on;
> -	regulator-boot-on;
> -};
> -
>  &sdhc_1 {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
> index b38eecbd6253..64d7228bee07 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
> @@ -72,11 +72,13 @@ pm8916_rpm_regulators: regulators {
>  		pm8916_s3: s3 {
>  			regulator-min-microvolt = <1250000>;
>  			regulator-max-microvolt = <1350000>;
> +			regulator-always-on; /* Needed for L2 */
>  		};
>  
>  		pm8916_s4: s4 {
>  			regulator-min-microvolt = <1850000>;
>  			regulator-max-microvolt = <2150000>;
> +			regulator-always-on; /* Needed for L5/L7 */
>  		};
>  
>  		/*
> @@ -93,6 +95,7 @@ pm8916_s4: s4 {
>  		pm8916_l2: l2 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
> +			regulator-always-on; /* Needed for LPDDR RAM */
>  		};
>  
>  		/* pm8916_l3 is managed by rpmpd (MSM8916_VDDMX) */
> @@ -102,6 +105,7 @@ pm8916_l2: l2 {
>  		pm8916_l5: l5 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
> +			regulator-always-on; /* Needed for most digital I/O */
>  		};
>  
>  		pm8916_l6: l6 {
> @@ -112,6 +116,7 @@ pm8916_l6: l6 {
>  		pm8916_l7: l7 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
> +			regulator-always-on; /* Needed for CPU PLL */
>  		};
>  
>  		pm8916_l8: l8 {
> 
