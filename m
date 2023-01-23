Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CABCC54E94
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 16:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233361AbjAWQkn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 11:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbjAWQk3 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 11:40:29 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6072BF1F
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 08:39:08 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ss4so31973912ejb.11
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 08:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOMakOD7xIn+dFf8F4hTOC/FgKd0/tr1iN5ftxQWKRI=;
        b=DV5RZNXMs2lLP0/NBV7jzvirEcgC37TFewowKpRNQSpVIBwIHxEr1k8iJ1Fstb17+s
         flcENq8cPzEh9uAV+WjkwWhuKdfLJsm513mDJ3+j5W+ytUaa7MCLNCJAQIH/yLHBdkKk
         UT4et/QOxoDUEnIRlZCyZTGXhAg/eWyBx7kEHLq2PR97RFDGcTedXynD+lJKeQwreN1l
         4+bCHPZc2ZFAPk2+yZxSXufaFRNhBuAa4XGvBw0XmpGbffhLtH2dhkpF0ZF7HLpoeRww
         NKH5vREvBdoqOqLWHRThSv7uFmEWCL7XM6VmrfzcLy+a/Rcu1Eb/+dWJxX7YRspSxDTu
         O35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOMakOD7xIn+dFf8F4hTOC/FgKd0/tr1iN5ftxQWKRI=;
        b=Hd9kdN8ps9akBy6VSTbXLg6JCEDWj6VQA8T4OlgmdDJBP9f+FplhPMzzt1Ez9qBdim
         4IPtb5c5pzRhVmHSssOdASU5RsxBH9Wv2Eprr6CLh1OExdNNINRMYPN+mT5NXebkD4tg
         gXdZ7FT5TMjjcUVJ9p5wygf8byUntzHSrPr9k/lBqNY9w1fpIahlMbrH4RYPTe76QHr1
         CGXbfYW9Pc23xuua3kU15jxehKUbGjm7QD1cVC7SK0GUmJvA5A1MiDMBW4WrLDlpBrdQ
         W8FD6ewjT++S8+KufGKK8d1GRzlXfU78/PfKjKXOVc/bnHs/AMw+I4OgWc79TbBnTl2i
         9Rcg==
X-Gm-Message-State: AFqh2kp/ZdI9JnmXwa+QsCpXDnQnGaIaNbQ2phv4a/SM2xud5i++Q7+M
        pmFOdI+Jf3PJRJnmZMA8JxaKnA==
X-Google-Smtp-Source: AMrXdXt28hHW6x7xG51Ffn8C7CrwvdlM0Q2tQIawdl33so9CBuSBJN4v3WEyigB0jGsR2/hnwzAOpA==
X-Received: by 2002:a17:907:6021:b0:843:a9fe:f115 with SMTP id fs33-20020a170907602100b00843a9fef115mr24119996ejc.32.1674491945669;
        Mon, 23 Jan 2023 08:39:05 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b0084d21db0691sm22503260ejf.179.2023.01.23.08.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:39:05 -0800 (PST)
Message-ID: <49427fdd-e0fe-0a96-597f-b56b373cf63e@linaro.org>
Date:   Mon, 23 Jan 2023 17:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/5] ARM: dts: qcom: pm8941: Add vibrator node
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230122-msm8974-bacon-features-v1-0-4049f565c24c@z3ntu.xyz>
 <20230122-msm8974-bacon-features-v1-1-4049f565c24c@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230122-msm8974-bacon-features-v1-1-4049f565c24c@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 22.01.2023 17:48, Luca Weiss wrote:
> Add the node describing the vibrator that's found on pm8941.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-pm8941.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index cd957a1e7cdf..a821f0368a28 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -161,6 +161,12 @@ pm8941_lpg: pwm {
>  			status = "disabled";
>  		};
>  
> +		pm8941_vib: vibrator@c000 {
> +			compatible = "qcom,pm8916-vib";
> +			reg = <0xc000>;
> +			status = "disabled";
> +		};
> +
>  		pm8941_wled: wled@d800 {
>  			compatible = "qcom,pm8941-wled";
>  			reg = <0xd800>;
> 
