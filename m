Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F09E71D3F
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 14:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233210AbjI2OQH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 10:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbjI2OQG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 10:16:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F3A1B6
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 07:16:03 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4060b623e64so4752935e9.0
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 07:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1695996961; x=1696601761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00JIa3i2YsuwYBTn1xiPk8aPDl3kS4S8pu4PM2POaUI=;
        b=ii2XP09kdIAgGjv8/mEcrLElJXeEzsrBBF+GqqhRu1dhciMnJOgNzsWOEcIeargaxR
         NZiBx9aZ2GfaEghBrlmtG+zoVoW045c1zaXuu6KQE8Nz2OylJv6Yg/mSDWrrabGX1wst
         gGgSqTSk8Dtl0nQ0mt8sNonpP9C/QMXj9lr7O8WuINhqIrebMVZh0P3oWqiDOI4x1KUH
         1Xdef+0vLpCFdvGPLGv11GVIV43uBa5/BOWWqVs3Yd61QzZ6Lx0qkWufurWNAPxVlw3M
         OMcn1Lyyy7aEsdV8i2YlFLAayIAaE+BZskfRJZ0OgGpOF4UYE6f4A8vbKAErdVpabZGI
         mZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996961; x=1696601761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00JIa3i2YsuwYBTn1xiPk8aPDl3kS4S8pu4PM2POaUI=;
        b=Kskz/DNwSe3WvfbeNc10bWKGFYno2vXh5qRyVYgBsQeRZXBzI0Gr2RiLCSItUb8TQn
         z2T6naOzc9B6Yuxk72FeC94xN7yoVuMiiMKjLh8M1g0coZVijWBeBC7VLe9hJY/D9+H4
         EzTwJ4w1lYcEa6drU08T2mJVZnbsJXKEy+UTxM0i3f1D5KmXzDkX7iLYCXvuWi9CqKmZ
         3yO/dLQP5s9IpWOQl/JBPJlK44IFV4itYn0Rj+2i8uut4CiY2T+wR/+dsTkrlXFJAUh5
         gUX80KAWVJwFxS5/RRE7VZKShkCbuAI+mCm9pddVI8ubDO8A8/OnVaLazlcZynDusawt
         vL/g==
X-Gm-Message-State: AOJu0Yx0Pa4KQMh30QNLLFAqCFPo8NzKgOMTzsiSegqBX4M5NqkmCgB0
        61Rwyjm05cCk8hxqyAgNAYNeJg==
X-Google-Smtp-Source: AGHT+IGupaz5r81Ti0rvQWeOc0Lhh8lSxqvscVDL1xvsH8kzwpVqJL8vHtFolRSxf76MRDlECmyZxw==
X-Received: by 2002:a7b:cc95:0:b0:406:51a0:17ea with SMTP id p21-20020a7bcc95000000b0040651a017eamr3957651wma.10.1695996960715;
        Fri, 29 Sep 2023 07:16:00 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d698c000000b0031c8a43712asm21607937wru.69.2023.09.29.07.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 07:16:00 -0700 (PDT)
Message-ID: <27778ef0-53db-453a-acde-ad81154c8dd0@nexus-software.ie>
Date:   Fri, 29 Sep 2023 15:15:59 +0100
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
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
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
