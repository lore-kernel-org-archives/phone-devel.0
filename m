Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2B7C433EF
	for <phone-devel@archiver.kernel.org>; Thu, 23 Sep 2021 21:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07D0C60F94
	for <phone-devel@archiver.kernel.org>; Thu, 23 Sep 2021 21:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243233AbhIWVQr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 23 Sep 2021 17:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243189AbhIWVQq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 23 Sep 2021 17:16:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81AC7C061756
        for <phone-devel@vger.kernel.org>; Thu, 23 Sep 2021 14:15:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z24so32074161lfu.13
        for <phone-devel@vger.kernel.org>; Thu, 23 Sep 2021 14:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f9fF1es1aEeH+o2sBBMLmPK2zQTL0jPUM9WO4klM+IA=;
        b=vSV3zeebm7WI+VqdkF7vS+UCyw08t3Sh3i5cSKiVxyJN6kImADE6c42pxwf0I+t8Oj
         u88Ra797Y4PaN0nwlQoLxQAydPBYLC/zhRTGx3a6Sxxe+WGsTAPgisVCLH6+kIXiZMnL
         hiuLnIwVuVOPfgg1obGzyD+5wiPg92JebqWvlUEEJi1a+7fXYHPBkDzxE53qEZyMx4r+
         4ieoV75QtMDWdsvDSdyoZI7r4i/KCapAt3EQtz4yBYWTGQlE1AMpaeqvz1mtoCiaZFWo
         BIm4+nxxg1DmhgnqB7MM8D8TzPBUCAZiG8feHRjP2KsUsmf+wUtHS48333q/P2rNuGDs
         6XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f9fF1es1aEeH+o2sBBMLmPK2zQTL0jPUM9WO4klM+IA=;
        b=afVHropZd7wp8yoB5IBk/th9MiRl0luqxqZCqNajtWgqnIg5E5qPg6TOpUfHeF1hsj
         g5TDpLvjbLS7zKIqrr6L7nVZ2nIEpKmceQ5ygZcfM3ktuCZa8hpOBNmWE5+Dr8nlR/ce
         cnO/rt5MEgld1cTYuMTeuCBMVtTXAwrEPprVLzOVjBy/bK6uAhCmhO9+BRsbS8BCmFEH
         eUl6T9NPX4EETQUgh+wi9jLH89eT2/Db9YDookz6KPB0ECbTD9NEHpt/ex0kNdskaxnG
         cbHsmpB9Z6HFfq/RWKeq1dCinNIqsQuXWQosmKoqllZuloKjs76kxH1GMBqulaBV9voK
         qD5A==
X-Gm-Message-State: AOAM532RfTJUUddnuGDOFnF7rbJ5lrpWablp4cGo6ulsUoLNHLSjXsUm
        vRylqje1S8tgEu4otnLzePPFldGZZX7yOX+3kK+83Q==
X-Google-Smtp-Source: ABdhPJyuSO61DwL5xrptJCfC+nHyEj2RbaWo2sXdQsh+r2DreGO7KINuSEchn0tzjfVrF/fRc/3HKOYOXXxnMkpW+Vo=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr6436551lfi.339.1632431712880;
 Thu, 23 Sep 2021 14:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210921162433.1858296-1-dmitry.baryshkov@linaro.org>
 <CACRpkdb15D0m7L-vO7RFcAaVuS7hdD8J=6=15TFgRgvvsw1e9g@mail.gmail.com> <B4GVZQ.IG4PDOTEQGB82@ixit.cz>
In-Reply-To: <B4GVZQ.IG4PDOTEQGB82@ixit.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Sep 2021 23:15:02 +0200
Message-ID: <CACRpkdZJb-ybj8o5hSxEgYbfLfxN96O4cfC9FYa6g5HPSc8yTw@mail.gmail.com>
Subject: Re: [PATCH] mfd: qcom-pm8xxx: switch away from using chained IRQ handlers
To:     David Heidelberg <david@ixit.cz>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, Sep 23, 2021 at 7:20 AM David Heidelberg <david@ixit.cz> wrote:

> with this patch, it does boot without any problems or warnings
> regarding to IRQ.

Excellent, let's apply it!

Yours,
Linus Walleij
