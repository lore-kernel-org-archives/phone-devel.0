Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0336ECAAD3
	for <phone-devel@archiver.kernel.org>; Thu,  1 Sep 2022 16:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbiIAQFq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234804AbiIAQFp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 1 Sep 2022 12:05:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303883F1E3
        for <phone-devel@vger.kernel.org>; Thu,  1 Sep 2022 09:05:42 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id w19so15412787ljj.7
        for <phone-devel@vger.kernel.org>; Thu, 01 Sep 2022 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=vr/ZL5AmHAEzgnQmGDrRMJ5qj1xOT1GKkMOHI3Yn3RE=;
        b=OBW0m9lAGizWRZ/P68MGppO1jIqQYAGQy48GMKel0Uq4jhGt2MEV/uWyfS1GbYjzaJ
         1BHwqmn30/EJlpqB47+JmWFHHyEsGsHmus+Qq5Ugv3lDmeLbrWM8NlYqZlLpjriwZ7+P
         48CW16MJKJSt41sqClVgaKv2eYUxhbe0Ug8X6Xn4ob72jJBo/dExtzAdN/YPOpyOgqUY
         3ctqiqMqp0UDutgZ7j7HaqENXyE2Yl6d3K5WOwQtWnFgrulq8wmP/zqdqeS+JeHx4hmg
         Uz1nK6cAa4jIU3UeFPvT6Pw3kNWA99R1ChrRsKhjfLWeu6y8veyOnSVojtYoQ4xiJT18
         uEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=vr/ZL5AmHAEzgnQmGDrRMJ5qj1xOT1GKkMOHI3Yn3RE=;
        b=lKbU90cPlPECWmj1v8cF1I3VoCUCPU//FbnIAHtyYMhfV0t7RHhLSRmFLygwOyRaaz
         K3KLKskPzUoeesx13igshOQJF6L1UdpE5/m58CNzqCP11YPFgT5iAeH6dexDAlxhM+uc
         thVYTNCNVlxCJ01KqeeipNJ0h6SXLl0m94/I64j0ZgItBjbVkaynCGVzGXUf/6hpTYpd
         pm2ct3KkRWDFjtzmed4yB1vwOPlprAy+Lwk/74/hC/0L7ofUE4rOP9Byv3y/Is9WcpPA
         CcLQwNwKdFKpLneablWfOgonDnfY7aco4Vvx5M1Ftb7G2ITNQ1ti3dNH9ndaCYEQt/OQ
         V3Ug==
X-Gm-Message-State: ACgBeo3O77pcfSSDxbGFgLWsQzgCpSqkolIU/5Ge9yUpkfH0Ct5pyass
        0sXlEAm2hG20zheF0P97EbXkxA==
X-Google-Smtp-Source: AA6agR4zoKWi+udXaP9NV5RAqmRyRVlHuj2DrQng205JkXNIZulNxMdS6Cd7d78UTo5VCv86qy3CEQ==
X-Received: by 2002:a2e:a785:0:b0:268:a64e:4b49 with SMTP id c5-20020a2ea785000000b00268a64e4b49mr1771914ljf.270.1662048340455;
        Thu, 01 Sep 2022 09:05:40 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id be19-20020a056512251300b00492edc64d08sm1622560lfb.32.2022.09.01.09.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:05:39 -0700 (PDT)
Message-ID: <68c412e6-a582-f82e-377a-b70b1048a45a@linaro.org>
Date:   Thu, 1 Sep 2022 19:05:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/14] arm64: dts: qcom: sm6115: Add apps smmu node
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220901072414.1923075-1-iskren.chernev@gmail.com>
 <20220901072414.1923075-6-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901072414.1923075-6-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01/09/2022 10:24, Iskren Chernev wrote:
> Add support for apps smmu (one of the two smmus) present on the SM6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 73 ++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index efbc81d2253b..a6be8b93a44d 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -434,6 +434,79 @@ rpm_msg_ram: memory@45f0000 {
>  			reg = <0x45f0000 0x7000>;
>  		};
>  
> +		apps_smmu: iommu@c600000 {
> +			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
> +			reg = <0xc600000 0x80000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +
> +			interrupts =	<GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,

One space after =


Best regards,
Krzysztof
