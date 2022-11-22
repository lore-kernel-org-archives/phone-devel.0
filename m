Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF88C433FE
	for <phone-devel@archiver.kernel.org>; Tue, 22 Nov 2022 12:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbiKVMJX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 22 Nov 2022 07:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbiKVMJQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 22 Nov 2022 07:09:16 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23502BB03
        for <phone-devel@vger.kernel.org>; Tue, 22 Nov 2022 04:09:10 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so23289181lfv.5
        for <phone-devel@vger.kernel.org>; Tue, 22 Nov 2022 04:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Csnc48Urn5gOv0ohzJqQzyx1zsvPYe4yFR3Q3spVEss=;
        b=Fh59EBhehUaw9BnEhRk64bPt5Tzu2mqPOIkg1lhypyOFmh9qgxRl2okP/gSvIyaOFg
         yct+f+OJcCcL2SRKf73tRhQrzEJQ/GV/fs4umpCFxiQy7/bGxxTJmpXCOh1U6oBpkJ1M
         xpO0l2q5MgvppWrQ0H8YyHs6wjQORNfAgG6nCVH7y7OzaLjshW9rpt+zvnHnJMfIv4Rz
         6SLlAdOacvYqoFV8c8GRpKGW3CeoZvZNX6DoLz2m7VyQ9cm0iWtdtbs781AX8d0MAQK4
         v2rAppcXHcERiFxG473qZ/83W/QTakMVAyzL+bWmMfJ2bSkJIRAxIBBpjemj2P9NVDGA
         a52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Csnc48Urn5gOv0ohzJqQzyx1zsvPYe4yFR3Q3spVEss=;
        b=iz6rLwsNFN60TNAqveYWN3kiJtAyyNdUt1lf36W4VM+2CVw2mC0BDhyAsuLJSUxODc
         Qz7EFj3VvI3u6EU1vzg5HKlS/RGVDadgU7yEKMctyrL7gu/+Du7T+AQR0zZXqsRXUj7H
         h2zx2w19k1yvJL1ulTJom2/Nj5Nhjn0K5PAsZiHeFdYeJQg8weTd+nUz+OMbXJqK6G4y
         HGcPPIsXudKkKay9ebb6pw9OMKhnjdJxMZ2G+lQFjT+Ji9razJXOHMyrt0rK/V9n/AkO
         YjHjPSQUY90tBZtvUY6Rpy57hmV5Mr6dDOJ/J+uTysKOR78XruXjErAHzqwCJnF1oZFR
         thGQ==
X-Gm-Message-State: ANoB5pmbFAY16VX+Y5KYcoGvb0fbKJ6OvKQYVnbK7HgQpikq/nxVbCaC
        F6UcpDzQkzzsyrOuYJKzyNSyUmV1nVzgt8s6
X-Google-Smtp-Source: AA0mqf6YcHIO+ovT7hifVj6mBVLdQ4MRhx3eLJDMkq6hkySZwNsp48jRqBgcfhwZZMphiDdwQrruyw==
X-Received: by 2002:ac2:4e07:0:b0:4a2:2a60:ecf5 with SMTP id e7-20020ac24e07000000b004a22a60ecf5mr8184639lfr.57.1669118948977;
        Tue, 22 Nov 2022 04:09:08 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512358600b0049468f9e697sm2431397lfr.236.2022.11.22.04.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 04:09:08 -0800 (PST)
Message-ID: <da4f788c-32bd-ece5-0d95-321bb7f50d56@linaro.org>
Date:   Tue, 22 Nov 2022 13:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974-castor: Fix touchscreen init
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221121213019.324558-1-luca@z3ntu.xyz>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221121213019.324558-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 21.11.2022 22:30, Luca Weiss wrote:
> On some devices a higher delay is needed, otherwise touchscreen probe
> fails.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Two simple patches that have been sitting around in msm8974-mainline
> tree for a while.
> 
>  .../arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> index 36044130a739..2725bd343f3a 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> @@ -122,7 +122,7 @@ synaptics@2c {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&ts_int_pin>;
>  
> -		syna,startup-delay-ms = <10>;
> +		syna,startup-delay-ms = <100>;
>  
>  		rmi-f01@1 {
>  			reg = <0x1>;
