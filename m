Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FF1C4332F
	for <phone-devel@archiver.kernel.org>; Sat, 17 Dec 2022 14:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiLQOZw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 17 Dec 2022 09:25:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiLQOZq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 17 Dec 2022 09:25:46 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA8B10B0
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:25:44 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id h10so4910783ljk.11
        for <phone-devel@vger.kernel.org>; Sat, 17 Dec 2022 06:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbkQiFOGaUTxjVfMNbHPRgK4jY57Ynyi5LA7DMw6iGs=;
        b=i13UUw/qhReRwrqL2wm6Slq8OeTCbX4r2X1YqZsDGN909O0GDRgqmClAZehsNrOUfe
         j8ehCr0WdpoFV/UumV9+t7QDdrfHSt78ve8lzcfOMl8EzoG9bW+9uRjawht36GnArN9d
         QYThTxMghwgR0NyHrJoetyv3sCBsnMZ32WvornpMIToVAj8AUpkWhSA0pndpmJt6FNmH
         94aTUgge5Q7pZQEeGz52/BM0swwGaDZtbo3+uCPb57BLs9ilmhS+EhfrBF5+T0DwlNMb
         oVdnylK3ccjS7XTFCoLV+VtD32WihPmJFB3teag1AoKJUHBUZN/G9sKMPykZaI+DJnQN
         XjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbkQiFOGaUTxjVfMNbHPRgK4jY57Ynyi5LA7DMw6iGs=;
        b=xREN2VISCVQQ6/ZWVmmxG81Wv7eeS1nB+g8r1n2voUBWm13vs4nppaVSWBA/1+f7RM
         I7k03IlsWuFudq6i6CeLqUSVAYRvbjRaf4kut5p46WVT3VmPfmfBn/1PkQeDIV3oLXIr
         iMRHvqa53FG7r4+Vs8bazHbW+gqONtoUWuaqD6cZRXkvg/irENlEWTImjx9DoIWwEIYn
         8gsUWvFA5vBoa1b8p4SH3GUp/eLJh4fJ4eogqD9euE6evutTEV7tvw37/8w6kOadbsI/
         /fM8fPffVYxcMU1P/gz7RYrG83iCj03Wx4XBQS3QmunZnACYmcxsZiYgPDKzTsVbfRmh
         Kvyg==
X-Gm-Message-State: ANoB5plOIMl4jD+DVZ7uXsvu9IY4udNHdhEpCmp0bL7WRh5UQ2BvAVsW
        rRKWHMof5bQhcIs0UNUqZZSFUA==
X-Google-Smtp-Source: AA0mqf7xrFRwNMGb2RtvbMR7QSO+gl/dwgUlXXZ4xE24Pvbi68yb3d5sVWaljwReIh3irB0dFAUupg==
X-Received: by 2002:a05:651c:12c7:b0:276:103f:dc36 with SMTP id 7-20020a05651c12c700b00276103fdc36mr14388214lje.1.1671287142491;
        Sat, 17 Dec 2022 06:25:42 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id z14-20020a05651c11ce00b0027f770526ebsm106761ljo.75.2022.12.17.06.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 06:25:42 -0800 (PST)
Message-ID: <a20b17b5-385d-ec32-8fb9-beaa3b2fde15@linaro.org>
Date:   Sat, 17 Dec 2022 15:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sm6125: Configure APPS SMMU
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221216215819.1164973-1-marijn.suijten@somainline.org>
 <20221216215819.1164973-3-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221216215819.1164973-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 16.12.2022 22:58, Marijn Suijten wrote:
> From: Martin Botka <martin.botka@somainline.org>
> 
> Add a node for the APPS SMMU, to which various devices such as USB and
> storage nodes are connected.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> [Marijn: add the new, generic, "qcom,smmu-500" compatible, add patch
>  description, reorder # properties]
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 73 ++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index bf9e8d45ee44..347665c2067c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -573,6 +573,79 @@ spmi_bus: spmi@1c40000 {
>  			cell-index = <0>;
>  		};
>  
> +		apps_smmu: iommu@c600000 {
> +			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0xc600000 0x80000>;
> +			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			#global-interrupts = <1>;
> +			#iommu-cells = <2>;
> +		};
> +
>  		apcs_glb: mailbox@f111000 {
>  			compatible = "qcom,sm6125-apcs-hmss-global";
>  			reg = <0x0f111000 0x1000>;
