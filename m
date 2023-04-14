Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BDCC77B73
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:25:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjDNIZd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjDNIZU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:25:20 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0E69027
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:24:58 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dm2so43832478ejc.8
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460695; x=1684052695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=;
        b=iXaoED0tEhQSyqai1EUHpNUUpddB1+3po1KoelJvQpfZqBH4H6WVcBblHREMFFlW5Q
         8Kq1hy2OAtnQfaxolldPzxw6ICb6zFRRhzaPml3lz8Hy+oeQfebpYJH6tAG9Wy344SR/
         u5rm6jiEjAmPA/VfiSMyvGOJJqd02KePv4/h2VpXjdmytS96sbfQirFHcQ88xrLG3JhM
         Ke3b5bnSHYuSx66e2NJRZXo/ltKWw3tpZ27pfDoQ6rrnygFeVi1+5BvD0QTpPzZsCedU
         6rHEsdlUWSHeJWKESndXy+cnXro09stKuckPHDpDO//EeGxxya1i37IAVarJ9zDmIBEw
         xAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460695; x=1684052695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrBCPg/7kEQmQ/S2HJSPkvrLLN8UQjkoca9tiMHDaUE=;
        b=I/g9ZQSeOFjBeupwIt3+/fz5WzLqvz+M9GNsaP0ps+Rd6OdEBxe2/drRonTX8dAjil
         DcynokVCJuYZJ/aAAdixGlOZANfYKcaE90T+F87JFoNveR1ykNQeqYQEwG/7JtNn9Tvn
         D0X64NMekYHuPScyEF6IbX3d141iX7d0UXKcVRy0/kgOhrLS9o2irKLcOqv6KZ4PQcCX
         fi8u08zOV+egKJiLjJuIELVDGQMl97o2J0F4R/g8DuoIFfBn9p98C7tjvsDsT9pxnclw
         qp/GFZVtznCWw2kowlfA5JXzyhXzrVlLSmQ9kyGluiYRsAiIPlESZ5+daMM5YFR1Dho3
         bsMA==
X-Gm-Message-State: AAQBX9eeNTQefrfi6i/Y9S7AGofUV3WzZKpLr39xzGbC5B7wI35kLMAu
        Jx8mWIWlJdfKV+62Y1DdH4YPrA==
X-Google-Smtp-Source: AKy350YXpqn0+HLdiWaIxk7myrpXbNP2xw+hirOiGiyN4wIw3OtEzEGmrJZjwJmO7o1h3UaPSKK/WQ==
X-Received: by 2002:a17:907:e8c:b0:948:a1ae:b2c4 with SMTP id ho12-20020a1709070e8c00b00948a1aeb2c4mr7740362ejc.6.1681460695443;
        Fri, 14 Apr 2023 01:24:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id x8-20020a170906440800b0094a8f61ef3fsm2119353ejo.173.2023.04.14.01.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:24:55 -0700 (PDT)
Message-ID: <8e629e18-547b-10a0-9be3-157f6ea139fb@linaro.org>
Date:   Fri, 14 Apr 2023 10:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/27] dt-bindings: display: mediatek: ovl: Add compatible
 for MediaTek MT6795
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
 <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's OVL block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

