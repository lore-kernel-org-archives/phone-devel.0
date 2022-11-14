Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF30C4332F
	for <phone-devel@archiver.kernel.org>; Mon, 14 Nov 2022 08:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbiKNIXQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 14 Nov 2022 03:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236310AbiKNIXP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 14 Nov 2022 03:23:15 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DA71A3B6
        for <phone-devel@vger.kernel.org>; Mon, 14 Nov 2022 00:23:14 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id r12so18076219lfp.1
        for <phone-devel@vger.kernel.org>; Mon, 14 Nov 2022 00:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzuIXzgVBbI4qXY2baaAexD3LrP49vG6Bo5QwNa8cpA=;
        b=YJMlPhqFeNe/En5JSvNaDhA15oD31ZMse9whRM9R5LPwhtsPN/ROaaQ6xqXUhrb+2I
         nmWp6UwRwQEEqEia7NDpwEbD4ooM7Z//wQOI5Ncx/7f4B3ZjU+4w+BSs0JjqjLmiHaxU
         /XJDDRYCathOvQJxVI9v70feKtVRThE/5yYbOLIXtLKNUSa+GOHpVcWxePFgEeo98chV
         mxu4HS6ep/qv/bcQZK2oSyl2dIeCzvwtAPgd9jcwO6GQHGswalz1HzLndib1oZgbAx5h
         RgzkHfIP7KqUOV5OJjAqEQxvmG32uGIDyfAgQyZ+aq41D6+nJ4Mj4fNslZ/xuELk84oL
         PlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzuIXzgVBbI4qXY2baaAexD3LrP49vG6Bo5QwNa8cpA=;
        b=v/xp3Gn9lDumRnk3OjJuTWpI/q48yUtEe5GIyj/u08S+USd08pCKxpQVAwN9NwVr50
         boJrAkNRuaWLQNlRp9Jg8xFk4OiVKLXqoFPcnuiHMOW9JJnFMMojGiw6x7RS4M1RcsAc
         weJCSEpq4Puj72slQ0tkh7skLBvKBQPglKWAV7QNOZcuDSsGRhcA83+CydKc1QYHYVMr
         u+DodODi5FncFDMZ0YWc5l98JHnlQW4KZmR56gF8o9yte0/Z85dkp1cOM3jjekO+7rmO
         n4iucBzuG+xb91qdquY4ZKUqUSIzukR0uLujVZFh1jvXZofo+xfeiAk4IzO6/WQncse6
         Z3QA==
X-Gm-Message-State: ANoB5pk3bwjm6P6OQURsFOML6l67CHi7dbbBhvUlcV2K3dXXxkg4xMP3
        zl3Wh/ghqjd6oldWIIJgtjKgNg==
X-Google-Smtp-Source: AA0mqf7OUWm5Rtc5riD3KjJncb+wbHHVjUlqyYJCIr+E9i9SC0nA2fTXhPR4SKM4Ub72vdqTFuJ6OQ==
X-Received: by 2002:a05:6512:3f19:b0:4ac:3f87:151f with SMTP id y25-20020a0565123f1900b004ac3f87151fmr4039536lfa.398.1668414192605;
        Mon, 14 Nov 2022 00:23:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d9-20020a056512368900b004b373f61a60sm1741674lfs.96.2022.11.14.00.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 00:23:12 -0800 (PST)
Message-ID: <c0dca253-77a0-2a0a-8a03-2a727512eedb@linaro.org>
Date:   Mon, 14 Nov 2022 09:23:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/7] dt-bindings: iommu: qcom,iommu: Document qcom,ctx-num
 property
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        marijn.suijten@somainline.org, kernel@collabora.com,
        luca@z3ntu.xyz, a39.skl@gmail.com, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221111135525.204134-1-angelogioacchino.delregno@collabora.com>
 <20221111135525.204134-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111135525.204134-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/11/2022 14:55, AngeloGioacchino Del Regno wrote:
> Add a new "qcom,ctx-num" property to force an ASID number on IOMMU
> contexts where required.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 1 +

This is already a v2:
https://lore.kernel.org/all/20220527212901.29268-1-konrad.dybcio@somainline.org/

and your v2 was a v3...

Best regards,
Krzysztof

