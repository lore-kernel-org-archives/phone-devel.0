Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CABC7EE22
	for <phone-devel@archiver.kernel.org>; Sun,  7 May 2023 20:41:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjEGUl5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 7 May 2023 16:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbjEGUl5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 7 May 2023 16:41:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC6B2719
        for <phone-devel@vger.kernel.org>; Sun,  7 May 2023 13:41:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f14ec8d72aso2254584e87.1
        for <phone-devel@vger.kernel.org>; Sun, 07 May 2023 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683492112; x=1686084112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Qsh+WDrWs66LoSbRmdKZ5wnMnJmv7Gda9Tt69BxujA=;
        b=IOy+PnEwdSVS/Uw+VY5bD8G6m3H4Q/nzAgIYS6ZcUOaZ/3Rj5We+TZIk676WDoij0D
         iGG2xB2AjUXbn1Bky9v9b7hRMx17CUD0Ii6QT5lHynhdHgeQsy4WbFpzENngnFHa0t11
         bjvWkVOeMql2b3qyWvuD5I/PMi+ecm3t9mhjtSaa+eE0FV4zJJkjjli9WgMzdGW1vOqx
         shAtdZKvTxLs4I/SHpqDtf/KuqFy5IyQwojMMYuBf00WP1+QoF+WhkH72oGXAOuKJSoW
         IoJ4jweQLoL4OEjsUCynujLUNY6wq7F/rCE9xsEV5jzQHRfomyR9+h60CI/ZIG6LRZ/J
         +NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683492112; x=1686084112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qsh+WDrWs66LoSbRmdKZ5wnMnJmv7Gda9Tt69BxujA=;
        b=SdhpSynfVoCdDOzgWwUq7HEOxd+hEfqqiUVg+eWUvVrnxkXN49pesng8F7t55tRjYH
         Un8snqTHJB+Ti51Eod38rkEDdn3Qz3PuJnlqzFPZGZB+cdKC2b8UMHIj1eLFjPmn/rEz
         zDEB5lCnNBpLOUm6xnGFus8NGyscDfmriYbJZAwaKozlO2rg1qTiyyf7KWHUziGWRiaO
         LdMUVlEIczHYXQKgXOY4bSPri+BRAKSOJppuLWjrSYkvRS72rT3qqW9g4WXuldRs+Apv
         hfw/2VWNAC4JhqJkXmolGxe0PI2Ar2SWcW+Dd/X699FyeIXw46J3PfFfp0SqW4wcQh+C
         jHrQ==
X-Gm-Message-State: AC+VfDzZpDcg4u7cU1WYV+LnQ3ynRikZY9jp55G1ZuLdfR5+Dmu2YBAq
        NSH1kpdz1YabtxpKa3/sGMlbcoKMfbkHDvD166A=
X-Google-Smtp-Source: ACHHUZ7VEV7wT8lTz7DhTfK2lOp+OB1Aq8mBaJo0x3t+nuLvH8YDSi2d8X1ej/NLQGcxMmY0fn9MPw==
X-Received: by 2002:ac2:4359:0:b0:4f1:5010:4b34 with SMTP id o25-20020ac24359000000b004f150104b34mr1518829lfl.18.1683492111710;
        Sun, 07 May 2023 13:41:51 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d17-20020ac25451000000b004f138c4de81sm1073869lfn.149.2023.05.07.13.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 May 2023 13:41:51 -0700 (PDT)
Message-ID: <8c69fa82-0566-0294-b25a-7d59502b625a@linaro.org>
Date:   Sun, 7 May 2023 23:41:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/6] ARM: dts: msm8226: Add tsens node and related nvmem
 cells
Content-Language: en-GB
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
 <20230507201225.89694-6-matti.lehtimaki@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230507201225.89694-6-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 07/05/2023 23:12, Matti Lehtimäki wrote:
> Specify pre-parsed per-sensor calibration nvmem cells in the qfprom
> device node rather than parsing the whole data blob in the driver.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>   arch/arm/boot/dts/qcom-msm8226.dtsi | 113 ++++++++++++++++++++++++++++
>   1 file changed, 113 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I did not manually check all the offsets, but they look sane to me.

-- 
With best wishes
Dmitry

