Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD46C4332F
	for <phone-devel@archiver.kernel.org>; Fri,  9 Dec 2022 22:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiLIW1Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Dec 2022 17:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiLIW1X (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Dec 2022 17:27:23 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5CA2935B;
        Fri,  9 Dec 2022 14:27:22 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A0B5ACA534;
        Fri,  9 Dec 2022 22:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1670624840; bh=wLfywnxmIafoKhNvlsidC0GQdw63kk9snyKcibJe0eQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=t0s3JI/5UovWp4wn/nB2fBIgsPyAE15q1Sdc4UdV3Kivu/onrmIMkiDkIQcSxVeZx
         NSJKAul/dDfqMRaAEPa7UoOJqW5eQUXhFeTHWkWVbIl0lMjow5Dk2Uzw1u/4i7769a
         VT9zwEbDjxN2O/+VYmCDC0+l+nSsu44eZIHv5zb4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     phone-devel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pmi8950: Correct rev_1250v channel label to mv
Date:   Fri, 09 Dec 2022 23:27:19 +0100
Message-ID: <4558956.LvFx2qVVIh@g550jk>
In-Reply-To: <20221209215437.1783067-1-marijn.suijten@somainline.org>
References: <20221209215437.1783067-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Freitag, 9. Dezember 2022 22:54:37 CET Marijn Suijten wrote:
> This was pointed out in review but never followed up on thanks to
> sidetracked discussions about labels vs node names.
> 
> Fixes: 0d97fdf380b4 ("arm64: dts: qcom: Add configuration for PMI8950
> peripheral") Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8950.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> b/arch/arm64/boot/dts/qcom/pmi8950.dtsi index 32d27e2187e3..8008f02434a9
> 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8950.dtsi
> @@ -47,7 +47,7 @@ adc-chan@9 {
>  			adc-chan@a {
>  				reg = <VADC_REF_1250MV>;
>  				qcom,pre-scaling = <1 1>;
> -				label = "ref_1250v";
> +				label = "ref_1250mv";

Indeed 1250V are maybe a bit much ;) Thanks!

Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

>  			};
> 
>  			adc-chan@d {




