Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7504C43334
	for <phone-devel@archiver.kernel.org>; Tue, 12 Jul 2022 15:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233938AbiGLPM3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 12 Jul 2022 11:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbiGLPL5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 12 Jul 2022 11:11:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7319AC1769
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 08:05:15 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o7so14402983lfq.9
        for <phone-devel@vger.kernel.org>; Tue, 12 Jul 2022 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eGwG/GucKtL6olAe03PTpskcUrGGme5wFAKul1wFsWI=;
        b=SWzYJNZira/kSD2dZalBhulw3VV5xRFfjlB/RSI9dDu0fA13/oSzL41eqGYa++1jAk
         C06lMwaI2L9osPXfNuGuROkRveJ7i4uqIm2ofiHdmd4k9up20IXhoiRFUzeSCOj7TKbg
         kUVGwkNbv1aGNXMK3g6n2m4CmkO1H/yq7EzsiFDYGYu70xZN/IACio7ft+hPA2AT2bQv
         XaHFaL73BXmyvS9bdftVdKmxmKZa9zNOWIGx4uidlJuxRhVI3bpMYyQW3mjD5j9jOF+v
         BaqxEtffVvZqbhvDeyxtcekMKqc9Y3txJQOutKV1BHWlvoCBxlJ/4c0pKd+ZV+S99Hzj
         NuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eGwG/GucKtL6olAe03PTpskcUrGGme5wFAKul1wFsWI=;
        b=sIGK/vAPdhzJjQ6AwNsgRqOWmB1Fkn/rMO/96D22KEJOOBfxDSGNpOq/7sIb4iY8y8
         MTDWolLk0ZUqI4LODb4BETY0TBH+Tvid4Ij1cgNM+IGpw0uvGvo/I6sOzZZKXZgTMInv
         +crzHSGsslgxtesWjb+CL5hoEgwyrX2RRGUNaMyIIYfaWmFJYgk3qt9tAGfpeG0ORh2Z
         z8ywFnOmu5qDjMWe7xCqgK7sFyTNj2G/G3FOqm+nR/82Juhb7xLHFRy/GfaS/eZHAxpc
         kZOyIZ6MlSJ1aHNhJ38pTW4eOIrSIz01mIEO1fjoO9lpN9faDiQHY5mKe9kjjAF2O3XR
         BfKA==
X-Gm-Message-State: AJIora/cM9c8hDtULXojnnKUP3fKKqdkpZuaARUwc+kpt9Ah4V3BTNAW
        0EqzZd4Tp4k6xZPgJOva2ansQQ==
X-Google-Smtp-Source: AGRyM1tnRiDGALVOqovwNutFSwMDBSaQrzCN7zruoaePsdNhRGTqPVNBMmA7XnUbngXN4XD4/gZ6uw==
X-Received: by 2002:a05:6512:224a:b0:489:db85:53c6 with SMTP id i10-20020a056512224a00b00489db8553c6mr7580747lfu.383.1657638310861;
        Tue, 12 Jul 2022 08:05:10 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id g20-20020a19e054000000b0047fab4c3651sm2240528lfj.85.2022.07.12.08.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 08:05:10 -0700 (PDT)
Message-ID: <3a0d3e52-a403-36c5-fc39-f45dce94c1f8@linaro.org>
Date:   Tue, 12 Jul 2022 17:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Mix2s
 bindings
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712145139.9473-1-mollysophia379@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/07/2022 16:51, Molly Sophia wrote:
> Add documentation for "xiaomi,polaris" device.
> 
> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>

This is v6 and still not changelog. No cover letter either, which would
 describe any dependencies.

Sorry, you need to follow our process:
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst


Best regards,
Krzysztof
