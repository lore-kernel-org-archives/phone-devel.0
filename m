Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33436C4332F
	for <phone-devel@archiver.kernel.org>; Sun, 18 Dec 2022 10:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiLRK0P (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 18 Dec 2022 05:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiLRK0O (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 18 Dec 2022 05:26:14 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F94DDEE4
        for <phone-devel@vger.kernel.org>; Sun, 18 Dec 2022 02:26:12 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2620A1F82A;
        Sun, 18 Dec 2022 11:26:10 +0100 (CET)
Date:   Sun, 18 Dec 2022 11:26:08 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
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
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sm6125: Add apps_smmu with
 streamID to SDHCI 1/2 nodes
Message-ID: <20221218102608.bzfyjnz64hcm4fj5@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <20221216215819.1164973-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216215819.1164973-4-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-12-16 22:58:18, Marijn Suijten wrote:
> When enabling the APPS SMMU the mainline driver reconfigures the SMMU
> from its bootloader configuration, loosing the stream mapping for (among
> which) the SDHCI hardware and breaking its ADMA feature.  This feature
> can be disabled with:
> 
>     sdhci.debug_quirks=0x40
> 
> But it is of course desired to have this feature enabled and working
> through the SMMU.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 347665c2067c..f560499cc0ca 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -468,6 +468,7 @@ sdhc_1: mmc@4744000 {
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&xo_board>;
>  			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x160 0>;

I'll make the mask 0x0 (same below) in the next revision, please do not
apply this patch.

- Marijn

>  			power-domains = <&rpmpd SM6125_VDDCX>;
>  
> @@ -494,6 +495,7 @@ sdhc_2: mmc@4784000 {
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&xo_board>;
>  			clock-names = "iface", "core", "xo";
> +			iommus = <&apps_smmu 0x180 0>;
>  
>  			pinctrl-0 = <&sdc2_on_state>;
>  			pinctrl-1 = <&sdc2_off_state>;
> -- 
> 2.39.0
> 
