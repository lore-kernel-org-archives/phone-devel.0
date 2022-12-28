Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B87C4332F
	for <phone-devel@archiver.kernel.org>; Wed, 28 Dec 2022 11:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbiL1LvC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 28 Dec 2022 06:51:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiL1LvB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 28 Dec 2022 06:51:01 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833F4B4B
        for <phone-devel@vger.kernel.org>; Wed, 28 Dec 2022 03:51:00 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u12so12621022ljj.11
        for <phone-devel@vger.kernel.org>; Wed, 28 Dec 2022 03:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5K3KP5mDdgN0eqJUL/TJpR4Fs9Rq1rDI3FFgGZRBmQ=;
        b=lAKNm5s4YW3N+clC20lLrn3ibALFmxk9YFvnz7UmR83v4emrhYOwJf3b2bBTsKl5vL
         dd4iHZCnHY3A3d4nRd9C0Z8JE1rPKO9lp4+2x4fTfCJBEoYeLqHczAQpcd+QFdeexKSm
         2eH+QNchNuhXPoY7jZNNhemYFbsiRRVfiquLGkKCGUfUofgAAIe3NWcDNLLSbVUi+tAR
         FUZUN0xxh7Jc7rh7Pp+QmT1ihMx+B7XYqjB5mT57M6twNZczmAIKGHgYLzxmSoGZ7gkq
         32HIySCfKWUUPblRky9mqXI/a2oHafakkcalCBIlEPzN1jsX52rDmwY7cD778N7Sz8F9
         fIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5K3KP5mDdgN0eqJUL/TJpR4Fs9Rq1rDI3FFgGZRBmQ=;
        b=iQJiJmy9wFTJANnJLTWiTSb/teto+adK3trOb/HG8q5e1/X4m/zhaUCpvx2oYsI5cs
         VqNvcQ2782Hs3Zai2vXWnXpS9W+HPb7RB5j2OIkNIOAlodv0o+IhnoIT4dBjglV6YWNP
         ARl5VvzMtmfCJCpuUIAeaohLuLHMnD35WjYeD5ZZKPKNuggKo44zqbL+WmgdfOerCteJ
         N6+kDYHYUlSDHMxg+Tc2lAAFGEfcPM6QfORKQaSy2tZUzir9TkgFfXrweZN9Bci2HZyN
         Yxgoo1RMYq/VmHwnX9srlZuomNHHOZljXayIUm6ufpCCZ1w6GySkHLXhsUXaRy9iQCG0
         t0Vg==
X-Gm-Message-State: AFqh2krnQ/r2uVURvirkZ77Hs9bAub92HyPwskqvT67eEbtaG9HtJ1vp
        6ZQWjMLP/dnEcNQdyjJSnzsW3g==
X-Google-Smtp-Source: AMrXdXu8/FWArHMsH2HpxRSK9zV6JdGrL7GdeNUK42xFXGhh8eXlwNs9E+UXd4dwGhBZUAQhrNR7Bg==
X-Received: by 2002:a2e:bf26:0:b0:27f:ada4:ce01 with SMTP id c38-20020a2ebf26000000b0027fada4ce01mr6445753ljr.6.1672228258918;
        Wed, 28 Dec 2022 03:50:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 20-20020a05651c00d400b0027a1ee0b8d4sm1918271ljr.130.2022.12.28.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 03:50:58 -0800 (PST)
Message-ID: <c4109766-22f1-7227-47bb-9273a027bb0c@linaro.org>
Date:   Wed, 28 Dec 2022 12:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: ufs: qcom: Add reg-names property for ICE
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221209-dt-binding-ufs-v1-0-8d502f0e18d5@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209-dt-binding-ufs-v1-0-8d502f0e18d5@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 09/12/2022 15:29, Luca Weiss wrote:
> The code in ufs-qcom-ice.c needs the ICE reg to be named "ice". Add this
> in the bindings so the existing dts can validate successfully.
> 
> Also sm8450 is using ICE since commit 276ee34a40c1 ("arm64: dts: qcom:
> sm8450: add Inline Crypto Engine registers and clock") so move the
> compatible to the correct if.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> (no cover subject)
> 
> The only remaining validation issues I see is the following on sc8280xp-crd.dtb
> and sa8540p-ride.dtb:
> 

Any plans on fixing the patch (after testing it) and resending?

Best regards,
Krzysztof

