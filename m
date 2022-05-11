Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3AEC433EF
	for <phone-devel@archiver.kernel.org>; Wed, 11 May 2022 08:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbiEKIUk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 May 2022 04:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243539AbiEKIUc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 May 2022 04:20:32 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E87B239780
        for <phone-devel@vger.kernel.org>; Wed, 11 May 2022 01:20:24 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bv19so2473501ejb.6
        for <phone-devel@vger.kernel.org>; Wed, 11 May 2022 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uy8aR8kz6BQpVxur6Kjai6fQ+hpFlGiZWJG0Qp4yCOg=;
        b=Fr/vip9pejDSZqSSt8H/JK2iltHXzGX5eyeHFwgdyMnJezlK+2lTTWFI7fPT/aDXhU
         ZrqpNPb1xceNSyxiAneMZxZe9H6xKDVWciNwUtz+ziERQ843v/TQKqZASKu8vw7DREcz
         3nPSd8C2luHoFafniYeVRyOKVKHuNSnwoKsIg5jyZl5gplAmflS02dUFnFDgmOyjkZat
         c4hF0Ko5ccpUqOQco9bSDG1oqaRPHVjoZrYUjXJ71oe/n4FJoEtQqr6HpggI0IeYjnhk
         G5gpN/enDBRgL6Buxh4W2eU5sBg19B81dLFeIj6ybSczHxNadFCayl6m4CEAAwFQi5E0
         ID3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uy8aR8kz6BQpVxur6Kjai6fQ+hpFlGiZWJG0Qp4yCOg=;
        b=0QATsboVNMqF2ZuuTK70+eXCj/JkFzyH+uI1DsVaBowu+ZUy0eqBWTLOE2TenmjeGG
         FTThmcjUR+x0qq6wjcBLLnCVd8bO4wFA2C1DwCMhNCkQlZvdBMrCcTHZjeRVEHhHwd8l
         BB3vT8IDwkK3yyLf5sfekjgMlBayHAAPTZT0noKnxLAoMNcbRV9FEJWxa6EdYQSA4L0V
         U5Ax8PpTnT+tyHhOdDMzfs69VC3yw7HL/FNd2m/c43My08hKEDs8cTiXPcA1NjZBcheT
         m8f9A6SJAme3VlXcRxLNSHSxaCvY5jgbgqZxe30XfmhNRFMMDYURH22KCM2wczhmGc5/
         cTag==
X-Gm-Message-State: AOAM533NjuCNoj7a03QUWh7c0Eyb52nK5djtzi+ZxHLsCRIrZdwnljho
        0NoFGn7sfJpJEbAT/vAE2FndFg==
X-Google-Smtp-Source: ABdhPJyp5kcKMjgrjpqm7gLFmCjmNvtcblZ57zYzau/VMyDvaHMxuHZ6/U1RNDoP2QszXU6cQEtuig==
X-Received: by 2002:a17:906:54c3:b0:6ef:d07b:c8ec with SMTP id c3-20020a17090654c300b006efd07bc8ecmr22902989ejp.687.1652257222606;
        Wed, 11 May 2022 01:20:22 -0700 (PDT)
Received: from [192.168.0.254] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709063e1200b006f3ef214e20sm668612eji.134.2022.05.11.01.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 01:20:22 -0700 (PDT)
Message-ID: <b3a618a6-f236-549c-0bac-4c874cd49a00@linaro.org>
Date:   Wed, 11 May 2022 10:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
Content-Language: en-US
To:     Joel Selvaraj <jo@jsfamily.in>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hao Fang <fanghao11@huawei.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <cover.1652245767.git.jo@jsfamily.in>
 <BY5PR02MB700946D0A3DA7AB7BE2CBBEBD9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <BY5PR02MB700946D0A3DA7AB7BE2CBBEBD9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 11/05/2022 07:28, Joel Selvaraj wrote:
> Add a prefix for EBBG. They manufacture displays which are used in some
> Xiaomi phones, but I could not find much details about the company.
> 
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L543

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof
