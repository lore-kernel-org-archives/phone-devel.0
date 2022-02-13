Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FFDFC433EF
	for <phone-devel@archiver.kernel.org>; Sun, 13 Feb 2022 23:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238820AbiBMX4m (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 13 Feb 2022 18:56:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiBMX4k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 13 Feb 2022 18:56:40 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1444151E54
        for <phone-devel@vger.kernel.org>; Sun, 13 Feb 2022 15:56:34 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id p19so41290951ybc.6
        for <phone-devel@vger.kernel.org>; Sun, 13 Feb 2022 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZ2kK0goc3/vjQqJIQMCKc+OYazRpzayZNMisgl9DFY=;
        b=UP5OSsTqlReuUnbYMjUGsL07qwGo7iGqMbPaC3XQc1yjarLVGAyAoXdgCfAZvy9Wrh
         ZAFE5Qkgn4zkOwCNh3AWmw5f5G54p3pJlh7Z1qX6vphAcDEdzpJs2LTM7CsuMaycDpSU
         s/wSCrEGOjne/99Kmr34ZzlBLB7FSyWrFCQq7T8cq9rMqsM4QrovBMa3h6AMDN0t7nHt
         jf4vLcYwxJrkI/+yftzPmnvTXkGl8tzgPNcoYU3CDkdtUSmX+M88j6cxOz/PUyzZ+D//
         77lm8yz2tr+RH/gZVkTQJF8f8ZbL3IDr57f3MG8QRfQF6Q8eyRW/BA55Hvj8UEogih4H
         Dcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZ2kK0goc3/vjQqJIQMCKc+OYazRpzayZNMisgl9DFY=;
        b=goM6cEo4xWOj85zN0wsNxCmrleI/SSZgJ0+4S/IG859hp2PnTJtAK1rvpOtQqp56qZ
         2iZSWS7OA4/TkCH3n2m6/CwDfONJvE67M0aLXj/hFX1vkfvXDn8fynDP/2/DADcfC7z4
         zvtVRIiJY7xn+dulNprKg6VnIGUhxGL+9ulgyQTd2Qp15Fur/fCdIJK+JbpXN7xjkt8r
         4emBEE5SxQioeUmSfi+Ev1HwweSWHa1/d5dNFqfPYnELQuBuooKTJgVkE+KPBIvB6qUb
         vd8+LnyVg5kDbdCm6mwbs+Xu2WQH9D34EKcPZROvL5k3ugiv5ED7XSLJZzfvX4NgppjR
         LNIQ==
X-Gm-Message-State: AOAM530Znje0w6NpHtU9mV7p3pCt4gu26VmCrQE2Tbgaq/GBIcMMLI2H
        QAG4IR2vfhRcswWXmruf81IoQwsMH7yNeIW1GAyhZQ==
X-Google-Smtp-Source: ABdhPJyg3vLyU0FBozuNK3IsfFSagbJAV6M3fTahC/Il4vNxR7f8zu0weiIO18uCVj4p/4tDjSzhjpyqTVsW4G9TlRE=
X-Received: by 2002:a25:ce03:: with SMTP id x3mr10298940ybe.587.1644796593303;
 Sun, 13 Feb 2022 15:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20210720144115.1525257-1-linus.walleij@linaro.org>
In-Reply-To: <20210720144115.1525257-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Feb 2022 00:56:22 +0100
Message-ID: <CACRpkdZHhGu_E+WZQ2rCXHdnWKe6oEO_heaOnf2dYuaOoXOe5Q@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: core: Add a card quirk for non-hw busy detection
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc:     stable@vger.kernel.org, phone-devel@vger.kernel.org,
        Ludovic Barre <ludovic.Barre@st.com>,
        Stephan Gerhold <stephan@gerhold.net>, newbyte@disroot.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Some updates on this issue:

We no longer get lockups as of kernel v5.17-rc1.

The console however says things like this:

[    1.979485] mmci-pl18x 80005000.mmc: mmc2: PL180 manf 80 rev4 at
0x80005000 irq 93,0 (pio)
[    1.987943] mmci-pl18x 80005000.mmc: DMA channels RX dma0chan6, TX dma0chan7
[    3.204496] mmc2: Card stuck being busy! __mmc_poll_for_busy
[    4.284431] mmc2: Card stuck being busy! __mmc_poll_for_busy

And after this it never finds the partitions on the card.

So the issue isn't gone, eMMC is still unusable on Skomer and Codina,
but the issue no longer hangs the whole MMC/SD stack which is nicer.

Yours,
Linus Walleij
