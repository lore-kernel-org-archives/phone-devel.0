Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61C2FA3742
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 08:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbiJaI6F (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 04:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJaI6E (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 04:58:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03A1D135
        for <phone-devel@vger.kernel.org>; Mon, 31 Oct 2022 01:58:02 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y69so16448961ede.5
        for <phone-devel@vger.kernel.org>; Mon, 31 Oct 2022 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmXgH1SAhcQIZxyzlJ97PpSiC9wwAu62KWCbNUsyD6Y=;
        b=1CXyrhXcPRd0nrSC3aPIkB9Bn78esovPFnNWKrzffXqOlHMJZb3/cEZREUFg+UKvVk
         2pdao7W9Hofxi8PFC7lysr3ju7q0BkM43v/ZpbQqHrPKBHmrpTNpKs22ZEVynU/zEQik
         UN+gtbPVuE5oMlIo0K4prEKut2Fjo6xkmM1EuF+5J00QTfBXAYqmY/o50/oiz94KaMJR
         Mws3XCeopytV5OvgIJdGp2HfkdZTqYqeMJdjZ+JrQv9P5A2/DvLIKZiVgyiNgs9h71AA
         vWMRM88TzEGML8os9csXOTI49BKUeHoGjeqSWv98CHB2EV4qLNcQJi1+gNsKL0ZaNy3Y
         z5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmXgH1SAhcQIZxyzlJ97PpSiC9wwAu62KWCbNUsyD6Y=;
        b=G90Bvgxcu6Nhc4AkuOBdD9cDqdrpjpPedFPTrnNr2sRY7DKz999Pu2rVhPxqSagE/9
         EwECKjANJi/FqeAqrvIRHbuvTa0MBVM90uFgCu6/JctBhBwTEwIFqPVLu2nu57q7k9z3
         Yvg0dNwAgTsRr1YvQYO95rDgN8LK5YBSny0JL+3AnO2CUl6MHPoDXmM3XcJ65qKdS6+6
         LItSLT4eliYTalo8s2eN78y6NKBLk7OAkCMCudVu6wo6Bc7rDBpwawqMNlPvUnTUVJ1i
         C0FNqzWSg0QPByCUTRsODZSqRBslENO/v6oVnx8bZxyV68jh/NuOJvGtZYBDCux5e6Jl
         oRbA==
X-Gm-Message-State: ACrzQf1G+j35bxcrNevNBJYMwJCy3La7toQuhZz6qC9HOO02u70Rn0HF
        KGX+QeEgqlH9khSlJRUPsVzQnA==
X-Google-Smtp-Source: AMsMyM6lYSiDtJrf/DKFW41ozouxJzii5xkDNqkcY0bNRbLhJUFcpQ3UdmT+9vkX+82ItP/IrztY8w==
X-Received: by 2002:a05:6402:3645:b0:45f:e918:9f35 with SMTP id em5-20020a056402364500b0045fe9189f35mr12209108edb.118.1667206681249;
        Mon, 31 Oct 2022 01:58:01 -0700 (PDT)
Received: from localhost (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906211100b007a8de84ce36sm2676467ejt.206.2022.10.31.01.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 01:58:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 31 Oct 2022 09:58:00 +0100
Message-Id: <CNZZFZGDB676.15ZOTNYXNCPUI@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        "AngeloGioacchino Del Regno" 
        <angelogioacchino.delregno@somainline.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        "Martin Botka" <martin.botka@somainline.org>,
        "Jami Kettunen" <jami.kettunen@somainline.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Luca Weiss" <luca@z3ntu.xyz>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sm6350: Add apps_smmu with
 streamID to SDHCI 1/2 nodes
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Marijn Suijten" <marijn.suijten@somainline.org>,
        <phone-devel@vger.kernel.org>
X-Mailer: aerc 0.12.0
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-11-marijn.suijten@somainline.org>
In-Reply-To: <20221030073232.22726-11-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun Oct 30, 2022 at 8:32 AM CET, Marijn Suijten wrote:
> When enabling the APPS SMMU the mainline driver reconfigures the SMMU
> from its bootloader configuration, loosing the stream mapping for (among
> which) the SDHCI hardware and breaking its ADMA feature.  This feature
> can be disabled with:
>
>     sdhci.debug_quirks=3D0x40
>
> But it is of course desired to have this feature enabled and working
> through the SMMU.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4

Regards
Luca

> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index b98b881ebe7e..c309a359ded9 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -485,6 +485,7 @@ sdhc_1: mmc@7c4000 {
>  			interrupts =3D <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "hc_irq", "pwr_irq";
> +			iommus =3D <&apps_smmu 0x60 0x0>;
> =20
>  			clocks =3D <&gcc GCC_SDCC1_AHB_CLK>,
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
> @@ -1064,6 +1065,7 @@ sdhc_2: mmc@8804000 {
>  			interrupts =3D <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "hc_irq", "pwr_irq";
> +			iommus =3D <&apps_smmu 0x560 0x0>;
> =20
>  			clocks =3D <&gcc GCC_SDCC2_AHB_CLK>,
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
> --=20
> 2.38.1

