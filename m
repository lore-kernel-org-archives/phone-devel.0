Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3868C433FE
	for <phone-devel@archiver.kernel.org>; Tue, 31 May 2022 09:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245270AbiEaJeN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 31 May 2022 05:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245262AbiEaJeJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 31 May 2022 05:34:09 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29FA3B012
        for <phone-devel@vger.kernel.org>; Tue, 31 May 2022 02:34:07 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-30c1c9b9b6cso68510427b3.13
        for <phone-devel@vger.kernel.org>; Tue, 31 May 2022 02:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0w2fXNQOc3DHaB4s+oXCyoZJeWAMalBiF5eAVeXufrU=;
        b=C4QZ6FMJ5aJLAtnQWNLvLEEDUXO25F0COEmJPF87NnQKZhExYvB92mpAWJf0lPVPBJ
         kdQWE6xMBXjrvcyyAKQfM+XTMO/lH6jlZEDbL+Dxws2W4zPIN+3iU2OspGRfkEIW/a5n
         h/afEYh/M76OJ8kCjZxWQmN9b4LfbKJ2OCpfcwvz7IQpmIpz+6OXqKvEiwLxbC/l15Lo
         7JjFtVLeg7L7vlHGka6YWCxIyM0sgJZiQPKzaDm6gysxAzjNX01+/WYYYfAvHsAYSLRX
         mjK6sRg4Xk4SNfc8B88YvU1SqAgFxaKvuHageZtrKwTYR4orYwo7OIa1ybFJ5IUL2nrj
         95lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0w2fXNQOc3DHaB4s+oXCyoZJeWAMalBiF5eAVeXufrU=;
        b=yZhrDgUQNdrshVjlMyFgbVCcsu1YvrrqCXfDVxTn9Xbpd/kXsw6I93og3pvhRBzwkE
         sefShd49iixRVdT847gpmJPxAXCeiJCAc6xILb6pxlHelcE/bde7i8D5R0xSUFqf1XNE
         Nj/SQkPJprsM+vQJRaZVvU/CkAufKFBKDwM7W9jb8/FyyK5LQyek6fycoP7itNEL20UG
         sbFXC8ddERQm0lllVPQno45FLzYNrUrwDTU+10W2DMMK7+sG7+NQjo2dSHgiVauVgDPJ
         NO33CpMZzARLhRmPh5MxX5kSv968WO1Aqxp77sR/aIfyJOFtdAugWAB+OQ/gyErhfuH5
         bLfQ==
X-Gm-Message-State: AOAM530ZNLRUmf8oIAoOonKiKnw7LZmLIxqvBqxD0eUMBwag00EMClTH
        yJzJm7v2bezfl8OqFriqdPWYJM2gW7/Ly8SQ8IxgVg==
X-Google-Smtp-Source: ABdhPJzVOfXBYTQoebXOcYGJ+lnLw7+x/Gvfz81biEV7PK3vYDQcPKJgisfe5ZodDgBmCw5OrHus2mbPSAh2SSEqRbY=
X-Received: by 2002:a81:fe0b:0:b0:30c:7e9c:701 with SMTP id
 j11-20020a81fe0b000000b0030c7e9c0701mr6503392ywn.118.1653989647207; Tue, 31
 May 2022 02:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220530160753.100892-1-jo@jsfamily.in> <BY5PR02MB70092E9495F2A52F473DD31AD9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB70092E9495F2A52F473DD31AD9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 May 2022 11:33:55 +0200
Message-ID: <CACRpkdZyVTWu=j5rVMmi1PuHBDYfEXhAiH1f0hskBnkS4a+FZw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add prefix for EBBG
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Hao Fang <fanghao11@huawei.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, May 30, 2022 at 6:08 PM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add a prefix for EBBG. They manufacture displays which are used in some
> Xiaomi phones, but I could not find much details about the company.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
