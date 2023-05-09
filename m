Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D74DC77B75
	for <phone-devel@archiver.kernel.org>; Tue,  9 May 2023 22:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbjEIWcW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 9 May 2023 18:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjEIWcV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 9 May 2023 18:32:21 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2032D7F
        for <phone-devel@vger.kernel.org>; Tue,  9 May 2023 15:32:13 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f41dceb9c9so26632095e9.3
        for <phone-devel@vger.kernel.org>; Tue, 09 May 2023 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683671531; x=1686263531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vf2w+03BSCOP6r1cRizX6iGMWy1Ixd9xnBiskm0VO5I=;
        b=BaEiCloTlLMgeA+infWj+9LILWoW7KxzKnuCegCmLWsAKExFZaDE/XVQiD2Xtj/eh4
         xpGEMVIp26w/ldkzeeiRchy2jCLeEqjW0Yj+TYgzA9p8KWAHj0eZrhNmXHRf1hv2+7i0
         gz3Go+8ewST7Q1qvOu8SZCLk4MIGluqe4BfmeSDEMxJ8MrCVXEqMQjUhUYaQfdYz+jXX
         eRUgVPfBzw4kbe4YBiFw/ociSz0jthUvzQL8SdwmCRJZQANz9lgX2d6AePHEwS+AaxSe
         jo+d75WlpfM7M8iz8zU2U9LlmRBsyoaN5qpT5hUFomJqIP1H+40BCatVaz1ll9J6OpqK
         royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671531; x=1686263531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf2w+03BSCOP6r1cRizX6iGMWy1Ixd9xnBiskm0VO5I=;
        b=lZ21IyfzDysEm+LrmgXm1EBD3PXfFAua/GdQwirmNeRV05tb2easjYZFTFYwcU2610
         /fwjleU6PchRaeQbSE2dubERcc6syTH90qpBskAf+Ybn+th3r9AeEoZsZxEXVaWTcWzZ
         sr7RNKa6UlLh5MyMB5CxAfPU1m2xnnYwpGGQqlvabaOwHVLHFAIBdgF7LKa0MQQYeCRj
         zfwCg+JKBsrupg0rrn9dFvHdUfDh6kTFXL4yawPGEgSF65wh+b7N4bXnBIxKMfkofO7S
         CsusRSjXN4DH9+Jb7pJi9u2q91uuOVnd38l//FXZvPRsY69CkHk7OqBx4yLgrmCVM7yN
         drNw==
X-Gm-Message-State: AC+VfDzxiFwL37X8YlMHBnkOaMl6JBjs3mc8bk3zlvTbKu+bmVsEezI2
        y79Cf81ZmcdDfRI2FX8+Mux5cw==
X-Google-Smtp-Source: ACHHUZ7YnTCKxhlxi6auAU1rer1yNJnPEtCNoPrm8phQHi1jU6zcsj2xBl8SoQRjqCEi5DI1dXU8CA==
X-Received: by 2002:a7b:cd08:0:b0:3f4:27ff:7d48 with SMTP id f8-20020a7bcd08000000b003f427ff7d48mr4235219wmj.19.1683671531733;
        Tue, 09 May 2023 15:32:11 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bca55000000b003f4285629casm5490392wml.42.2023.05.09.15.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 15:32:11 -0700 (PDT)
Message-ID: <aab042f3-46e3-cf44-fead-6d1afd432558@linaro.org>
Date:   Tue, 9 May 2023 23:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/6] soc: qcom: ocmem: Use dev_err_probe where appropriate
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-2-3e24e2724f01@z3ntu.xyz>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230506-msm8226-ocmem-v1-2-3e24e2724f01@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 07/05/2023 10:12, Luca Weiss wrote:
> Use dev_err_probe in the driver probe function where useful, to simplify
> getting PTR_ERR and to ensure the underlying errors are included in the
> error message.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/soc/qcom/ocmem.c | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
> index c3e78411c637..a11a955a1327 100644
> --- a/drivers/soc/qcom/ocmem.c
> +++ b/drivers/soc/qcom/ocmem.c
> @@ -317,18 +317,13 @@ static int ocmem_dev_probe(struct platform_device *pdev)
>  	ocmem->config = device_get_match_data(dev);
>  
>  	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(ocmem_clks), ocmem_clks);
> -	if (ret) {
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "Unable to get clocks\n");
> -
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to get clocks\n");
>  
>  	ocmem->mmio = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> -	if (IS_ERR(ocmem->mmio)) {
> -		dev_err(&pdev->dev, "Failed to ioremap ocmem_ctrl resource\n");
> -		return PTR_ERR(ocmem->mmio);
> -	}
> +	if (IS_ERR(ocmem->mmio))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(ocmem->mmio),
> +				     "Failed to ioremap ocmem_ctrl resource\n");
>  
>  	ocmem->memory = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>  						     "mem");
> @@ -341,16 +336,14 @@ static int ocmem_dev_probe(struct platform_device *pdev)
>  	WARN_ON(clk_set_rate(ocmem_clks[OCMEM_CLK_CORE_IDX].clk, 1000) < 0);
>  
>  	ret = clk_bulk_prepare_enable(ARRAY_SIZE(ocmem_clks), ocmem_clks);
> -	if (ret) {
> -		dev_info(ocmem->dev, "Failed to enable clocks\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(ocmem->dev, ret, "Failed to enable clocks\n");
>  
>  	if (qcom_scm_restore_sec_cfg_available()) {
>  		dev_dbg(dev, "configuring scm\n");
>  		ret = qcom_scm_restore_sec_cfg(QCOM_SCM_OCMEM_DEV_ID, 0);
>  		if (ret) {
> -			dev_err(dev, "Could not enable secure configuration\n");
> +			dev_err_probe(dev, ret, "Could not enable secure configuration\n");
>  			goto err_clk_disable;
>  		}
>  	}
> 

-- 
Kind Regards,
Caleb (they/them)
