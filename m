Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4530EC77B7C
	for <phone-devel@archiver.kernel.org>; Wed, 10 May 2023 13:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236593AbjEJN73 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 May 2023 09:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237102AbjEJN70 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 May 2023 09:59:26 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB16D84B
        for <phone-devel@vger.kernel.org>; Wed, 10 May 2023 06:59:03 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9661047f8b8so917589666b.0
        for <phone-devel@vger.kernel.org>; Wed, 10 May 2023 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683727141; x=1686319141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5umD0N00LZsQUDgnQcKGC0bp9WmaQ4p5LSOJTLwKMI=;
        b=jtMGSk2ebqQKWw641Lf7ew3cTaW23tSJ6KNFWdukvqtcPA8OEwyirpNWxiplfyG5SG
         FpuALU+I3jfUVMgWponcQLKxbny4WvnzxPy30aDvBe/Yz9o3Fz7ODncvbi1CV08MhWYP
         qXGaN/dWeXTiLREdfVmHnXuQFAXTYF/ROxTjzWn3TToPkD9g+74+pTyHEa6y3aNRMvWI
         PWoa8GjAsUDSQEx3/poFuK4qKRO2Bf3ujm0nKS+rtJPy3H24MRqRr0D+/Gr8/q8s2jt/
         Dub7XpNo5dzG49H/zj/8dFVRRzq0DfuE5sl9p5+JwQZ0poi6udXPLxN9LidyvJPd067q
         BEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683727141; x=1686319141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5umD0N00LZsQUDgnQcKGC0bp9WmaQ4p5LSOJTLwKMI=;
        b=QwkAqRUuMQLdXBqXIriCJrjggdnqIlLnGyh+RkoSEF/2S/CLfXet3qgqrnCGJLgw4q
         7S2dXpOdXDxK0osvZ4pjh2mOzSKKK9BwV4yFLOUkDTCtJitDpU/zn2fyw/pisAnV6C8k
         F61CKMuKh7TYpZnA6rVVCIZqJHymBsCDnY6Z8kxhv1CfG2Bv1NdJUhj44QsRI5gXek8o
         2vMphk1cDIjopkhFXQX9vzmLULHSYS7B3/Gj2EGJ4z3fnD9sb/V6HaGruyjjiVlFZgNs
         HGn0HzJNWGWZNlD3dmITL5HqVOvDBwILiFM+E4cFl3jsg7ze9sbCOVDiXPa/CBkDaTL5
         IZcA==
X-Gm-Message-State: AC+VfDyxsAv82MqRdWUYYbn6aHWEqX5smV3AK/p22QjpZktXsRf/N1hb
        LesflHjjwAPt8ouLfojtLmFu+g==
X-Google-Smtp-Source: ACHHUZ5Mr7mD7SvXGL0sP9dSfVFv/L4mlj7pc4sjNRGl3BsJQfiJM6ofgG+1MgO0eYlaNqMgdqQrbg==
X-Received: by 2002:a17:907:1c14:b0:95e:d74d:c4e6 with SMTP id nc20-20020a1709071c1400b0095ed74dc4e6mr20957880ejc.25.1683727141303;
        Wed, 10 May 2023 06:59:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id mm30-20020a170906cc5e00b0096595cc87cesm2710921ejb.132.2023.05.10.06.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 06:59:00 -0700 (PDT)
Message-ID: <68818f45-199d-1b5b-d125-ce08205516bf@linaro.org>
Date:   Wed, 10 May 2023 15:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/6] ARM: dts: msm8226: Add qfprom node
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
 <20230507201225.89694-5-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507201225.89694-5-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 07/05/2023 22:12, Matti Lehtimäki wrote:
> Add missing QFPROM definition for MSM8226 SoC.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index c373081bc21b..c34b8f3139ae 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -505,6 +505,13 @@ restart@fc4ab000 {
>  			reg = <0xfc4ab000 0x4>;
>  		};
>  
> +		qfprom: qfprom@fc4bc000 {

We usually call this efuse@

qfprom is Qualcomm specific.

Best regards,
Krzysztof

