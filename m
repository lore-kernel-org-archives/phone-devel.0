Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684EFCCA479
	for <phone-devel@archiver.kernel.org>; Fri, 17 Jun 2022 13:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382497AbiFQNzc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 17 Jun 2022 09:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382489AbiFQNzb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 17 Jun 2022 09:55:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0B93A5CC
        for <phone-devel@vger.kernel.org>; Fri, 17 Jun 2022 06:55:27 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y32so7075036lfa.6
        for <phone-devel@vger.kernel.org>; Fri, 17 Jun 2022 06:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mSVdlrZwQBdRNTbOurp3xHACayt6ICnyCyJkN4WwF/E=;
        b=CJAPPp0Q592579nygMx7NnFAtrXHmBjj0VbS6q3wYNKvTiY2X49o0KjPgH1d743lct
         QNj1RZsfZQm9lr7Iks9hVM8wDiqJ87Jhl7QZ3bdg5q3GORT3uCTMxDRwQC3d18peE6aj
         ttNbek2WPier8b3XlwURBvxivnT/pc/6iKjG2odBxpAwEFTKmp9SsXLYTGs3451r73nI
         cDXJJZc2Ze99vWm4+z/u7Rtwe0RMHTjcGtFL8HhK23Y/kFjWh2t8nxZrPRG2V8OXE4Xq
         FJX4MEvi61GzO2Q5Wnm5aa2BPgGx6phnkcFrCuZVGafRLkPrz9a7S24oaOrVJJRoB3YP
         N7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mSVdlrZwQBdRNTbOurp3xHACayt6ICnyCyJkN4WwF/E=;
        b=AYzIyjSx+8OQMoWI6/IdCSPQI0N14AKA+CJQ41jd6VfVE7LB9hLSCb5JcPmhjdPYxT
         N9l/5JnyrAdFxr18rOD4XMY4G2qSyhCAWOzx9sPxTbzUI54MutLyG0eOqSJtMslACkR+
         I5RZiWrI4R4VdvFhhDouEio8p2LUKI3TulHY3Xf36m0N9XBx7jA2Jn7ThFkhBE1T3S39
         TVuDhDomjE5qV1+Idb/yRdrckyrcZKWOEjfdduQB62ciTRQpfcRFUBLYeGfboA3zII61
         ZU9K/XMk3AR0INSFVTVCIlIsbA+klkt0IS4R2+YmjpC6axC4AJt4M0mSYgwBZH21WlXU
         +lYg==
X-Gm-Message-State: AJIora9amnWuQNBV8GFyqCbmZz71fZyntVsZ7eFoXloG3LpZcd4Tpuan
        qSm77Cqhz+bF5WlGWdtKxFrJbw==
X-Google-Smtp-Source: AGRyM1u7saiT0IStvE2BqMAh3YsaZYv9yS135+UBfFFzhy/jP+fGGNQXVlplJ4ktB9J754nE3oDH2Q==
X-Received: by 2002:a05:6512:3ba3:b0:478:f078:d44c with SMTP id g35-20020a0565123ba300b00478f078d44cmr5843553lfv.351.1655474126131;
        Fri, 17 Jun 2022 06:55:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h21-20020ac24d35000000b004795a3181absm646808lfk.69.2022.06.17.06.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 06:55:25 -0700 (PDT)
Message-ID: <11aeba3d-5d45-e436-18b3-4d4f680d184a@linaro.org>
Date:   Fri, 17 Jun 2022 16:55:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8953: add MDSS
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220612092218.424809-1-luca@z3ntu.xyz>
 <20220612092218.424809-5-luca@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220612092218.424809-5-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/06/2022 12:22, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add the MDSS, MDP and DSI nodes that are found on msm8953 SoC.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes from v1:
> - disable nodes by default, thanks Dmitry!
> - enable iommu for mdp
> 
>   arch/arm64/boot/dts/qcom/msm8953.dtsi | 208 ++++++++++++++++++++++++++
>   1 file changed, 208 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 961db3e23ee4..c7373c845f41 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -726,6 +726,214 @@ tcsr_phy_clk_scheme_sel: syscon@193f044 {
>   			reg = <0x193f044 0x4>;
>   		};
>   
> +		mdss: mdss@1a00000 {
> +			compatible = "qcom,mdss";
> +
> +			reg = <0x1a00000 0x1000>,
> +			      <0x1ab0000 0x1040>;
> +			reg-names = "mdss_phys",
> +				    "vbif_phys";
> +
> +			power-domains = <&gcc MDSS_GDSC>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>;
> +			clock-names = "iface",
> +				      "bus",
> +				      "vsync";

I've sent the patches using "core" clock for the mdss ([1]). Please 
consider utilizing it here.

[1]: https://patchwork.freedesktop.org/series/105162/

> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			status = "disabled";
> +
[skipped the rest]

-- 
With best wishes
Dmitry
