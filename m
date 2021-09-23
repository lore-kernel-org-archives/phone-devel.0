Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B512C433EF
	for <phone-devel@archiver.kernel.org>; Thu, 23 Sep 2021 00:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EA2661131
	for <phone-devel@archiver.kernel.org>; Thu, 23 Sep 2021 00:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234042AbhIWAF4 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 22 Sep 2021 20:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhIWAFx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 22 Sep 2021 20:05:53 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A0DC061756
        for <phone-devel@vger.kernel.org>; Wed, 22 Sep 2021 17:04:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y28so18927254lfb.0
        for <phone-devel@vger.kernel.org>; Wed, 22 Sep 2021 17:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sa3iqWTO0RSINxC6pdN7sv6Khz55kfHyIbBdNZkvBp4=;
        b=OTFX9ZJLD5vh0fKJTVOUpE2Zrv1mtIFUZoxaIdu+/Z8ekt3vtoHq9DfqyPDOQKM5Qp
         fm0X/JKT4FZ+fNpYGrHe9kjjBLdkS6IVFbyBOk72qtaYrWRSTXFOXejvI92QiP1yP9lI
         1eqx0xpNNdQUBZmNQO7wNm6OcyF1UNTl3X0d9/nD156HuE77iYWDaamArGvrq4Zmn5wC
         R66btAiYOjOXDOQuJqKzo6iiyvDbQN/+NpipWY+SRMGfTCuPMGeiQGAreEv3Cw6gObqD
         OBIF3UNpZkpHDxHxZgzHO5hy7cvH7ODAiy0cd9soNkLOsjjtEnB0vqvMr7buHSxQZmfk
         mHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sa3iqWTO0RSINxC6pdN7sv6Khz55kfHyIbBdNZkvBp4=;
        b=bjz2bWc3xMHjRHR4qQ0zwMWXbhbsMibWpxQiKr4Yz/GJSfQ9vpc4W6qC1Crm6Ku/hI
         CIAHrIa+re4Fny3wH5IbtTI7fE+b6lwCGT9JxFF8+PZKsWE4xgT8kJtw9+xENYZWJM9D
         YiVhc6rcmNn4BXVIxGTNvZysZ9ACtOrituPHtK+/6NU5+jIUysUD9Y6OCfAzviVQ/Hv1
         3EJ8EGR6Jq3K+TpCb6l7BNmmy6q3R91HaG+jEP76pTtxOp8oSEkbWDGCj3a2t+JNsiV8
         XGtuOIZGKyx9Skp1XERtXzITlVuIlUgdxk5F9Z6LLOrPylCZmaMXpYCGzcVxlhXm4EvV
         G/NA==
X-Gm-Message-State: AOAM530nMzLGmAL1AFqK5jdrw1y4Iji/6a3eYMxQegLxlLJ2MSip3aL9
        FUUMx1ghd0AEIP4dh+bab78LDbkmSeVYgUnJFmmNNA==
X-Google-Smtp-Source: ABdhPJwsRrPN9D5ir08pDg3q5mLEmvyUxXdigIoSb7uBDAMPrKXkSs+VHrXem7+1aFU6lGf2cgBHR3FPOw9sGQqHh4E=
X-Received: by 2002:a2e:4c19:: with SMTP id z25mr2083292lja.145.1632355460966;
 Wed, 22 Sep 2021 17:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 02:04:10 +0200
Message-ID: <CACRpkdb15D0m7L-vO7RFcAaVuS7hdD8J=6=15TFgRgvvsw1e9g@mail.gmail.com>
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, Sep 21, 2021 at 6:24 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I sent this patch:
https://lore.kernel.org/lkml/20210819154400.51932-1-linus.walleij@linaro.org/

David Heidelberg reported that it didn't work for him.

David can you test Dmitry's patch instead and see if that works
for you, I suppose I could have some bug in my patch :/
It would be nice with a Tested-by from David.

FWIW the code looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
