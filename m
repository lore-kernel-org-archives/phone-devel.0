Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C99CC43334
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jul 2022 15:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbiGLPM5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbiGLPMa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jul 2022 11:12:30 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7E1C1FE9
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 08:05:42 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r9so10198725ljp.9
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N95UeN2GEUoq/Y9MZnralNNF96wmUdf5PfFX4kSTL0Y=;
        b=n07ma88Ez+/f2BhSUkw0P0jQFXye2PKrmW17Nqm/1jOPuvJWVZQh478f+yWd+DMO+P
         IGEisyduu+SwOEbyhPlTVUdtNuyQFI8cn+ZfE92XXl3R269ZJ8pjf1uZsPqIRYIHh6oK
         2Ec6K9gADqWCoqnMzZG4tMxcJddPD1figJjC6FLNwJdaMTpZC2E4JzX4rCNdUYxMyvHa
         t1FY02WTUXXWws0Z1RBcgBq5tNpeY+5b8QZ4DNRPYqLeB4MsbreplX0yRn4ps92rvLvd
         /9LU1cNlgvhIPRRLMK9PZHGwpkJ8/e4/IEI6A49tyE9zltvfFngqUkz+n+sUcm2B9cC6
         Hhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N95UeN2GEUoq/Y9MZnralNNF96wmUdf5PfFX4kSTL0Y=;
        b=1n/HuNix5pYfApfcNKCoFGSf6FAjXXCqD3RVnKcPdQa426MefOLeMVmWHLo0UENhq4
         7nr1IR4HPrcYhSRsJ/MwO+qOHpyNKO53jShAEeb5YmMm5tobBLlgJHOQwXmZXh+AKufA
         s7Zo8Sj3+NP9kpD4pQ8mBzALU9bJNwZOnZOsHIvq0FFvykWgyHBRAgfS5HOYU0QDvviY
         O2qNTEc1SWOJuFFzQuJRkclhXelDdQcOwzbHL932g5Rg02C7mO6wbdPrXAGafL93aFIc
         6P7vVCk0MDT2tOjWXubIw0b13bpvXnBXpQavN9Yhj5n2wXTSudpPRqAYxMy8k3Rtv6ON
         vlyg==
X-Gm-Message-State: AJIora8d9lSfmLQI2/7hLgfIOWKHopcvunewhFb5ru/JKO/robrKKAEZ
        wXRV1BBtQtwJxiqSGQNH8FDQsg==
X-Google-Smtp-Source: AGRyM1sBWDmHbBkd9dAeP+xC8COTAEUF3I38MJWleTJir5VKZ2V4ivGoLVPmWVu6FOs5PSxB0VKuHA==
X-Received: by 2002:a2e:2a41:0:b0:25d:832d:2af9 with SMTP id q62-20020a2e2a41000000b0025d832d2af9mr543465ljq.429.1657638340964;
        Tue, 12 Jul 2022 08:05:40 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f21-20020a2eb5b5000000b0025d4b0707c5sm2495651ljn.125.2022.07.12.08.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 08:05:40 -0700 (PDT)
Message-ID: <ed28a4f5-a6f4-1f87-007a-ef7fe6c1670a@linaro.org>
Date:   Tue, 12 Jul 2022 17:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add support for Xiaomi Mi Mix2s
Content-Language: en-US
To:     Molly Sophia <mollysophia379@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220712145139.9473-1-mollysophia379@gmail.com>
 <20220712145139.9473-2-mollysophia379@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712145139.9473-2-mollysophia379@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/07/2022 16:51, Molly Sophia wrote:
> Add support for Xiaomi Mi Mix2s (polaris) handsets.
> 
> Currently working features:
> - UFS
> - Touchscreen
> - USB 2
> - Bluetooth
> - Wi-Fi
> - GPU
> - Venus
> - Display (need jdi-fhd-nt35596s panel driver, which I have sent a
>   patch but it haven't been into upstream yet)

I have no clue what changed here and to what I should look.

Best regards,
Krzysztof
