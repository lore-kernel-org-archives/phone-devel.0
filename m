Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40974C6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 04:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiIZEpx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 00:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbiIZEpw (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 00:45:52 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D27224BF2
        for <phone-devel@vger.kernel.org>; Sun, 25 Sep 2022 21:45:44 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id hy2so11493619ejc.8
        for <phone-devel@vger.kernel.org>; Sun, 25 Sep 2022 21:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=inQx/B+myoBQVAF3vsFN8D/0R7rZQjwNrUieRpG8clU=;
        b=j/uFU1KOCRqduTJlrlEoIn6ttforECuEoaRHf2Jkb1/p00FI72BhA+ja0+iw0yrlSt
         PyWtg1GZTi4rAHzt4bV8b93gt95RdcPppHsOHk7Sj0JJB63rSc1AZSvmj5mmHrUTV55b
         9Srf43HDAj1z8qqOrmCkboDh9b2nghcIx73IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=inQx/B+myoBQVAF3vsFN8D/0R7rZQjwNrUieRpG8clU=;
        b=zOQpnA/T78HMxIXzdbzG/HaOAp0E/jVgr9mAyO6efr29MovtqCJlZ5UvOiP2DsxxZ+
         YQkO67GLNAVDKgRap2Dy3PFl6Iiy8olUn5cg6NTzZx7oZBywxS3jgUOHYTyqCv29nYkq
         vUjmH5TmhVI1S/f9g/7vPY3+DINtBZhGG+oK2PKWBUyyUsXThEkK/qXo6yKqPlU1nMKu
         e3kYOu95f01W++JTR8XfcnVXjZWq0vlPzHeiC63wy/GdjuZGI7eW+LPyZIzWu/GNNHVv
         HqmwxC2PG4dn4yJJJ13S+jOEAPVXXFCC4iFYUK5v4HBXO/6Qv+sVtKOoys+fiCyJNQO4
         xVdw==
X-Gm-Message-State: ACrzQf1b3HpBCq6OyR7cUUnlYeDumXWg3yT7v5ZAbm0mQ6YMGDNFCdlK
        SCAMfcoIrx0JKZ8ssUvKch3VJxcDz6UBjf3yE2nsGw==
X-Google-Smtp-Source: AMsMyM50baM0xEgY1j/hLICZS6Ro1n/Ox33rLV2Rl1Yb22kNPgKw8xFU3i402SgQ5Dfectw+su70alxJjafTx80ETlM=
X-Received: by 2002:a17:906:8455:b0:773:c45b:d970 with SMTP id
 e21-20020a170906845500b00773c45bd970mr16452870ejy.46.1664167542843; Sun, 25
 Sep 2022 21:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 12:45:31 +0800
Message-ID: <CAGXv+5HayW7XFcPJyV4xWvndmLau5T068nc_XYEbyiFX=pMzVQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 0/8] MediaTek Helio X10 MT6795 - Clock drivers
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, y.oudjana@protonmail.com,
        jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
        fparent@baylibre.com, rex-bc.chen@mediatek.com,
        tinghan.shen@mediatek.com, ikjn@chromium.org,
        miles.chen@mediatek.com, sam.shih@mediatek.com,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Sep 21, 2022 at 5:15 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
>
> This (very big) series introduces system clock, multimedia clock drivers
> (including resets) for this SoC.
>
> Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.
>
> AngeloGioacchino Del Regno (8):
>   dt-bindings: mediatek: Document MT6795 system controllers bindings
>   dt-bindings: clock: Add MediaTek Helio X10 MT6795 clock bindings
>   dt-bindings: reset: Add bindings for MT6795 Helio X10 reset
>     controllers
>   dt-bindings: clock: mediatek: Add clock driver bindings for MT6795
>   clk: mediatek: clk-apmixed: Remove unneeded __init annotation
>   clk: mediatek: Export required symbols to compile clk drivers as
>     module
>   clk: mediatek: clk-apmixed: Add helper function to unregister
>     ref2usb_tx
>   clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers

I've queued this series up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1
