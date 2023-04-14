Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B26C77B6E
	for <phone-devel@archiver.kernel.org>; Fri, 14 Apr 2023 08:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjDNIrD (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 14 Apr 2023 04:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjDNIrC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 14 Apr 2023 04:47:02 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3716977A
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:46:29 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id kt6so5667880ejb.0
        for <phone-devel@vger.kernel.org>; Fri, 14 Apr 2023 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461984; x=1684053984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=;
        b=xp9uWY+38EX8iXKhDxwuf/8P6/uzkYqJiZSNi9vbejNbCSdunJ1Q9htZtm13dmHSwZ
         eB2ixQjldDhVwyuix6HrldPkLC68my3bBZD1+VnwEJYIEqao34hsl9FKzJhaqbncEL3k
         /KmdhyM5haVIHZSXu9JatbD4YRave9CEPpq90sLNHZvf9sW6wBpDPzjaSX+WnuQwT6Us
         silZOQPudvwxoBZsEswx2cagU4lJtHv+hGWoQ6PsUugjiC08giCkVUTO/lm19lCPilgW
         E1f808oQegKlCwXB4Qm2/bYW5g5Cs/6JKEFvAraCZ2Qt5rX7g9UAPhvFrP8zZfj27pql
         c0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461984; x=1684053984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=;
        b=kxCKJuH37pNGN4u5X9/3J8ZG1B4QirmMwGlSsA/SahtKTqPDErOLyKUiE7aU8nbFRx
         ADkD8os2uDLfQ+TwVjrDunRDIeaDU1uM57Ej+ukn1xu5syTnb8t6/+waB0aCKeVoSdkU
         cdACt+7vDhSX6gMakM8APfWDKVBNeSXEvD8BZG3eAO+P+TJSinmDjxJ697tXGDhCJBfe
         ndqeOpzczEBl+3YBPKG6SzNQGKLQKY2bcyOtUa/jRSxbPzYwRCWEgVuW5xfnfBQSAPgu
         msSleGvmQftC9CVvqdkJv6M8P60wV5IJUSFGmvVugdA210JSqtbA7/giNBeiUdMm0yLn
         28MA==
X-Gm-Message-State: AAQBX9fLCOSOtzH0+hZqQHtrKm0u/ZGBW6b4N5lYkU0l1p7S3rbmmeh3
        KFE0E/TGiC6uo8979PAc1Nhmtw==
X-Google-Smtp-Source: AKy350Zv7NbHUiKpmnlHoLbQyKG9G9zKPHkXSd3wH7bVQzjdvDDsKYYR9UPKlRsG7vTDe9V2aEOkog==
X-Received: by 2002:a17:907:25c9:b0:94e:ef09:544c with SMTP id ae9-20020a17090725c900b0094eef09544cmr659459ejc.10.1681461984189;
        Fri, 14 Apr 2023 01:46:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906584700b0094e597f0e4dsm2087436ejs.121.2023.04.14.01.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:46:23 -0700 (PDT)
Message-ID: <6fc26e38-ac45-b4a3-32f0-2bae686371db@linaro.org>
Date:   Fri, 14 Apr 2023 10:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 22/27] arm64: dts: mediatek: mt6795: Copyright header
 additions
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
 <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> I have added more than 800 lines to this devicetree: adding myself to
> the copyright header.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 29ca9a7bf0b3..a4c950b65006 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -2,6 +2,9 @@
>  /*
>   * Copyright (c) 2015 MediaTek Inc.
>   * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * Copyright (C) 2023 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Copyright is a result of significant changes, thus it is a part of
commit(s) making these changes. Adding copyrights in separate commits
looks like you are spreading them unjustified. Squash it.

Best regards,
Krzysztof

