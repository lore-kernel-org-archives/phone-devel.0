Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17D0C27C76
	for <phone-devel@archiver.kernel.org>; Sat, 28 Jan 2023 14:30:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbjA1Oaz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 28 Jan 2023 09:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbjA1Oax (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 28 Jan 2023 09:30:53 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E865C45F74
        for <phone-devel@vger.kernel.org>; Sat, 28 Jan 2023 06:30:51 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id v10so7115582edi.8
        for <phone-devel@vger.kernel.org>; Sat, 28 Jan 2023 06:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YmUIiWvEj/OlD5nGw0BxToo9ydjOw0J75PDbpyJ/x0=;
        b=gXVap0kjUnx4txDs6Nuabhj2btiX70cjn4iws+yCEWWNuC9AK4gCOGXRLUqO31vB5s
         2ZiyJzZFMxDjHxznxTzdRshnxsDru5wM39skVG7H21egc87yz2RXZeDCNT1HZAT1BmZ6
         zo5kE5BMdKTixR13HfAQaZWacoAj+hm64hO979fB5cf3DpQkx/lMkjZfoBxWQ68IoW28
         pDnzMUBD/p7LG339pMbSpCQFtsGBT5czm2ZtTfANuqQPpefZwlQ6Gsk4xEISQYo7zPU4
         XW0LQnjoM3RlDkIWNqK0GaEDBqGauUxx9DZmdYNUNLVOYgP7aUwMi9s9ACP7YFJlKpPG
         O8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YmUIiWvEj/OlD5nGw0BxToo9ydjOw0J75PDbpyJ/x0=;
        b=jsmL1d8BPXhvPeGvYn85r+u2pYJ2eq+uNUm3ObXSsO3Ts+HPIERto1xwyjrso2k8Ia
         x9Ci/q1WmgrE33r5H933Npr8EUqroyog7csKYsorkEEQKG3Tg7j1t1TNq9vjILsOtgLm
         jcpNZfwzyFm3I+bH1+3JEr2CCeI5TGqnOx8dByjLmcFQh4+6Rsn5e6kVEyBfkm+Lzwcq
         f8adh6zyhM0If3ZWsjl0qE0ggUrTcvD7aLbPWm0zKbG4It7KDJaVLP08H4NREBHSxZVx
         nG7mcdfVxW7+Kqu/tBq7g/qM8QOmPdv5kyd/gAsceK0S0XtmMCQSSr6TvrtEVYgi8+BB
         XS2A==
X-Gm-Message-State: AFqh2kp7lgZxbK9lpIa7HE8bYo/+3CRcS0OO7ubOMSqd70BMsxsg2Ldr
        HTvMjBPWBJofIdPWk61anlwiDQ==
X-Google-Smtp-Source: AMrXdXtP3VFcy8JI4mmQAd3j6xdOB4Uo/R/8C7tIhmT07fUfZam2J/X+W3hgeqR3fe8Ww75pSscS0w==
X-Received: by 2002:a05:6402:10c9:b0:49d:a87f:ba78 with SMTP id p9-20020a05640210c900b0049da87fba78mr44641434edu.35.1674916250518;
        Sat, 28 Jan 2023 06:30:50 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id t13-20020a50d70d000000b00458b41d9460sm3997228edi.92.2023.01.28.06.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 06:30:48 -0800 (PST)
Message-ID: <f8590655-3869-d905-ebad-347b8c9ae8dd@linaro.org>
Date:   Sat, 28 Jan 2023 15:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8992-lg-bullhead: Correct memory
 overlap with SMEM region
To:     Jamie Douglass <jamiemdouglass@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Petr Vorel <petr.vorel@gmail.com>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Konrad Dybico <konrad.dybico@linaro.org>
References: <20230128055214.33648-1-jamiemdouglass@gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230128055214.33648-1-jamiemdouglass@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 28.01.2023 06:52, Jamie Douglass wrote:
> A previously committed reserved memory region was overlapping with the
> SMEM memory region, causing an error message in dmesg:
> 	OF: reserved mem: OVERLAP DETECTED!
> 	reserved@5000000 (0x0000000005000000--0x0000000007200000)
> 	overlaps with smem_region@6a00000
> 	(0x0000000006a00000--0x0000000006c00000)
> This patch splits the previous reserved memory region into two
> reserved sections either side of the SMEM memory region.
> 
> Signed-off-by: Jamie Douglass <jamiemdouglass@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index 79de9cc395c4..5e375ea73c79 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -53,8 +53,13 @@ cont_splash_mem: memory@3400000 {
>  			no-map;
>  		};
>  
> -		removed_region: reserved@5000000 {
> -			reg = <0 0x05000000 0 0x2200000>;
> +		reserved@5000000 {
> +			reg = <0x0 0x05000000 0x0 0x1a00000>;
> +			no-map;
> +		};
> +
> +		reserved@6c00000 {
> +			reg = <0x0 0x06c00000 0x0 0x400000>;
I think you made this 0x200000 too small, unless there
is supposed to be functional change.

Konrad
>  			no-map;
>  		};
>  	};
