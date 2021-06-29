Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA88C11F67
	for <phone-devel@archiver.kernel.org>; Tue, 29 Jun 2021 17:23:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D041161D88
	for <phone-devel@archiver.kernel.org>; Tue, 29 Jun 2021 17:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhF2RZp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 29 Jun 2021 13:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234009AbhF2RZm (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 29 Jun 2021 13:25:42 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267FCC061760
        for <phone-devel@vger.kernel.org>; Tue, 29 Jun 2021 10:23:14 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id f30so40908873lfj.1
        for <phone-devel@vger.kernel.org>; Tue, 29 Jun 2021 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Pz3f/hfxl1jaPM1RWGOapwPCZqFLRRrBPgL3gkfM0I=;
        b=TF6bukI8TwCub3roSkIUFJ7VsCt7/GmXaAGXcDnjo+eqv5RIM7y4BXq/rrA5qMF6Qe
         4VABQO62w6cMCR2ITje8PVcSzvp4ECtSsvrRUjlYQ06fgNLoQyjR4f0kk8YWKYO1zpKm
         kEvtvkDVjz4miMarOIxK+BeZUjeXaIeHNH2C0is1y+6XYtRqwSmnk7gCLMG0KCrPk94E
         TP3wqWUat2svi9Jfk4+vlazJCsN0JlvAk2+s3uc8MLgdiVzBTqEBvQwkF15pYLc46rKm
         LLmVIyPFpS9nfiHx6SXilni1+ektpxpx/yQZBaETNKiU3jdlknxbO4XECMTMq4FGLElz
         cPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Pz3f/hfxl1jaPM1RWGOapwPCZqFLRRrBPgL3gkfM0I=;
        b=kU8BFI9EdeYvYiB35AAAoEo388r7GZWtPTdpBeD6OLZK9Ii5qSlKaYyeIllP92WDoz
         N3n9tnPdL2lzvpXPSsovrfgnsMGB3oVL+ktlVBm1AtSefVmEBLm9Zv+Juz9/CxbbGzPM
         T6jIyJ4aF4Gw8Tov7WTEquYIfx/3vt/Q1BkWUDQeJL/ewcKyMRjvsLz6VmaDgjfFYe3W
         xmZfbzsErrzIMevkbwdIkoYBLZVN4kePsNUSugp+I9Jof95dX6gaQNyGOEIt3WykWAMn
         RDz05hufRfmpU+wBiRZruiO6F5uVKSdVGDnWOp+miX1wPNqpdLTV1xiL0TcP4DCEKpm/
         tV7w==
X-Gm-Message-State: AOAM531z78ErOm34/lO72tYnPCiEwTjFXrOi70tc7zHAL2plzQPgVr7A
        4U+Qr3QO4ECQgE4m/aCkKMOwKWIWtY2sjJkdd+qdSQ==
X-Google-Smtp-Source: ABdhPJyJhVaAvE4YGViHDSd9N2pi9oKKDRsNW3RIYB4CnGmjHuWFJEuSik+FaQYV7C20D5XCdKjhgaBtZ1fvIsQBap8=
X-Received: by 2002:ac2:5237:: with SMTP id i23mr25187602lfl.29.1624987392429;
 Tue, 29 Jun 2021 10:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210628232955.3327484-1-linus.walleij@linaro.org> <CAPDyKFpfJC=KAZ5dGAso2zcgBic4uCkOiDFQ0ZA5Zi7UDUeEug@mail.gmail.com>
In-Reply-To: <CAPDyKFpfJC=KAZ5dGAso2zcgBic4uCkOiDFQ0ZA5Zi7UDUeEug@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Jun 2021 19:23:00 +0200
Message-ID: <CACRpkdY4kegTzeqPHNEd3=hOdqSXAvJq+LehLbf09mUybU0VfA@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Add a card quirk for broken boot partitions
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>, newbyte@disroot.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, Jun 29, 2021 at 3:56 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> I would
> prefer some more details before I am ready to apply this. For example,
> more exactly, what happens when the stall is triggered? Can you
> provide some more debug info, perhaps with the sequence of commands
> that triggers the error?

I have added debug prints and it looks like this, first tons of normal
traffick switching between the different partitions with CMD6,
both 0 (main), 1 (boot0) and 2 (boot1) are investigated before
results. At the end of the trail this happens:

[   54.171173] mmc_host mmc2: start CMD18 arg 00005010
[   54.171478] mmc_host mmc2: start CMD18 arg 00005028
[   54.172058] mmc_host mmc2: start CMD18 arg 00005048
[   54.172790] mmc_host mmc2: start CMD18 arg 00005088
[   54.174926] mmc_host mmc2: start CMD18 arg 00005108
[   54.177581] mmc_host mmc2: start CMD18 arg 00015038
[   54.178039] mmc_host mmc2: start CMD18 arg 00066400
[   54.178222] mmc_host mmc2: start CMD18 arg 00004880
[   54.178497] mmc_host mmc2: start CMD18 arg 00000040
[   54.178649] mmc_host mmc2: start CMD18 arg 00015078
[   54.178894] mmc_host mmc2: start CMD18 arg 00066800
[   54.179382] mmc2: modify EXT_CSD, index 179, value: 1, set 1, timing 0
[   54.179412] mmc_host mmc2: start CMD6 arg 03b30101
[   54.180145] mmc2 modify EXT_CSD completed (0)
[   54.180175] mmc_host mmc2: start CMD13 arg 00010000
[   54.180267] mmc_host mmc2: start CMD18 arg 00001ff0
[   54.180755] mmc2: modify EXT_CSD, index 179, value: 0, set 1, timing 0
[   54.180786] mmc_host mmc2: start CMD6 arg 03b30001
[   54.180847] mmc2 modify EXT_CSD completed (0)
[   54.180847] mmc_host mmc2: start CMD13 arg 00010000
[   54.180938] mmc_host mmc2: start CMD18 arg 00015010
[   54.181121] mmc_host mmc2: start CMD18 arg 00015028
[   54.181365] mmc_host mmc2: start CMD18 arg 00015048
[   54.182312] mmc_host mmc2: start CMD18 arg 00015088
[   54.183654] mmc_host mmc2: start CMD18 arg 00015108
[   54.186187] mmc_host mmc2: start CMD18 arg 00066018
[   54.186767] mmc_host mmc2: start CMD18 arg 00004900
[   54.186950] mmc_host mmc2: start CMD18 arg 00000080
[   54.187225] mmc_host mmc2: start CMD18 arg 00066038
[   54.187469] mmc_host mmc2: start CMD18 arg 00004a00
[   54.187713] mmc_host mmc2: start CMD18 arg 00066078
[   54.187988] mmc_host mmc2: start CMD18 arg 00004c00
[   54.188293] mmc2: modify EXT_CSD, index 179, value: 1, set 1, timing 0
[   54.188323] mmc_host mmc2: start CMD6 arg 03b30101
[   54.188354] mmc2 modify EXT_CSD completed (0)
[   54.188385] mmc_host mmc2: start CMD13 arg 00010000
[   54.188446] mmc_host mmc2: start CMD18 arg 00000000
[   54.189300] mmc2: modify EXT_CSD, index 179, value: 0, set 1, timing 0
[   54.189331] mmc_host mmc2: start CMD6 arg 03b30001

After this CMD6 just hangs there. Nothing proceeds on mmc2 (the eMMC)
ever again.

> Moreover, it would be nice to know exactly where in the code the stall
> happens. Could it be that it's the mmc_wait_for_cmd() that never
> returns in __mmc_switch(), when sending the CMD6 to switch the
> partition?

__mmc_switch() initiates a partition switch, then
issues CMD6. Then:

__mmc_switch()
  mmc_wait_for_cmd()
    mmc_wait_for_req()
    __mmc_start_req()
      mmc_wait_for_req_done()

We wait forever in mmc_wait_for_req_done() since the completion
never arrives.

> My main worry is that we should not set a card quirk for an eMMC that
> could be working fine (on some other platforms), that's why I want us
> to be sure.

Yes we need to get to the bottom of this.

One theory as we discussed on chat is that the busy detect
for the previous command isn't working as it should leading us
to prematurely start CMD6 while the previous CMD18 is actually still
busy.

After testing, this appears to be true!

I disabled hardware busy detect in mmci.c like this:

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index 984d35055156..cffe95e32b9a 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -180,10 +180,10 @@ static struct variant_data variant_ux500 = {
        .f_max                  = 100000000,
        .signal_direction       = true,
        .pwrreg_clkgate         = true,
-       .busy_detect            = true,
-       .busy_dpsm_flag         = MCI_DPSM_ST_BUSYMODE,
-       .busy_detect_flag       = MCI_ST_CARDBUSY,
-       .busy_detect_mask       = MCI_ST_BUSYENDMASK,
+       //.busy_detect          = true,
+       //.busy_dpsm_flag               = MCI_DPSM_ST_BUSYMODE,
+       //.busy_detect_flag     = MCI_ST_CARDBUSY,
+       //.busy_detect_mask     = MCI_ST_BUSYENDMASK,
        .pwrreg_nopower         = true,
        .mmcimask1              = true,
        .irq_pio_mask           = MCI_IRQ_PIO_MASK,
@@ -215,10 +215,10 @@ static struct variant_data variant_ux500v2 = {
        .f_max                  = 100000000,
        .signal_direction       = true,
        .pwrreg_clkgate         = true,
-       .busy_detect            = true,
-       .busy_dpsm_flag         = MCI_DPSM_ST_BUSYMODE,
-       .busy_detect_flag       = MCI_ST_CARDBUSY,
-       .busy_detect_mask       = MCI_ST_BUSYENDMASK,
+       // .busy_detect         = true,
+       //.busy_dpsm_flag               = MCI_DPSM_ST_BUSYMODE,
+       //.busy_detect_flag     = MCI_ST_CARDBUSY,
+       //.busy_detect_mask     = MCI_ST_BUSYENDMASK,
        .pwrreg_nopower         = true,
        .mmcimask1              = true,
        .irq_pio_mask           = MCI_IRQ_PIO_MASK,

Now it works.

So now I am thinking about a quirk that disables hardware busy
detect on some older eMMC cards instead, my current
assumption is that the hardware busy detect on these eMMCs
is glitchy. It works a bit but not good enough.

I think you also mentioned the timeout in EXT_CSD maybe not being
long enough? How do I play around with this?
MMC_QUIRK_LONG_READ_TIME?

Yours,
Linus Walleij
