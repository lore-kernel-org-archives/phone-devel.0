Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FDBC4321E
	for <phone-devel@archiver.kernel.org>; Thu, 13 Oct 2022 21:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbiJMVTK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 13 Oct 2022 17:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiJMVTF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 13 Oct 2022 17:19:05 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECCBA3B73A
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 14:19:03 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id df9so2097100qvb.9
        for <phone-devel@vger.kernel.org>; Thu, 13 Oct 2022 14:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqR2KCYKmVm9s7WE15umjNdzmWYBIaWjIp2AMtzbdxg=;
        b=Pa8C26IhKJL4eZX7SM8BD/J/PGGAA0YkUMDsCsgw5EfR5Bt5DsaT7jPqapCXkCQ02i
         RcPg1+isjTCHpn7WLghwBg3UCh2tLbQ+1e5PJN9zuvPQNCQhrqkLRA7BRCzLMt5tVrr7
         H1vuuyz0UAIzoQXnSBupth9e6Ii3YhHvOzS7ieUT2NI0yf1ZhhYyNECwro8Ss5rfrf81
         iaeoW7exp4ThxR5YcFhtYPKyIU3gsXriXzwr2iP5hbsUKcTrWzY4wF7BHfPnTcN1Tt+V
         knAYLmOZ4BKbKnWZmXNM/iSXlCcwNvecLU9kD7PrCmP971Mj9/a56PE/+5M7dI9tv8fA
         WGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqR2KCYKmVm9s7WE15umjNdzmWYBIaWjIp2AMtzbdxg=;
        b=HCRni6WW4SFO56fo6EsacUKIYaftTcwCc4q5v7+3DU9tG5TiJyv1hasQRKleQAdZN1
         IU3uMz6YjnlA6htEMLR/wO3CWg1KkOZI0rMWcHeOBgDmpCiuVkZfWcaDHnYgZnfE+So2
         1o5gS/Nw5494pwX4u/QBPx/Lu6tSITmNYjfHR4UZnrBD7WaD3rQIL5kl4sepEPlvqMBH
         y07Hx6xu8RuM5415oGLe6URhuzPxSkIDjSmMQoqeM5rPqqrTeQlqn0HLGkUxguRQ8nXr
         79B8axPQZhMNPzIrrvyZOiroeh2Md5mal7ZfFiT+rKMPsZzK5ZbsY7o8BWDOEyF/2vGq
         7K6g==
X-Gm-Message-State: ACrzQf3twGbNP+mdoKIeLotQVnPArlZYH35owD/RZKqEWxKvCuEPj7ZR
        mAwI45W/MUy/OwsVVpeB1imxmA==
X-Google-Smtp-Source: AMsMyM7lnbf0nIPv9rq8SIxhIiHobUpjXLxcKtaCEwKFZcUGTo+wZFoUDg2Co/zScjFI02QAngcwAg==
X-Received: by 2002:a05:6214:d8a:b0:4b1:9f67:450b with SMTP id e10-20020a0562140d8a00b004b19f67450bmr1509945qve.119.1665695942528;
        Thu, 13 Oct 2022 14:19:02 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id bj33-20020a05620a192100b006ecfb2c86d3sm606364qkb.130.2022.10.13.14.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 14:19:02 -0700 (PDT)
Message-ID: <6f804ef0-bfc6-95ac-3a79-cf7b0dbcc5f7@linaro.org>
Date:   Thu, 13 Oct 2022 17:16:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 1/3] ARM: dts: qcom: ipq8064-rb3011: fix nand node
 validation
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013190657.48499-1-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013190657.48499-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 13/10/2022 15:06, Luca Weiss wrote:
> The devicetree documentation for the nand node requires the subnode be
> called nand@ and no compatible is needed.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 3 +--


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

