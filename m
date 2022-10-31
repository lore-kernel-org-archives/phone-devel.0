Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B08FECAAA1
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 21:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiJaVM4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 17:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiJaVMx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 17:12:53 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5017C14030;
        Mon, 31 Oct 2022 14:12:52 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.156.neoplus.adsl.tpnet.pl [95.49.29.156])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 063B83EBDE;
        Mon, 31 Oct 2022 22:12:49 +0100 (CET)
Message-ID: <e03d6d9f-3dbe-7766-fabf-5edb5a122333@somainline.org>
Date:   Mon, 31 Oct 2022 22:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 04/10] arm64: dts: qcom: pm6350: Include header for
 KEY_POWER
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-5-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221030073232.22726-5-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 30.10.2022 08:32, Marijn Suijten wrote:
> Make pm6350.dtsi self-contained by including input.h, needed for the
> KEY_POWER constant used to define the power key.
> 
> Fixes: d8a3c775d7cd ("arm64: dts: qcom: Add PM6350 PMIC")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm6350.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm6350.dtsi b/arch/arm64/boot/dts/qcom/pm6350.dtsi
> index 18c14257e2c1..111f4c1c56ae 100644
> --- a/arch/arm64/boot/dts/qcom/pm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm6350.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
>   */
>  
> +#include <dt-bindings/input/input.h>
>  #include <dt-bindings/spmi/spmi.h>
>  
>  &spmi_bus {
