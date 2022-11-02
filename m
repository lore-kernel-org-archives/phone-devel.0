Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6114EC4332F
	for <phone-devel@archiver.kernel.org>; Wed,  2 Nov 2022 10:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiKBKjn (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Nov 2022 06:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiKBKjL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Nov 2022 06:39:11 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C85019004
        for <phone-devel@vger.kernel.org>; Wed,  2 Nov 2022 03:38:32 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so981935wmb.0
        for <phone-devel@vger.kernel.org>; Wed, 02 Nov 2022 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hRYCRL/SBQ45Ja/04fjZY/45c3An/3ZI+v6TZQZgOFs=;
        b=JkjxUWpdZACAbfgRAF8iqhXJ/9ga/2EeSTQJMmEiZPH6vIlZdzVFvJujbP30Y9VN0r
         evr3SnPsLcUFNrW6Fat3FEFpwWgVNAXyKaDdMiZsqf5w0+6V6aGk8hmRyoM0bhNABD/Y
         lbXeXdwmOHD95Mx7m2KpQhUyssC8D6igfIa/Yeb1aPkLmbUCUFFeJEC9trFTbqO+Fcrj
         kGjd4MfPFtZnQ7HYhXkF/p237RXpQB5ucgS+GaaSR7KZNt23Zq4goV3vG7k/T2U+lMi9
         XxVdCFBzoFyeqlxhnBndvV9wqL+xTvT52eVIByvylSheN432OE3ucWCDAf/l5Lqes+AL
         d/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRYCRL/SBQ45Ja/04fjZY/45c3An/3ZI+v6TZQZgOFs=;
        b=jlrs6fcAH6KN9K5ctGXw3nVHKobcYKTviZ0b3G/m5I2xy9BkJj0Yn+DKAFxPMpR7a+
         B8ta9Wvl4DlTw5RUVA1aFGpEWrF6Gn4vjfzjckiH5UYjWm2R5IvFU9V+AiqnchDA+mgs
         Lt3+ivBhSOK8v0sPCztm86tKbSNKilMcvBwpcWMPF7JNCKwTJs/0ptb7oXUPU9zmdIJ5
         ao98Vo2CWWI4L+dzmSSC0fsGigRqCvld/yPdYbthUL4dsIVFBpqdM/ts3og6XgTGUwob
         OnlfL9NMS15CMCO6X+ozq9YttibkJwNxRVj5OFVb5zG2dUMp9YQQTYFq5EwyOACAiHCX
         064g==
X-Gm-Message-State: ACrzQf1PY6g8lPjVj0nDjNgDzlSKG4ZceHaWaWZ9gYii7z0ZlcbEu/fm
        Xvq30BD1dqlpCcNVBqTCKadhyVF9vp5Xy0jV
X-Google-Smtp-Source: AMsMyM7+g1dcKLFTAyXXyWWdBiZhU3NGuGjw8oKD1SRd73NeAVaUVT5p/5IUP9D2SvUeXDKXmcIvSQ==
X-Received: by 2002:a05:600c:42c9:b0:3cf:69d4:72d9 with SMTP id j9-20020a05600c42c900b003cf69d472d9mr12879993wme.93.1667385510803;
        Wed, 02 Nov 2022 03:38:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1546169wmc.43.2022.11.02.03.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:38:30 -0700 (PDT)
Message-ID: <ea0fd9da-4fdc-9d9b-f3ea-e74fae6d3723@linaro.org>
Date:   Wed, 2 Nov 2022 11:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 2/3] regulator: dt-bindings: qcom,usb-vbus-regulator:
 change node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221031173933.936147-1-luca@z3ntu.xyz>
 <20221031173933.936147-2-luca@z3ntu.xyz>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <20221031173933.936147-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On 31/10/2022 18:39, Luca Weiss wrote:
> usb-vbus-regulator is a better generic node name than dcdc to change the
> example to match.

Subject is wrong, should be something like:
dt-bindings: regulator: qcom,usb-vbus-regulator: update example node name

> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> * New patch
> 
>   .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index dbe78cd4adba..b1cff3adb21b 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -33,7 +33,7 @@ examples:
>        pm8150b {
>           #address-cells = <1>;
>           #size-cells = <0>;
> -        pm8150b_vbus: dcdc@1100 {
> +        pm8150b_vbus: usb-vbus-regulator@1100 {
>               compatible = "qcom,pm8150b-vbus-reg";
>               reg = <0x1100>;
>           };

Thanks,
Neil
