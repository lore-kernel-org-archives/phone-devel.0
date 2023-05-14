Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12779C77B7D
	for <phone-devel@archiver.kernel.org>; Sun, 14 May 2023 16:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbjENQnZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 14 May 2023 12:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjENQnY (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 14 May 2023 12:43:24 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C683F3C12
        for <phone-devel@vger.kernel.org>; Sun, 14 May 2023 09:43:22 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-953343581a4so1855909066b.3
        for <phone-devel@vger.kernel.org>; Sun, 14 May 2023 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684082601; x=1686674601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4spgMntPB3LCUVqHkhSqU+qO4ZV/kE2zwnApUafRYkg=;
        b=wnDSe5Eh1EA+khgHLHK6bWcwx6mk/1MFGA0p08W5Mwz1YJyRBppd2MLg73PSsDASFe
         mj8Icbp6p32t6oMzSkm3S+wKamKURvyA7/RUeq8sxOP96YthFvrZZkblByhqk/GI8Scu
         p6PVmJJNygjxVStUSFXYzkVTubqi35niAID5iFMvo049WgFwOZVmeGeqs8ZqSjqjOSWu
         I50MrK2eoA4UgUkeTW0g+53oo8bbv1FdWKCEfzUG4ww1qaj+SJomd5YynDfRQx6JfKs6
         53QnyRRpgmWV1n0iMeZ7Y69k+T9T+pNuwfq+KVrmRFi/0jXRl6U7Bho+MogixhZ33ic0
         nn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684082601; x=1686674601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4spgMntPB3LCUVqHkhSqU+qO4ZV/kE2zwnApUafRYkg=;
        b=HKsgNeKt+e7AJF+PBWtUYm3pZKXu1O+88YGpRV4SmVYKTgr1ZJhI/f5ps03AUzTBwF
         LZLYbsaPzJnxBK4rLn3grrWpGYnCL5wUNXUSOG2gXCvoMiIG77hsWMhX0K5f53t/6PKU
         ugskA2z6RsBlwq0Ei+j5xHJTmww2kvIwVkFDe3bP9gIAkik1isRs9MJ/uIu6E9b65i97
         DSLVwBaI4sWnYdldIGmDuUIHc8+icf8wfNAhWfOYmVkrKSJdFJNiZOLpaD2FIf9bxjjJ
         S76mvoBbArqhgrxI8N3K46cbWBkWyC6CeLYdRnx4G6SAhQJXIosWWLgXK5O690NU2gcb
         iV6A==
X-Gm-Message-State: AC+VfDyRRUJ3S3ClS/4OHsBC5f+HW5leSf6KVbCJ6gf7JS7YlJuftXaM
        Mp5nbzT0asrUu1hW89CX2FKQaQ==
X-Google-Smtp-Source: ACHHUZ4wKLYVNC10wfemrXflp1NJh60COumq314MHATvysNxMLWA0CUuYlbZZ5GDFvDfcBKLz94RDA==
X-Received: by 2002:a17:906:58c8:b0:966:168d:8c5 with SMTP id e8-20020a17090658c800b00966168d08c5mr26374950ejs.57.1684082601102;
        Sun, 14 May 2023 09:43:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a146:6594:d73a:8280? ([2a02:810d:15c0:828:a146:6594:d73a:8280])
        by smtp.gmail.com with ESMTPSA id fe18-20020a1709072a5200b00968242f8c37sm8341504ejc.50.2023.05.14.09.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 09:43:20 -0700 (PDT)
Message-ID: <bd03403e-9246-faad-c23f-89417e31aeda@linaro.org>
Date:   Sun, 14 May 2023 18:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 09/10] dt-bindings: power: supply: rt5033-battery: Add
 power-supplies as a property
To:     Jakob Hauser <jahau@rocketmail.com>,
        Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Beomho Seo <beomho.seo@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Raymond Hackley <raymondhackley@protonmail.com>,
        Pavel Machek <pavel@ucw.cz>, Axel Lin <axel.lin@ingics.com>,
        ChiYuan Huang <cy_huang@richtek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Henrik Grimler <henrik@grimler.se>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230514123130.41172-1-jahau@rocketmail.com>
 <20230514123130.41172-10-jahau@rocketmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230514123130.41172-10-jahau@rocketmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 14/05/2023 14:31, Jakob Hauser wrote:
> Additionally to the already available ref "power-supply.yaml", add
> "power-supplies" as a property. Otherwise, when referencing rt5033-battery in
> an example, message "'power-supplies' does not match any of the regexes:
> 'pinctrl-[0-9]+'" will be returned.
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>

Instead just change additionalProp->unevaluatedProperties: false.

Best regards,
Krzysztof

