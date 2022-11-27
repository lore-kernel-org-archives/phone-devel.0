Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589C5C47088
	for <phone-devel@archiver.kernel.org>; Sun, 27 Nov 2022 21:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiK0VaU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 27 Nov 2022 16:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiK0VaT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 27 Nov 2022 16:30:19 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EA9DF1F
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 13:30:18 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id d3so11148615ljl.1
        for <phone-devel@vger.kernel.org>; Sun, 27 Nov 2022 13:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0n4CTe4WBaaSWhkZDVFkSXyJGGMu9q39kAifmZ2ndLs=;
        b=oJo4UvcNKjMiYJs92Cqcs3TNjzbQ9oWY96Jm3o1a2r0LecO2IAbqQ3vEKiDN1ShiZ5
         mYUdioXJuOEqVNmU3fVQiBHuQnV4iwWaI8QSl9mYd6Kc3fMpO9uKUN2U1kEmkE86BKUm
         i1V/VyAluyz9jWUrz2yKiEmtYQl3ObFEo0joriLZ4WCpWBAEY/Oc2FhecGvN1Ez89GmF
         buwMSYKl3MIUpb2d6ur61pQAWakOTlThmMst/Jw7GkzmgEglcFy2S2sWR+SR3SHdhTZD
         SIeGwBNpatYabdO/WclRbbGHrfMdVGOHTmr9TyPuazEMNYBLW5XXHfcf2d4smekxZBO8
         SzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0n4CTe4WBaaSWhkZDVFkSXyJGGMu9q39kAifmZ2ndLs=;
        b=ERZqoE529Q+i06U486fRjmfkHPhiHhFcvD8ZtzjAVgG846lNIyDx8qnaZ577TKFItI
         Ui7jS+t8CkclIMOBVIiw8E6uta3A6fwKcJ5qZZkZs8/I65JWAQ5aBmS3rSyDZrf2CWws
         4RmEBmgc8Fa5+vtK5fpDzvBaHdnscVAvb5FNev7kK8joXdHeV18SUbBJbIeGc97NJeL7
         nG/nFOzxK73SabKXwEapf1lcxZWusm4+Pc173lJ/IgJCY8RgXT2x5YGoYE2ISHpABSMe
         YDVd9zeUMybcqdyvrPC1NK88Wp2rOXyoZF1dgFlr/53sLBq6SR5brP4gzxWnrldtpIea
         Gr2Q==
X-Gm-Message-State: ANoB5pkU2XgWk1P54UOANxkYCaJqM7Aw2C1ZW3JjfEp9gIgQTT8soS+G
        Rsg1YS3rlzSX9h6xeA2A3p33iQ==
X-Google-Smtp-Source: AA0mqf4r2WZxTuCuGnSThCQfKi6ipfJsSqYG0WK2G9b921OL1SXuMkGGGeTd2YIt0j7LOSPY3UfFDw==
X-Received: by 2002:a2e:bc12:0:b0:279:f7d:15d6 with SMTP id b18-20020a2ebc12000000b002790f7d15d6mr10175281ljf.402.1669584616439;
        Sun, 27 Nov 2022 13:30:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a2-20020ac25202000000b004acff58a951sm889582lfl.133.2022.11.27.13.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:30:16 -0800 (PST)
Message-ID: <f0a15b01-81b6-5c73-6c35-ce3a8c71b4ad@linaro.org>
Date:   Sun, 27 Nov 2022 22:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221127181835.806410-1-luca@z3ntu.xyz>
 <CAA8EJpoe09FZcfVXuknmFWO5qg-iYDOBVN3=qr=DeJjvHw56Mw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoe09FZcfVXuknmFWO5qg-iYDOBVN3=qr=DeJjvHw56Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/11/2022 22:25, Dmitry Baryshkov wrote:
> On Sun, 27 Nov 2022 at 20:19, Luca Weiss <luca@z3ntu.xyz> wrote:
>>
>> Document the OnePlus One ("bacon") which is a smartphone based on the
>> Snapdragon 801 SoC.
>>
>> Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.
> 
> The patch itself is good. However it raised a broader question for me.
> Up to now all msm8974pro devices use qcom,msm8974 as a top-level
> compatibility string. Should it be changed to use pro-specific one
> (e.g. qcom,msm8974pro)?

Yes, makes sense.

Best regards,
Krzysztof

