Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF2AC77B6E
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjDNIX0 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjDNIXX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:23:23 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE6276A2
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:23:11 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id qb20so43294653ejc.6
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460589; x=1684052589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=;
        b=uozEHOqhsVLQi8VAd0LiVLiIcaJjqdIe0doxfbqY4LrNElfxRSLsWLNNn5zylJUn0h
         lHxL6cLx6Lm8AJU1Qz7HAS25JoY5i+onzAcV4fLv6Z1z39K0Kknjov5Ime2nZn+f3mKi
         qpeInhnvcx9i+yORBAcxGjvqxyQatYSOgfeWUwXBVPHjesc7/k+ZMwA636R6djieJvJm
         vBChHpBBwVm348eRPxDxWYvwS9mjTI/AdRatEsyAsi9HCe2EedzgJwqtMoqjXsiQTI/q
         BSIUkO+iAL745TdY1tYj04jYfu39mDcmIy3b/wqdgvci8hkpq1ezVGuswXsbqQOUKUX5
         cM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460589; x=1684052589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=;
        b=GT1Q+SWAav/TxTI3LycJ6EdJ0dwL4MzuU4RqaGUqc9QuciS1dqVyDJx4Kc6qOkcrRK
         Rt0O0TkNdNM+TxEHwB5C9PLKfuDeLsag03L0aCFPErJPYknWcyxrVnksMASn7SFsKEXC
         uM1VVzwLe8gLBdIavtbwmaItLqTxNBarc9Ke8saqOpOLOosuhY6qdy7j3BzfA+cbK8n9
         pvisFdEPCnzLLhlyjnKNrYPT+BtRGEEqusUgqrnYyONLR3SQtWUNX6WMIf5Xc/Jdy5CB
         u6eZ+vemvFVb4bje0a2ljFFlVoMzTtx/TOWm0OO3/BpxMvb1jj9xxdoHzQuRiil3Getg
         G3RA==
X-Gm-Message-State: AAQBX9elXQo2lgf6VZbweWAjhp8aAl5WcCCyvUOurddz5LSguRt4tS3h
        pbE7Kf5WJUMBL1m2nRqGujilEg==
X-Google-Smtp-Source: AKy350berumbKkfJ41+HfpsbynlljsimfYfJHpk52Z1fKMpG3joFYZsRrgaiLWvTZCpLIyxkJxRVVw==
X-Received: by 2002:a17:906:4743:b0:932:fc34:88f with SMTP id j3-20020a170906474300b00932fc34088fmr5878677ejs.11.1681460589673;
        Fri, 14 Apr 2023 01:23:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id me17-20020a170906aed100b0094e002dd3bbsm2094050ejb.224.2023.04.14.01.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:23:09 -0700 (PDT)
Message-ID: <2247fca1-ac4a-a1ea-1c06-0e25d19c0eaf@linaro.org>
Date:   Fri, 14 Apr 2023 10:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
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
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

