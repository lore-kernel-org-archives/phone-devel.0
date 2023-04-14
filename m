Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1F9C77B71
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjDNIeL (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjDNIeK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:34:10 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAC66A6F
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:34:08 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id q23so34280672ejz.3
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461246; x=1684053246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YETSwyP9KyJmIykjMyk1TM49CieBNMVHrTzyPxKcTSk=;
        b=FkQzqgIFOAMsY5C49r1vVB/ZlzTMvC6eoeJBVcpcCRatuAaj6EIDAzi3hygq5+Ij1g
         JBGhZBFMX7pINFHlQiMdv7hC22MjElW2vDWKKVX/MSzTmcHGS5Gow/BGmXAiYyXVt3Rc
         TwHLdDfG5VUJBs7kKpL0yZtdBIOgMc27tvQabifkeXgBXMFPRAaCDM7iXEOBED/IWt/y
         NmIFWcjRsMtBhqMZwvLbe3ORStBZA417ZS8RGIc3ZE0/2GEdnH753mli+ov6NbQ1UAV0
         2miw7dNFMmbmugoxca3FDGb1jnUPzAQcjAd4BRyShkqiZf8yTad3RCKAOBWa8ejhn2ha
         LbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461246; x=1684053246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YETSwyP9KyJmIykjMyk1TM49CieBNMVHrTzyPxKcTSk=;
        b=CHDzPPPzZVulr31m5Mitt0d3A6peNQ4p962fMM1wk7l51kVBemfB1BMTXEI78t1c4P
         oCII5LF1oriNT2SStkZEx+P+T6imvADk+CWVjyrYTOdTuLDhlKrjAtlAaQVm+rf0sjxR
         +6A5XYJjvKnb7wCJ7JvmDI2riRypLVnHSxDw2Drl9iIdyEhHxRUqxmujqK58/Nt1vLba
         CfIs16bmbYU4xznF/emSrOZqQSsvflZ+xwvuurQGQ9CRqGbWjdzydcfeD7WWFCBFTV3R
         db2P9vJ+tiq31yOggqXQOw1zghUTvIXH1YCqLAy3TpD/ua5j5ng94vWZ0KVfdMRV7XJW
         Bagw==
X-Gm-Message-State: AAQBX9fzC80IDMeYM48oM5bX+PVISCxBQaotX35oYH0FxMxpk81YNeEN
        qiS3ndfz9XTe5TyIBimx5zxuow==
X-Google-Smtp-Source: AKy350Z7uaDB4GQxOP+F7tcD8R2KCxU2CUl3f5Uqi9jTZYCUHl43i3I1xzx6+MrjdoI2Do1jwFgUmg==
X-Received: by 2002:a17:907:1b1b:b0:94a:68a9:b399 with SMTP id mp27-20020a1709071b1b00b0094a68a9b399mr6056042ejc.53.1681461246577;
        Fri, 14 Apr 2023 01:34:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id jt6-20020a170906dfc600b0094e6c45b117sm2106215ejc.168.2023.04.14.01.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:34:06 -0700 (PDT)
Message-ID: <8349f5c1-36fe-802b-2a36-acb9c6eb6d8e@linaro.org>
Date:   Fri, 14 Apr 2023 10:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 12/27] dt-bindings: display: mediatek: split: Add
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
 <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's SPLIT block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

