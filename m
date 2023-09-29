Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A24E810D5
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 11:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbjI2LhO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 07:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbjI2LhN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 07:37:13 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FA71AB
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 04:37:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-533c4d20b33so1278160a12.0
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695987429; x=1696592229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVXBaUdZuWKwijDr+1t4ohaYkGxEB+hc3BtA9q2v7ZI=;
        b=qe5t48ExZtypK/sqfe7cP4Q1HWnZ2my7oY95CApe8I9zZvOgYf79nKh7rQfk6X/YR9
         upjeCWC/673Iw90SdzLWzTug/BuA4RAuaae3vGyUQMlz0r5A973nzaWY2xpNKeCyEy7k
         gAxt7Mq7CJwx9GWSi4gq8Db1Bb/4a9WpHGsYLzus8HkT2joT2/J8PC+s1D2DE8GYqzKp
         mN54yYcE0ZVLEwUYI9TWyH/elcUv/6b2TCJjo/Ontenu5XA3p7J7eepJraWhT/t43rGe
         ypzMjjv/NQDYaZA4WOfKtettQZkkdD0GgF6XQt++SodrUfflCzJsEcyxw1NPWNnBPle3
         3dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695987429; x=1696592229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVXBaUdZuWKwijDr+1t4ohaYkGxEB+hc3BtA9q2v7ZI=;
        b=sMW7JuvJvYrzHkMHzaPwSOq+P/uIpmwljC1dyMA7wg5oB2t9qMuhByKb5v+UvVx4BN
         hcVTBOcADwH3o6+Ho4l7UTgmEDT8qc0AU33aihoRqLeGPCZgTP+ZU0rk7+ws2sz8gr51
         G6g5Tkt2WljLtRSsdpLIDNVp0gs2VkZCVZhnkrV/PaM0yFwAy0o/+lYM32WVVaUUJCVu
         uYQ86vE6VspMf5tslZNfUXcapfposBOXcJ3kmE2O0L709KpPPILRSAOtF8P3DXvrkaDM
         T2DoyN86otWJlPVQ4Cpiv1U5dimmttOYsYwrl3eJvHmU+omVdh+z5tV17gMEGhMXxgmi
         MlkQ==
X-Gm-Message-State: AOJu0Yys9jZv2nY0gOufrihxqC+xtOOu4w43oJx6JJ+J3uSqj7fAa4v6
        pax8bTYPVJ+3LDthUxeeMuObgw==
X-Google-Smtp-Source: AGHT+IGfn7JNgmv2XHJPju4nNbhYlyFx5eaFEgbWPI2WE/wGiViM36fknEX1kTDa9PruvCaYXOg5rQ==
X-Received: by 2002:a05:6402:50c8:b0:536:169a:4ac3 with SMTP id h8-20020a05640250c800b00536169a4ac3mr3257371edb.8.1695987428732;
        Fri, 29 Sep 2023 04:37:08 -0700 (PDT)
Received: from [192.168.33.189] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id s16-20020a05640217d000b0053420e55616sm6595226edy.75.2023.09.29.04.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 04:37:08 -0700 (PDT)
Message-ID: <0e760d7a-f855-4e45-ae6d-9ea376ed6860@linaro.org>
Date:   Fri, 29 Sep 2023 13:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: core: Set up secure memory ranges for
 SC7280
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com>
 <20230929-sc7280-venus-pas-v1-1-9c6738cf157a@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230929-sc7280-venus-pas-v1-1-9c6738cf157a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 29.09.2023 10:38, Luca Weiss wrote:
> Not all SC7280 devices ship with ChromeOS firmware. Other devices need
> PAS for image authentication. That requires the predefined virtual
> address ranges to be passed via scm calls. Define them to enable Venus
> on non-CrOS SC7280 devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
The media tree (or at least venus) moves quite slugglishly..

But looks like applying just the DT patches (which I expect to get
in first) results in a non-platform-killing:

[   25.851120] qcom-venus aa00000.video-codec: Adding to iommu group 11
[   25.851618] qcom-venus aa00000.video-codec: non legacy binding
[   25.916562] qcom-venus aa00000.video-codec: invalid setting for UC_REGION
[   25.916569] qcom-venus aa00000.video-codec: failed to reset venus core
[   25.919000] qcom-venus: probe of aa00000.video-codec failed with error -22

So it should be okay either way.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
