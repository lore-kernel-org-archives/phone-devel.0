Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82C0C77B77
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjDNI1Y (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjDNI1A (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:27:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF8A8691
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:26:45 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id c9so4865510ejz.1
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460799; x=1684052799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=;
        b=bt73naGw+ZXi4dc8Cmhv0FLtGUbeOgrPuV1QMF4QPK4DWhqcDIiQyq2SXqDshVY58+
         9i5EZRohDL67399mm6hHhCeQV/EJor+rJ8VeOerrE+yvaisOQ2EXVIzVKEzSqBMW6Bsj
         /QStpG4ys+runlabZaXcTBjIl7IH/NVwijX7kgLZam1r0Xs+zSdWpyc9iow1Bl3P9Zr6
         qTEXFqfz9+7uepReMSv77u28y+M74JLZY3/yfgzdzoLj7xro2lSoL8qMvur81rANjaL9
         4QuNXgOvOjBgmIoG5TjRbKELD2WjLfk+HiPP6p9vqHmpim7DFpm87T/BjxLYHqgQTBqD
         uyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460799; x=1684052799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=;
        b=L56v7jDulJxpBU0Dg8XUInt3ulKQALl36jFnX5KlIkluNwr5OodhS5JwB1LlUo/3Ok
         2f+KBp6ElC1OptD9niJLFdha5PXvDkVA/EltBALZkvccTiC8YgOCCrQI0G95tsbHDBZd
         YA2K6PMPnp/4321/yFcWdhIXFnHLvm9t+lVb91V2dyiL9jUipTzh9jZZ7iDV336QDoRi
         Ud2Jzjvc5lsgGoog09QO6pXo9x1JLM/G0uGUZ9r7YtYJSlcCsMlRiCN1+A6f2y0FD8yH
         if/a9TLY7yofejV+aMNRdrjIOyCdUupwQWaYzQj73TgqO3qYG5JEUWijmakzQvF0K4dA
         UrZg==
X-Gm-Message-State: AAQBX9cK/DcMwP/Dw4t8q76mW0fedGUvb1DpUor1fP9ESpIwA8KPP+/i
        jat4FWzZ8EtwsijXRN2ysC9xrA==
X-Google-Smtp-Source: AKy350ZHB0iX4SpIl6nSdBkIW18ThkfNLzwYurPIDtNAv4p6SmGfIue6rSdxEw2SmolXbx+cb6/kbQ==
X-Received: by 2002:a17:906:b2d4:b0:94e:d17f:eacf with SMTP id cf20-20020a170906b2d400b0094ed17feacfmr2364045ejb.23.1681460799195;
        Fri, 14 Apr 2023 01:26:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709064a4a00b0094a4e970508sm2117803ejv.57.2023.04.14.01.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:26:38 -0700 (PDT)
Message-ID: <d5580870-a440-a3b7-1c67-26db193a7f8f@linaro.org>
Date:   Fri, 14 Apr 2023 10:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/27] dt-bindings: display: mediatek: color: Add
 compatible for MediaTek MT6795
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com,
        vkoul@kernel.org, kishon@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org,
        ck.hu@mediatek.com, jitao.shi@mediatek.com,
        xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
        dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
        kernel@collabora.com, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's COLOR block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

