Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5AAE784B2
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 10:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbjJBKAL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 06:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbjJBJ76 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 05:59:58 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BF6CF7
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 02:59:54 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so255900561fa.2
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696240792; x=1696845592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gncSwMFcnYXO7+yoToF5ZtSRBM43wttJi1puoOarBO8=;
        b=PttmKga6TolJPvDy0ubLRZSyRqdEMzisAvJSNECvgZPvoIO2E0ny9Z/3/aErH0lWd9
         0oywHwqEXW4TnupH9uCN/gDZJxJt6z1bPWxef/FNInN7pcOS3R9nXMb3y1a+VjSKLBon
         Kyhh/2QNyipkTfOuLznl/GhY2vzlkYuFJceYqmx5uQYlORC/hXtiLqt8mzvVQl6ofe9w
         Gv2NYUndhKQu/fJltp6vYcGasnDvldI2UCqcTalk5GtZxeBRayEDJMRDfTNYqgn8qWHw
         ZiSQXIjoAM7slZLg2Bk0Yq+NOs7fuMK9pyjKA4pFTfMYiMi2Rcs7pC/gdlo7sh+xbgwW
         s6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696240792; x=1696845592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gncSwMFcnYXO7+yoToF5ZtSRBM43wttJi1puoOarBO8=;
        b=N9x8mlFrNzGRdK2Tc+uQAacKlmSw3D6Slc37/QuEHXr1+aM0wffKVe99LFkVPobqOn
         RRHqS7/Lcz5isfMgADzjp4LAGWoUHU4K3yqxRCCHNFM8q6xSII8G3SYr+GFYpdj7JY4q
         3Bc5oesh5HCguRA+0Nmhwp2sNe7Y2Ievp15xkpMGdvskh/9ARJuemeU27vq3rAdYLV8v
         tneOsNQXvGeZkYmWbp/96sm2cdTBClfBTof6vGck9tLjthXUpgmprmFN6yYHUQjYgb8W
         Sjo1mI6F7TltvOF5v98eACnQyMiMrbPMJn6b5J3lmwRkWf3bC0fcM1yMduuhi5ZbO1OY
         B69g==
X-Gm-Message-State: AOJu0YwQKYiKbFMY34rHwnVK1JPs2XPupLHvIKGzpCx7pRfEeG6AERlW
        jpy1j62iSphYzo2qdpPI/KGTVA==
X-Google-Smtp-Source: AGHT+IFz07CTiTCLL4SudGLfq1adSM4kx0/HChfGtNHaieGodNY70bP9DLTgXQIlbFpVa3dWg4MuFw==
X-Received: by 2002:a2e:9cd5:0:b0:2c0:afd:e7ed with SMTP id g21-20020a2e9cd5000000b002c00afde7edmr9715892ljj.10.1696240792512;
        Mon, 02 Oct 2023 02:59:52 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k25-20020a2e2419000000b002b9f1214394sm5226754ljk.13.2023.10.02.02.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:59:52 -0700 (PDT)
Message-ID: <a1dda0c5-e394-a66a-327f-77f534590134@linaro.org>
Date:   Mon, 2 Oct 2023 11:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 09/13] arm64: dts: qcom: msm8916-longcheer-l8150: Add
 sound and modem
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>
References: <20230926-msm8916-modem-v1-0-398eec74bac9@gerhold.net>
 <20230926-msm8916-modem-v1-9-398eec74bac9@gerhold.net>
 <14262938-4150-429f-a730-df1b2fadd9ff@linaro.org>
 <ZRhT2PRwAoB39J_0@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZRhT2PRwAoB39J_0@gerhold.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 9/30/23 18:59, Stephan Gerhold wrote:
> On Tue, Sep 26, 2023 at 08:59:52PM +0200, Konrad Dybcio wrote:
>> On 26.09.2023 18:51, Stephan Gerhold wrote:
>>> From: Nikita Travkin <nikita@trvn.ru>
>>>
>>> Enable sound and modem for the Longcheer L8150 (e.g. Wileyfox Swift).
>> e.g. -> i.e., or is that thing sold under many labels?
>>
> 
> Yes, "e.g." is indeed correct here. AFAIK the MSM8916-based Android One
> devices (aka "google-seed") are also based on the Longcheer L8150. They
> are available under names like "Cherry Mobile One G1", "i-mobile IQ II",
> and "General Mobile 4G". They are also covered by this device tree.
Oh wow.. That's surely fun

Konrad
