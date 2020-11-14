Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438D9C5519F
	for <phone-devel@archiver.kernel.org>; Sat, 14 Nov 2020 14:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E848320719
	for <phone-devel@archiver.kernel.org>; Sat, 14 Nov 2020 14:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="sc68bhkr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgKNODO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 14 Nov 2020 09:03:14 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:36599 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgKNODO (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 14 Nov 2020 09:03:14 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Sat, 14 Nov 2020 09:03:13 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605362592;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=uvhBQwmZuEKWwxTDNAOpiwnoQdo3xw+7k3IeY8EYRCM=;
        b=sc68bhkr4of5vl4dt9U7NThzj6/XKQ2RnkcxJRG/TPrTYsAGgxqZQ60P3bOZ4RyS4T
        i6HSJhi12BClLoWBnI+F2bH+4C+lhd0WaNXIfsNlKEHG5CAfvecYBNnDf5w5Nzf99Din
        9x0l1q0PMaGryrJpQ5zNzpowEPs15bvWvXYUYDxsFJLi58xJzWfxXKlngVnsubPIdWBC
        60ayin0GMMgJ4QLSAeu3FUTHB4GDHenEQLJbbtrWMokRm33JS7WU5GyEFs+ET7k7hJ5E
        8qPtRGVHhfS0ZiBicqZwbMi+0H+jKxiem8pPAHqRNmgYAARvNukb6j5jWrS5jDZHYSIP
        yaJg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j+IcfNBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id Z061efwAEDv5tLq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 14 Nov 2020 14:57:05 +0100 (CET)
Date:   Sat, 14 Nov 2020 14:56:59 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     nikitos.tr@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/6] arm64: dts: qcom: msm8916-longcheer-l8150: Enable
 PM8916 vibrator
Message-ID: <X6/iK4p2lyNzZbv0@gerhold.net>
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

Thanks for sending these!

On Fri, Nov 13, 2020 at 10:59:12PM +0500, nikitos.tr@gmail.com wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> L8150 has a vibrator connected to PM8916. Add it to the device tree.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>

For all 6 patches in this series:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

> ---
>  arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> index 2c204d535d66..d106bdbfda68 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
> @@ -61,6 +61,10 @@ &pm8916_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  };
>  
> +&pm8916_vib {
> +	status = "okay";
> +};
> +
>  &pronto {
>  	status = "okay";
>  };
> -- 
> 2.25.1
> 
