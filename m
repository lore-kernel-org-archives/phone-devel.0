Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8CCC07E99
	for <phone-devel@archiver.kernel.org>; Mon, 12 Jul 2021 17:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B88F56120A
	for <phone-devel@archiver.kernel.org>; Mon, 12 Jul 2021 17:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhGLRVe (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 12 Jul 2021 13:21:34 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:35353 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhGLRVe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 12 Jul 2021 13:21:34 -0400
Received: by mail-il1-f179.google.com with SMTP id a11so20364579ilf.2;
        Mon, 12 Jul 2021 10:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TiFkdBgaz2wMtnB/AoqFohTDPez/LJuB1eqRTUbRjdY=;
        b=D345VCTHnMXdVBGBzu0Whpq4mvB15LoxJf4RyjxlHVwZVu0T3wrsw8W4/S6nKL3XH+
         HWQoCJ615cjJw4naJrH1STXMF153jhjzzmR9RT5qxKW5HZNAxFj3RxwCFAN4rqIECKTS
         jZfbmrhcYX7O5xp02H0W7CxHn9s1PxxQBEZaG4fIc2ORw+6yOcxVIZDwtmKhuTASR/EQ
         hVsYomNzLWpT0pfyD6bdt9AI7RLxJjwQb1gh1XXI8fA40lAfHbzH2mEGO8fNEctFE4Cd
         0SDLjTK5Ep7pZJD2pJMaNTpfp6usoCRL47AaaKTdvTchKG7Zn7vJyL/Q6JYLyWxKfLvK
         d1vA==
X-Gm-Message-State: AOAM531rl/4shgpySAkaVYn7KtgHkQOIM28H+IMTCVwrd76yCreIksi7
        YNY2doMJ/s8LEQjuDtudoA==
X-Google-Smtp-Source: ABdhPJyuhbHmm2mo85GbQP3+WFLWBgM1bAoYlXsHA4LIEG2y60tA0xG8KSMd+MSY2AmMu+OyHNJ6UQ==
X-Received: by 2002:a92:6610:: with SMTP id a16mr38109099ilc.124.1626110324850;
        Mon, 12 Jul 2021 10:18:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o7sm8607264ilt.29.2021.07.12.10.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:18:44 -0700 (PDT)
Received: (nullmailer pid 2137224 invoked by uid 1000);
        Mon, 12 Jul 2021 17:18:42 -0000
Date:   Mon, 12 Jul 2021 11:18:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        phone-devel@vger.kernel.org,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2 v3] drm/panel: Add DT bindings for Samsung LMS380KF01
Message-ID: <20210712171842.GA2137166@robh.at.kernel.org>
References: <20210707234315.242663-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210707234315.242663-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 08 Jul 2021 01:43:14 +0200, Linus Walleij wrote:
> This adds device tree bindings for the Samsung Mobile Displays
> LMS380KF01 RGB DPI display panel.
> 
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes just resending with the series.
> ChangeLog v1->v2:
> - Expect SPI bindings to be pulled in for the client and state
>   spi-cpha: true etc.
> - Make port a required node.
> - Update the example to use a proper SPI controller (spi-gpio)
>   so we get full validation of the example.
> ---
>  .../display/panel/samsung,lms380kf01.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
