Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B291C4332F
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 14:24:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiLQOYv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 09:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiLQOYu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 09:24:50 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4B2FD13
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:24:49 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id b9so4948502ljr.5
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KNgZa+Y3gIZKsrHD7gN7V0iC9hOQKT+xAZ+np2Vlthw=;
        b=V7/zPkQni002KmWLbYldVWQW+6zdDu9L/haAmCpsl8Ae+6Ktu8KI+IdzieDisf+/tO
         BXugqEoDJgUem6u9Uyl3x9l8aX0leYHskSadOMJNddd8x7SDQDVDpHNT9bEJc44pwjSf
         lkoX+aZGbeHsrSniojbuz0WZE+iVXDfiWgzKREW6t+XjLwxTogQTdUsUyZsiNzSVM2a7
         a1DL6ddbKXhNI3AzKgX9Xe4Fq5gtwlnK8OPCpvIwRqHP9N835Oblt64rmV/L4E0nfRmF
         6JMRZmq+3idBgaik5mpzSN8WYG8LNxqbYXcZ6A/k4GLakhYzt14aCAktZ9LLXNGFdGLg
         dXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNgZa+Y3gIZKsrHD7gN7V0iC9hOQKT+xAZ+np2Vlthw=;
        b=LoZ0nKKMFXNi/ZLSZ+DjBMDelHY3675ByVFu5NxKkzsh0gXXSJYALEV7C3qJuKhuuM
         izrjqzA0ixXMNTmLYLqc2k9REJH0yNO4ue+xzh3Tu7CzUA7DsTWIDmdDTxAWCeh2nuGh
         Q+FD4dN6v4sB4LSBR8/NeFUvrOwNHRl+8ixApZ56bu+dgS141i5n1Bsd169d3pG1VxZy
         K+CNQitBtv4mThzvkdLizkAHuQGyJMABLSp8KGdKreyQjLUeVv7Eb7ywAJe7OCQ6LNDZ
         qooZHX/JKxsIZsyxkkEOvEwQBs1Ft884grKu9JzyHtJE+MFIPlF3m5UEzEvW1ZJ6fUqN
         oipQ==
X-Gm-Message-State: ANoB5pmNI9o4kCuAj23XkJboRz2F3tgl3BHhkfauCN911mrcFWWNq5/w
        lnqvQLO+ya6IEw5/GbhOD/cRfw==
X-Google-Smtp-Source: AA0mqf7WfrMk6abPjh6HI9vwQOk3Oj2NfROxiJ0MR6Etm+ew83vy90ngM2TtctYoZHdaKdE1fAiFAQ==
X-Received: by 2002:a2e:a809:0:b0:277:4fa8:8eb3 with SMTP id l9-20020a2ea809000000b002774fa88eb3mr9635910ljq.18.1671287087818;
        Sat, 17 Dec 2022 06:24:47 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id b13-20020a05651c032d00b0027a1bf37670sm360258ljp.55.2022.12.17.06.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 06:24:47 -0800 (PST)
Message-ID: <c4f4fc87-81dc-64d6-b61a-1af949aebe61@linaro.org>
Date:   Sat, 17 Dec 2022 15:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] arm64: dts: qcom: sm6125: Reorder HSUSB PHY clocks to
 match bindings
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221216213343.1140143-1-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216213343.1140143-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 16.12.2022 22:33, Marijn Suijten wrote:
> Reorder the clocks and corresponding names to match the QUSB2 phy
> schema, fixing the following CHECK_DTBS errors:
> 
>     arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: phy@1613000: clock-names:0: 'cfg_ahb' was expected
>             From schema: /newdata/aosp-r/kernel/mainline/kernel/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>     arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dtb: phy@1613000: clock-names:1: 'ref' was expected
>             From schema: /newdata/aosp-r/kernel/mainline/kernel/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> 
> Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 7e25a4f85594..bf9e8d45ee44 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -442,9 +442,9 @@ hsusb_phy1: phy@1613000 {
>  			reg = <0x01613000 0x180>;
>  			#phy-cells = <0>;
>  
> -			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> -				 <&gcc GCC_AHB2PHY_USB_CLK>;
> -			clock-names = "ref", "cfg_ahb";
> +			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
> +			clock-names = "cfg_ahb", "ref";
>  
>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>  			status = "disabled";
