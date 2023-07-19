Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF724EB64DA
	for <phone-devel@archiver.kernel.org>; Wed, 19 Jul 2023 09:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjGSJqC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 19 Jul 2023 05:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjGSJpz (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 19 Jul 2023 05:45:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BF51715
        for <phone-devel@vger.kernel.org>; Wed, 19 Jul 2023 02:45:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98de21518fbso914534766b.0
        for <phone-devel@vger.kernel.org>; Wed, 19 Jul 2023 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689759952; x=1692351952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgDMq8EIs6cspXF6h80EUdVrIdTF49gQA8Jmrcfwu8g=;
        b=G0NhZBDiVzdqDKmNidzXpVTTlrgUn853zGTxU3EvK5rxIR4e9IBv6tesf/GFDoH/RH
         0zage/xH+HJrFRElelFJGFU93Uch6HW1DVDOpOY99SsDbowmR0qBVzISY1dLzOCOJjDi
         Hlli/Uup8eu0arXpzS/KKziNgMxDtODc4wUrRxDwxPL5KPCdQOOpJfwKrDq6crANldnQ
         k/75QdimFUxu5NvmgvgLfR76rcmT3JiFUz4sdjEWQ7cnJVlxkyAnjhHueJqpHl6AFnIp
         DddFx/7vLLIPECUXadL2ElFrv5iZ1sKvuWUh4JejAjLCR32hJjW6gvyh5FowP9RdIjaa
         w4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689759952; x=1692351952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgDMq8EIs6cspXF6h80EUdVrIdTF49gQA8Jmrcfwu8g=;
        b=UPPGr6bX5oDA9RQJjmfx6Icc3H2g8KPB561CDq/d4T2Q3P37Mq1L2vKu0f/flW1ofr
         rh68k1dyOtpM7zr99mx1FkIWP081ykjtVfOsEzVUIinrTpdChIcxP3jFmxGCj7hP5/z0
         iMwxwC/6z62pacet0Tg9bMsZG1HbzLSNG/k7lf9iuo2ELv772qIw6Rk5feLTcGxu3ax4
         P4fBTlmGkFf72M3Hm/q12Lvjg42aF5qiy6v0aMm7BQNswL6o9rFiz44IltV7NS7pJO7w
         RRDs3OExFo4nZELxCXLcQldQQd0cE36tt6Q1zhk45u3UZcLK0hlwDxazG1iwM/wJjkw5
         ui8g==
X-Gm-Message-State: ABy/qLYn006p0D4gEGVnvbYq+7ivsQQeFH9f17gYHcjmmR1DPv0jFGqe
        OHx1zp/m0Pv+05c5fUW3WWuk9A==
X-Google-Smtp-Source: APBJJlHexnJstMsdtGTJCbSIgOlieYQJgNdMtFqtxAgvGnbbXeTx2dJ1MnyPK18EMK3MjtK+PnfcDw==
X-Received: by 2002:a17:906:7a4a:b0:993:e883:491f with SMTP id i10-20020a1709067a4a00b00993e883491fmr2340646ejo.8.1689759952496;
        Wed, 19 Jul 2023 02:45:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v10-20020a1709060b4a00b00999bb1e01dfsm774352ejg.52.2023.07.19.02.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 02:45:52 -0700 (PDT)
Message-ID: <2c1c69bf-3cd5-4d68-43db-696ce0f15197@linaro.org>
Date:   Wed, 19 Jul 2023 11:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm630: Add support for modem
 remoteproc
Content-Language: en-US
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230719093458.2668842-1-alexeymin@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719093458.2668842-1-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 19/07/2023 11:34, Alexey Minnekhanov wrote:
> Modem subsystem in SDM630/660 is similar to MSM8998 and
> device tree node for it is based on the one from msm8998.dtsi.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
> 
> V3: Use memory-region property to specify memory regions, instead
>     of using "mba" and "mpss" subnodes.
> 
> V2 link: https://lore.kernel.org/lkml/20230621175046.61521-3-alexeymin@postmarketos.org/
> 
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 59 ++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 2136ded22f7e..797625cf78ac 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -1032,6 +1032,65 @@ data-pins {
>  			};
>  		};
>  
> +		remoteproc_mss: remoteproc@4080000 {
> +			compatible = "qcom,sdm660-mss-pil";

Missing bindings so standard comment:

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Best regards,
Krzysztof

