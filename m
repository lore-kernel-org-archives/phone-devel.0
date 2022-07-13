Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01FDCCA479
	for <phone-devel@archiver.kernel.org>; Wed, 13 Jul 2022 20:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbiGMUxy (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 13 Jul 2022 16:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237303AbiGMUxp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 13 Jul 2022 16:53:45 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55C5101CC
        for <phone-devel@vger.kernel.org>; Wed, 13 Jul 2022 13:53:37 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-10c8e8d973eso67025fac.5
        for <phone-devel@vger.kernel.org>; Wed, 13 Jul 2022 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OYmf+T3lRc79u5oDlMjUbDjfxPJAcVJEHMhxiR51+Fs=;
        b=SPhcykdTfoAFVar5hEaib1+zz9NzmHisUsycRp2UDMoNG73WmZTrMmthYDs9PJy+lk
         E5CWEEcNe60QEHQ2UdvFucM3qtTTgDsr/oqFlA/rMjnFSzqmZn61X9WjMnh4LwwjwRc2
         GoruyrKbxN3BuW3Rc2cJ8Whd/8PWXDmhT341ciiBYGyVNxKr+HDznUeYoFGN7kLoVNDy
         i1dzYC6xWbnyAyttKpugkAV1rgFWYKyJpjxQZPThq09IeXIvGJEawVTlVxpKnALIF2mJ
         O22PciPb/l5TNJxCgnTkUVfN2m5aAxEMyKqKi8LmcsepGnvx9VR9//rITXVywg/UQFTL
         zwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OYmf+T3lRc79u5oDlMjUbDjfxPJAcVJEHMhxiR51+Fs=;
        b=h21Gfagq5M8bXTov/m0GDBoiP7ZibnHYiDsfGKg7uuncjDoBv89AbMGJcSHj4XkSGj
         uCSrRDmTByDfOh7zuODjUTgnmsqDOrL+85EnGMZE/kZVbR2vJiuYRjbb+fHuk5jndmOB
         m9MUU4kA2D6i7rF+JwdY8ncNEgznj/0i6iBHaVz5o+XSchnloeCPHYyAksHeRLJ8mz38
         csBb71Cu90f9TEPwYzmx+glkpm08yfX3TJAdswwxH21XZsuzmYUH0stlCaIk5P9vVAjW
         8/NIyDMLg5X/PoQROJacnQj90wA+IdwhOcdfn1PxFUU5J0QYP1BRW8wQfMbFqjJzfwX0
         s6FA==
X-Gm-Message-State: AJIora83L4MRgYHk8dNIv2ch/UKohcmNSOvwIkz7nsmAapwbk5m4VQqc
        2Qksj6ZtigYcs1/29+VgtEt1iQ==
X-Google-Smtp-Source: AGRyM1vw8R/0Mik936bygCkJyPGmua0fl/ZV3zFCx7E6u2dNDZEHeSILD5mtPkiG+LUPBJJ6xtRWEg==
X-Received: by 2002:a05:6870:e0cd:b0:10c:289b:c8f0 with SMTP id a13-20020a056870e0cd00b0010c289bc8f0mr2800216oab.74.1657745617077;
        Wed, 13 Jul 2022 13:53:37 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id kv17-20020a056870fb9100b00101c76f7831sm6502446oab.24.2022.07.13.13.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:53:36 -0700 (PDT)
Date:   Wed, 13 Jul 2022 15:53:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 generalize the display panel node
Message-ID: <Ys8wzodQNI5ZrUUM@builder.lan>
References: <20220708111207.85249-1-jo@jsfamily.in>
 <MN2PR02MB702479BBA7FE8757E577CA6DD9829@MN2PR02MB7024.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR02MB702479BBA7FE8757E577CA6DD9829@MN2PR02MB7024.namprd02.prod.outlook.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri 08 Jul 06:12 CDT 2022, Joel Selvaraj wrote:

> Make the display panel nodes generic. The tianma and ebbg variant will
> set the compatabile property as per the display model they use.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi     | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index d88dc07205f7..634999cf8987 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -221,8 +221,8 @@ &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l26a_1p2>;
>  
> -	panel@0 {
> -		compatible = "tianma,fhd-video";
> +	display_panel: panel@0 {
> +		status = "disabled";

Please make "status" the last property defined in the node. Same comment
on the next 2 patches.

Thanks,
Bjorn

>  		reg = <0>;
>  		vddio-supply = <&vreg_l14a_1p8>;
>  		vddpos-supply = <&lab>;
> @@ -235,7 +235,7 @@ panel@0 {
>  		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  
>  		port {
> -			tianma_nt36672a_in_0: endpoint {
> +			panel_in_0: endpoint {
>  				remote-endpoint = <&dsi0_out>;
>  			};
>  		};
> @@ -243,7 +243,7 @@ tianma_nt36672a_in_0: endpoint {
>  };
>  
>  &dsi0_out {
> -	remote-endpoint = <&tianma_nt36672a_in_0>;
> +	remote-endpoint = <&panel_in_0>;
>  	data-lanes = <0 1 2 3>;
>  };
>  
> -- 
> 2.36.1
> 
