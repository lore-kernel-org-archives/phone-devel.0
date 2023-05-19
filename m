Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BCFC77B75
	for <phone-devel@archiver.kernel.org>; Fri, 19 May 2023 23:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjESXZ2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 19 May 2023 19:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjESXZ1 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 19 May 2023 19:25:27 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17784E76
        for <phone-devel@vger.kernel.org>; Fri, 19 May 2023 16:25:21 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac7462d9f1so44181491fa.2
        for <phone-devel@vger.kernel.org>; Fri, 19 May 2023 16:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684538719; x=1687130719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VOvjqN8AVqDU+Adbzq8R5mSYYGxz+RyLYVuQ1pVdfBY=;
        b=gKrVCbH6ooo39BHamSYxZz6HuvRVrXQVsJtkCWbh4jQeEI7sCxkC1DUoPJv2RNCPG7
         T02BfXw3Lrqlz3dwzaSiM0TwitcOSWlZp+RcZ3DfQfVmCUXh+os8KYtfuqStyoS2fd52
         xX4N8V5YnGsXRyY6+WTJFbkx6e6UVYOz92z1Tk8XSph/y2QXHs9Z304p3xgSa5nxmWnC
         zsvFvCIA1yBppLLRNZG+hxBOeoDflCRUkDSfwUZfG/Iaq2Hdwdtm+k7sy910PwXb3dCI
         xR+/U2MzIZCUPQzxjAKKZGUSMhLXRx2+j+XAMxLeRNjM/xowphXBEAlF/kpEf+a1BLUj
         caJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684538719; x=1687130719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOvjqN8AVqDU+Adbzq8R5mSYYGxz+RyLYVuQ1pVdfBY=;
        b=YMBnHn8k6d4VxgIj23i/9O1ux32EtzAcbD3mEjHbywMUpguYqZZJSkNNwKqRmzOOzw
         PuANvNt3S0HS5blz0R7flmbZiRYsUDXDoxH5UOL2SFKRimQCH2MgUFBHGft34A6h36Eg
         mUCVlJ0skqhIbwJgSfmAfpLFm0bFIMY9P2PHQ3WXhWvGdg1RUDP2OdF83ncfUPPW50R4
         LwW9lXIoLmGlD86s21pZKG+5g7XvPwToUmukAViGkzSJdKugTbC0fV8Q9dgNoLlHfSoG
         BV9CGCF6awXKfNOml7V4JwuBA0jsKFf2bUslIcZeSQpC/a08yrzVrk/MksyI0nJd7Jn1
         pxfA==
X-Gm-Message-State: AC+VfDxfQXgJX6a9eIrHy0tjy3O4WsHQwHcqyzA1ZTPLnJoI4TB6fhif
        pxTPs9xmDXrQ5ShqMooFNO6dBA==
X-Google-Smtp-Source: ACHHUZ420IDbdaMgoPXwNeI7sLTtm8/VjDcIy3Q4qQuT2OHkdFB7TWfA1g9j1hTnqdFHEInpUQpC3w==
X-Received: by 2002:a2e:2e0f:0:b0:2a8:e480:a3c8 with SMTP id u15-20020a2e2e0f000000b002a8e480a3c8mr1302991lju.44.1684538719272;
        Fri, 19 May 2023 16:25:19 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id z7-20020a2e9b87000000b002af2a411655sm41597lji.41.2023.05.19.16.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 16:25:18 -0700 (PDT)
Message-ID: <7d8ff3f4-fa9f-109e-b255-329803532e9f@linaro.org>
Date:   Sat, 20 May 2023 01:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8226: Add IMEM node
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
 <20230519210903.117030-5-matti.lehtimaki@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230519210903.117030-5-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 19.05.2023 23:09, Matti Lehtimäki wrote:
> This is used for example for reboot-mode which enables userspace to
> signal the bootloader to go into the bootloader or recovery mode.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index 006263373348..3628e48c1ec1 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -646,6 +646,18 @@ smd-edge {
>  				label = "lpass";
>  			};
>  		};
> +
> +		imem: sram@fe805000 {
> +			compatible = "qcom,msm8226-imem", "syscon", "simple-mfd";
> +			reg = <0xfe805000 0x1000>;
> +
> +			status = "disabled";
> +
> +			reboot-mode {
> +				compatible = "syscon-reboot-mode";
> +				offset = <0x65c>;
> +			};
> +		};
>  	};
>  
>  	timer {
