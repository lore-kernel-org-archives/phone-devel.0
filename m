Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BFAC7EE23
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 21:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244026AbjEZVLv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 May 2023 17:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjEZVLu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 May 2023 17:11:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC194BB
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 14:11:47 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f122ff663eso1293256e87.2
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 14:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685135506; x=1687727506;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1L+ycxs8nT0k5qZvWSokMUtOJErTXYk5ocz+vVaSWnw=;
        b=Dr45UR/vjmG+V2DhYmc/+Z94k1T50oJR3bZmR/3QdgjNmgX8VS+huSL+ilAYotiOWG
         5VdCz5PEq2JwDhTLXslGE0StQ1HuAk3HhQlag3EHYkrelF/g2wyQaMtSrkLHaKxEbbWB
         gpFB9raWzZQSLe3PNDaF71eC0btdoGnDru5LtEtAQXHDSICUtxPCVQsxQRcUaYsss0rk
         13hajfXAkNVUjLa15uQHSc9w4KJu02h4mgP6N+yP6kIqNiqGFwPtW/gUjTlzCEQw8Jm5
         +/ydHKgdZUmSAUAq3vXtd2abEFRWHioaWImcKfJ5atyD4UKPGUUBm5mChNxZo1a+jleh
         Gcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135506; x=1687727506;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1L+ycxs8nT0k5qZvWSokMUtOJErTXYk5ocz+vVaSWnw=;
        b=Pm6Qb+2DpIG3cSEwwvuuQWQUA3xtLFph/O+H8CSv88sPfHjSRqbM3Fz3W90Rln3Di3
         5cI3ahUNfQXDZ4PsXJUGxW0XpZsUQI9fksAqU/6eBkoBQ2px8VEUnJagWrsGKWyOOe0a
         +y/pDeAf4J7JupBR4120x4xjK/oRgnITXAxxHhTV2hhU2fRBHX05m7eQyaO/mA8YK832
         uEvd/GsErlfCThyXaHFDgM2+NSW4ls2DiWyn77M5eH92YvLKenfL/6nSrkjoHHqdahFS
         8oQp50XtKM46uiyYvsUuquYAVkGpAL5IU0J05jwa9YCIDqGDdD/BdRwe+DYv/VmCgH/7
         uvJw==
X-Gm-Message-State: AC+VfDycj1aD4L5+Wv2R/NFRJiFBS3vPdDB1XmGNpmHkPyqawsFswXWN
        BjQw52lUEf8SQE36DvI47mex0A==
X-Google-Smtp-Source: ACHHUZ5cemCoNqzhRRERX6I4HzjQMrvTEWDuDE93LE/pVDCsDJENXaFbS/q8p5n9/kFtuNQarEdlnQ==
X-Received: by 2002:ac2:4c09:0:b0:4ef:6ed9:7af2 with SMTP id t9-20020ac24c09000000b004ef6ed97af2mr860215lfq.8.1685135506191;
        Fri, 26 May 2023 14:11:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id y26-20020ac2447a000000b004f24ee39661sm787480lfl.137.2023.05.26.14.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 14:11:45 -0700 (PDT)
Message-ID: <02543b3b-a94d-fd3a-7b28-3e55f4414137@linaro.org>
Date:   Fri, 26 May 2023 23:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230510-msm8916-regulators-v1-0-54d4960a05fc@gerhold.net>
 <20230510-msm8916-regulators-v1-7-54d4960a05fc@gerhold.net>
 <9f474fe8-523c-3668-540a-a8fc04ed64a6@linaro.org>
 <ZHBV-mBPhoqy8yvs@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8916: Define regulator
 constraints next to usage
In-Reply-To: <ZHBV-mBPhoqy8yvs@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 26.05.2023 08:47, Stephan Gerhold wrote:
> On Fri, May 26, 2023 at 01:35:06AM +0200, Konrad Dybcio wrote:
>> On 17.05.2023 20:48, Stephan Gerhold wrote:
>>> Right now each MSM8916 device has a huge block of regulator constraints
>>> with allowed voltages for each regulator. For lack of better
>>> documentation these voltages are often copied as-is from the vendor
>>> device tree, without much extra thought.
>>>
>>> Unfortunately, the voltages in the vendor device trees are often
>>> misleading or even wrong, e.g. because:
>>>
>>>  - There is a large voltage range allowed and the actual voltage is
>>>    only set somewhere hidden in some messy vendor driver. This is often
>>>    the case for pm8916_{l14,l15,l16} because they have a broad range of
>>>    1.8-3.3V by default.
>>>
>>>  - The voltage is actually wrong but thanks to the voltage constraints
>>>    in the RPM firmware it still ends up applying the correct voltage.
>>>
>>> To have proper regulator constraints it is important to review them in
>>> context of the usage. The current setup in the MSM8916 device trees
>>> makes this quite hard because each device duplicates the standard
>>> voltages for components of the SoC and mixes those with minor
>>> device-specific additions and dummy voltages for completely unused
>>> regulators.
>>>
>>> The actual usage of the regulators for the SoC components is in
>>> msm8916-pm8916.dtsi, so it can and should also define the related
>>> voltage constraints. These are not board-specific but defined in the
>>> APQ8016E/PM8916 Device Specification. The board DT can then focus on
>>> describing the actual board-specific regulators, which makes it much
>>> easier to review and spot potential mistakes there.
>>>
>>> Note that this commit does not make any functional change. All used
>>> regulators still have the same regulator constraints as before. Unused
>>> regulators do not have regulator constraints anymore because most of
>>> these were too broad or even entirely wrong. They should be added back
>>> with proper voltage constraints when there is an actual usage.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
>> I'm a bit torn between saying "this is very nice already" and "we should
>> probably override each regulator individually" like so:
>>
>> &pm8916_l17 {
>> 	[...]
>> }
>>
>> to minimize mistakes..
>>
>> Not sure what to make of it, I see Bjorn already applied this, so I guess
>> I'm just leaving some potential ideas for the future here.
>>
> 
> Sorry, could you elaborate a bit on what changes you would make exactly?
Assigning the voltage ranges through direct reference to each individual
regulator, instead of overwriting them through referencing the
pm8916_rpm_regulators label and (essentially) redefining them.

> 
> The way it works in this patch is that regulators that are used by the
> SoC are defined in msm8916-pm8916.dtsi. All other (board-specific)
> regulators must be defined together with proper voltages in the board DT.
> 
> What kind of mistake are you thinking of?
Fat fingers, mostly

So suppose your device needs a different voltage on L18, so you do

&pm8916_rpm_regulators {
	l19 { //fat fingers burn devices
		regulator-min-microvolt = <12341234>;
		regulator-max-microvolt = <43143144>;
	};
};

DTC will happily eat that


since we use labels, one would have to fatfinger twice, like so:
&pm8916_rpm_regulators {
	pm8916_l19: l19 { //this was still supposed to be l18
...


as these two combinations will trigger a build error


&pm8916_rpm_regulators {
	pm8916_l19: l18 { //duplicate label vs actual l19

---

&pm8916_rpm_regulators {
	pm8916_l18: l19 { //duplicate label vs actual l18


Konrad

> 
> Thanks,
> Stephan
