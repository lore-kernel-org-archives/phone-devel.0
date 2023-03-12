Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D2EC74A5B
	for <phone-devel@archiver.kernel.org>; Sun, 12 Mar 2023 20:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbjCLUsj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 12 Mar 2023 16:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbjCLUsh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 12 Mar 2023 16:48:37 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD83E24134
        for <phone-devel@vger.kernel.org>; Sun, 12 Mar 2023 13:48:23 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id cy23so40896267edb.12
        for <phone-devel@vger.kernel.org>; Sun, 12 Mar 2023 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678654102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSuu62ZtrCDKkOlmQUYQACQgoTEHCbw8LO0DFEfyOYI=;
        b=B43oLgAITueP6GEec2rIrhCf8+qS+0h2b6xYUnGJF254Av1FgGuGTXsitKkqpSAjfs
         fvqGRPWmKVD0qPUNUw/9DLdakSggBGrOZ9FDe/WUpmeJLoIqCETd13fK1PxXkp2uBxMd
         F6k8jZM5E0vRz+xu1wuayOO0sCekV28IUjEf2xvynwW3I73ib2dO8yXc3UswB1e+l92J
         eHtEHMc1eq5/wp5w2qoXdWOCAXvIG1eVTCBooMkNHymxyFn14rtUwcdTuUHFwxKA0Qqp
         oo+tH98j/LGk1V8UHtcMNaFm8f/ValnFD673qDbkzyZ5mFXBHvOU79joCmRhRIC2oTkR
         C47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678654102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSuu62ZtrCDKkOlmQUYQACQgoTEHCbw8LO0DFEfyOYI=;
        b=7P70IrXovXGH/c4xrS7OIHAcBJFE0tf5z2msoVpJ9mjr4x/HQCDGt123Govz2Uape6
         FgZuepBiuy65BA/vNs8EZsmBe7EOAMkMrmvMJpDqJM3+Mqrl5j1QoJIL4COL9hIyZ2k2
         MsIEb3F+vKQDUgflEbEezAuDgFcmXbfdsIUtcXd8c7A1BiaPSClI+KsU35Q6uKMYHYBi
         Hpd3WHkIzUTll+YhdCtR29Eoc68JXMIEWd9MGGS4vwTp6tCEBF8yDN3K1ZzeB+P6S/vG
         CgLxVNNGUBpvWNvjA7omfOE6c1IJs4A2+1tAN6QTJBP8TMnYK7LINjDQR9IFTnModFZ1
         azlw==
X-Gm-Message-State: AO0yUKXbuHvajV33OfGN+yr5XSLRCcrte0a4kUIW+DkszcKl3GabpYSf
        j9MmZhAJs78Sn2UELdlqDRjz1g==
X-Google-Smtp-Source: AK7set86YBGLHhii08oOoSKY0zWmcztYRGX+cZDo0CWEBHvRVtn8lz1i+Y8Bbobgt4g9uQHZt35EnQ==
X-Received: by 2002:a17:906:b882:b0:8b2:3e72:1022 with SMTP id hb2-20020a170906b88200b008b23e721022mr31771384ejb.29.1678654102186;
        Sun, 12 Mar 2023 13:48:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906685200b00926b944676esm932476ejs.131.2023.03.12.13.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 13:48:21 -0700 (PDT)
Message-ID: <ad9ce095-deff-a191-baa3-d3778efe9846@linaro.org>
Date:   Sun, 12 Mar 2023 21:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce support for fts touchscreen
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230312093249.1846993-1-joelselvaraj.oss@gmail.com>
 <20230312093249.1846993-5-joelselvaraj.oss@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312093249.1846993-5-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/03/2023 10:32, Joel Selvaraj wrote:
> The Poco F1 EBBG variant uses Focaltech FTS touchscreen. Introduce
> support for it.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> index 76931ebad065..a23be4c8e1bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> @@ -13,3 +13,30 @@ &display_panel {
>  	compatible = "ebbg,ft8719";
>  	status = "okay";
>  };
> +
> +&i2c14 {
> +	status = "okay";
> +
> +	dmas =  <&gpi_dma1 0 6 QCOM_GPI_I2C>,
> +		<&gpi_dma1 1 6 QCOM_GPI_I2C>;
> +	dma-names = "tx", "rx";
> +
> +	touchscreen: focaltech@38 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof

