Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333A9C32771
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbiIZI4U (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbiIZI4S (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:56:18 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771C33DBC4
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:56:15 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n35-20020a05600c502300b003b4924c6868so7693299wmr.1
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=cMdvVG6gsVrl67bRH/yjYyvxFVJ/s7FYCJ8TDUHq/e8=;
        b=oYcg6maKBAwLkrJtTzjJDgfU2YwyJZ4y3fiJoiClwcf/BM+Hw9KLQn4IhVUfFCSuar
         6/wAvvVn6yftGiR1m/DDzR2zzHDpdKvETW4hJMvJ82LIWqKOCPPmqmTEZH6iyhMnCBVB
         6R7IXRkcgOCIKo+Ota7tWwK+wH3X2pFqfHsGpQN8zkIHfn0RDTyM4+DfEqskaZd9erDO
         nKW+zfPuyry/nDiXxPL4+ll5MP9SXNz5XRvxCggsi63u2tZ3RKF0+NdvBUVNinYkBFxT
         Tfx9SjzqUbbT+SqywinllpMgAFp3c3DD+XRlguLKS1w7aXeX8CH5CwmGZ9tbMY8kpiKw
         Ecmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=cMdvVG6gsVrl67bRH/yjYyvxFVJ/s7FYCJ8TDUHq/e8=;
        b=HciH/UGQOxD3nxqhJZpsXNR+CYW7TrjwbF3s6hjg9meRixv5MPF8HobXl1MkKsYPwn
         4+sERBJLSestWWaH9CIVwrr/WJHuHWqnedDXVmLwj4ElTV/9nWu0B8JEKlraSNa8FNKB
         ce7YDa1keFBwmmQdrYKtVZrFqiGPDpIohye3guwiLe11WRQX1eOAIbnoAAlxQccJIbOF
         XhW9NaLPTeRD8+J+3hW28UQyF2fXTaVM+tyJymVpbLettYT0351gDJOLRbDag6joo/wt
         jIn3r+sT6JNQvYXLyBtTyyJy4dihacd/K3KMtnRYZAZ5anTKD2ZQvVqhOejDEShz2eDs
         93qA==
X-Gm-Message-State: ACrzQf08NYl9+Nnk3X2nzIKF4MNRlm6h5poMz8DGRyB3cVSuiagRoNyx
        kGUmNrCSuTeSgVknm6ebWccqfQ==
X-Google-Smtp-Source: AMsMyM7pAEtgR9SQVfgG1QhJMXvMDKkf8XyniYQR7ul4iT246LQLXLILmqxGPic89ZHI2yzTTionMA==
X-Received: by 2002:a05:600c:1990:b0:3b4:c326:d099 with SMTP id t16-20020a05600c199000b003b4c326d099mr13751533wmq.19.1664182573985;
        Mon, 26 Sep 2022 01:56:13 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c1d0200b003a62052053csm13123493wms.18.2022.09.26.01.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:56:13 -0700 (PDT)
Message-ID: <2b57b492-8765-8629-1c94-ea04c0188792@linaro.org>
Date:   Mon, 26 Sep 2022 10:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <20220925210229.128462-2-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925210229.128462-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On 25/09/2022 23:02, Luca Weiss wrote:
> pm8941-misc should be called 'extcon' and pm8941-coincell 'charger'.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 33517cccee01..01f14d5f314d 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -27,7 +27,7 @@ pwrkey@800 {
>   			bias-pull-up;
>   		};
>   
> -		usb_id: misc@900 {
> +		usb_id: extcon@900 {
>   			compatible = "qcom,pm8941-misc";
>   			reg = <0x900>;
>   			interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
> @@ -138,7 +138,7 @@ pm8941_iadc: adc@3600 {
>   			qcom,external-resistor-micro-ohms = <10000>;
>   		};
>   
> -		pm8941_coincell: coincell@2800 {
> +		pm8941_coincell: charger@2800 {
>   			compatible = "qcom,pm8941-coincell";
>   			reg = <0x2800>;
>   			status = "disabled";

I think those changes are unrelated and should be split into 2 patches.

Neil
