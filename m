Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448EAC07E9D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 08:46:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbiIZIq0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbiIZIqG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 04:46:06 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221BA1C123
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:46:05 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id ay7-20020a05600c1e0700b003b49861bf48so7822114wmb.0
        for <phone-devel@vger.kernel.org>; Mon, 26 Sep 2022 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=5Ml7yf5x+fVyOuDNSapRUuoUDWz/G8BORxjiAvIuMxw=;
        b=dY7lg+wUSXtvk2k8ZHwyuP/mZ4H3Osn3/PbwsCEOgsF06W7SZKNSG1z6TCJ8oksFWi
         Xs3SxGt5ygyytXqTyn6fQJeXlvPn8IK4/6tP7kvB1hErvDF0IYQXQpQDREQORi5Lm2gl
         IbWqYwYkdp3cxnky1QVTlOTldeqACp1KKdnF4lKJmtgDLgxSdh6shMrp9u+/VvBP/vV3
         Df5CxsS+skUHLLC5LCS/qWcNdiiU0s//B2u2Bzp0C2Qx1qJnLY2FcxENrrBCiz7QvpWO
         rKVA7EjW7NRqmpVNfVLIJILFF3Njz1sv3Fo74mzmfKVHTfsUU56kdXHiULQCY1d8aK1q
         1BjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=5Ml7yf5x+fVyOuDNSapRUuoUDWz/G8BORxjiAvIuMxw=;
        b=bzV0I9e+VR97Cxy4ZJAcWFQJ8DTVjZw1DE3d8+RNMbxMVslmr++9nitg2bEOOmDDwq
         0v4HKHtae6SeTahy4E8WsKL1JNOBaoliFZB5D+Q9W8u0U6q2tfBfV6ajs0psakaZQ/oU
         +lsQ0tQ+/qw8PaMjwjJ5wMY42Q7eqPE1Rijv5UiF6RMp/Hn1QlKWWSfoe2vizfJotQiw
         4p/o194/1OjHnQuv3iEpMDzOnB6OSfttgzPU/JTojB3R0AB9Aeokt/iRwYhVmnd2x703
         rRepHnIG2cp4QSNfrH2dqXhT+k5ydFUx2QvAG2G1Oyj2fnn8foqZSla/HmzkdAbB6OwE
         spAg==
X-Gm-Message-State: ACrzQf2cX2YA5EKmaOW3f2G9nVmCSGPShW8HlKJPyuKLBsPWapgGuKvn
        8OjOnghH+noXjTfzOBDmg7iSOg==
X-Google-Smtp-Source: AMsMyM4rEt5jgdqlg7SiNQKTA9LNAfapxqWjttwRoxiLKVXgogtvYugTAYBYelZQC1i6J13JXOQAFg==
X-Received: by 2002:a05:600c:34d2:b0:3b4:a617:f3b9 with SMTP id d18-20020a05600c34d200b003b4a617f3b9mr13652175wmq.204.1664181963751;
        Mon, 26 Sep 2022 01:46:03 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id m187-20020a1ca3c4000000b003a83ca67f73sm10304371wme.3.2022.09.26.01.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:46:03 -0700 (PDT)
Message-ID: <8d2d111d-aaa8-5fd9-784f-4c830f2b0a27@linaro.org>
Date:   Mon, 26 Sep 2022 10:45:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: pm8941: fix iadc node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161821.78030-1-luca@z3ntu.xyz>
 <20220925161821.78030-2-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925161821.78030-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/09/2022 18:18, Luca Weiss wrote:
> The iadc node name is supposed to be just 'adc' and the compatible is
> only supposed to be qcom,spmi-iadc according to the bindings.
> 
> Adjust the node to match that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pm8941.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index 3c15eecf2f21..33517cccee01 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -131,8 +131,8 @@ adc-chan@48 {
>   			};
>   		};
>   
> -		pm8941_iadc: iadc@3600 {
> -			compatible = "qcom,pm8941-iadc", "qcom,spmi-iadc";
> +		pm8941_iadc: adc@3600 {
> +			compatible = "qcom,spmi-iadc";
>   			reg = <0x3600>;
>   			interrupts = <0x0 0x36 0x0 IRQ_TYPE_EDGE_RISING>;
>   			qcom,external-resistor-micro-ohms = <10000>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
