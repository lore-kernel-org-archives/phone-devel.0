Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0D6C4338F
	for <phone-devel@archiver.kernel.org>; Mon, 16 Aug 2021 22:38:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7180560ED5
	for <phone-devel@archiver.kernel.org>; Mon, 16 Aug 2021 22:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232495AbhHPWib (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 Aug 2021 18:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbhHPWib (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 Aug 2021 18:38:31 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA4BC061764
        for <phone-devel@vger.kernel.org>; Mon, 16 Aug 2021 15:37:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id i28so8373492ljm.7
        for <phone-devel@vger.kernel.org>; Mon, 16 Aug 2021 15:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=39HL+1BSTEP9McF8N5wJpHZqTmDxGof61S5w7T18t2c=;
        b=PIs+rFO4pY8Mv2zPiP7V6q/9YBvqlbSQNI7cVts9VvV0Hz3CkLMBnig1HrU7GnFYCE
         O0Q4VRNvYIVl119B7gJPknlTEUx+o0PWLDRPKeaE+JF0RKf6O01d+ztmYDR3LJ/5BZLK
         7aYlfzKganWO6Zz/nbb5QGdMwAmcFJ7YNW/EFtn8uVSguA0SKqkNu7u1yTFx760GaryM
         pJugUZKI8rd1dAmUwiCsf1Wm7L2TAcWTw/LSngxpoeua5nKPQoWX0dspsKulFQ0ntlCj
         QRhfsrxl6bi0Yqc0tXysl1ZoKWnjIEYeZMQHApP5C6ATdIyZ1qR+GBZy/BCrs8N5He8N
         H69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=39HL+1BSTEP9McF8N5wJpHZqTmDxGof61S5w7T18t2c=;
        b=pwH7G3RzG0KG8bIjjCjmaGsyZKPw0pKlezqLw84Hdqn9rqdGc2h3lXStLhZ0yFNqsa
         2mOFUeHLBtJp6Xu+8BZ2v89P9THixo4R5mc37Gz2UDb0rnPMCyFLrT35g/1BLX1uNsc5
         MbGVoKrL1CKZQ1XzAvRviRy5N5aqXBdVBGTxwITJCRcFk11jcyL0LCwnDr40rsPF2t+t
         NzRidDHsiJzGYBcoUPbA7h9gmLhRkWgn+1xIRl1aoJr8g8fzpOu40uV9vdQ9TivMtcFW
         OHncIKLwwVbaz8rB2msnjI7GUlpIEQdzY3n/IFA601wrGIdmvotMyLhUr9wYcK/3oFSo
         Npqw==
X-Gm-Message-State: AOAM530CMmUgqNTeaixzCQ7FgDivwMEQMq1X/9kiE/FAP7IAh7yQqb/d
        EaG8QHtd4FH+hje2Nf+eOSwsd/KT2xA2ibL3P83q10dmC7eL6A==
X-Google-Smtp-Source: ABdhPJxzmodtRFtigSTsXW3Hjcueq6Q1d1XD/3P7zoYrskkwNMcxgNm5kFyqkanm5Fu3lKOWWYYYiaLrR2KTWatt1+Q=
X-Received: by 2002:a05:651c:1507:: with SMTP id e7mr426852ljf.368.1629153476979;
 Mon, 16 Aug 2021 15:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210720144115.1525257-1-linus.walleij@linaro.org> <2f449f6e-bca0-3c70-4255-26619e957d44@foss.st.com>
In-Reply-To: <2f449f6e-bca0-3c70-4255-26619e957d44@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 00:37:46 +0200
Message-ID: <CACRpkdY2GnqNYqPPctqa_t5ax1SDo7nEc3a1jSncF8N-V-Da-g@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: core: Add a card quirk for non-hw busy detection
To:     Yann Gautier <yann.gautier@foss.st.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        stable <stable@vger.kernel.org>, phone-devel@vger.kernel.org,
        Ludovic Barre <ludovic.barre@st.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Stefan Hansson <newbyte@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Aug 16, 2021 at 4:03 PM Yann Gautier <yann.gautier@foss.st.com> wrote:

> I was just testing your patch on top of mmc/next.
> Whereas mmc/next is fine, with your patch I fail to pass MMC test 5
> (Multi-block write).
> I've got this error on STM32MP157C-EV1 board:
> [  108.956218] mmc0: Starting tests of card mmc0:aaaa...
> [  108.959862] mmc0: Test case 5. Multi-block write...
> [  108.995615] mmc0: Warning: Host did not wait for busy state to end.
> [  109.000483] mmc0: Result: ERROR (-110)
> Then nothing more happens.
>
> The test was done on an SD-card Sandisk Extreme Pro SDXC UHS-I mark 3,
> in DDR50 mode.
>
> I'll try to add more traces to see what happens.

What I think happens is:
- You are using the MMCI driver (correct?)
- My patch augments the driver to not use busydetect until we have
  determined that the card can do it (after reading extcsd etc)
- Before this patch, the MMCI would unconditionally use HW
  busy detect on any card.

Either we have managed to wire the MMCI driver so that it doesn't
work without HW busy detect anymore, you can easily test this
by doing this:

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 3765e2f4ad98..3a35f65491c8 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -270,10 +270,10 @@ static struct variant_data variant_stm32_sdmmc = {
        .datactrl_any_blocksz   = true,
        .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
        .stm32_idmabsize_mask   = GENMASK(12, 5),
-       .busy_timeout           = true,
-       .busy_detect            = true,
-       .busy_detect_flag       = MCI_STM32_BUSYD0,
-       .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
+       //.busy_timeout         = true,
+       //.busy_detect          = true,
+       //.busy_detect_flag     = MCI_STM32_BUSYD0,
+       //.busy_detect_mask     = MCI_STM32_BUSYD0ENDMASK,
        .init                   = sdmmc_variant_init,
 };

@@ -297,10 +297,10 @@ static struct variant_data variant_stm32_sdmmcv2 = {
        .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
        .stm32_idmabsize_mask   = GENMASK(16, 5),
        .dma_lli                = true,
-       .busy_timeout           = true,
-       .busy_detect            = true,
-       .busy_detect_flag       = MCI_STM32_BUSYD0,
-       .busy_detect_mask       = MCI_STM32_BUSYD0ENDMASK,
+       //.busy_timeout         = true,
+       //.busy_detect          = true,
+       //.busy_detect_flag     = MCI_STM32_BUSYD0,
+       //.busy_detect_mask     = MCI_STM32_BUSYD0ENDMASK,
        .init                   = sdmmc_variant_init,

Or else there is a card that cannot work without busy detect which
I find unlikely.

Yours,
Linus Walleij
