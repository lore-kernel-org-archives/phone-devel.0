Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78105C77B7A
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 19:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236768AbjEZTqc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 May 2023 15:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbjEZTqa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 May 2023 15:46:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED69BBB
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 12:46:28 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so1275761e87.3
        for <phone-devel@vger.kernel.org>; Fri, 26 May 2023 12:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130387; x=1687722387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGRmQVz2qOO/JHGqdPvAPL5aOAN7tSdjqi8YZkSo1xs=;
        b=voBhsyIBCO5EPlcOz0jKXU8ijOs06ei0PEKdaElwd3YFnKM4vSmbg7X/adzwx+OGEE
         wssOaRNAVuKinyffQoY0hE0CVdQBKGTcgRsPfJrOTaL5hTIXWS2Nwyat4FpMkGeNQ3wX
         hiECqW/PwwytXVaZeImaQBnKdrhq/4oxCQexJ017nwtLvCc9OqqSpdWd9IC7BRT6Endu
         ZqDajo81sQ3I/t9BH2+FXjkY/uG/PsATnzgnt9WCiS4PmIEo9W85bAOJlBP/OLFox1un
         ZkZyrPqKXUF67qU3Yq/DYubaOHgvqYoZtnlJPp/m0tOZ+eSJRhK1K7C5DtWx1yYloAO5
         Blqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130387; x=1687722387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGRmQVz2qOO/JHGqdPvAPL5aOAN7tSdjqi8YZkSo1xs=;
        b=YFLZKxs3CD2Thy/4vtOkcC0jiOAgrAo0b8YnTD/Iw3z9oiqggfFYuhZPM1fiDPXY7t
         kln3/asl/g6PZ64tECC7bOpR9QwxpQXeIi54ElnAIMn7JJ/4FKYDU7hHd1Uv8pDkGu3w
         OeoWsvoHIWSFyxGBsbwAaNGIulm1eNOBb2Fs+OhN/8Xmr6kSRB2aT+vV6OHvmNX6SinC
         /3PbLEYAjMBjxc1pimCZKndu4hQCHRCNeeOZgQKetCgHAOW4PacnnFEgHRYlKPv0XWk/
         UwxBcxuZcCsHGGgvMTa8VHH5DOJ4vAbduEMAHGpCrwNkvEPQSajQnT6Ip/Nr7AdqXTGq
         +E/g==
X-Gm-Message-State: AC+VfDySO4obRwbE8hJWBzbSSmQ7iLNjlVfONr2l5ussFD/ySCfMpeKF
        agkTB15zP+0W+9HmME1XXxzSEw==
X-Google-Smtp-Source: ACHHUZ4oVU/CuIh38JWiwcfSKfq4DCuUPWaxrg5aT4d8kWdUFMenhjIRlFtDPog3S+d3vemyn3407Q==
X-Received: by 2002:ac2:51ad:0:b0:4e0:a426:6ddc with SMTP id f13-20020ac251ad000000b004e0a4266ddcmr931823lfk.0.1685130387203;
        Fri, 26 May 2023 12:46:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004eb4074f40fsm747155lfo.241.2023.05.26.12.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:46:26 -0700 (PDT)
Message-ID: <e7786af1-f19d-abb4-59ce-d08fb25bd091@linaro.org>
Date:   Fri, 26 May 2023 21:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pmi8998: add charger node
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-3-f9334afc4505@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 24.05.2023 19:38, Caleb Connolly wrote:
> Add a node for the smb2 charger hardware found on the pmi8998 pmic
> following the DT bindings.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index be6f60bfc26c..73f51451d21d 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -9,6 +9,26 @@ pmi8998_lsid0: pmic@2 {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pmi8998_charger: charger@1000 {
> +			compatible = "qcom,pmi8998-charger";
> +			reg = <0x1000>;
> +
> +			interrupts = <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
> +				     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "usb-plugin",
> +					  "bat-ov",
> +					  "wdog-bark",
> +					  "usbin-icl-change";
> +
> +			io-channels = <&pmi8998_rradc 3>,
> +				      <&pmi8998_rradc 4>;
> +			io-channel-names = "usbin_i", "usbin_v";
Are these hard-wired internally?

Konrad
> +
> +			status = "disabled";
> +		};
> +
>  		pmi8998_gpios: gpio@c000 {
>  			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
>  			reg = <0xc000>;
> 
