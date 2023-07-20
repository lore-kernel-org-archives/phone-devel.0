Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 764BEEB64DD
	for <phone-devel@archiver.kernel.org>; Thu, 20 Jul 2023 12:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjGTMBS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 20 Jul 2023 08:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbjGTMBR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 20 Jul 2023 08:01:17 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D667A10CB
        for <phone-devel@vger.kernel.org>; Thu, 20 Jul 2023 05:01:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so1093152e87.0
        for <phone-devel@vger.kernel.org>; Thu, 20 Jul 2023 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689854474; x=1690459274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgJO0hqYDA2Nqh6mu9cc9MRnvY6CGEvkARFrTIY0YJA=;
        b=EOnVsmgf5wMcztiewlDLKo7adJCc3hQNng9qGUN5JC8Hcg+x8KA9b2OnMFx6Y0HL21
         BV994Fat4mX+vuYsz8ITdIIyYDIrszAQlgSl/eplNkls4pfBNg4xIAzQghKmT3CG2P6c
         1q74DYVpdC1OL7bkDbZ78t9OLKcAXnBCDUboybEIsiGVBUivIhLWBa/7JKecC8TiKlVQ
         S8vOm3+7srRHbyo7DrkQNI6S/KNUsMYUyF2zkSfKHBh/LoKkON8ede3wZzn61J/JzaLu
         3J/kVU/2stVdKKxvg+2YFEsZt7y8c+hK7msmYqYP0m9VJwiNBFgUsIFVB3z1osESOkdb
         JSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854474; x=1690459274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgJO0hqYDA2Nqh6mu9cc9MRnvY6CGEvkARFrTIY0YJA=;
        b=dbvBQNbzSplGKsQ2G9y84GDfik70SjfqAA20wFXywIN9EnPZNdLxhJjOl1RnetQPxC
         YU3H2vGVKZ04lKiX2TZucK2nr4+YYDRlKPLtpuZhvpviDKtnMgjEawwNavUD9Kkcesbn
         +XtQwB0ShQagbSW4zBsJ3aczmcfYpOwjSPN50TEmHGXcai3i+Pz2n+lkjrFz+BGf2fWd
         j8gbqnzEKSPVFTYhSxl4rickK4i2hhQgq1HIwiNyuA8mVUiExooL/TMAv6rwJpbetuq4
         yqdN9f2gvMzVPzIo+z3herGEb4s4oQeTLE8vkJYe7DsyWcRwlCCB1Ng9hjur32PiumSU
         caiw==
X-Gm-Message-State: ABy/qLalDuU2ZJIvYA8WucLfYdqQf6haeKicN6opYjYIKcyieTaPdx2l
        /YzI3fgGsBrNz49p2WXQgxNT/A==
X-Google-Smtp-Source: APBJJlEnYSy7ib/63UPVp8rdhMsFgvKjS/5g6LIpVjoes/s6RzvAdUJsWw142TXV/PG4TnnV8arOQw==
X-Received: by 2002:a05:6512:2212:b0:4fb:844c:a867 with SMTP id h18-20020a056512221200b004fb844ca867mr2658884lfu.9.1689854474121;
        Thu, 20 Jul 2023 05:01:14 -0700 (PDT)
Received: from [10.1.3.131] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h1-20020aa7de01000000b0051a4fcf7187sm663363edv.62.2023.07.20.05.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 05:01:13 -0700 (PDT)
Message-ID: <a85ee57b-d000-7eef-6817-82539d37ed32@baylibre.com>
Date:   Thu, 20 Jul 2023 14:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt6795-xperia-m5: Add DSI
 Display and its vregs
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230720091559.86406-1-angelogioacchino.delregno@collabora.com>
 <20230720091559.86406-4-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230720091559.86406-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 20/07/2023 11:15, AngeloGioacchino Del Regno wrote:
> Add support for the DSI display found on the Sony Xperia M5, including
> the necessary regulators configuration for it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
