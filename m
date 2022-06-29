Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE876C43334
	for <phone-devel@archiver.kernel.org>; Wed, 29 Jun 2022 10:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbiF2Kto (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 29 Jun 2022 06:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbiF2Ktn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 29 Jun 2022 06:49:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5CD1EAD4
        for <phone-devel@vger.kernel.org>; Wed, 29 Jun 2022 03:49:42 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id cf14so21600944edb.8
        for <phone-devel@vger.kernel.org>; Wed, 29 Jun 2022 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=;
        b=yNq8IvCL5Dg51Uk7RRycS5nTQ1ufinsu06YZxbJrtwMe2AdvrQ8y2tWiPzSnzQDxJt
         g6JYm2ol8XeEKknqc5daQfBgei7nO5Rzo+vxg07UEgvs3x6ZAv/6N/Kc2ez2Ut9ah4yX
         25qAwKWwtCYvUkkhMVtHu1U3apXjGaBVplRwyx49+bv0uh8zhQRjKwsVlDpcJnAIuiIi
         P7nX40urc34Noz/c7SArlRjxDpAnsbiJA4gJBJ2bF0BmsojoVIghTJjTtWmIBIvFOx2Y
         3OUgAeAQaYSi9d3tkhF0AN6+nteGOdUB3hGv1LeMIx/XZJty7ZDLCcZQCBsco7/5eX8Q
         Cylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QCnND+Ihr0E4grOsKhhsVTMtV8dOmEKSL8p2O7AW2mo=;
        b=JZdezXaJWHR8Wne78M2Xl9qUP6on7xCxHqU4sDj7JHYblbBaWrQHPerPk4QiLpa8wD
         h1JOpEl2y9Y9XqtNeEMLedDdXedd3lJ+O/FSUqcjPbHsoOOAd21rUO0RRSXiv5Drjjf/
         eZGi2epHfi4Arf+tQEfY0U6Tx1PVB+ji2Zg1asQVt91LhiTDQArVyShVcomP2VERv7xV
         cinX87iYdgHvJQKrlQB6TuNrOgSmxVZjCs1bhlvKCoLRpox+LUFbGBD7ZA4mNDw2Ld5G
         Kk8t3KQIEAxZ/nMXqnhFMgJdBFQ//sSC8zMP6IQAoNuxk54fX7Qq1YnfzbJSO48iSK24
         3TIQ==
X-Gm-Message-State: AJIora9cxNPxGVFQR3b/VxgqnKBIEzYUJY6XFaMxX1CsSrZZmzblDf4x
        KFRA6om9dLijL/MQYpu7UwFXlVXk5A9tGw==
X-Google-Smtp-Source: AGRyM1vPhtigeGlEU1LfGq5MzvjkEe9jkqsKuNcP6bcK5KLfAijl6m0zJULiQcNe8NSdk7w+UspYZg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr3460224edb.142.1656499780597;
        Wed, 29 Jun 2022 03:49:40 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906455000b00722bc0aa9e3sm1300091ejq.162.2022.06.29.03.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 03:49:40 -0700 (PDT)
Message-ID: <75bc2de0-1965-ed64-7313-ccf9a88a64c2@linaro.org>
Date:   Wed, 29 Jun 2022 12:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, robh+dt@kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        y.oudjana@protonmail.com, jason-jh.lin@mediatek.com,
        ck.hu@mediatek.com, fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, chun-jie.chen@mediatek.com,
        weiyi.lu@mediatek.com, ikjn@chromium.org, miles.chen@mediatek.com,
        sam.shih@mediatek.com, wenst@chromium.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220627085632.23797-1-angelogioacchino.delregno@collabora.com>
 <20220627085632.23797-3-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627085632.23797-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 27/06/2022 10:56, AngeloGioacchino Del Regno wrote:
> Add the bindings for MT6795's clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6795-clk.h

The same as v3 - you still need vendor prefix.

Best regards,
Krzysztof
