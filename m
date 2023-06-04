Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7516C7EE23
	for <phone-devel@archiver.kernel.org>; Sun,  4 Jun 2023 09:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjFDJLZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 4 Jun 2023 05:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjFDJLX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 4 Jun 2023 05:11:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90245DF
        for <phone-devel@vger.kernel.org>; Sun,  4 Jun 2023 02:11:22 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9741a0fd134so617612066b.0
        for <phone-devel@vger.kernel.org>; Sun, 04 Jun 2023 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685869881; x=1688461881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcvHDMkzrwljyNeqpGNC3T31sTZEZ5CPQHa0w+swo54=;
        b=VoEiuTKhox4FxPtyHUZo0MDz2jEB3iPUWcOtskKnYlgI5xUfeeyHR80H/Xd8y50x4a
         Xmz4lF80hj3Awe6QSk3OFrXBJ2mkg+wRmUa4AjbiHmGbb2tYYEgvqKnOQfZ4sEECVaNu
         wwlQZ7svBYxm1tVo4PPoADDBNcrY2uWK1BdZV8ka2tAD/hs6CQ44W1hRMwqYFWSvtq8F
         7KDq9y+DqpD5/x0//twWxOTfI4trd7Dt2MUNdSUpPnWHfR75VnBQB+87sYRTB0z+cZTJ
         kzciNhrKF1dibz+jtrTEw/oClcIrGdK57FbxsIioAzw/5C6ky22BUiBGH1ukKkYn6bru
         k0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685869881; x=1688461881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcvHDMkzrwljyNeqpGNC3T31sTZEZ5CPQHa0w+swo54=;
        b=RvvHJMikozijTQWOR/tGl8tg4xpEZRxtcvZe4r+IQe8NasbgFOa0HttUQtyCWQVUKE
         Ti910LLQOmIpS/HoSMZWfWfjyf8hcb0+ulrTl+RY3/OmdOXOjygktvJpc20IiSo/izr2
         J5AJZMNX+ReHWM0pNE4ne2JIhFyhI5E5EJ2egO9++ey+im0ta4iiUd7EjG/j0LZCNkjk
         jDNO80e9l72Zu3dpvZiYtRuGeLa7QO61KVVyckUb9o0CRUrw+hLLgr+wJ4tyRiLrfdaR
         pzbMljrCHtOIQsvcygaQLNjq5tJjQi0R59RTAtPD2m/i4b+5Savvl2hxmp25xmV0b8k5
         BidQ==
X-Gm-Message-State: AC+VfDyHlb94ibtHDDQiodEgeON8u6Vqg7h7myTq7QmepehNzoLGsAdx
        ORnVTZIzzyYSMQcnvwADHrzHcw==
X-Google-Smtp-Source: ACHHUZ6Ja8AuRkcS56tswppum6NJfV+7Lt04jvt9yGevB0CVpYfVOuZ3hgOMDkFyPLTTP0esvYYDTQ==
X-Received: by 2002:a17:906:fe04:b0:96f:45cd:6c21 with SMTP id wy4-20020a170906fe0400b0096f45cd6c21mr3643942ejb.30.1685869880966;
        Sun, 04 Jun 2023 02:11:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id be21-20020a0564021a3500b00514b0f6a75esm2525893edb.97.2023.06.04.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 02:11:20 -0700 (PDT)
Message-ID: <05658f98-ddc1-702b-ea4b-4ea95d0b3313@linaro.org>
Date:   Sun, 4 Jun 2023 11:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil: Add
 SDM660 compatible
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230604061421.3787649-1-alexeymin@postmarketos.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230604061421.3787649-1-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/06/2023 08:14, Alexey Minnekhanov wrote:
> Mention sdm660-mss-pil in compatibles list.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
> index c1ac6ca1e759d..09da5616e1e5a 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - qcom,msm8996-mss-pil
>        - qcom,msm8998-mss-pil
> +      - qcom,sdm660-mss-pil
>        - qcom,sdm845-mss-pil
>  
>    reg:
> @@ -245,7 +246,9 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: qcom,msm8998-mss-pil
> +          enum:
> +            - qcom,msm8998-mss-pil
> +            - qcom,sdm660-mss-pil

You also need to restrict/constrain power domains and resets.

Best regards,
Krzysztof

