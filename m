Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D45C4338F
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:15:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D46A260F46
	for <phone-devel@archiver.kernel.org>; Mon, 26 Jul 2021 07:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhGZGep (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Jul 2021 02:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbhGZGel (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Jul 2021 02:34:41 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EB4C061757
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:15:10 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h9so10155665ljq.8
        for <phone-devel@vger.kernel.org>; Mon, 26 Jul 2021 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOfpNk8cBwygjzCjyHz8QRiXxo98sz2BqAuXNRnjjWg=;
        b=lEFUh/WH6uiITinRF/Iqnt5mx0rDbjrYjOAX+EqORbulhwCdiFCiM14vzgxuTeXiC4
         U+EmK0jTo5sdIvsyHjZA1IYkt3ySBDTyc5497lw0rHm4iBT4Hsp2JUGlUblQcD/rRVCc
         vjTLrw7tTOB22lnDgqVA3cgwhX5qOFXWku54RtGwwhfWA4zNCmq0ObobAB8J6IuE/Euj
         bw7GRhZPw4K+O83v4hHeCZNltTeKX8KimIWvHSpXglmT8oFVayW9ZMwSYWOAcSFjrmIM
         W6z4HnsYn48XBImAeDcOHqZdfp1d0E1Hu9UwP1NbHvyREsmKlQThD4Dgo5njIWEvrmE5
         zczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOfpNk8cBwygjzCjyHz8QRiXxo98sz2BqAuXNRnjjWg=;
        b=sHXOOXzIDSLOvYodZkRhIoB0KiYMvoV+GGDAFUTzEnCusS2WZ53OgzxRDP5iQwr7Ci
         D74ekXGwCSg/zZD6dSE2sWztlzi4gVt0/TiA+GutNyCzXjQ+4GddOmcpVANyuf6xjNpd
         yHkch5kgGH3AVB3F+jTP/IM/KqvbBF2NN4lndlLMeEoyp5V/yucW/OmgQtPZfQM06ord
         sCspWIQq2AzV5Gvvbx2/z8NVLX0JMTuR+ab23DlXsGq5ZhrN4MTGV6frmRziIYHKWIpf
         7Vtj/P9T4YEvUOKzW/oz5K9EAdKEgjB7hO/kvMnQ2FeRyXB2Liy4v9BfDKS0xr426OrC
         FGFQ==
X-Gm-Message-State: AOAM531h/8+oL3IAWcRpyeBsFLu4M7hkZ06u0oE3Z/nK0ZP2Tnp/A0aW
        dUKJzymDfIs04wvgz1oXLUaeDJacmRLZQKa3jqA3rQ==
X-Google-Smtp-Source: ABdhPJyUe92qyD4ubvU/cbw2RdqOOoO//w6eh4gn88UzLyuYn5bk8b3ggPXevchReZQ2PP7O1b8K+LWJqxxjari5FZU=
X-Received: by 2002:a2e:950:: with SMTP id 77mr11173508ljj.438.1627283708901;
 Mon, 26 Jul 2021 00:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210201165307.51443-1-iskren.chernev@gmail.com>
In-Reply-To: <20210201165307.51443-1-iskren.chernev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jul 2021 09:14:57 +0200
Message-ID: <CACRpkdanNPaBOAo80wSvNU=ynkS5AVc6gV02jTfq-AePye+fGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Iskren,

thanks for your patch!

On Mon, Feb 1, 2021 at 5:56 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:

> +required:
> +  - compatible
> +  - reset-gpios
> +  - iovdd-supply
> +  - vddr-supply
> +  - port

I do not think port should be required because the DSI
framework allows panels to be put as children right inside
the DSI controller node without any port linking the two.

Other than that it looks good!

Yours,
Linus Walleij
