Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D04C6FA82
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 03:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233264AbiIZDCF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 25 Sep 2022 23:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233202AbiIZDCA (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 25 Sep 2022 23:02:00 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189542C121
        for <phone-devel@vger.kernel.org>; Sun, 25 Sep 2022 20:01:57 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id lh5so11223452ejb.10
        for <phone-devel@vger.kernel.org>; Sun, 25 Sep 2022 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=;
        b=fMDjGMFeZ+MEZfjBLeXyZXO+5QURbDxXo1FUsSS2j688UXbghiFGIb5sDWVtiLfaTu
         HifASisiYD84FYcN4xahhmp+HSp/Fjyzm68aXl8cTDtA67mLClwfSSukEs6aYvvKicqJ
         DUEZqyaPDMlZkZcP8+NrKcf+0HixlqbnoQch0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Skd+l8JquKxTkT+d04SuRhlV1yn9RBCkYSqV8apRUX8=;
        b=Bao5FRF9DUSLap6V1+wBfFc4TSHWawrEKGpz4tNNL64GUk3vZzCx4Jr8AyCyFu8iTD
         bP1/SyQpGpOYj+QpGNFKRRoibzg5+9SlztlYFhYiw6t0WUPgDcmvsof42a4jPKst7TPK
         lYloyGZeIspLV6opZRUk4XsepTYIVuBUDjlrX6tT0+F48B9zOn9SbS1dzv1HESONYJAB
         Mf2M3QOv8+bX9G1itIZo874jwBc2S4WHvqz8mWJzxeHne6DvUyakf17jIzmQ413hV9b2
         OEYmh1UvFej2AX5U5c7OHwK6CWZFxSHGi27u0Qw+vFi2JOS9PSnzjoDxCgsQs6xki84R
         jhBg==
X-Gm-Message-State: ACrzQf381O7CKsXkT1uA6XUuJd06VJzSt4wVrvJaMemDbLXFcEXqyy5H
        xVR5oNnpti9NciEElv+uBDioIcA2oSnrZTtrOEIN3A==
X-Google-Smtp-Source: AMsMyM7o8MwQQBDwguXkozM6n/umhwviFw/Nfd+rhMxsOtT2UejSuJCqg8qOL0/MW/9zxPZApsONr4Gwd23XXRSuZkU=
X-Received: by 2002:a17:907:7f93:b0:781:dbee:dece with SMTP id
 qk19-20020a1709077f9300b00781dbeedecemr16459188ejc.323.1664161315561; Sun, 25
 Sep 2022 20:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921091455.41327-1-angelogioacchino.delregno@collabora.com> <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921091455.41327-8-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 11:01:44 +0800
Message-ID: <CAGXv+5Hr6LYEZ8_3Z07XAVPbbSHZiwjR2QTrv9LdhwpYn35TFw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 7/8] clk: mediatek: clk-apmixed: Add helper
 function to unregister ref2usb_tx
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
> The ref2usb_tx clock was introduced a long time ago and, at that time,
> the MediaTek clock drivers were using CLK_OF_DECLARE, so they would
> never unregister.
>
> Nowadays, unregistering clock drivers is a thing, as we're registering
> them as platform_driver and allowing them to be kernel modules: add a
> helper function to cleanup the ref2usb_tx clock during error handling
> and upon module removal.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
