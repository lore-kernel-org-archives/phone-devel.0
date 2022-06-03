Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEDEC43334
	for <phone-devel@archiver.kernel.org>; Fri,  3 Jun 2022 22:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348861AbiFCWBQ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 3 Jun 2022 18:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345822AbiFCWBP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 3 Jun 2022 18:01:15 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6661754F89
        for <phone-devel@vger.kernel.org>; Fri,  3 Jun 2022 15:01:11 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-30ce6492a60so95309817b3.8
        for <phone-devel@vger.kernel.org>; Fri, 03 Jun 2022 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eTD0MDLxzeNH/wZaowzR2+0RiK3EJbyXvBxqEdkLvtM=;
        b=xhJzcH7d5QTXkQNOqXLSstuJfS4pLxYPzVq2duSk1AJq1r+TfbcyB/GAypgPpOtA7r
         /ddKS4Qxdxi7jQbGQOE4x/Gn7UCLAaGsT6ec6lvEwBpY7WMGcsLjQp7T/vT/ELWlD44w
         k93B+XASZcopMTvx14Q0F0mqGkCO2m/Wq0pgvaKjPDaJ0vGi++QMQqPx+gl1Aj15z0D2
         5FUafMzPdam2A9cyN9zshFuvGqVZG7E4wKVxZqRZNBiqVe3a91N6F3lKYwxt3mOw+PbO
         WHELqcOA7kZquMmnjYuil/8EhCFa6BURLXfjAPMx+AKqhYkMVxhM0p4btk8wO6qvyny/
         b2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eTD0MDLxzeNH/wZaowzR2+0RiK3EJbyXvBxqEdkLvtM=;
        b=MBngICz+W3UcS8igAGHyMW4XQAZZCIGj7kqqaZ/AL/UEmz3uS3xog3kq58BlXMGYsm
         a1Z0APjDElK1cwHM6FnHFlYkgvonG3B0hp1XBv8DkPHERQQtbAF1+l/OOGm6chlPGlQV
         uSvJDRSugyrTfTaxt7Ib1MAmNzO2zJNrn51Lk65NgVs4vqcH2V06zvWO8/vGveUjlbO8
         SlRq1uu5gNsYvqnIjiXcazeA57dsrBavD15MOQKjbzxnheiXUUxwW4G6MeBDgIEhKonx
         mxDyr4NzC50wGdRqZA/AXtcl22k5fQ7c1rMogvhRExbbGnHuAclc6DqRBslwEcj1+FjY
         emRw==
X-Gm-Message-State: AOAM5332v1JkiuXI/d+gcBfVHl4voOYLm66dVGSrOaepzTF3qsJupag6
        vF9paByz4w0oO0QWYlbwAWv7mwKcXDCyJKATVVbuUA==
X-Google-Smtp-Source: ABdhPJygLfhw11c+DqIQfw/OzDPBUuIPK8OMfv1NYvSDNKAjndYL5Vk5Dxk796+DH0WSeJFvMkT3GUqpyQVumTKeTYo=
X-Received: by 2002:a81:fe0b:0:b0:30c:7e9c:701 with SMTP id
 j11-20020a81fe0b000000b0030c7e9c0701mr13607442ywn.118.1654293670642; Fri, 03
 Jun 2022 15:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220601082410.55266-1-jo@jsfamily.in> <BY5PR02MB700952493EEB6F0E77DC8416D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB700952493EEB6F0E77DC8416D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 4 Jun 2022 00:00:59 +0200
Message-ID: <CACRpkdbZwYCT1joo+EdQm8OXkmKHdPPDZicsp_SmH7DYkFMVYw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
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

On Wed, Jun 1, 2022 at 10:24 AM Joel Selvaraj <jo@jsfamily.in> wrote:

> A helper macro that can be used to simplify sending DCS commands.
> It is useful in scenarios like panel initialization which can sometimes
> involve sending lot of DCS commands.
>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
