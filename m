Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5308DC433EF
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 14:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E0E060FDA
	for <phone-devel@archiver.kernel.org>; Thu,  9 Sep 2021 14:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235604AbhIIOaH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Sep 2021 10:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbhIIOaB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Sep 2021 10:30:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1C3C00F627
        for <phone-devel@vger.kernel.org>; Thu,  9 Sep 2021 06:19:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c8so3716526lfi.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Sep 2021 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zjCm2kqLmEkD1fYMpLfynjls4LWjCF1R/HM+9Gqf848=;
        b=OE15DtuTMThkONQn2QaW9vAJKJ4c5pWnECM8dh6t2F5lxkzOQeepKE0K4HmtgqZgjV
         MRkwgGmGmxUriL00OMiESoz55OF7Kg50LWHvTG1px0UFyDmtKcbVmx4Uoah1/qoJWO2i
         5p3ySfY5SwOR9I8JDePdifMsBy7MlP3+CHy2wNlJBPmtx9ai9DWrRxh430t8NpR+qkbV
         yJOIbzETKc40EIGF15R4XdOy/OgEfFhXtuJ/0bmufBPBzcG62lorQlBtuzSLqOVhO/bC
         loAS8P5S/d02dnIN04YJ10gffnzt8rv9c7Ey+vvL5DYUHVSyEqPETkva74sSJ0Pjk1j1
         /7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zjCm2kqLmEkD1fYMpLfynjls4LWjCF1R/HM+9Gqf848=;
        b=RZC7qYOuf7dyqI5F4D2Vu6H5EsE6nOB3M9W34mrCKelGWy97IMMESmNMu3MJExbb2L
         2IAWpF7BDxdmy2mSeCJIKOfTqK3XMQirnRS8X1U9+7kBxzkooF5JGHRvTHjiQ7xC61v1
         1QquAPHzyPmvP5sG1EV88Q9X2H1llkqc52gGDv0k2ktW5FdK8iCy2+QZpvRNv8a09utK
         uYwMMp9OUdji4ujw8uSLifVSpLib6WPdoBMNyHW3jly4MJPKBMg05Wg05opvvxwLLB/O
         I3CN06gD7euLMSuFt/+J9TSZYeG+76svQcI4ph1dpqZpNC2/FSkaGiBrZnuhHbnyXfcr
         eF8Q==
X-Gm-Message-State: AOAM531p38rREKTMFsktJGLhPYx9xTEUNNbpTBv7lvfCx48YFb8TkiVJ
        d4Hu4L25rK87hizoen1lhxAe0Q==
X-Google-Smtp-Source: ABdhPJw92+bv1tpDoZqXpouY2qicTHxeTcDi4tXjJ1yAhPRIT8shcSy3idYOKvLB9LMdigSvIPI8Hw==
X-Received: by 2002:a05:6512:b27:: with SMTP id w39mr2412730lfu.129.1631193549547;
        Thu, 09 Sep 2021 06:19:09 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d1sm200065lfl.5.2021.09.09.06.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 06:19:09 -0700 (PDT)
Subject: Re: [PATCH 3/7] arm64: dts: qcom: msm8998-xperia: Add support for
 wcn3990 Bluetooth
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210903180924.1006044-1-angelogioacchino.delregno@somainline.org>
 <20210903180924.1006044-3-angelogioacchino.delregno@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7032cf3a-2469-3d66-bfde-9754dbac58b9@linaro.org>
Date:   Thu, 9 Sep 2021 16:19:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903180924.1006044-3-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 03/09/2021 21:09, AngeloGioacchino Del Regno wrote:
> This platform uses the WCN3990 Bluetooth chip, reachable on UART-3.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi   | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> index 2fe53e4675d5..66b009ba72fe 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
> @@ -179,6 +179,23 @@ &blsp1_i2c5_sleep {
>   	bias-disable;
>   };
>   
> +&blsp1_uart3 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +
> +		clocks = <&rpmcc RPM_SMD_RF_CLK2_PIN>;
> +	};
> +};

There is an ongoing proposal to rework wcn3990 (bt and wifi) bindings, 
so we might want to delay this a bit. Not a strict requirement, since 
the changes would be backwards-compatible.


-- 
With best wishes
Dmitry
