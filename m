Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1C7C54EE9
	for <phone-devel@archiver.kernel.org>; Tue, 27 Sep 2022 13:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiI0NHa (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbiI0NH1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Sep 2022 09:07:27 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7D6181CEF;
        Tue, 27 Sep 2022 06:07:23 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1CCF43F257;
        Tue, 27 Sep 2022 15:07:21 +0200 (CEST)
Message-ID: <fcc552c0-7e0d-cdd2-be56-8af9e763d747@somainline.org>
Date:   Tue, 27 Sep 2022 15:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <20220925210229.128462-2-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220925210229.128462-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 25.09.2022 23:02, Luca Weiss wrote:
> pm8941-misc should be called 'extcon' and pm8941-coincell 'charger'.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 33517cccee01..01f14d5f314d 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -27,7 +27,7 @@ pwrkey@800 {
>  			bias-pull-up;
>  		};
>  
> -		usb_id: misc@900 {
> +		usb_id: extcon@900 {
>  			compatible = "qcom,pm8941-misc";
>  			reg = <0x900>;
>  			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
> @@ -138,7 +138,7 @@ pm8941_iadc: adc@3600 {
>  			qcom,external-resistor-micro-ohms = <10000>;
>  		};
>  
> -		pm8941_coincell: coincell@2800 {
> +		pm8941_coincell: charger@2800 {
>  			compatible = "qcom,pm8941-coincell";
>  			reg = <0x2800>;
>  			status = "disabled";
