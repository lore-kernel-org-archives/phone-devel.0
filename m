Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9CDC001E0
	for <phone-devel@archiver.kernel.org>; Thu, 13 Jul 2023 10:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjGMKLW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Jul 2023 06:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbjGMKLN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Jul 2023 06:11:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A9826B9
        for <phone-devel@vger.kernel.org>; Thu, 13 Jul 2023 03:11:11 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-991da766865so85521266b.0
        for <phone-devel@vger.kernel.org>; Thu, 13 Jul 2023 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689243069; x=1691835069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdJChzZNxDzjOXLqJ61GLiH0/vTfmrIbg8mkf+gOJHA=;
        b=XpqauorbRj+16W2KdWYqID1YUOFsG/PLZ+NFNt+BljuZB9a8RP2Z/dH2zY5Ud6LuI2
         8/Oklpnhec0u39RVTWa6M8TXhm7RiPlh2NpjuLqR3labjm2NuAGTRuIaeld0yiieIcb/
         CxliVWI5j8uhpr/ofEZOSON3NL7jkUYeC7mLPSZUKgTDzU03htyHcMqlDTNMXow5Y52U
         dXh16Ij30ycdhACBcsI+r0sBo0JoYAQqmwX/ezXoNyfPctJ9LVHds8EsBM0ldo7qUoG0
         Ge4g78Zrmpgz+voLuE92FZAmklmu9ryRlMcnyz2NStpskMAELW8xPy1VePTI1sSwjxym
         aHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689243069; x=1691835069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdJChzZNxDzjOXLqJ61GLiH0/vTfmrIbg8mkf+gOJHA=;
        b=Q9jj9xXZuQSp278fa7m+RgRmTYSyi17bRtD7TAyVxqwRZKh6Y7XBARRXvtJrUg3OyW
         Vj6AKJO1pxNEbx8mSrZDV5+fO2VA+R5kIB4H/uxCXudcbJd0KfuTu62tuXhLjSJ9KCOm
         CzTYnnj1n/iy9SIe2rCelkyNaT2RyKCJ6wLKKAGlPJ7WfTNdozhvqcOd+BQDnCIplyYE
         c5GeljEQHjG/+ACvMHNU30NbXhLFUdKirbp5rp7QnAZZBM2zfXPHBZm0h9wZlSaDRq3M
         QQBStLEofek0oOJWL8r9bF73+wArm32ypbpvPgAQ2iiNNcf5Pgw4BHXBiKKpzyXmQxyM
         4fqw==
X-Gm-Message-State: ABy/qLYBeDHHnfPKGvPQ7j9jKwEjRLLpqa7aGMBJum2A37F/qAMBbH5W
        flR+FF5Ku42MiBW6/jbQoYJWQg==
X-Google-Smtp-Source: APBJJlHupH2O4PNGjOoIHbXwB5WOyuMkaK5vUVwl67E+lPYsa2Kthyh37XaKqJxQvC4FiojvMkXRgA==
X-Received: by 2002:a17:906:341b:b0:992:a836:a194 with SMTP id c27-20020a170906341b00b00992a836a194mr788045ejb.59.1689243069359;
        Thu, 13 Jul 2023 03:11:09 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id x18-20020a170906149200b00989027eb30asm3762868ejc.158.2023.07.13.03.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 03:11:08 -0700 (PDT)
Message-ID: <5bc4ddee-fdac-a6c0-c30d-5d0a065e24e9@linaro.org>
Date:   Thu, 13 Jul 2023 11:11:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/6] dt-bindings: nvmem: qfprom: Add compatible for
 MSM8226
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230507201225.89694-1-matti.lehtimaki@gmail.com>
 <20230507201225.89694-2-matti.lehtimaki@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230507201225.89694-2-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 07/05/2023 21:12, Matti Lehtimäki wrote:
> Document QFPROM compatible for MSM8226.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---

Applied thanks,

--srini
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 2173fe82317d..0baf7819ab46 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -20,6 +20,7 @@ properties:
>             - qcom,apq8084-qfprom
>             - qcom,ipq8064-qfprom
>             - qcom,ipq8074-qfprom
> +          - qcom,msm8226-qfprom
>             - qcom,msm8916-qfprom
>             - qcom,msm8974-qfprom
>             - qcom,msm8976-qfprom
