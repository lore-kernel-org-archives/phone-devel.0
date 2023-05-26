Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32466C7EE2E
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 00:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbjEZA3p (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 25 May 2023 20:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbjEZA3o (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 25 May 2023 20:29:44 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F5C1A6
        for <phone-devel@vger.kernel.org>; Thu, 25 May 2023 17:28:55 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3b5881734so114940e87.0
        for <phone-devel@vger.kernel.org>; Thu, 25 May 2023 17:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685060934; x=1687652934;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHS1nKZQCzUqgGxJIZEyDSTgpeKovaxXS5dmIp7B7mY=;
        b=hb48OX7YswDIW6bgXvhMyWEHilfEU4nfve7nE+bYuTZx0T9EUMAs+2M/7lpaR9rIvq
         B3ni3hmdQFue8u+rzo2kPPA2xKblgMCKZSzfwtCjDDGZR4o5UEYJHPsf1tv5S3Ltjn+Y
         PtWgsnH7aUvLbcSZ1zLSmZMuC4+ktixdpuG/STOZ8Jv1oEh+zFo98UvIaMFsYuoaUe7N
         JhbYct/yNJGYIKlMr7ZDNK5rdWX930m2xVvqXsWDeUoLwY3DReIEFdty2QHlTdtcc19B
         Xu8IWl02Vpaug1WY/qckzEnZHD0LEliLOJsStW+xsgvUs9VP/PGaVVvJWLBBf3XxZhoh
         J/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685060934; x=1687652934;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHS1nKZQCzUqgGxJIZEyDSTgpeKovaxXS5dmIp7B7mY=;
        b=AP4CMmJefHAC3veJSSBcVxi5ljV2d6StzMOBQLRYPnwh5NjuGw4F2cwNLeoS2zkdQ8
         /ozPhSQq3M1cDbqX0FmcB6in86mDabnLUUSdUEYLo1qmnwdHVs00cDQ7Muxh4aXJF6Ew
         obte8BjrKVoulV/FWWmt3VVidi2ULw7waeqAwvoQNs37concFJbotchtNTxJ6a5nSip3
         Gp85VSvsSen6kPbHY1k7PjRvUvresN+S52srmgUgdijO+Ft7FLxU2Gy0kmjDC6Oo9+D+
         c+KOugzyP2cSZ7OkZvM0fCpDgC9oxrKsBZVUl2Ntedr/Hxnp9i8RpcCmUzX2MnlpxNPI
         dqpQ==
X-Gm-Message-State: AC+VfDzWjJNyzEn4kPh+4VU6NyKqYilcOK76Y4jalcKi4fEPR+h6cqrn
        AuseVD7HzpzA4YjExBGQcZT71A==
X-Google-Smtp-Source: ACHHUZ7HMH2gfDV78qkYBjih+sKJV8C+EftnKAOlJTya/1eA3U1ovDXqiVBNax8yy9vDptHy2jzpmw==
X-Received: by 2002:a19:f816:0:b0:4f3:a49b:121f with SMTP id a22-20020a19f816000000b004f3a49b121fmr7754951lff.40.1685060934020;
        Thu, 25 May 2023 17:28:54 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id t28-20020ac2549c000000b004f3892d21a5sm390475lfk.69.2023.05.25.17.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 17:28:53 -0700 (PDT)
Message-ID: <ef7b7335-d20c-3ddc-52df-b2801fa40283@linaro.org>
Date:   Fri, 26 May 2023 02:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8916-pm8916: Mark always-on
 regulators
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230510-msm8916-regulators-v1-0-54d4960a05fc@gerhold.net>
 <20230510-msm8916-regulators-v1-8-54d4960a05fc@gerhold.net>
 <ea53525b-749b-25e2-6dde-662a8e273597@linaro.org>
In-Reply-To: <ea53525b-749b-25e2-6dde-662a8e273597@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 26.05.2023 01:39, Konrad Dybcio wrote:
> 
> 
> On 17.05.2023 20:48, Stephan Gerhold wrote:
>> Some of the regulators must be always-on to ensure correct operation of
>> the system, e.g. PM8916 L2 for the LPDDR RAM, L5 for most digital I/O
>> and L7 for the CPU PLL (strictly speaking the CPU PLL might only need
>> an active-only vote but this is not supported for regulators in
>> mainline currently).
> Would you be interested in implementing this?
Actually, I think currently all votes are active-only votes and what
we're missing is sleep-only (and active-sleep if we vote on both)

Konrad
> 
> Ancient downstream defines a second device (vregname_ao) and basically
> seems to select QCOM_SMD_(ACTIVE/SLEEP)_STATE based on that..
> 
> Looks like `struct regulator` stores voltage in an array that wouldn't
> you know it, depends on the PM state. Perhaps that could be something
> to explore!
> 
> Konrad
> 
>>
>> The RPM firmware seems to enforce that internally, these supplies stay
>> on even if we vote for them to power off (and there is no other
>> processor running). This means it's pointless to keep sending
>> enable/disable requests because they will just be ignored.
>> Also, drivers are much more likely to get a wrong impression of the
>> regulator status, because regulator_is_enabled() will return false when
>> there are no users, even though the regulator is always on.
>>
>> Describe this properly by marking the regulators as always-on.
>>
>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>> ---
>>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts     | 5 -----
>>  arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi | 5 +++++
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
>> index ab8dfd858025..1c5d55854893 100644
>> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
>> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
>> @@ -358,11 +358,6 @@ pm8916_l17: l17 {
>>  	};
>>  };
>>  
>> -&pm8916_s4 {
>> -	regulator-always-on;
>> -	regulator-boot-on;
>> -};
>> -
>>  &sdhc_1 {
>>  	status = "okay";
>>  
>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
>> index b38eecbd6253..64d7228bee07 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
>> @@ -72,11 +72,13 @@ pm8916_rpm_regulators: regulators {
>>  		pm8916_s3: s3 {
>>  			regulator-min-microvolt = <1250000>;
>>  			regulator-max-microvolt = <1350000>;
>> +			regulator-always-on; /* Needed for L2 */
>>  		};
>>  
>>  		pm8916_s4: s4 {
>>  			regulator-min-microvolt = <1850000>;
>>  			regulator-max-microvolt = <2150000>;
>> +			regulator-always-on; /* Needed for L5/L7 */
>>  		};
>>  
>>  		/*
>> @@ -93,6 +95,7 @@ pm8916_s4: s4 {
>>  		pm8916_l2: l2 {
>>  			regulator-min-microvolt = <1200000>;
>>  			regulator-max-microvolt = <1200000>;
>> +			regulator-always-on; /* Needed for LPDDR RAM */
>>  		};
>>  
>>  		/* pm8916_l3 is managed by rpmpd (MSM8916_VDDMX) */
>> @@ -102,6 +105,7 @@ pm8916_l2: l2 {
>>  		pm8916_l5: l5 {
>>  			regulator-min-microvolt = <1800000>;
>>  			regulator-max-microvolt = <1800000>;
>> +			regulator-always-on; /* Needed for most digital I/O */
>>  		};
>>  
>>  		pm8916_l6: l6 {
>> @@ -112,6 +116,7 @@ pm8916_l6: l6 {
>>  		pm8916_l7: l7 {
>>  			regulator-min-microvolt = <1800000>;
>>  			regulator-max-microvolt = <1800000>;
>> +			regulator-always-on; /* Needed for CPU PLL */
>>  		};
>>  
>>  		pm8916_l8: l8 {
>>
