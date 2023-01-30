Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CE1C54EED
	for <phone-devel@archiver.kernel.org>; Mon, 30 Jan 2023 18:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238252AbjA3Sb0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238117AbjA3SbM (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 30 Jan 2023 13:31:12 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3D118B06
        for <phone-devel@vger.kernel.org>; Mon, 30 Jan 2023 10:30:10 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id k4so28962669eje.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Jan 2023 10:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65DAqa7NFXfr14vMU2F+CNbqT97WmaFxmni09tE7hfo=;
        b=G0BBFzKq0YWCP2HAK0UdjkCMMAgqIN2FCpswzuQ3dBQ0YjEUV2ERtK3Sf4Ld6mntlr
         Kpy6rT4oAh7u1WvVpqzXD4T8uluPqWz4uJy5arFEEhOmjZGEb6i5BGR5ijQW9kle0faR
         C+Rv5hxBAHIVcHaWBMoLlj7WgDSxrZCrdpgl81XzRI+QZrLpfbbYp0nVKwhKECALoTIJ
         XlxUxBEX63NafjyY9gs2JoypWRxjqIQVel4ygZdd589zo56rk5MUKjyvHR97qlLkxNyt
         7kzOxyFRHCy5aQCSErKEJJUwmyDgHXj2YNsB5w5t/MVCUU0YB5mrMBvt6VuDZbRzezVI
         TOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65DAqa7NFXfr14vMU2F+CNbqT97WmaFxmni09tE7hfo=;
        b=6ZTE4g3OPasR1yCErsLjAqTmFZl8K+uRerwsaih2rvbozwvTjAS/B6/2DUXCbFKA+j
         rWOU2C+bzaDJ8XbmPwhGT4KjW8YWqpkuqIkMgipfjd+u+njbAQQBerzOpgqRJT9gAGHC
         yszhabHy5myw117utgKKK81KKSgfSnwPPQaQUK7mVgVySO6Qx/6Mu4OGRZC/s7RhMpbW
         MFo9eZuF+12siYwOzm4BgFN1JJjcC03C4yMJImEB3aFfSBjrCGfw2x2mudB/PYhN7oRm
         Th+q0VO90EY6D2HwWmA+m96BgwusGr63tT+iaLvDaxhAV5UkkG9LY+egsmCc9SW1a8lV
         Tbbw==
X-Gm-Message-State: AO0yUKVnoplqP41bh4524pr1bPoFfX27jVcG8R1WMe+639mzlNU1pgcd
        7Oi7CuhfaiWexi2P8vpfXOukRQ==
X-Google-Smtp-Source: AK7set8Zb75ejjpssAeuChuI4lKGTyk46KrTOKEni5f22Paov+i6NmS0GT6yJ+rT4XYmrqB1hQnxcg==
X-Received: by 2002:a17:906:fc13:b0:87f:d08:1064 with SMTP id ov19-20020a170906fc1300b0087f0d081064mr472237ejb.6.1675103407343;
        Mon, 30 Jan 2023 10:30:07 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709061dc500b0088a694749f7sm1018726ejh.4.2023.01.30.10.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 10:30:06 -0800 (PST)
Message-ID: <3112b531-45df-672c-c0a7-aefbdcceb727@linaro.org>
Date:   Mon, 30 Jan 2023 19:30:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8974: correct qfprom node reg
Content-Language: en-US
To:     luca@z3ntu.xyz, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Craig Tatlor <ctatlor97@gmail.com>
References: <20230130-msm8974-qfprom-v1-1-975aa0e5e083@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230130-msm8974-qfprom-v1-1-975aa0e5e083@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 30.01.2023 19:20, luca@z3ntu.xyz wrote:
> From: Craig Tatlor <ctatlor97@gmail.com>
> 
> The qfprom actually starts at 0xfc4b8000 instead of 0xfc4bc000 as
> defined previously. Adjust the tsens offsets accordingly.
> 
> [luca@z3ntu.xyz: extract to standalone patch]
> 
> Fixes: c59ffb519357 ("arm: dts: msm8974: Add thermal zones, tsens and qfprom nodes")
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Isn't this a raw vs ecc-corrected values problem?

Konrad
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 8d216a3c0851..922d235c6065 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1132,16 +1132,16 @@ restart@fc4ab000 {
>  			reg = <0xfc4ab000 0x4>;
>  		};
>  
> -		qfprom: qfprom@fc4bc000 {
> +		qfprom: qfprom@fc4b8000 {
>  			compatible = "qcom,msm8974-qfprom", "qcom,qfprom";
> -			reg = <0xfc4bc000 0x1000>;
> +			reg = <0xfc4b8000 0x7000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			tsens_calib: calib@d0 {
> -				reg = <0xd0 0x18>;
> +			tsens_calib: calib@40d0 {
> +				reg = <0x40d0 0x18>;
>  			};
> -			tsens_backup: backup@440 {
> -				reg = <0x440 0x10>;
> +			tsens_backup: backup@4440 {
> +				reg = <0x4440 0x10>;
>  			};
>  		};
>  
> 
> ---
> base-commit: 6d796c50f84ca79f1722bb131799e5a5710c4700
> change-id: 20230130-msm8974-qfprom-619c0e8f26eb
> 
> Best regards,
