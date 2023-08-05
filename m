Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1066FC04E69
	for <phone-devel@archiver.kernel.org>; Sat,  5 Aug 2023 20:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjHEUxC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 5 Aug 2023 16:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjHEUxA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sat, 5 Aug 2023 16:53:00 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75DE2D4E
        for <phone-devel@vger.kernel.org>; Sat,  5 Aug 2023 13:52:54 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so28893485e9.0
        for <phone-devel@vger.kernel.org>; Sat, 05 Aug 2023 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691268773; x=1691873573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4uZjubyBmUVVEt3PUoxQJFxZWi+4QvNzWctTLRO5ao=;
        b=WL7oEn0O0nOTtFkhAhBzY0aPVBFffwA19BFKdsx7I1DewAg34m2T+Hh95HlEqMdBFv
         sa7LISpkJsgpLiHoiBhDA4p5+SbaQlWaH7sRncfp1bkXIgGRQH0iDQJMhQKqEfHMNpzC
         sLcV5yiuwadorVAxjd7rCH5LLwhO20Q8byp0ANRJns7YSQ9CSvMfTtxTAUel5xKzt3IX
         biI6NdX3tR9NTwQjHXrRV/6vx6artkga+Mbos+c4meQRKIHjxL2zH3LnG33pYa6ZpxRo
         VesO3oGb5tTqLsUhv2fFCYabj41IuOoLPW1jl5LGb90Lp8g3R4jjedO9BMX+Xf+NrAok
         xniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691268773; x=1691873573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4uZjubyBmUVVEt3PUoxQJFxZWi+4QvNzWctTLRO5ao=;
        b=B2yjY9tRGVQCd1/nVILiUHQ++BPAKHqgcn4bvVhYFCPxxiqeh5s6fridtFxG1JX9NU
         9oavDW7FIIRCDQ/3WONpFinx2+Va50R9rPPiHInzSWSCcZYYfZnylTrWjOUaU+OehkGv
         vO52FeddSoPDpD88JhimL5GyADxsdAsGINICGHP7UHB58aT3BZbZSmGTkNYavHUW31l6
         BNgaJKzvlluVlwo3wuxZxR0YUl0YIAC5HBPIieRLFAxiicrrfBLqAQEc7YiydRhMPsgt
         30zspAVC1bDJa5xhqwNGkhlHqym4rGgTNaI3jj9Wd4FImbW2zQAiD5GA6P9Zmt9Fugbl
         fKEg==
X-Gm-Message-State: AOJu0YwwuNt2Sj0qrCFHO2y5vN6roayr1yeGuQpdIynBxJK7BWI8uafr
        auYoF+vkMjJWeSRUh/vBiV1bFg==
X-Google-Smtp-Source: AGHT+IHW4BPSBjV99OmrpHfUw1HgZrgGWtEtYc7eGhiVa2EkbPc+SDIb+/BdcX/n6S5Y4gKy9tR++A==
X-Received: by 2002:a05:600c:22cf:b0:3fe:201a:4b7b with SMTP id 15-20020a05600c22cf00b003fe201a4b7bmr3754893wmg.27.1691268773391;
        Sat, 05 Aug 2023 13:52:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id h6-20020adff4c6000000b003176eab8868sm5944676wrp.82.2023.08.05.13.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:52:52 -0700 (PDT)
Message-ID: <c5330567-4fa5-c7b6-6927-d53ef9628a8c@linaro.org>
Date:   Sat, 5 Aug 2023 22:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 5/8] dt-bindings: marvell: Document PXA1908 SoC
Content-Language: en-US
To:     =?UTF-8?Q?Duje_Mihanovi=c4=87?= <duje.mihanovic@skole.hr>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.de
References: <20230804-pxa1908-lkml-v3-0-8e48fca37099@skole.hr>
 <20230804-pxa1908-lkml-v3-5-8e48fca37099@skole.hr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230804-pxa1908-lkml-v3-5-8e48fca37099@skole.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 04/08/2023 15:32, Duje Mihanović wrote:
> Add dt binding for the Marvell PXA1908 SoC.
> 
> Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

