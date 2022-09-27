Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE2FC6FA82
	for <phone-devel@archiver.kernel.org>; Tue, 27 Sep 2022 13:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbiI0NDP (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiI0NDN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Sep 2022 09:03:13 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D9ECBADB
        for <phone-devel@vger.kernel.org>; Tue, 27 Sep 2022 06:03:12 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 39C9D3F335;
        Tue, 27 Sep 2022 15:03:10 +0200 (CEST)
Message-ID: <335f759a-3279-4ab3-10c0-55daa313e669@somainline.org>
Date:   Tue, 27 Sep 2022 15:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: pm8941: fix vadc channel node names
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161821.78030-1-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220925161821.78030-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 25.09.2022 18:18, Luca Weiss wrote:
> Node names for the channel are supposed to be adc-chan@REG.
> 
> Use this format and at the same time sort the nodes by reg value.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 9cd49deb9fa7..3c15eecf2f21 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -101,26 +101,33 @@ pm8941_vadc: adc@3100 {
>  			#size-cells = <0>;
>  			#io-channel-cells = <1>;
>  
> -			bat_temp {
> -				reg = <VADC_LR_MUX1_BAT_THERM>;
> +
> +			adc-chan@6 {
> +				reg = <VADC_VBAT_SNS>;
>  			};
> -			die_temp {
> +
> +			adc-chan@8 {
>  				reg = <VADC_DIE_TEMP>;
>  			};
> -			ref_625mv {
> +
> +			adc-chan@9 {
>  				reg = <VADC_REF_625MV>;
>  			};
> -			ref_1250v {
> +
> +			adc-chan@10 {
>  				reg = <VADC_REF_1250MV>;
>  			};
> -			ref_gnd {
> +
> +			adc-chan@14 {
>  				reg = <VADC_GND_REF>;
>  			};
> -			ref_vdd {
> +
> +			adc-chan@15 {
>  				reg = <VADC_VDD_VADC>;
>  			};
> -			vbat_sns {
> -				reg = <VADC_VBAT_SNS>;
> +
> +			adc-chan@48 {
> +				reg = <VADC_LR_MUX1_BAT_THERM>;
>  			};
>  		};
>  
