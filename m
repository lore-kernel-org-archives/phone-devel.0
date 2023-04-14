Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B51C77B70
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbjDNI2O (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbjDNI1t (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:27:49 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DB6AD12
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:27:14 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id rp27so6722121ejb.12
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460832; x=1684052832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=;
        b=TXtg+5vSMswTh++PcVMw4FZVIJqiJXwtBF4esfUNcovAdf/NpcKSjcUBpatbisjxWJ
         1m3+T5xQIJMtC6itqvIY24p8+E3w3ulSHduTDMIz6GS7nU6oZ44ajbOjyIS8bdz7mJpy
         qxNUKmIeFOHGKpcVhauyQ/Ct94cEDQNwloMkJQzoPNWXy8VK7wgirOKomhYBd05xfbsm
         6nFmgoLKnZN10M2aIP00kyw3jXrKfO5vThqEULTFKVKu367PJgNidsKBUcg0i9HVQsUm
         VlrXmuInv8FGw66mhBXkZPMxcFgx1eqLzoDO+PsZE4esAJ1vYNVK6veTbl+F6t7oVHkl
         k20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460832; x=1684052832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfV+vHgOiOTb/T8PGJETWUjU9ShSgfKqGb/lRZ9bS+Q=;
        b=Wb2jVQCxOxHY7TEj0OVatvuwDPhbFFFDgyx/W1ODIZZLj5+THU4lzXonZeLur/IVPE
         j4AKE8TDiDLqgtZ2rA+BIhMFIfkhllsjY783TLoSzibNxZR8aOtvKlA3Usa8pEKWMhR4
         mwee/hPfWGJtgH7Ft20hapQ66q0Bi5sCy1Fp2h+rRNqx82E1fGpqCPAWFjyWfYotgi2e
         g5+kVmJATrDxxlU6b1gFPAdNOdDDaSe4tpL6aFxLNN6GKOMTYJ33F2Tn9D+WZgLEH24y
         xnP9z/HBC/QJjLtfbA/zAVMx3YANWj07O3S5a4eN+yDIyeqhCO4p53mhR6qQVW7XJzcY
         xaEg==
X-Gm-Message-State: AAQBX9dQQOcnx6fgXMZDk4oDhktbsJHNlDzxygXW6RsBsvYQXMaApNTv
        imm2pSLVgzuDw1FzNPFD4VQAdg==
X-Google-Smtp-Source: AKy350bROMqGwlhCVGwl5H8OJ+bgHbDFNGXpnOwYOw4FLgadYWAX0xpuhZWD9cFLA3D4vEUtaQZhkg==
X-Received: by 2002:a17:907:10ca:b0:94a:5a9e:9da0 with SMTP id rv10-20020a17090710ca00b0094a5a9e9da0mr5236919ejb.77.1681460832272;
        Fri, 14 Apr 2023 01:27:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id ss23-20020a170907c01700b0094a611b21a8sm2072758ejc.223.2023.04.14.01.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:27:11 -0700 (PDT)
Message-ID: <ca69a9a0-5abb-e3b8-dbd7-0389da955bd1@linaro.org>
Date:   Fri, 14 Apr 2023 10:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 10/27] dt-bindings: display: mediatek: gamma: Add
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
 <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's GAMMA block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

