Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD804ECAAA1
	for <phone-devel@archiver.kernel.org>; Fri,  9 Sep 2022 09:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiIIJqE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Sep 2022 05:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbiIIJp6 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Sep 2022 05:45:58 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81387C483A
        for <phone-devel@vger.kernel.org>; Fri,  9 Sep 2022 02:45:56 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e20so1768796wri.13
        for <phone-devel@vger.kernel.org>; Fri, 09 Sep 2022 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VpThbe8guKkTwpHrdYNBDJk5GWCovHFUSJ8RnnMnk6g=;
        b=Tn08c/5JrTkDYxf9JP+BQRqJAKtzTBpuTTVsrsWIfFmY3BKIup/asMRrLQSoChOYHp
         tNhuNH1d0f3+4ufoQZ/irHZNIpXh18tmWUHTRuV8lR7Hqb2BuTPDMM6+lpEQGxaxqt9j
         PIc0kk+FesFhVgmL091Fkdz4NQROCzjXAdHxdAJExzgjO21FFUwmSkHzysyhIXRyxOwR
         cwoSbhj2S74bTWf6SLGSMEWOHaTgLEDJKUDYLgmDWdwZXsdcc3PfB7iejktrwWceAf9f
         xyZ0l/7/sHQuIQvNk7rT78nRUAMWyV9M4xlwhnOax4HGvUpB46cCRWcck9Tb493iNgDz
         LsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VpThbe8guKkTwpHrdYNBDJk5GWCovHFUSJ8RnnMnk6g=;
        b=QagCSEP9HOHBfxyxuFPdEnyLBFH6FvjoWBp+Rokr7z/jBZG/3cQxoyBfffzjWj4Tqz
         TQBkvIC3FREYGwjEyAXfh+Z6mQM/e5fUOwB+rnAg4WIn29TfG0my3VdlTUoxmlS/adCC
         81M1eNIVajUhiMyyeqJoj4TfvXaBrcqM8C4dTKGY54HRZ5yCYrTb0PnY5eIt/NbYmzE7
         auygjOM/f3MDlDcBwAvjXtPeYHmsOwVx4Dl84S5fBHYM0QuzygEF50sMM01bM/nY1wT6
         NPXynfXALNI0nWl32o5P2owUET3b5Ow3qKWMJgdbDvJP94Jn3/FXDrlv3IcIRAFFEvHf
         8VWA==
X-Gm-Message-State: ACgBeo2xaj9LAUtZ8KbnfoGTndBqCdzVqSkzMWu6WT5FmbljlpG8svSZ
        4nKahDdfx7njJ29x8VcUhTQHTQ==
X-Google-Smtp-Source: AA6agR5w63EZsxEPD4It3zid2cpGCTqxvsFLMwsJC8Y+tyuxAZb7LkaKpwpIWBOYGI+L0ngJVJME7w==
X-Received: by 2002:a05:6000:10d2:b0:228:d60b:6d5a with SMTP id b18-20020a05600010d200b00228d60b6d5amr7168864wrx.146.1662716754958;
        Fri, 09 Sep 2022 02:45:54 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id k4-20020a5d4284000000b002286670bafasm82563wrq.48.2022.09.09.02.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 02:45:53 -0700 (PDT)
Message-ID: <1b4084bc-2ec6-e2fe-5a0c-40a3409b7b9b@linaro.org>
Date:   Fri, 9 Sep 2022 10:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/9] dt-bindings: nvmem: Add SoC compatible for sm6115
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220903174150.3566935-1-iskren.chernev@gmail.com>
 <20220903174150.3566935-4-iskren.chernev@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220903174150.3566935-4-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 03/09/2022 18:41, Iskren Chernev wrote:
> Document SoC compatible for sm6115.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---

Applied thanks,

--srini
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index dede8892ee01..54053e16b8fd 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
>             - qcom,sdm845-qfprom
> +          - qcom,sm6115-qfprom
>         - const: qcom,qfprom
>   
>     reg:
