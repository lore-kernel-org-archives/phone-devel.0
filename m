Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BDBE71D3D
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 14:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbjI2OQR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 10:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbjI2OQR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 10:16:17 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95691B7
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 07:16:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4054f790190so132489365e9.2
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695996973; x=1696601773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00JIa3i2YsuwYBTn1xiPk8aPDl3kS4S8pu4PM2POaUI=;
        b=hrW7w7JlgqYDLBetKemNzjp7x4cVc2MXWIalfba5IePCjFNGq5u8kb9crDeEghFxka
         W10sAS60DlA7JRIfVdbMJoDGSUxMw5ppzU80O2BZq1VUwzhC33oBHua0N7n2cCVZ7lrL
         lcHP78i4Hy0nD50rrUNs8RpfSumHaIAOJHsG22QsK0P+lBMW2quYgWEot68PmyqzmzJi
         cI2lLnIbKAamYmu2vkWAWrFUAlhU+Sr2QL+XBYnMtwaF1uUyFXFFEMoO+U4e/b0UrgEJ
         8kJE0JuJ6RF1CMxA55wbWuKngtsq4uVBAqBNOohNaRPK3xpNauattMaK8SdTcJkQK3uZ
         BWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996973; x=1696601773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00JIa3i2YsuwYBTn1xiPk8aPDl3kS4S8pu4PM2POaUI=;
        b=irzT9oet/xFQ7moxVnhaISMuBhccSIWfoHcS9Y2+o/uQ83Q0SMsFX+l0x5hOq4Y95S
         ZM3zddFtZCvrckYUSdq2PCPSD1fqrhVWW2ihzRA19j8htnSPahwgAyP2qQzboRSs2qFr
         oZkGoOHd3Vf7QiRNwESfR1y2bJJitzHr/EHh0ZiVrHnJ7tWAbXZVh/XILvcqaEoha1EZ
         Oj0GB6Jrr7ZDGqiZ4wVJ8qXOZey9qaFpiLpSFvJI+Gi1zZEpy8w4HBsHQb853I1L1B9Z
         Zc0i0G39cv/HDgTIUHxiVU4vsRA1TXka5en7UcD/odK2MHBISjt+0IYnZM2zY8l7buIE
         Vtuw==
X-Gm-Message-State: AOJu0YxKe4SEuJ+N+r++3qfp7oyDDepdnsOSyDcdMZlc8NQX57ojJ+aN
        hzmmg9OvLBgNL3sBDg6NVcRmJA==
X-Google-Smtp-Source: AGHT+IG61tSL0NxdNazcc9PmRAuQGFsDS5CNv2jnP9lZj6UbJ/936yH9/EvOEDuRV/yyAsqsm4f9Cg==
X-Received: by 2002:a05:600c:211:b0:404:6ed9:98d1 with SMTP id 17-20020a05600c021100b004046ed998d1mr3845184wmi.41.1695996973349;
        Fri, 29 Sep 2023 07:16:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n24-20020a1c7218000000b003fefb94ccc9sm1520894wmc.11.2023.09.29.07.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 07:16:12 -0700 (PDT)
Message-ID: <6b201582-4005-4d06-819d-356dd906b28c@linaro.org>
Date:   Fri, 29 Sep 2023 15:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: qcom-cci: Document SC7280
 compatible
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929-sc7280-cci-v1-0-16c7d386f062@fairphone.com>
 <20230929-sc7280-cci-v1-1-16c7d386f062@fairphone.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230929-sc7280-cci-v1-1-16c7d386f062@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 29/09/2023 09:01, Luca Weiss wrote:
> Document the compatible for the CCI block found on SC7280 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 042d4dc636ee..158588236749 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,sc7280-cci
>                 - qcom,sdm845-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
