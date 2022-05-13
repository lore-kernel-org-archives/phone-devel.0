Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D11FC433F5
	for <phone-devel@archiver.kernel.org>; Fri, 13 May 2022 20:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384495AbiEMUkE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 May 2022 16:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384491AbiEMUj7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 May 2022 16:39:59 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C7C1BB991
        for <phone-devel@vger.kernel.org>; Fri, 13 May 2022 13:39:57 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id i11so17199491ybq.9
        for <phone-devel@vger.kernel.org>; Fri, 13 May 2022 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjgsJyomaG9QQtE3jbFFKe/5rvj6syuow/ZH8n5yvJ4=;
        b=SQoFqGZkR8OJQ0Qk63dN6u8KZ6fGMmX6HLbVWIW46XqaVncbFbTDVP9cdiNDF8Rx/D
         WHT7hM6yG5Ja3/APJFYAliXvVtbW5HdfL+mBQgLhAYE2KGom/m9srR1otUd/jjymzi7N
         enIhThFTnZLdAgcq2IbD5PxYIagJ5EtxK0/v0a5Y/Zw05uI9+cSDpSCoRPue6ht09eni
         yptXjDz3CYCwtP34zBKm5VInN3wkF0uonNI+DuaMzjSTHJSvuJaBWZh/aG+fWtNMlJh9
         doNK7QZ2aOhX3wYSA4XJdgITh3XvxexMRA+Q3rrmOLo10t0QbM42+rpxw87Y/V7qY6Ht
         BdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjgsJyomaG9QQtE3jbFFKe/5rvj6syuow/ZH8n5yvJ4=;
        b=rO5OqS2U1GCNaRY3eDaoZxxZ066MxwJEVUtgB2JSKHXFoyeqsmubm9+eQw5YHhp5C9
         TdwaHwIGPV290qS5qbF5ryFRq4RNgeSLJYVGKP00syIT9+2kjbSBM2rFC8rnT2KNvfiJ
         yHtzcqGM7TBTLnLTRe+CB+QDv1c2BwoVbSmPhR3pLws2Lr+iQ30o3HXFiXoExhRfM3jq
         UsqDUEztvfVdXqYAOuLeMqy0Dj2wsbrTkGyN4Nw8WXjCWpkmwclP3dn5OQb/WgCld8f8
         RqYemxZ4FCtjyR3dLPA0nO03u7VFe7xeO4cVA3hf+EU73m5z0fVuxXdQY36Jp/n993Ew
         pYaQ==
X-Gm-Message-State: AOAM531yaEBExKknarARKHLB2n5rvhppY2p3rcYpY/+FZ7dsNKXPoW3o
        uMLcW24t2bgzmOA8cyM9CS4Fg7kbIBS6Rq+D1Th5JP/iBysOTg==
X-Google-Smtp-Source: ABdhPJxqWNc/BcbrWALPfb9mCeCOCpLqwW04ceOHeKLE9KROovikbSFRNij1NE2lfz4+r3R3/cUkmXIQUrDYhhomyZ8=
X-Received: by 2002:a25:1f85:0:b0:64b:a5fc:e881 with SMTP id
 f127-20020a251f85000000b0064ba5fce881mr3813638ybf.514.1652474396907; Fri, 13
 May 2022 13:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652245767.git.jo@jsfamily.in> <BY5PR02MB70098FF9BDEDE264B78CFCE0D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB70098FF9BDEDE264B78CFCE0D9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:39:45 +0200
Message-ID: <CACRpkdbvv6FcdatAPdTq4fmzgXyr-SjYEwuc_sT+152DtqhiUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: introduce ebbg,ft8719 panel
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Hao Fang <fanghao11@huawei.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, May 11, 2022 at 7:28 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> Add DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI video mode
> panel, which can be found on some Xiaomi Poco F1 phones. The panel's
> backlight is managed through QCOM WLED driver.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

I see my review comments on v1 arrived after v2.

Nevertheless, please address my review comments on v1.

> +struct ebbg_ft8719 {
> +       struct drm_panel panel;
> +       struct mipi_dsi_device *dsi;
> +
> +       struct regulator_bulk_data supplies[ARRAY_SIZE(regulator_names)];
> +
> +       struct gpio_desc *reset_gpio;
> +       bool prepared;

For example that means to drop this prepared member.

Yours,
Linus Walleij
