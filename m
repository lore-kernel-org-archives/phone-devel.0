Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A328C77B71
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjDNIYz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjDNIYg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:24:36 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD9F6EB6
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:24:09 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id q23so34224563ejz.3
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460646; x=1684052646;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5WD2gH3v1xh1o9givBu2e0w5swNPvhe4afXVRz+MMM=;
        b=oL2AVZdFWoDex9JkWRqff2ZD9V1chGSVX2PbXu8xygcwfNgaAECi+J/jq4IvngaZ7y
         PXGFg2oWbN+6Ti1aDMNflhZMr4aeTCV3Fn7wAS84QyfBZGasr5mGwO0KpsOsSl3yllKq
         a5Kgb8EnYyMQ2TK5voW/kOf2a52ATwrGmt455naheGH5rx3rVv/nu3hCSVmeLvah5YN3
         09EKjCFWOrlStNsycYRXmax28GtewTPwjDFXqtd4ViyFL3W44QWTbc3Qp7XrRfwjFI55
         1F7nc9TR5jfSu3SLXYSajVg9nGUKOBP1By4Ju0iluU9P8Lg0Gd8VGmCVHAI4Mg3ZEjdm
         vUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460646; x=1684052646;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5WD2gH3v1xh1o9givBu2e0w5swNPvhe4afXVRz+MMM=;
        b=cWGcPP+lAEuNy2/WjNQ2dVhhsjittYdf3K3GiqrcMkfgf5JKKlZzPaAkdapLmUvM2X
         7dpXHLbiafA0aluQTOrnztJQK7qgw76bVG2HONK1+8wBqrHgz5M4Knu+k++trVUJywN0
         DHGvAEuGl+D3RNjke9HhhLM/JwN8CUKPS4Epjv7thOJrg4rbTj+4J6b8lsAOuU6Bbp00
         sffwBK018K/JI+eFRFDaMO+P5VMYqfVjstE7nvyok27i3muNDXdR8Y19Hyj7B33A3iWo
         6jjFif39cUzWptHmA9pzzJalumWZ2fb13b2D0CoQrcVQnc+6RRR8ymaDAauLAyXUoQ4o
         CXmg==
X-Gm-Message-State: AAQBX9d8h+woveuw7Xj7bv0cNZlxkNOw7NHL9C3xL9G+/UVEtkAYLPPA
        /uIvtMEJ/eaNlAu/THsQXWjRkg==
X-Google-Smtp-Source: AKy350Yyst89FsoZKHfvDoqzSjH2OZKJJ8WXXeFSuUX3l3Dk4pEzIM0gMQIP9wV/17aCQ0jwNMC+hg==
X-Received: by 2002:a17:907:1191:b0:94a:4875:262d with SMTP id uz17-20020a170907119100b0094a4875262dmr5997882ejb.67.1681460646226;
        Fri, 14 Apr 2023 01:24:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id p8-20020a17090664c800b0094b360a281dsm2094426ejn.123.2023.04.14.01.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:24:05 -0700 (PDT)
Message-ID: <1ef0beda-9608-d73c-bab6-a07a971f939e@linaro.org>
Date:   Fri, 14 Apr 2023 10:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 04/27] dt-bindings: display: mediatek: aal: Add compatible
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
 <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795: similarly to
> MT8173, this SoC has the gamma LUT registers in DISP_AAL.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

