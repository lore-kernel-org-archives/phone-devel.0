Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B65EB64DC
	for <phone-devel@archiver.kernel.org>; Tue, 27 Jun 2023 20:49:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjF0Uto (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 27 Jun 2023 16:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjF0Utm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 27 Jun 2023 16:49:42 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E736319A4
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 13:49:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f8775126d3so7074427e87.1
        for <phone-devel@vger.kernel.org>; Tue, 27 Jun 2023 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687898979; x=1690490979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5FTPvn30QPL4kCu475gLqCpNlEhXjGVNlal9AK4Pd8=;
        b=il25tTPhW/Rvl1RK/G0wd46AH78H28kA4j0hHV2yb+D9YTW2Oa7jgQwACbaoKaOT5M
         XG3Gz8kVhsQaPelu834BdknOebU6ml46yRNAbtTMjGp2/mUdVEL98cu1ef67IJVyoxzD
         JU1lO1/63ourhjsCO2FCPYYrItDBXIDduWGYOto0/flbaT7S6DQwYmsCi2xQLBoSAvYb
         to8A/InaT9JVoPSO3VUiV2b81xR8yabdI/BmmWHnlvhJboCjjUZaKaMgFN0hCbZ7tBhR
         5bWRYOMY9VLbIiOKhcUglhjPL6jMXxo3Xe6O7JkQvazDziLAuc3fdFL/6Auw28lL76CJ
         d6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687898979; x=1690490979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5FTPvn30QPL4kCu475gLqCpNlEhXjGVNlal9AK4Pd8=;
        b=Dc5WEhMwnZqHGuwViV7pUTzxveYXNjusS4AhKxiweMdnUhGo8S8OJkWh9qS5QxdFqZ
         dJwWYyUYmak0+TC9yqFEJ0zPe02xs/sZDsia2P6YOenGSU3gbjUhCBJvwTo2uMDSDqgC
         sSJtnf0s2nwvL7Sfs2dSVUfIzmeWUr499793jcR8Kh9zNGyXVXkLwVuL2v2ZGcBBvSnt
         sOgzhnfSh/K/ob2QywaLpXRELhhYXWuzd6tV8x66HYMN75ym+cgvLzR1DelabgEwlJeP
         Jnvked1nDXkks4aeC4KLBpyO80xydFUsonOR6Orm6B6EbaYgNLsnciTv87vBdTkcEpHo
         KtZg==
X-Gm-Message-State: AC+VfDy9wBT29xzEzdoFzkj1E9EXjZj9mR94wor2I6OEmv0wn9/nglJa
        SvhCb/mFEvOl7OCIYxQ62W1ziw==
X-Google-Smtp-Source: ACHHUZ56rZXCHV+7wUEkRISGb+GdewVmnF02vDb/vrwCgBxxR+1Gg68dP7hpYy5JEb+vQz8qobD9bg==
X-Received: by 2002:a05:6512:1cd:b0:4f9:57e3:ba0b with SMTP id f13-20020a05651201cd00b004f957e3ba0bmr13314170lfp.23.1687898979125;
        Tue, 27 Jun 2023 13:49:39 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id l11-20020ac2554b000000b004fad5602c18sm1371420lfk.73.2023.06.27.13.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 13:49:38 -0700 (PDT)
Message-ID: <e9cbebe4-a400-8635-406e-f0ab9151e784@linaro.org>
Date:   Tue, 27 Jun 2023 22:49:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: msm8974: replace incorrect
 indentation in interconnect
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230627-msm8974-sort-v1-0-75c5800a2e09@z3ntu.xyz>
 <20230627-msm8974-sort-v1-1-75c5800a2e09@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-msm8974-sort-v1-1-75c5800a2e09@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27.06.2023 21:45, Luca Weiss wrote:
> The clocks definition in the interconnect nodes should use tabs (+ 1
> space) for indentation instead of 9 spaces. Fix that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index aeca504918a0..c6475837eda3 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -1075,7 +1075,7 @@ bimc: interconnect@fc380000 {
>  			#interconnect-cells = <1>;
>  			clock-names = "bus", "bus_a";
>  			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> -			         <&rpmcc RPM_SMD_BIMC_A_CLK>;
> +				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
>  		};
>  
>  		snoc: interconnect@fc460000 {
> @@ -1084,7 +1084,7 @@ snoc: interconnect@fc460000 {
>  			#interconnect-cells = <1>;
>  			clock-names = "bus", "bus_a";
>  			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> -			         <&rpmcc RPM_SMD_SNOC_A_CLK>;
> +				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
>  		};
>  
>  		pnoc: interconnect@fc468000 {
> @@ -1093,7 +1093,7 @@ pnoc: interconnect@fc468000 {
>  			#interconnect-cells = <1>;
>  			clock-names = "bus", "bus_a";
>  			clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
> -			         <&rpmcc RPM_SMD_PNOC_A_CLK>;
> +				 <&rpmcc RPM_SMD_PNOC_A_CLK>;
>  		};
>  
>  		ocmemnoc: interconnect@fc470000 {
> @@ -1102,7 +1102,7 @@ ocmemnoc: interconnect@fc470000 {
>  			#interconnect-cells = <1>;
>  			clock-names = "bus", "bus_a";
>  			clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> -			         <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
> +				 <&rpmcc RPM_SMD_OCMEMGX_A_CLK>;
>  		};
>  
>  		mmssnoc: interconnect@fc478000 {
> @@ -1111,7 +1111,7 @@ mmssnoc: interconnect@fc478000 {
>  			#interconnect-cells = <1>;
>  			clock-names = "bus", "bus_a";
>  			clocks = <&mmcc MMSS_S0_AXI_CLK>,
> -			         <&mmcc MMSS_S0_AXI_CLK>;
> +				 <&mmcc MMSS_S0_AXI_CLK>;
>  		};
>  
>  		cnoc: interconnect@fc480000 {
> @@ -1120,7 +1120,7 @@ cnoc: interconnect@fc480000 {
>  			#interconnect-cells = <1>;
>  			clock-names = "bus", "bus_a";
>  			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
> -			         <&rpmcc RPM_SMD_CNOC_A_CLK>;
> +				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
>  		};
>  
>  		tsens: thermal-sensor@fc4a9000 {
> 
