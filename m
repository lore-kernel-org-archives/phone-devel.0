Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8784FC76196
	for <phone-devel@archiver.kernel.org>; Sat, 25 Mar 2023 12:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbjCYMHh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 25 Mar 2023 08:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjCYMHe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 25 Mar 2023 08:07:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C5B3AB4
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 05:07:30 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s8so5468397lfr.8
        for <phone-devel@vger.kernel.org>; Sat, 25 Mar 2023 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679746048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p356MBtB/RizhVAGNyalP9Y93+gE/vYnHPbZyulsolM=;
        b=QPUrZL6Z7HxUkduf+MmpG6YklZ03DspfOAGlwpYoGUxhvQ9fRMqFo5I72WDdeOsTgx
         RiUhNbBBKgOtcS2veTzH1SZAtTFRHSgQYzfKAImCANZ2XIRS8IYBIut2FUH1ERGDgKUx
         /OkhbfNFPhzZBEteNCmrUPUccrDCofdZJHwUU6SYNcRCvkRSN9h9ZkZscEOC0rDFyIey
         Grgg5OqOvOPLFPggmV9eixtY7C4ZMv63O7T/Jpby9BL+Z0a20M5iDzSQU5Csic4tEk8f
         NsreHN+jnTTWeIMnRLaKXg1Rbp9hMcrpMW3GQYoGxJOKGKcBpftnt+oyZ4k2jQ1hQQXp
         MxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p356MBtB/RizhVAGNyalP9Y93+gE/vYnHPbZyulsolM=;
        b=xEyQqeF6YD5/n9IYX1x+3W2zzjI2n9WcWQFAZRZWdP5kd9Kvlgecy9OuIQQlcmmFNq
         xmrh59tU6etfLDaNcoDqFRvZZejPux/ReAn2dhx1mkvpI74HhkK1TbfITdMht2BYV22U
         IyZyH90zqBTgRpcIsBT7KBA2Qo1kGMEPwYDZra16+vxW8lcUx6YumNL++GZcJAQtE12X
         k857B8DHwPNc9O7CE8uk2NrTleh9je8+7eLJi4hBQ0fs9xKTf8xSzQYD4TUbg0vZ6E4w
         EjERawIGyDnEkI0LtirmHW4Ig9iZbSW2f00l8ynFDpTWAvaHSgwqxkSqClVqkWRf222/
         2HZA==
X-Gm-Message-State: AAQBX9fjhCJdgPjtMQY5j6PHRzUn550i3fhsrC9cAow86rsqhj9QFWTv
        jH0hrtCkKniALmxlvmgb1OgqXQ==
X-Google-Smtp-Source: AK7set9ibMMcbCfR4EZgermsFvShjtwfVKIXybQNbDhOj0oM8Iiz/PvGD8Ncs1pq87s8V+JeQ9GslQ==
X-Received: by 2002:a05:6512:4003:b0:4e7:ff1c:6030 with SMTP id br3-20020a056512400300b004e7ff1c6030mr3649143lfb.15.1679746048254;
        Sat, 25 Mar 2023 05:07:28 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e321a000000b002934febffe4sm3793705ljy.128.2023.03.25.05.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 05:07:27 -0700 (PDT)
Message-ID: <445c0cf7-78bf-40f1-1803-266841955790@linaro.org>
Date:   Sat, 25 Mar 2023 13:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] arm64: dts: msm8953: Provide dsi_phy clocks to gcc
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230325112852.18841-1-a39.skl@gmail.com>
 <20230325112852.18841-2-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230325112852.18841-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 25.03.2023 12:28, Adam Skladowski wrote:
> Provide clocks from dsi_phy to gcc, this will make
> sure we don't fallback to global name lookup.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 438a70eb6152..5dd10c35ee0d 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -640,10 +640,10 @@ gcc: clock-controller@1800000 {
>  			#power-domain-cells = <1>;
>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>;
> +				 <&dsi0_phy 1>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi1_phy 1>,
> +				 <&dsi1_phy 0>;
>  			clock-names = "xo",
>  				      "sleep",
>  				      "dsi0pll",
