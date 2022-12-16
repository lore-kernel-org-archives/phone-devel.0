Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9341AC4332F
	for <phone-devel@archiver.kernel.org>; Fri, 16 Dec 2022 00:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiLPAQq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 15 Dec 2022 19:16:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiLPAQq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 15 Dec 2022 19:16:46 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8310A2D1C4
        for <phone-devel@vger.kernel.org>; Thu, 15 Dec 2022 16:16:42 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id q6so983442lfm.10
        for <phone-devel@vger.kernel.org>; Thu, 15 Dec 2022 16:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRw9NosyKCoLQzJxnba7zzcyE0l9B5s5iM+v2n7vWEI=;
        b=wpjEBWCy0R6NjVJ+C8PgFTksxRS9zH9OhoKXGLCwK18mr/7o3/tNuMyt7TWbBpADRy
         +bQ/NzBmXUeR8ftCqJcn6ikvHoCXUw1n161TrUEVwgaRZBACpRXDIwMgrDdQ7YLIaNvp
         cMJqPgBzMDohxB8HfHoLhLvd52lMtc396eBRmF08/ofkzD96Y6swb9OR+qXfqDe0JHsv
         0iJoBVQ3+BCHtvdh1KSRXzR4JYxTptC7M50REBAcWT5VZ6dQUH+7iAXfXFKf1RhNJe35
         0k7GGcdeGJgT+ZBhGFrnX4I+Zt5K1NNqWmL6//NM+2E4KyG+iZPgQCR7/OXQ5wwV1lrS
         YEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRw9NosyKCoLQzJxnba7zzcyE0l9B5s5iM+v2n7vWEI=;
        b=G62rmPx0gj5zx0wL1qJwEJ/9fIoWYmLpgIzuNp41yLFcMOT5ZzoPCqZ1X4NprXCsHi
         ZyBOIUW5t5wJgtjOTYuG3bpPLVbjYNr13O+772pkgWIKo+g9HTiAIzXDF3gmIB9Ltx/J
         wULtiBYNRgfYfkVoEbJrWgZLYCnk34BHjOqF/p9hED2SX9pPUhinBGq+900NchzWeXQz
         R+P41CSkfYbou65++k3wdKfPhgSMrVoJA51f8F7Kn++qGGHo/uxawzP1Ft6n3M8gWYTW
         dqmAyA/nUMcqrsXB8WmLGO4wBWQuk0xuuW9w+eSD8KMZ+XKKPzXq8ah2AkW0gGGy6QLS
         m1Nw==
X-Gm-Message-State: ANoB5pnzDJq+dd0yaHOa31JYOOyoSsP9zTkSFaRk7RVRD6/UKaSddrG4
        pYdYJSn8W1q5jjRDz4ShGY90wA==
X-Google-Smtp-Source: AA0mqf6yQuvPJwr6lilxSPk5K679p5RQghfxCvY9VemYiZmO40/mgLzuvrybWqODEa0kVXYNGmmYoQ==
X-Received: by 2002:a05:6512:3990:b0:4b6:d28a:2558 with SMTP id j16-20020a056512399000b004b6d28a2558mr13048452lfu.49.1671149800890;
        Thu, 15 Dec 2022 16:16:40 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a197602000000b004a764f9d653sm50821lff.242.2022.12.15.16.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 16:16:40 -0800 (PST)
Message-ID: <d3d28673-934b-08aa-6301-ec56e6509010@linaro.org>
Date:   Fri, 16 Dec 2022 01:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/6] arm64: dts: qcom: msm8976: Declare and use SDC1 pins
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214232049.703484-1-marijn.suijten@somainline.org>
 <20221214232049.703484-5-marijn.suijten@somainline.org>
 <60a40ace-d4e9-df74-88f9-4354d80efaac@linaro.org>
 <20221215210010.on44gmoefbnsokvt@SoMainline.org>
 <20221215210246.rcx7f6unbhj52dkb@SoMainline.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221215210246.rcx7f6unbhj52dkb@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 15.12.2022 22:02, Marijn Suijten wrote:
