Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B73CC4320A
	for <phone-devel@archiver.kernel.org>; Mon,  2 Aug 2021 07:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 515F960F4B
	for <phone-devel@archiver.kernel.org>; Mon,  2 Aug 2021 07:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbhHBHry (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Aug 2021 03:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232549AbhHBHry (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Aug 2021 03:47:54 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DB1C06175F
        for <phone-devel@vger.kernel.org>; Mon,  2 Aug 2021 00:47:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h14so20288634wrx.10
        for <phone-devel@vger.kernel.org>; Mon, 02 Aug 2021 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iUhecmtOEFBOc/n8Ox/w9VyUCPFMQi2/vzz/bstOM4g=;
        b=ixzKpGkfHnM1TJkRFBHUhQdH/W4ackddH1I+yYxn6v7vZE1JIiGfQwWrRWv0uEg990
         teA+I9WXVILBiVqIHA5fSk3QPncnNuNdCqbRGcSMqMCMfyQudam2r3GtIkcZxXk8jT7b
         MNTkYQjQBs8aDMO0xSAy1X6xGkgWYik0x1eVoa0UkftQkVjn6klKNp04f4vthyUwnK7P
         XxL5umd+7jlis8eDau67azw/ljb7Q48NqKqEolijNF4UAqwPv9uU7P+ZldQV+X/3HAgg
         i36flnHC+WM1vL04Ri/jfqDUCMcDS93n7ICsvfsV8w4zmv6V0ztwds/m5rNPs5u1VuhI
         xVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iUhecmtOEFBOc/n8Ox/w9VyUCPFMQi2/vzz/bstOM4g=;
        b=VoqsP+3ZiFW/9mD4+lrDdsYPPbtyqnCHnFD59uwNUwaxOeCDA5x35zFAoIvt0UyKvv
         JQBpz6/rA/f018YsPMG+rkKp9rhEKkuewn8/27Ts36Lnq3yYco4lCzISnLGBILBAQlkU
         6EX5XkbEaG+ru3v4545TFtsqnaUs6yIwfj/o/ZPwqn5IjJymHW6xh6SJ3AV49EzZnbWq
         eb4eP8BSQV/a4zkTfe0M4GaKTHoFzAhAqEvPMnER2iRK7NgDPkByVYs3566N/yLGz0Gv
         e3EnNzHPGIueggKEwwLp3YkhChri9n3XJIuLadK7XRzmwTvr/7YRk1Xnzb277ymHME0+
         CqoA==
X-Gm-Message-State: AOAM533bzDLPHC77ym2jiZkLkOOK4sSnDzknZ6Q4ds26OyJm2ZwgzPwJ
        etq6aBxl6+Cr/NKn4GuGSK5YlA==
X-Google-Smtp-Source: ABdhPJw971iLzA6b1H5TxMDnRNFA5vYa4ieLVAtaXNg8xx2Cc3YPcHZRCRQrUKzvmPuLhmWy2FqsXA==
X-Received: by 2002:a05:6000:12c3:: with SMTP id l3mr15805272wrx.314.1627890462858;
        Mon, 02 Aug 2021 00:47:42 -0700 (PDT)
Received: from google.com ([109.180.115.228])
        by smtp.gmail.com with ESMTPSA id q17sm10214086wre.3.2021.08.02.00.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 00:47:42 -0700 (PDT)
Date:   Mon, 2 Aug 2021 08:47:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: db8500-prcmu: Handle missing FW variant
Message-ID: <YQejHNP1AzFHZ6gK@google.com>
References: <20210801233314.3150754-1-linus.walleij@linaro.org>
 <20210801233314.3150754-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210801233314.3150754-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 02 Aug 2021, Linus Walleij wrote:

> There was an "unknown" firmware variant turning up in the wild
> causing problems in the clock driver. Add this missing variant
> and clarify that varian 11 and 15 are Samsung variants, as this
> is now very well known from released products.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Clock maintainers: could you please ACK this so Lee can take
> this into the MFD tree? The chances of merge collisions are
> zero, this code changes very seldom.
> ---
>  drivers/clk/ux500/u8500_of_clk.c | 3 ++-

>  drivers/mfd/db8500-prcmu.c       | 6 ++++--
>  include/linux/mfd/dbx500-prcmu.h | 3 ++-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  3 files changed, 8 insertions(+), 4 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
