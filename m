Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E60C43334
	for <phone-devel@archiver.kernel.org>; Fri,  1 Jul 2022 03:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiGADQ5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 30 Jun 2022 23:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234025AbiGADQv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 30 Jun 2022 23:16:51 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6958564D65
        for <phone-devel@vger.kernel.org>; Thu, 30 Jun 2022 20:16:50 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id m24-20020a0568301e7800b00616b5c114d4so884133otr.11
        for <phone-devel@vger.kernel.org>; Thu, 30 Jun 2022 20:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HPNd4ReapLodwhnbZtj5CIOKPYAgQKMIlbQzUVzo7PA=;
        b=KgpRiaQlIInDtNWwve1xr8qYAEVPtOLJSS1jE74EkT3DPKl/jQttI+vc0RdNjD5SYw
         tfyEDkQmueRl6sgGxQ4sSLROHm9f6O6wnbgbsdQ8ZNqM0rITQFfgKm+JuHRNPoLEbjvH
         P6JiruMLvhfpqCeMYTKRzJ1ZQp+2lmLdCgirJA2JK+pd8Rdpl+Qn8/GFjuRaMouW35NY
         t7EczL0tzK5RLMSL5zEpBmEUbRuPWHWjxh+probLRdM4CvOq2X288oC6r3IcKLywyOLL
         4VqQ8P714xErkirPgvHVr9++FDnfmWyWAG8aewvfSiTA0LZzmhhhEqfzbQf3eltFY/G4
         F0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HPNd4ReapLodwhnbZtj5CIOKPYAgQKMIlbQzUVzo7PA=;
        b=tjF0kQY7BQOyibt2L+h9uj5cdsfdEGa0I2AA2Rcezgah5fi3cPSaBth3uMIZDJwIZI
         FZnoKFoKs0drI7WghGfqapFsMplsXoLcMq8CcNCsL2+3jykmzxGJoVULkz5xFdmkKlFd
         EVvLUuQOLaWSCA0ZLJvi3RyWwpeUQH7FGTq2qN+C4XAOzlR1b6eoUhDaHFZDX/X6Gs3H
         L+mqLnqL0cbG0Yf7pDbW0F7Ue/YuXzuHChvATMmQ1abthBren+rpeRxQ/IgYzoOdpPGR
         IYA1Yh2dGjsH+K3Um5euZzH0S3wGu8SWBP2/pU2mrn/4cp4ONFfdRSlh7omMQZagaM8H
         IAfg==
X-Gm-Message-State: AJIora++qKhlLkJUNv+kixXbqBfzMZsn9nQW7BDN+eZfW5CMf3NdvFjB
        db4e2aEdXzlsiZtQ5sYLdczpmg==
X-Google-Smtp-Source: AGRyM1uO+s50h/3fmKyKSQ72i2tbY3t4VXAXY3PiTJmIZ5tobtdNuA66C58BgCeCFycW6fHZs/26wA==
X-Received: by 2002:a05:6830:4491:b0:618:b000:97b1 with SMTP id r17-20020a056830449100b00618b00097b1mr2996109otv.148.1656645409774;
        Thu, 30 Jun 2022 20:16:49 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 7-20020a9d0807000000b0061706c58a9bsm2867121oty.61.2022.06.30.20.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:16:49 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:16:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Teguh Sobirin <teguh@sobir.in>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 7/7] fixup! arm64: dts: qcom: add support for AYN Odin
 Base and Pro
Message-ID: <Yr5nH5O4gJlCIsmI@builder.lan>
References: <20220606230522.107428-1-teguh@sobir.in>
 <SEZPR03MB66669DF0DECE022290F7C9E9DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEZPR03MB66669DF0DECE022290F7C9E9DDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 06 Jun 18:05 CDT 2022, Teguh Sobirin wrote:

Please squash this with the commit you're trying to fix and repost with
a cover-letter.

Thanks,
Bjorn

> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
> index 545debd7c275..8deeb375bc1a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-ayn-odin.dts
> @@ -133,7 +133,7 @@ vdda_usb1_ss_core:
>  		vdda_qusb_hs0_1p8:
>  		vdda_qusb_hs0_3p1:
>  		vdda_mipi_dsi0_1p2:
> -		
> +
>  		vdda_ufs1_1p2:
>  
>  		vreg_l1a_0p875: ldo1 {
> -- 
> 2.30.2
> 
