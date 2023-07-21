Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB47EB64DC
	for <phone-devel@archiver.kernel.org>; Fri, 21 Jul 2023 12:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbjGUMFt (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Jul 2023 08:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbjGUMFj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Jul 2023 08:05:39 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9004217
        for <phone-devel@vger.kernel.org>; Fri, 21 Jul 2023 05:05:13 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so16372615e9.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Jul 2023 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689941111; x=1690545911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwkAITNstbKHyFH4YH4HGkeGusEuKBwo8M8zNrSZdhU=;
        b=aF2eIZeXrg/zFUDfDqX2VRdg/iwpCjbdedLrdlDzh5onBXHGhO77YzC1SAkx0Z56WB
         hNsn2wPWE2wl5ADCXQy7It6KqmaBdH4urXNG33ImeMzRsV+Y5fr4wwaVYGmHBLhsnDTG
         xHyBattkMTeVIJfCTI4hDoRRnJDQNgedkwQrrztCT6ld9ey9NbmDs2/gZgi3yO/ZPCBx
         DUiNZs1Jym5CieKIikuk60Do2qtAQaWAks+iGejZXbnCbxzzWZPHmK29LAj74NO9/ac6
         iVJTrMmZZZK0soe66ePTj2Z9NMIokxJGWSLrYgeq1GHgoWGRH/EzO1fLYISQ27yfGkv3
         cTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689941111; x=1690545911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwkAITNstbKHyFH4YH4HGkeGusEuKBwo8M8zNrSZdhU=;
        b=EFqvanSZRHbt8QRIGfG7pk5KM12bVoxK8NdfIc67gxll1MStksOhVvhgBKGcHO0boV
         veakvZ/hFRNsbsaBHNo5TnDiV+IFoIzqsuSFy74g10EXFqpHf60Y1AwKmw8D9hy/ZFUw
         ZMYoTrRtPFadKGGlEhea8SAwjUl2Sc+t2yFaxF7Rz6fnQ9twJXQM7kY2VIRmW4Gb/l1H
         epDOxAHCm7yftsD5Dctqu8QB5tVZ2xV/vjy6AgN/8ehh8LP7ZwoGXFmpGoMvnzx5z57k
         OpVP8YM1f7mPiJVpWDYQbAUmurB38yqEPnzztHKkW/rBagyECAkO2rNx6VVK56GB1Qmi
         DQfA==
X-Gm-Message-State: ABy/qLYgvk3zJRbQ1+Jmwuwl2VkKSv7sPXta8g7NcJWquGvVVVikyKdi
        IbYKouSlJ5n/CovzA+b0XQj9QQ==
X-Google-Smtp-Source: APBJJlHRz8i4/yqZn1Tc3ne+fyyGgKuZDYiIqzx37lC9JZfJ4gGCcmSmEPniqHtoeiGz22OlooGr0w==
X-Received: by 2002:a05:600c:450:b0:3f8:c70e:7ed1 with SMTP id s16-20020a05600c045000b003f8c70e7ed1mr1345123wmb.20.1689941110870;
        Fri, 21 Jul 2023 05:05:10 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c229300b003fb40f5f553sm6032566wmf.31.2023.07.21.05.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 05:05:10 -0700 (PDT)
Message-ID: <a840ac78-dbb2-23b0-493f-a7e618502a01@baylibre.com>
Date:   Fri, 21 Jul 2023 14:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] arm64: dts: mediatek: mt6795: Add support for
 display blocks and DPI/DSI
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, matthias.bgg@gmail.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
 <20230721082822.680010-2-angelogioacchino.delregno@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230721082822.680010-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org



On 21/07/2023 10:28, AngeloGioacchino Del Regno wrote:
> Introduce all nodes for all of the display blocks in the MediaTek Helio
> X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
> left disabled as usage is board specific.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 251 +++++++++++++++++++++++
>   1 file changed, 251 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 597bce2fed72..3485a2a9a19e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -1,7 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2015 MediaTek Inc.
> + * Copyright (C) 2023 Collabora Ltd.
>    * Author: Mars.C <mars.cheng@mediatek.com>

typo: Author => Authors


-- 
Regards,
Alexandre