> On 2022-12-15 22:00:12, Marijn Suijten wrote:
>> On 2022-12-15 14:19:41, Konrad Dybcio wrote:
>>>
>>>
>>> On 15.12.2022 00:20, Marijn Suijten wrote:
>>>> Add the pinctrl states for SDC1 and use them on sdhc_1.
>>>>
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 55 +++++++++++++++++++++++++++
>>>>  1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
>>>> index 05dcb30b0779..7d4c7548882c 100644
>>>> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
>>>> @@ -508,6 +508,56 @@ tlmm: pinctrl@1000000 {
>>>>  			interrupt-controller;
>>>>  			#interrupt-cells = <2>;
>>>>  
>>>> +			sdc1_off_state: sdc1-off-state {
>>>> +				clk-pins {
>>>> +					pins = "sdc1_clk";
>>>> +					drive-strength = <2>;
>>>> +					bias-disable;
>>>> +				};
>>>> +
>>>> +				cmd-pins {
>>>> +					pins = "sdc1_cmd";
>>>> +					drive-strength = <2>;
>>>> +					bias-pull-up;
>>>> +				};
>>>> +
>>>> +				data-pins {
>>>> +					pins = "sdc1_data";
>>>> +					drive-strength = <2>;
>>>> +					bias-pull-up;
>>>> +				};
>>>> +
>>>> +				rclk-pins {
>>>> +					pins = "sdc1_rclk";
>>>> +					bias-pull-down;
>>>> +				};
>>>> +			};
>>>> +
>>>> +			sdc1_on_state: sdc1-on-state {
>>>> +				clk-pins {
>>>> +					pins = "sdc1_clk";
>>>> +					drive-strength = <16>;
>>>> +					bias-disable;
>>>> +				};
>>>> +
>>>> +				cmd-pins {
>>>> +					pins = "sdc1_cmd";
>>>> +					drive-strength = <10>;
>>>> +					bias-pull-up;
>>>> +				};
>>>> +
>>>> +				data-pins {
>>>> +					pins = "sdc1_data";
>>>> +					drive-strength = <10>;
>>>> +					bias-pull-up;
>>>> +				};
>>>> +
>>>> +				rclk-pins {
>>>> +					pins = "sdc1_rclk";
>>>> +					bias-pull-down;
>>>> +				};
>>>> +			};
>>>> +
>>>>  			spi1_default: spi0-default-state {
>>>>  				spi-pins {
>>>>  					pins = "gpio0", "gpio1", "gpio3";
>>>> @@ -680,6 +730,11 @@ sdhc_1: mmc@7824000 {
>>>>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>>>>  				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>>>  			clock-names = "iface", "core", "xo";
>>>> +
>>>> +			pinctrl-0 = <&sdc1_on_state>;
>>>> +			pinctrl-1 = <&sdc1_off_state>;
>>>> +			pinctrl-names = "default", "sleep";
>>> pinctrl-names usually goes before pinctrl-N
>>
>> I thought I had seen them _after_ nowadays, same for reg-names,
>> phy-names, interrupt-names and clock-names.  What is it?
>>
>> Regardless, I'd rather keep this consistent across this file (sdc2 also
>> has it after, same for other *-names)
> 
> Excuse me, I was looking at sm6125 DT while writing this, sdc2 for
> msm8976 is introduced _and used by sdhc_2 in a followup patch.
> 
> The other points still stand though, everything has -names last.
Hm, that's a good point, perhaps we should apply it to pinctrl-
too then. I like this.

Konrad
> 
> - Marijn
> 
>> and correct it at once in a
>> separate patch, if someone really cares.
>>
>> But really, we should have a checker/autoformatter for these "rules",
>> instead of all this manual back-and-forth (is this order already set in
>> stone under Documentation/ or something?).
>>
>> - Marijn
