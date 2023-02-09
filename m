Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBB4C61DA4
	for <phone-devel@archiver.kernel.org>; Thu,  9 Feb 2023 11:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjBILLI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Feb 2023 06:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBILK4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Feb 2023 06:10:56 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE0935268
        for <phone-devel@vger.kernel.org>; Thu,  9 Feb 2023 03:10:52 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id by3so70390wrb.10
        for <phone-devel@vger.kernel.org>; Thu, 09 Feb 2023 03:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V89hB8P9aljMFaI4JVhG1UB7ptSBWBngnxQJmHuqEqU=;
        b=eL7Pu7g5g0LHCZLE/2uwHQbquviWqM+ui1NcQVYBmzALmBW2z+8w+HHfzi7ezO8PjH
         vG+xlrc8jAcgoLbxRLMLmXL4PKp/N64nj2u+BMllyaqSoxj3iSO+BZUnTkJEliT+yPgq
         9YIX0IaEIP+Bf8xcMetAcnJs10ka/AaDWf5Ku56uFmDjeltfdQ5EDeoPkAS3ujQmFpKC
         3RPwT3CAwR0GpQwxLe2OE9D0dXzIsM76RP4cahnqjS5+Q2fOXK2tjZqiTNAF825Grn4R
         gxwuTS0lAvs9Sk8V3pyIGPQNPPh1KAWKUCPJ2T/KomCWqS7haIOwwZGLrpiZDHcjFTQU
         WvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V89hB8P9aljMFaI4JVhG1UB7ptSBWBngnxQJmHuqEqU=;
        b=VHyI2gsev3xhcY8nUQnyR0RItvSrkbrxQMYMoHV2BOOXyi32Dp89qV1TcPW6VFQ9nU
         m0GbFUmXAanGRyPk6AREPgw8DJbm6Ag190Ymlj0KqAoQBkGC7qjpzbmhU4QNTb3yyL5T
         /1PyZxjLHrJbOEuNPAoSrlFAC0ba9Dmh/y6jqnlQ+oMANoJl4cItEjJciFy8M6QxzHwp
         Gvvx1E+LlhfxhUfT1AY4vPPH1ANjPxJJdqUffQZQZiVw4FRTMBwmquIhe75tA6OuFDR8
         DMD+J84F2JGGzl9xT/D8/m6IQi+LRvcs6H24OBs6kc4cCjTWr5fzNhWjhf5P+Fd3YFZ7
         Bs1w==
X-Gm-Message-State: AO0yUKX/F+VycJMrY8JYFNDWdcrp2brAmZNgCDTnS2UBv7qfyEGUrXcR
        TveItPqt6LW2a1awITnis+RO7A==
X-Google-Smtp-Source: AK7set9DRa8qVIxG0cZVTMfZRttELsRCFtgifHQea5sUv2Utsl7IJv8U5sa+TDnFwWB0SvKYeWZCbA==
X-Received: by 2002:adf:f34d:0:b0:2c5:3fcb:6823 with SMTP id e13-20020adff34d000000b002c53fcb6823mr226977wrp.25.1675941051537;
        Thu, 09 Feb 2023 03:10:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm963207wrr.69.2023.02.09.03.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:10:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henrik Grimler <henrik@grimler.se>,
        ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
        phone-devel@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: Re: [RFT PATCH 1/3] ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Midas
Date:   Thu,  9 Feb 2023 12:10:42 +0100
Message-Id: <167594102111.781687.5239598797684494010.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
References: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 8 Feb 2023 18:26:32 +0100, Krzysztof Kozlowski wrote:
> The GPIOs properties should end with "gpios" suffix and Linux gpiolib
> already handles both names, so switch to preferred one.
> 
> While touching the lines, replace open-coded GPIO_ACTIVE_HIGH flag.
> 
> 

Applied, thanks!

[1/3] ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Midas
      https://git.kernel.org/krzk/linux/c/0e06b987d1b7469ff1b4f7a68466859f94e7221a
[2/3] ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Arndale
      https://git.kernel.org/krzk/linux/c/149a903eceb73b8b8af25e12b552c68aa9991802
[3/3] ARM: dts: s5pv210: add "gpios" suffix to wlf,ldo1ena on Aries
      https://git.kernel.org/krzk/linux/c/a81cc43abd23f2769b044b79f4cf58a9ff6e2201

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
