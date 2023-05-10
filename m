Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917F4C77B7D
	for <phone-devel@archiver.kernel.org>; Wed, 10 May 2023 13:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbjEJN56 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 May 2023 09:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237216AbjEJN5x (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 May 2023 09:57:53 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAC9DD96
        for <phone-devel@vger.kernel.org>; Wed, 10 May 2023 06:57:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94a342f7c4cso1284812666b.0
        for <phone-devel@vger.kernel.org>; Wed, 10 May 2023 06:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683727042; x=1686319042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+DF7OGInPZyCUnAUInyj/96xWmp/Hi9F+tKcsy2ORw=;
        b=yJzOXYE/xy9fBn2DYuONeh/AOt6srNw9UTcYYwrZFhNRHuJkq0RHSMvptFQWXo5jc6
         T0fjwG0asLvxOWooylILrfY/9DBbpKrT9mlIvNbW1zF6efoTObdQ1C/2yPwIHag96cIm
         s+j/c8MQUzc/ikPNmaG9TiAIlWtjVOGubjjP52AFxBNhdVbOf794MGyJJO1Dj5MeDCgy
         wZuNXRDXjOZnK8xxm7l17/euaxbMLSvBguUSmkuBh+VBXJXVXl5BB/YmNxeqk9LB679i
         Fyb23eZYXQn/VxPnwdvnzIkged7DN/Xbvd3TTHiAki/CmhPgGwH3Rid+BVGId3C50top
         U1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683727042; x=1686319042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+DF7OGInPZyCUnAUInyj/96xWmp/Hi9F+tKcsy2ORw=;
        b=SVTriU2Fr06Iqhc6gPJhi3lZKighR1Oc1KllcDAa/oLwXY2fCvm1ztRf96KZGvQjf3
         NuevCRgNOmPt8Xy5/XwbhVlTKjgsDMk3bqKNdTAEHrmRnTOcRw7dsHE5gpnpdc2AwuWa
         74JJVM0CPrQRZJFWYRxXHbM3zXqB8deajNTcHKiL3lusHL+D2CBXkAbDhz0bCz1PLI2E
         BroNzTD/JsfVe23X8eZykEIUo6vdk9Orkkx6Zo4eVF3NipfG5NSOIDGMzb5wdHKmNRnQ
         mwiFsNOt0ctsa7vIc5e2YV7M56/99fmiCX0WczS5T7e+GXaIbz5u/EcbPwsFrBa4mzO2
         cySw==
X-Gm-Message-State: AC+VfDx5ppaS8OvhYSPzmLaCI9Blpv0KqNrqA21cWYz2WiJ7F7fN79TY
        oOhgDScyaUbMH5Iz4ATNtk67qQ==
X-Google-Smtp-Source: ACHHUZ6cmdtzc/F8QJ+OVdwn7vxhY07H9LADiEK1jviTuemzNY34HdNTeZ62G10wpthFVG/7PaB39g==
X-Received: by 2002:a17:906:4792:b0:96a:138:c1a0 with SMTP id cw18-20020a170906479200b0096a0138c1a0mr4895575ejc.9.1683727041764;
        Wed, 10 May 2023 06:57:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id wi21-20020a170906fd5500b0094edbe5c7ddsm2739068ejb.38.2023.05.10.06.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 06:57:20 -0700 (PDT)
Message-ID: <0023c59a-1538-9a6b-ff74-9e26ad1f4308@linaro.org>
Date:   Wed, 10 May 2023 15:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] dt-bindings: nvmem: qfprom: Add compatible for
 MSM8226
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230507201225.89694-1-matti.lehtimaki@gmail.com>
 <20230507201225.89694-2-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507201225.89694-2-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 07/05/2023 22:12, Matti Lehtimäki wrote:
> Document QFPROM compatible for MSM8226.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Bot's errors can be ignored.

Best regards,
Krzysztof

