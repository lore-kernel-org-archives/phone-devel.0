Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD62ACCA479
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jul 2022 13:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235273AbiGRNpx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 18 Jul 2022 09:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235292AbiGRNpr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 18 Jul 2022 09:45:47 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548FA248F6
        for <phone-devel@vger.kernel.org>; Mon, 18 Jul 2022 06:45:43 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 19so13674074ljz.4
        for <phone-devel@vger.kernel.org>; Mon, 18 Jul 2022 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DKoR4Ro1OVJtCy4SmvnL1kWSjaV/Fp3Wip/RAp6Bzvc=;
        b=R51Ggj9LrkxR/7/+OIZ+QNudD0BGz8gLF/2swjL94x3rIRM9ZXw3EKNMV9U+Whqu+e
         kATnHaogIXNoR9exlXVb2hitWfu5AsG4LNep/e8qbPT5OGHSTjwMoAw4+1qZxXsvhC2o
         mHo13JOg+m6zK+vihoin3yFpJTSOiDAKwCQUSVXUs0EttZox6QQewFob5WC/Siqg/OK2
         sYsB7ElEw7adDh/HZjv/AZGdXvLCONt5+jWlnUez7rHHM8WdqYRnPRqicJElZ+EKLILI
         M38efKjBwnfmKgQNs4aUT8gjBZLC8fh2OrN+J6OKf00VAiak8ljGgIBXGoqcs4i8P5Vu
         yNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DKoR4Ro1OVJtCy4SmvnL1kWSjaV/Fp3Wip/RAp6Bzvc=;
        b=l2piqrgTJVGKLtWak4+2YJ8r60mL8MeD0oRFyiWMoN9WrXNQcHLlNacbe2zgWHEcCy
         D3QBZiXkbG+xqh28Nf31CzcBgGF7fNLoF2MPasP6Cx4mOxvZagQJ+gqQV1DVMBiuhK1Z
         MH/50zEwspU3lC55E5M609oQ0LnVo4MZrkaiI4yh49pk7YZZyKl/Cs8+2JvmPqN20PY2
         cUJBO+GH+RZ6TEK2SeV2YLwj06Izehz67zGy2QgzqhcqysqHDrJJzYnv/XJfExlQBSa9
         zAGoyiQ7/yVGwez2ymskJS/f44ezzv2p54QcKIguB4H8Cko81M/VuqsZWfaR9j0Qxk8m
         Z3ig==
X-Gm-Message-State: AJIora+qd8R2N4krwgaXMOECY4GTP7/2mKWzWu1gEBapbAr+Tz/TQGTr
        G0TZFqOlxEPxhc9KLUrd6vqQTw==
X-Google-Smtp-Source: AGRyM1somiSvS6Xk5Be6L6bYB2ygzu9DKzHW6ayMd+VF0RV9ckq+gbVM1YdLlY4dXUTMvTQHf4UHhw==
X-Received: by 2002:a2e:87c8:0:b0:25d:776c:8343 with SMTP id v8-20020a2e87c8000000b0025d776c8343mr12285854ljj.268.1658151941493;
        Mon, 18 Jul 2022 06:45:41 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id c3-20020a056512238300b004833caeb8bdsm2608841lfv.101.2022.07.18.06.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:45:41 -0700 (PDT)
Message-ID: <341fc30d-edc6-015b-d7ca-4b6d4a10b903@linaro.org>
Date:   Mon, 18 Jul 2022 15:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: pm8226: Add node for the GPIOs
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717213432.134486-1-matti.lehtimaki@gmail.com>
 <20220717213432.134486-2-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220717213432.134486-2-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 17/07/2022 23:34, Matti Lehtimäki wrote:
> The PM8226 provides 8 GPIOs. Add a node to support them.
> 
> Signed-off-by: Matti LehtimÃ¤ki <matti.lehtimaki@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-pm8226.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
> index 9b7d9d04ded6..235df06a0369 100644
> --- a/arch/arm/boot/dts/qcom-pm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
> @@ -90,6 +90,16 @@ pm8226_mpps: mpps@a000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pm8226_gpios: gpios@c000 {

It seems several Qualcomm PMICs make this mistake... why this cannot be
"gpio" like expected for gpio controller?


Best regards,
Krzysztof
