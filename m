Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCAEC77B7F
	for <phone-devel@archiver.kernel.org>; Fri, 19 May 2023 23:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjESXYU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 19 May 2023 19:24:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjESXYT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 19 May 2023 19:24:19 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2853318D
        for <phone-devel@vger.kernel.org>; Fri, 19 May 2023 16:24:17 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2af24ee004dso14507571fa.0
        for <phone-devel@vger.kernel.org>; Fri, 19 May 2023 16:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684538655; x=1687130655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VeXTcSjQ1u9WPirlSadWI4lW3NNlUgK10Dkih6okJFQ=;
        b=OO5rgIA7Iqshr5cs3rSGJ4XHDshZUm9a6cv9xjXEJ2aUbkpJ1cq20PeJsNohsxISX/
         4YLurx9dAH9Qmzw2i48VRcdF/GRRULUyD9W51Qnru5yw59zdVPv9eyPeaFCor7q0hYLI
         eL1/g6CpL0ToHl3aQpP6NX0jBa3e6IA7XsJE/yb/RGVg607oPFTTV/Nfyia9dnDYBC8z
         Qnw2BACEloMh9ujzM6MCoBIJ0bKf0Uk55rQTy1SYl747AVqTP7wWlCFoMIfinTxH9/Ca
         VoRXpDWXOraoW6GBlhSZJrrBtXpI5LFoeIkJzWGUln/Lcb2xVQMcuoJsfV1atDmK2+6B
         8MYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684538655; x=1687130655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeXTcSjQ1u9WPirlSadWI4lW3NNlUgK10Dkih6okJFQ=;
        b=BijAi5fjpBLoGczlM7v7vlelspWWxIYczox+PHeSNF8jxIQC//K8uXKpFb4/r4Jhbp
         1e80xxFnl5C0+vx7paWFUFQ7s3YJ/V8RT09UoZzbTPEi6GfE+okwTte6VZvjVoALhmLz
         1yytitoOgYbjRe74B+V6RUVlvya/ZfZWbyyUXPV/ldurskwtEKcW7S+2BeVTIiaHmrmw
         oQXKS0oVZCfMm2zJva654Or3DTGmZQOEzRiL6d7xDxWVoxNgOsIcWprxqChNrDKHwVCu
         Bjr54gWHUI2rdTZ/kCKYt4Zwrt993c1DErlqgMwYvxVWpr63ja8bSpZ19cSd9WKGWECp
         7zXQ==
X-Gm-Message-State: AC+VfDxeimiGkPeGA+HrPXKFeWh64Ed2EU97tD5ZYINIGPUqbPmzik0F
        7iXUm8VDZXf+HaQa2i4ImSYRvw==
X-Google-Smtp-Source: ACHHUZ7DKkjO9fUHI9Nf4reCnLMCyIe5yBRYrCRS5Qj4H/L+Tf1xn/fenq+byrA4tAtTCDsbuCYqRQ==
X-Received: by 2002:ac2:420b:0:b0:4ef:e895:cff2 with SMTP id y11-20020ac2420b000000b004efe895cff2mr885589lfh.64.1684538655282;
        Fri, 19 May 2023 16:24:15 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id f2-20020ac25322000000b004d4d7fb0e07sm54480lfh.216.2023.05.19.16.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 16:24:14 -0700 (PDT)
Message-ID: <eed1bfec-70f4-953e-ae9b-38b987edc3bd@linaro.org>
Date:   Sat, 20 May 2023 01:24:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] ARM: dts: qcom: msm8226: Add rpm-stats device node
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230519210903.117030-1-matti.lehtimaki@gmail.com>
 <20230519210903.117030-4-matti.lehtimaki@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230519210903.117030-4-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 19.05.2023 23:09, Matti Lehtimäki wrote:
> Add device node for the rpm-stats pseudo device.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index e272a1e15b44..006263373348 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -597,6 +597,11 @@ frame@f9028000 {
>  			};
>  		};
>  
> +		sram@fc190000 {
> +			compatible = "qcom,msm8226-rpm-stats";
> +			reg = <0xfc190000 0x10000>;
> +		};
> +
>  		rpm_msg_ram: sram@fc428000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0xfc428000 0x4000>;
