Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0862C48BDF
	for <phone-devel@archiver.kernel.org>; Sun, 13 Jun 2021 04:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C47CA60FEA
	for <phone-devel@archiver.kernel.org>; Sun, 13 Jun 2021 04:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhFMEXf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 13 Jun 2021 00:23:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhFMEXf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 13 Jun 2021 00:23:35 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5EFC061766
        for <phone-devel@vger.kernel.org>; Sat, 12 Jun 2021 21:21:23 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id c13so10558585oib.13
        for <phone-devel@vger.kernel.org>; Sat, 12 Jun 2021 21:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8YqT4iQ5ARuAsr6gtIHiKsiWycjnAEstDWdPEQ2s7Oo=;
        b=SzK65P0jNbO87tAuQU+tnH5HoSu25WKpV5S4ECBy4n4OUq7OkU4RUkEn2S9I8tpLe0
         UWUHYqjE1iPLFwpK6asKcuVwZcudPJj8tYRYtZbvQrDSGgxc6RGKH8fQq0g9NhIu23S8
         McOnAJ5fK4be9oGgD1gbPnDMP9nVxMbxDlULrHNEJPoDZ68LjjdNx2rsEoWgfVfYP9xk
         3bNDzl4Qqw6M0tRhB9xSflSQ8UUVXWIGsU1bfP1yyDr3U+vQrZ0xhQ86orbkid2nIL/j
         2KfA+jnMvihI34zfIcZsc9mJ0+BPfuGF+0yNupOR9DWyFlWnXtxHSaU1J7oahd9rOcM9
         UAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8YqT4iQ5ARuAsr6gtIHiKsiWycjnAEstDWdPEQ2s7Oo=;
        b=thQXuMlgNRn5RGD+OdklIygO5r6TuCGzYv+UkqNov6cgyPpO4cgKjSYu8iVYSRKiGu
         MLMm1xE5EBFbIVNeFqipjbv1xeoFFNSRrAfCXSZIrkKzZFJJ/vlP26Saqoy45RDOpeBF
         AXSnnbpf1RyGcCf0fkjKF7jEwWOYSTZvH+WwYKz3iztKPpCs2bRC56mB9VFHv39dR//n
         tM3G0aqAMQf7JGlfjgs9noSVcxrKwmwdpjfbKZfr6VLhgZFQIGk2T+n8bHD1ywMuOdfx
         MMVWSOA/R/8W392BFNt5eSWCPTpYWKol7Mzc+6aFFz5HBN0xeUVgxxkCh0YMYx92hF/o
         elGw==
X-Gm-Message-State: AOAM532tEHNjFKR28wsNcEyr4WZxrgpM/Fz48IO/W0xvQMIWr9FnsCZV
        UspdITCI31yPExmzb+rgxOq4gw==
X-Google-Smtp-Source: ABdhPJx39pPSqUGZ+2JLZGZIoy2K54tmZqpddydIlq0r84X5ZZ7EvZbLXRRnITnI5LKzKYzAIeqymg==
X-Received: by 2002:aca:a9c3:: with SMTP id s186mr6856373oie.103.1623558082760;
        Sat, 12 Jun 2021 21:21:22 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n186sm2110995oia.1.2021.06.12.21.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 21:21:22 -0700 (PDT)
Date:   Sat, 12 Jun 2021 23:21:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pmi8998: introduce qpnp haptics
Message-ID: <YMWHwHXRZ69vivC7@yoga>
References: <20210612205405.1233588-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612205405.1233588-4-caleb@connolly.tech>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat 12 Jun 15:54 CDT 2021, Caleb Connolly wrote:

> Add bindings for Qualcomm QPNP haptics, setting default values used on
> most devices.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index d230c510d4b7..ccf64c1898d4 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/input/qcom,qpnp-haptics.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> 
> @@ -41,5 +42,20 @@ lab: lab {
>  				interrupt-names = "sc-err", "ocp";
>  			};
>  		};
> +
> +		qpnp_haptics: qcom,haptics@c000 {

No qcom, in node name, please.

> +			compatible = "qcom,qpnp-haptics";
> +			reg = <0xc000 0x100>;

#size-cells is <0>, so this means 2 addresses. Please drop the "length".

Regards,
Bjorn

> +
> +			interrupts = <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
> +			interrupt-names = "short", "play";
> +
> +			qcom,wave-shape = <HAP_WAVE_SINE>;
> +			qcom,play-mode = <HAP_PLAY_BUFFER>;
> +			qcom,brake-pattern = <0x3 0x3 0x2 0x1>;
> +
> +			status = "disabled";
> +		};
>  	};
>  };
> --
> 2.31.1
> 
> 
