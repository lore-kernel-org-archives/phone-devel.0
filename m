Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12D3C43219
	for <phone-devel@archiver.kernel.org>; Mon, 21 Nov 2022 11:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbiKULVD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 21 Nov 2022 06:21:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiKULUc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 21 Nov 2022 06:20:32 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE43C561D
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 03:15:37 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id s24so14085064ljs.11
        for <phone-devel@vger.kernel.org>; Mon, 21 Nov 2022 03:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWC8CYNLKIyO+05hiYCKGraT17Q/Il0FYDWGtXnGDsA=;
        b=cLFBBJ7khNJ6Xv059O4X8uyLuI3lDNF8IVVuKU01pHaTqKykXdd8CpoXY9XQ2U/uy4
         RsQ6EiPAjDo1cJtfnxg3LnKys60d7Hpc381RI+7CsT5rxAiCjlpLAkAsczZNYozwSnHZ
         ppjKQujNviMGJmwaBhCId8rnA16UXhnwdMXpoEyj48TQhzpV+YlnMYkrTWj/g3PQOrFM
         1tfpMjAIx4hzw6CLbGSqXuAOpd4JVOLqHEaKvLTbvbIIWoa0BXUukx+UGMlyExW3odu3
         jKwnE+J/hx1GcpoxHQ3t826W2PbipfYNZW9c85pdfFeIr8y8rkeCN4SYDSphYficSOg3
         L55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWC8CYNLKIyO+05hiYCKGraT17Q/Il0FYDWGtXnGDsA=;
        b=T3UCebmZk11IkG4vwALBgIxaV6brZ7q3VoPsRPjudkoRdXncMBp34bB7PKGceqrI27
         +iW9oNRwq1+2s2HtXAU7qe3zCxqi9V20DoBRK0aUnpVNIAbGnGbI0WAR/e/526bGmOZb
         UZbA8EUPIWPeFyTTcg7iKvLlmaVJriQtiVCoa7bfy4CcMNKgtnMH0O0ZlwS/vKyGephc
         DUN4IEjL5hZSXUJUvQN5FP1P3woWFnAm2500ch34ToJn56PRFBjfsdprLr9RUcGVocHc
         ExLTae1kg2/Ct9vkIVGevXm2KETkIs+LG4FgP6cibeS7dt/GiQJ+MAeZLI0XaFw24YUy
         VVwg==
X-Gm-Message-State: ANoB5pkt5OsHJ9smrk7jJLzhYX6Hv92OU95oKhNas/z+bU5p3joEiGuM
        /PhjBjoRAsuejuJptwGGiX8SNw==
X-Google-Smtp-Source: AA0mqf7xpS2eSVLUKP0jfKxKzA1Qc3nanDwhynuehhRBjbaU4FajHMh2tvjcdHn1JTDAZtbJnq7LIw==
X-Received: by 2002:a2e:b55c:0:b0:277:7f8a:e21d with SMTP id a28-20020a2eb55c000000b002777f8ae21dmr172402ljn.447.1669029335721;
        Mon, 21 Nov 2022 03:15:35 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id k11-20020a05651c10ab00b002793cf0e9e8sm852389ljn.122.2022.11.21.03.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:15:35 -0800 (PST)
Message-ID: <a0e482a8-fed0-622a-99ba-dba23c33fb17@linaro.org>
Date:   Mon, 21 Nov 2022 12:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/9] arm64: dts: qcom: msm8953: Adjust reserved-memory
 nodes
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221119203758.888207-1-luca@z3ntu.xyz>
 <20221119203758.888207-3-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221119203758.888207-3-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 19.11.2022 21:37, Luca Weiss wrote:
> Adjust node names so they're not just memory@ but actually show what
> they're used for. Also add labels to most nodes so we can easily
> reference them from devices.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in v2:
> * new patch
> 
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 32349174c4bd..62d2ae30711b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -245,18 +245,18 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		zap_shader_region: memory@81800000 {
> +		zap_shader_region: zap@81800000 {
>  			compatible = "shared-dma-pool";
>  			reg = <0x0 0x81800000 0x0 0x2000>;
>  			no-map;
>  		};
>  
> -		memory@85b00000 {
> +		qseecom_mem: qseecom@85b00000 {
>  			reg = <0x0 0x85b00000 0x0 0x800000>;
>  			no-map;
>  		};
>  
> -		smem_mem: memory@86300000 {
> +		smem_mem: smem@86300000 {
>  			compatible = "qcom,smem";
>  			reg = <0x0 0x86300000 0x0 0x100000>;
>  			qcom,rpm-msg-ram = <&rpm_msg_ram>;
> @@ -264,47 +264,47 @@ smem_mem: memory@86300000 {
>  			no-map;
>  		};
>  
> -		memory@86400000 {
> +		reserved@86400000 {
>  			reg = <0x0 0x86400000 0x0 0x400000>;
>  			no-map;
>  		};
>  
> -		mpss_mem: memory@86c00000 {
> +		mpss_mem: mpss@86c00000 {
>  			reg = <0x0 0x86c00000 0x0 0x6a00000>;
>  			no-map;
>  		};
>  
> -		adsp_fw_mem: memory@8d600000 {
> +		adsp_fw_mem: adsp@8d600000 {
>  			reg = <0x0 0x8d600000 0x0 0x1100000>;
>  			no-map;
>  		};
>  
> -		wcnss_fw_mem: memory@8e700000 {
> +		wcnss_fw_mem: wcnss@8e700000 {
>  			reg = <0x0 0x8e700000 0x0 0x700000>;
>  			no-map;
>  		};
>  
> -		memory@90000000 {
> +		dfps_data_mem: dfps-data@90000000 {
>  			reg = <0 0x90000000 0 0x1000>;
>  			no-map;
>  		};
>  
> -		memory@90001000 {
> +		cont_splash_mem: cont-splash@90001000 {
>  			reg = <0x0 0x90001000 0x0 0x13ff000>;
>  			no-map;
>  		};
>  
> -		venus_mem: memory@91400000 {
> +		venus_mem: venus@91400000 {
>  			reg = <0x0 0x91400000 0x0 0x700000>;
>  			no-map;
>  		};
>  
> -		mba_mem: memory@92000000 {
> +		mba_mem: mba@92000000 {
>  			reg = <0x0 0x92000000 0x0 0x100000>;
>  			no-map;
>  		};
>  
> -		memory@f2d00000 {
> +		rmtfs@f2d00000 {
>  			compatible = "qcom,rmtfs-mem";
>  			reg = <0x0 0xf2d00000 0x0 0x180000>;
>  			no-map;
