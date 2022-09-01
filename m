Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862C4ECAAD3
	for <phone-devel@archiver.kernel.org>; Thu,  1 Sep 2022 16:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234877AbiIAQNy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235004AbiIAQNk (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Sep 2022 12:13:40 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C8D91D10
        for <phone-devel@vger.kernel.org>; Thu,  1 Sep 2022 09:13:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g7so8188227lfe.11
        for <phone-devel@vger.kernel.org>; Thu, 01 Sep 2022 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/h8fdpcLhY4wu6EZotB0ad3yUb1WuRgsZLCw3g30N7s=;
        b=AL58HhQtL8dAINZDiR9Jy7SCy6M1Dh/RHGgmNLEaJXlbv04ar66bwmzyAjo/AkOzfM
         HLA0NmZy0HcVlc//0crt4Y78sdwVeYZTRZLrBnkasm5jDooceRFzNsWaHLxzN64ZSxio
         ARI582Qi7CFJFX8Ee2UaYuB2gR/LGnTLRoevMAjhm+l3ZrZYgQFCzaEnSEm3xa/MpFy/
         77VlrEwioFsuiM0TPssqXQmgUBrbaSOeTKg5tc+GlAqSsBC6dVQCIat3X4ER7Td7kPzV
         uJEEZaN9PXuPkfjY9VlCDcFrxKsmrWV+aOyykph5dmYow4TwiBnkEUxNd53xh2ZdcbG8
         FgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/h8fdpcLhY4wu6EZotB0ad3yUb1WuRgsZLCw3g30N7s=;
        b=M7terzHd84yBaMIA9BNjVgZ3zA2K8Qt6PZlaqozZ5SJSj8FZuT3H1HXdyCl7DS8yEB
         KDP2+Pt0ug6tqi2a3m/pt+J8EM32jsr5NtufIhSdkZ827BAP0Be6EqTZvZD8Ppr3FKZJ
         laoCuWEKgDYqSTk1QuqH+Th//2ygmVoNmq7CLb5yeXSducwo6rcNJuf9YJcW9U4MSR1q
         7v8C/tFH/mE8Izfg+JsMkcGyZkkBzK1fZaZmirDEY7YD2xmClnKAATMuozSOmKQ4HDr+
         T5OeloR9pdCIsepBDBdLpx4XMPoTAMSg4joB9Bzhwu7Wmc17kjRGw/JrNeE3zE3px6CW
         TjFA==
X-Gm-Message-State: ACgBeo2j17J4DFtORXYIVahoyycrWOdeg6pkcp2htCvQ4K/qslF+kJSP
        o+DCtlwGUX1No0r06m83uMcN3A==
X-Google-Smtp-Source: AA6agR4WPGNknCusu5ZB4w+TzAKz+hU2cGpzNsGUYnCdtjfKXHgQ3HQZ0okBViuMoNSFRKc4vQ/Vdg==
X-Received: by 2002:a05:6512:6c8:b0:494:796e:93b6 with SMTP id u8-20020a05651206c800b00494796e93b6mr4379172lff.213.1662048817367;
        Thu, 01 Sep 2022 09:13:37 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id m9-20020a197109000000b00485caa0f5dfsm2389640lfc.44.2022.09.01.09.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:13:36 -0700 (PDT)
Message-ID: <a0204dc3-af13-6b0b-d779-0f207d1aff7e@linaro.org>
Date:   Thu, 1 Sep 2022 19:13:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sm6115: Add UFS nodes
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-10-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-10-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> The SM6115 comes with UFS support, so add the related UFS and UFS PHY
> nodes.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index cde963c56ac9..491fffff8aa1 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -620,6 +620,76 @@ opp-202000000 {
>  			};
>  		};
>  
> +		ufs_mem_hc: ufshc@4804000 {
> +			compatible = "qcom,sm6115-ufshc", "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			reg = <0x4804000 0x3000>, <0x4810000 0x8000>;
> +			reg-names = "std", "ice";

I could imagine that testing DTS against existing bindings might miss a
lot, because we have still a lot of errors. But at least I would expect
you test your DTS against your own bindings, which you submit here (and
previously).

You just wrote that ice is not allowed.

> +			interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&ufs_mem_phy_lanes>;
> +			phy-names = "ufsphy";
> +			lanes-per-direction = <1>;
> +			#reset-cells = <1>;
> +			resets = <&gcc GCC_UFS_PHY_BCR>;
> +			reset-names = "rst";
> +
> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +			iommus = <&apps_smmu 0x100 0>;
> +
> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_SYS_NOC_UFS_PHY_AXI_CLK>,
> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
> +				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>;
> +			clock-names = "core_clk",
> +				      "bus_aggr_clk",
> +				      "iface_clk",
> +				      "core_clk_unipro",
> +				      "core_clk_ice",
> +				      "ref_clk",
> +				      "tx_lane0_sync_clk",
> +				      "rx_lane0_sync_clk";
> +
> +			freq-table-hz = <50000000 200000000>,
> +					<0 0>,
> +					<0 0>,
> +					<37500000 150000000>,
> +					<75000000 300000000>,
> +					<0 0>,
> +					<0 0>,
> +					<0 0>;
> +
> +			non-removable;

Is it allowed property?

> +			status = "disabled";
> +		};
> +
> +		ufs_mem_phy: phy@4807000 {
> +			compatible = "qcom,sm6115-qmp-ufs-phy";
> +			reg = <0x4807000 0x1c4>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_UFS_CLKREF_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
> +			clock-names = "ref", "ref_aux";
> +
> +			resets = <&ufs_mem_hc 0>;
> +			reset-names = "ufsphy";
> +			status = "disabled";
> +
> +			ufs_mem_phy_lanes: lanes@4807400 {
> +				reg = <0x4807400 0x098>,
> +				      <0x4807600 0x130>,
> +				      <0x4807c00 0x16c>;
> +				#phy-cells = <0>;
> +			};
> +		};
> +
> +

Just one blank line.

Best regards,
Krzysztof
