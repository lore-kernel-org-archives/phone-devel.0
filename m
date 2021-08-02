Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7BEC4338F
	for <phone-devel@archiver.kernel.org>; Mon,  2 Aug 2021 07:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54BFA6023E
	for <phone-devel@archiver.kernel.org>; Mon,  2 Aug 2021 07:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhHBHqE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Aug 2021 03:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbhHBHqE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Aug 2021 03:46:04 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB23C061796
        for <phone-devel@vger.kernel.org>; Mon,  2 Aug 2021 00:45:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id p5so20338587wro.7
        for <phone-devel@vger.kernel.org>; Mon, 02 Aug 2021 00:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b8jW3IOV41KMKmqVpH+AdE0I3WMSTbX/8dDvcRHBAMs=;
        b=aQaWN4h7IGm0JCqpgaw2HOVw0Qsbd6HJLFAO+r8LxOSCwJHW825mmT8bYNlgOxB1iw
         EtjH4/xZ2c2/9a2E8XZ8OJD853/W79XLv+bQHWmVCvTSGBibu4vkt6MabW4eiiw2FEsQ
         n1JaINCWIyipRfaoBF3QJKDzrIrsIX1lrRPz59yIb33VfhPV3szO0xWEHTjLvbkh00nM
         Wd0efPTo4An+XrMoIQtnNxjfY1Pu40qychT3RFqP7jQQMd7cjBFopbjsdMMzExR1NJpI
         dRYvxGoZPcLA1ndgCODkH9+KxU/Qdlgz1Pk1YPU/6tjz1fvuE34ffJbCbN8YFXkn8rt5
         KwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b8jW3IOV41KMKmqVpH+AdE0I3WMSTbX/8dDvcRHBAMs=;
        b=hP58eaUnZLAl8YdYxEuQLoxo4+Zold9M7EQNT/ahQL34/RZ1bz3R6ZLObGS9N2CJHc
         wc9CBJX8axNbj/MFSHXzuVsIcUp4WMkFgCk+rzau22byLFFmelKQtlT0quFXUGxda2Ur
         h86NgKIqbKo/88b4aAGKdgA+Zqnh/DSdJqwcT3nBMG5WLjqg22qc/EweOLNM+wx0xZN9
         Gxnp/M78g9ELs9BanfqXTzdKcYI3S0p7FdbNhhG6Rom7IKy4L4uHh9l9VSVV4LktHzm4
         8nAeOPQjOPsJ5a7LyNCbDkRNeiiqi96ev4l8wAesqNhFMeeN0lr8PUji2xOY1WQ0TYfN
         sTYQ==
X-Gm-Message-State: AOAM530ywzN8nZXtyRG+BO5ZAV0XS6rsIhoSbNVUgv29zd+JS9pwfqoC
        h787U3zlwIhmmephjaAo8dk8zg==
X-Google-Smtp-Source: ABdhPJwQQkroMNYDfuvpsIDOf0GjPS2wAm+W/G0POKYBXcirQeTE1zN6cYDtTrMhrEyMTjslZ3pWlw==
X-Received: by 2002:a05:6000:186f:: with SMTP id d15mr4276531wri.89.1627890353495;
        Mon, 02 Aug 2021 00:45:53 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id x16sm10552433wru.40.2021.08.02.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 00:45:52 -0700 (PDT)
Date:   Mon, 2 Aug 2021 08:45:51 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: db8500-prcmu: Adjust map to reality
Message-ID: <YQeir0PbUAEXC26F@google.com>
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210801233314.3150754-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 02 Aug 2021, Linus Walleij wrote:

> These are the actual frequencies reported by the PLL, so let's
> report these. The roundoffs are inappropriate, we should round
> to the frequency that the clock will later report.
> 
> Drop some whitespace at the same time.
> 
> Cc: phone-devel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/db8500-prcmu.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
