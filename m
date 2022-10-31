Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80DCFA3740
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 08:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiJaIzS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 04:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJaIzR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 04:55:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B03C2615
        for <phone-devel@vger.kernel.org>; Mon, 31 Oct 2022 01:55:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id f5so6106196ejc.5
        for <phone-devel@vger.kernel.org>; Mon, 31 Oct 2022 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07p05AvXxhhg9Ebj2EYm3CyzIzK358DNeUTZctR79PI=;
        b=GZQfWLfmnuI5l9MZYGnSAYveWIFMxE58j8f5hvgoMp7eyitHBtHWTEb+uZ+QCz7+D1
         ILQ/sB5+dYeaXHTh7U1MpS4agInDcsNNxKDXqNBhMAMVqf85Jgy6MMmIJvG52bbiCjbv
         PH0QEasMd1paHeqr/fkeziXfGflPhjGFgceyifgvZvHID29F1mypW/14MCuLRfr12/9b
         Sz5zXmuJu0ZS0d0uPHgdMrx+p/O5GJtXvtYatWNjBn8UM6BxBe3EJikeoa1Y72ueELZf
         rPWQz94f4GI2hM3DCJh7ko7IcmZU6PnxUiSLPfcvSJ597QgAGBAljb8dnx9hcIslfdet
         zTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07p05AvXxhhg9Ebj2EYm3CyzIzK358DNeUTZctR79PI=;
        b=1gFC05ngxR9KwTXJXBqTguA8PJUCjsyv575bdFEiZa47sUC5uHlkEKTNxPzyA12Gfu
         cstnnECS9YM3MqsqR7IbZduj9khoiaiDEyI+JNn8eDzqiUeJLENlKdbIgEdyo1xVbT8W
         TtJMPCIh34mGlOurQ5UYUDsHu+fT+2U8QwwR4nGhjUvzlAicjd7uiqxkome+fCTdRcs4
         fYBcRf6P+fKgaIl643ij2kN1cpBOxAzIyEH9eu1G5WqWQx2F4nAv+M+OZTjaosIVbOml
         uRk0UM13rUxFVtsrcQulhuNpLaG6C88ORsCD61DcbNFIQTCsZlsajKDIlc6reX/uxowa
         RpRw==
X-Gm-Message-State: ACrzQf32h4cEIOwcj4TtjKMXEycxrxcNz9kPkK/MhdQDcHb1+G4AswYg
        LqdVp0mhpc5g92u4n3yN/bRyvw==
X-Google-Smtp-Source: AMsMyM6Ls3q3a245kOnbwO75tFYa02f6fAzk6wJP3W3KapAsowgtoEDHccbyuuTIyj3GPqs4TX4UrQ==
X-Received: by 2002:a17:907:271b:b0:7ad:b748:63df with SMTP id w27-20020a170907271b00b007adb74863dfmr9258436ejk.639.1667206514690;
        Mon, 31 Oct 2022 01:55:14 -0700 (PDT)
Received: from localhost (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b007aacfce2a91sm2713110ejc.27.2022.10.31.01.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 01:55:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 31 Oct 2022 09:55:13 +0100
Message-Id: <CNZZDUY2NAEQ.2MTXWFKUSHNA7@otso>
Subject: Re: [PATCH 01/10] arm64: dts: qcom: sm6350: Add resets for SDHCI
 1/2
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Marijn Suijten" <marijn.suijten@somainline.org>,
        <phone-devel@vger.kernel.org>
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
X-Mailer: aerc 0.12.0
References: <20221030073232.22726-1-marijn.suijten@somainline.org>
 <20221030073232.22726-2-marijn.suijten@somainline.org>
In-Reply-To: <20221030073232.22726-2-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun Oct 30, 2022 at 8:32 AM CET, Marijn Suijten wrote:
> Make sure the SDHCI hardware is properly reset before interacting with
> it, to protect against any possibly indeterminate state left by the
> bootloader.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
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
> index c39de7d3ace0..a3ae765d9781 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -490,6 +490,7 @@ sdhc_1: mmc@7c4000 {
>  				 <&gcc GCC_SDCC1_APPS_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names =3D "iface", "core", "xo";
> +			resets =3D <&gcc GCC_SDCC1_BCR>;
>  			qcom,dll-config =3D <0x000f642c>;
>  			qcom,ddr-config =3D <0x80040868>;
>  			power-domains =3D <&rpmhpd SM6350_CX>;
> @@ -1068,6 +1069,7 @@ sdhc_2: mmc@8804000 {
>  				 <&gcc GCC_SDCC2_APPS_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names =3D "iface", "core", "xo";
> +			resets =3D <&gcc GCC_SDCC2_BCR>;
>  			interconnects =3D <&aggre2_noc MASTER_SDCC_2 0 &clk_virt SLAVE_EBI_CH=
0 0>,
>  					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_SDCC_2 0>;
>  			interconnect-names =3D "sdhc-ddr", "cpu-sdhc";
> --=20
> 2.38.1

