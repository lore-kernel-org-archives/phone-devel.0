Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8171C05027
	for <phone-devel@archiver.kernel.org>; Sun, 29 Jan 2023 10:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjA2Kl5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:41:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjA2Kl4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 29 Jan 2023 05:41:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B272321961
        for <phone-devel@vger.kernel.org>; Sun, 29 Jan 2023 02:41:54 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso3483742wms.4
        for <phone-devel@vger.kernel.org>; Sun, 29 Jan 2023 02:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABOPXo+vgZx0ugSosEN45asIKHRXs9VuvlJa6SU0Dis=;
        b=dkO0qH/zaSjAzdEj90pcW5ViVKz8qJeWHtIZnJQaQIO/BGjOf0rFOB+KQB9Ch8a96x
         C2/0l5o/wLooOB3YO6PsLEruoh8JvqpbzjopQcd2qApH3A4+HbIFw84g3syJ3Lq8Gm40
         W3xLcoPlOX7r3cfHVFNy5vX2Ssqs286OKOYWY3A7SkVRf9GLG08bGDoWa5IdQWFe3l+M
         RmPYCZwa0P84kxGY6XXV6rmmbxyruaBx98YcQKt1XwqNyp+kKyNQBBoFIuOmtW0NIFxv
         lw4GPQb07TAHEjF3Dk5dt/GtYE60xl6/q2ZTxQ/f1243Pasae6MSurhRR1w32f6xp+0q
         v6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABOPXo+vgZx0ugSosEN45asIKHRXs9VuvlJa6SU0Dis=;
        b=BWmCsOcUgm/j+8AV7CVKfa1SnLeBsGthAZ7CCkRUhHDZroLV2D589PP+W4cbQDF9q9
         ONtBqkiwRtyjQQ8ilQ3hYJNEC9OJRorLQXmYfC0jEIfG7ZD8f1XvKF8ZDD2Q2Gn1laXU
         rvvOQfuLLJmQp2t4HLwUrKwFh7UjNhJPBshZjVfeDdRrd6sxVMNirhr0QG/iRdY8Bsrj
         xRwAcEMFNopYL1DNpZw9bsJTJgHpzHhEjzhDc9g+Oi2nvlctHpZTmF1HNqZW6mTvJsXA
         pTodR8Uqb7/t4rxasDkIAIpcqSl3RDwt79Nhl5oJ4IyrqqmhBdAkVXgS4rNq6zOnAh/B
         jWSg==
X-Gm-Message-State: AO0yUKVxhvs9GtOsdCeYzbI375YSy4I6h0Oq5CA1RMQunYbJtNTbf9dM
        qDhFuGZsTI8DDiJxuEcB4UtGZQ==
X-Google-Smtp-Source: AK7set+k1n8Li7xTXQDAlFACNKneV85+M14FiXGZez6mvrj5+SAuqVREzJnWNHLw9K01lR39uBk6qQ==
X-Received: by 2002:a05:600c:1e85:b0:3dc:557f:6126 with SMTP id be5-20020a05600c1e8500b003dc557f6126mr1165942wmb.4.1674988913135;
        Sun, 29 Jan 2023 02:41:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm14873836wml.9.2023.01.29.02.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 02:41:52 -0800 (PST)
Message-ID: <341373ac-b493-d44a-727d-aca3ff4421e4@linaro.org>
Date:   Sun, 29 Jan 2023 11:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/9] ARM: dts: exynos: move exynos-bus nodes out of soc in
 Exynos5420
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
 <20230125094513.155063-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125094513.155063-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 25/01/2023 10:45, Krzysztof Kozlowski wrote:
> The soc node is supposed to have only device nodes with MMIO addresses,
> as reported by dtc W=1:
> 
>   arch/arm/boot/dts/exynos5420.dtsi:1070.24-1075.5:
>     Warning (simple_bus_reg): /soc/bus-wcore: missing or empty reg/ranges property
> 
> and dtbs_check:
> 
>   exynos5420-arndale-octa.dtb: soc: bus-wcore:
>     {'compatible': ['samsung,exynos-bus'], 'clocks': [[2, 769]], 'clock-names': ['bus'], 'status': ['disabled']} should not be valid under {'type': 'object'}
> 
> Move the bus nodes and their OPP tables out of SoC to fix this.
> Re-order them alphabetically while moving and put some of the OPP tables
> in device nodes (if they are not shared).

Applied.

Best regards,
Krzysztof

