Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE663C43334
	for <phone-devel@archiver.kernel.org>; Wed,  8 Jun 2022 15:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244010AbiFHPQo (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Jun 2022 11:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243270AbiFHPQG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Jun 2022 11:16:06 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD834614A
        for <phone-devel@vger.kernel.org>; Wed,  8 Jun 2022 08:12:18 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id h23so31021829ejj.12
        for <phone-devel@vger.kernel.org>; Wed, 08 Jun 2022 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0wo28W6u7lVNDcrnTWpD6PtK5Yh/q56MRuIbEHfWpMA=;
        b=UqPBSC8UeBWLodpPuqbv9EGQdkhhD0u3WcQIiBuu9jP3Gx1lQO+7rw57nqILzKDmF3
         QjZJPODF7cSMorpXUweOgyyt7D1OupUkUjFD6VJ7lpLHA8CYh84fkqpBHoIIPnOwEFvt
         mj7la1t2vqFNWZHkguUZlN50rQ+VojzxiyYHuPJJH+j/a29wULqRkOnZS+JC6931tvEf
         uAIOD0+pG+F49VLtdvkm4Zs+/Z8f72cSxrDU6mjg2MrpP4NgOgxblEyzlh/oi7Flki5m
         dRmqgfQKunhlD0kynkGsuPFiBzdPkvkvqgmH2YIM8GlYPagNk81M9PiCCgVaYk/C69BL
         AbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0wo28W6u7lVNDcrnTWpD6PtK5Yh/q56MRuIbEHfWpMA=;
        b=454Rjvz0OuKrlSd/GBqcdqs19A6vK+E2npj8OY3VOvOaAQFDvjvXYj5jRDScIw5/rf
         0z7OURYmKJEddfJJTMEMZucr+sOiOTxtpxMNOfaf6k8S5fbE6rGZFbZaOj/6zDogx7Gp
         2q7OZyX0rLLOaVoDOLwCq9U9Tv42+CCE4C896Lp30UWGgegMHLrvbvlUQssJYL71JKMs
         XsItIzHYqKcN0YYh3vCCem0tzCsVOLYKIheer/W+wuFKH+nhRvRa3LuOfcEcZnPfSCzN
         Z239P8iULoUqsactdJs6WOxCF08+UQXKoF05C8RmwN3asJSPNEfS0d9TzB4Q5IUipccH
         SFqA==
X-Gm-Message-State: AOAM530aba/HlFofXciv3Q99QbT69TgR04qiGBC1UppT381u14zgvvjc
        uNvPDO/wD8gGx53LoFaaOsxRHA==
X-Google-Smtp-Source: ABdhPJztdyKIPVdguj7TN6+S7yMRjzDCE9N9DK46oHiWu07CES1P4a7OzzlUMd8F3+cU5ML4Wlsw2A==
X-Received: by 2002:a17:906:99c5:b0:6fe:b069:4ab6 with SMTP id s5-20020a17090699c500b006feb0694ab6mr31875027ejn.436.1654701136476;
        Wed, 08 Jun 2022 08:12:16 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709060dcb00b006fe9f9d0938sm9486755eji.175.2022.06.08.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 08:12:15 -0700 (PDT)
Message-ID: <6178d685-5a87-6057-1200-e41baa3ece7d@linaro.org>
Date:   Wed, 8 Jun 2022 17:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add bindings for Exynos7885
 CMU_FSYS
Content-Language: en-US
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     phone-devel@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220601233743.56317-1-virag.david003@gmail.com>
 <20220601233743.56317-2-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601233743.56317-2-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/06/2022 01:37, David Virag wrote:
> CMU_FSYS clock domain provides clocks for MMC (MMC_CARD, MMC_EMBD,
> MMC_SDIO), and USB30DRD.
> 
> Add clock indices and bindings documentation for CMU_FSYS domain.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
>  .../clock/samsung,exynos7885-clock.yaml       | 27 ++++++++++++++++
>  include/dt-bindings/clock/exynos7885.h        | 31 ++++++++++++++++++-

It seems the clock IDs from bindings are used by both driver and DTS.
Sylwester, can I take them to Samsung Soc and send you a pull request?

Best regards,
Krzysztof
