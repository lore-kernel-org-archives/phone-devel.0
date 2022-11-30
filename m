Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DEDC352A1
	for <phone-devel@archiver.kernel.org>; Wed, 30 Nov 2022 11:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbiK3LS0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Nov 2022 06:18:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234422AbiK3LSF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Nov 2022 06:18:05 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0F03C6F2
        for <phone-devel@vger.kernel.org>; Wed, 30 Nov 2022 03:18:03 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a19so4746051ljk.0
        for <phone-devel@vger.kernel.org>; Wed, 30 Nov 2022 03:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
        b=fa9DTGfn6miiSdGDtIzetZ3cP+Y//XHFAUdhDMe/rcDBMGLkWiIlAIXblHykz3XBdq
         YzC0fnxzFt/60yWvxiqVbFIVXSJ+vvPP7rzKgGOIGzZ8p4rczzLY/n7Jh0d3pSP6asmS
         7GIf+V6LW3muePp0QgVBYwDrtglEYK8SCNEgQmgKpQhlICmt+y8IaUUoeshYPm5bZ4Y0
         PG6iXABOS/F6ufJVLLCEuzHlIzBc+YhSNmcYiVRL4gfQItJ34mAZq32Mnrbtno7K0rl/
         g7f0JjDMNEMQP/zEIVKTJcQ4yvgxgWRd4HROJpKo9uYKlGAB1AJ6i3yiZVXORWvn6uCv
         ILhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otStQxmxOG6LpjBUQIYuow/PF/UV5Z7DPxX9LVFmQEo=;
        b=fIFeo9UTwAQJlryIwCmHqaMaclo36MqkgCEEp3168WdviA/eXroDpvQH+CmTabi46b
         NbVm/3BjHt01zwwel8CZc+db1nr5UCN8X0eLpTs2r1RL6SSFI9RpKYeVdv+sgidA24bm
         SCCxGmegjwWeYpI5FOVtAMZgJyUeqcqlBaOBmhp8PhHXNp6L1JpoM4m5P1AltQ8HDycr
         3bNCQ595UlmYmWeA90e4SnxrFmSAxPMjfzYs0jkDzp2bRDhS6xYGvOA9z6caHxVrvOCf
         laf9K3mUKHRE04oTAplLQlpcEEKJh/8IUS2d8B20gzWHSrrecTuAe2NbQpZ2TUFuseNf
         j/Cw==
X-Gm-Message-State: ANoB5pnNbitqQv6KLMhDMnoSZsCwEWltqQp9xEAc28zuzIayprZ4G63K
        yOG3YThDS1hpIKN4T/r8s3Gtdw==
X-Google-Smtp-Source: AA0mqf6wG9cAljfGq/fOblhbS+7rNoNwLhQu0yt79NeJDaajfzWbs9CAdx2+LxPPPMd07rqtVe40Hw==
X-Received: by 2002:a05:651c:88c:b0:26c:4e3a:516 with SMTP id d12-20020a05651c088c00b0026c4e3a0516mr14687322ljq.510.1669807083389;
        Wed, 30 Nov 2022 03:18:03 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id u22-20020ac258d6000000b0049e9122bd1bsm216515lfo.164.2022.11.30.03.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 03:18:02 -0800 (PST)
Message-ID: <46202b25-e253-0a5a-0c90-9d699906d3d7@linaro.org>
Date:   Wed, 30 Nov 2022 12:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 07/12] arm64: dts: qcom: sm6115: Add dispcc node
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-8-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-8-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add display clock controller to allow controlling display related clocks.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 6d14bbcda9d3..ea0e0b3c5d84 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +#include <dt-bindings/clock/qcom,sm6115-dispcc.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -717,6 +718,19 @@ usb_1_dwc3: usb@4e00000 {
>  			};
>  		};
>  
> +		dispcc: clock-controller@5f00000 {
> +			compatible = "qcom,sm6115-dispcc";
> +			reg = <0x05f00000 0x20000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <&dsi0_phy 0>,
> +				 <&dsi0_phy 1>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		apps_smmu: iommu@c600000 {
>  			compatible = "qcom,sm6115-smmu-500", "arm,mmu-500";
>  			reg = <0x0c600000 0x80000>;
