Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5AAC4332F
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 19:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiJMTqY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 15:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiJMTqX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 15:46:23 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F7218B48E;
        Thu, 13 Oct 2022 12:46:22 -0700 (PDT)
Received: from [192.168.1.101] (95.49.31.41.neoplus.adsl.tpnet.pl [95.49.31.41])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5EB461F67B;
        Thu, 13 Oct 2022 21:46:19 +0200 (CEST)
Message-ID: <4ffe4597-be6f-65c9-42cd-e2b0c70ce98a@somainline.org>
Date:   Thu, 13 Oct 2022 21:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: ipq8064-rb3011: fix nand node
 validation
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013190657.48499-1-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221013190657.48499-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 13.10.2022 21:06, Luca Weiss wrote:
> The devicetree documentation for the nand node requires the subnode be
> called nand@ and no compatible is needed.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> index 5a65cce2500c..86f895db9894 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> +++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> @@ -264,8 +264,7 @@ &hs_phy_1 {
>  &nand {
>  	status = "okay";
>  
> -	nandcs@0 {
> -		compatible = "qcom,nandcs";
> +	nand@0 {
>  		reg = <0>;
>  
>  		nand-ecc-strength = <4>;
