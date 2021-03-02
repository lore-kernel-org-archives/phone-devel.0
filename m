Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF991C433DB
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A162764EF0
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443177AbhCBNwi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 Mar 2021 08:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348425AbhCBIwW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 2 Mar 2021 03:52:22 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16843C061356
        for <phone-devel@vger.kernel.org>; Tue,  2 Mar 2021 00:50:43 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id w9so8034273edt.13
        for <phone-devel@vger.kernel.org>; Tue, 02 Mar 2021 00:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1etITy7cj5GhtJLa/FOQQXW7yboxkS0n4AWEfPrYBhE=;
        b=SVnqXAT2OzXedVGcbW2uy9H4c0GQhemJuAe5rGbGGgyiluQC6AQ918pKVQGYNlLfNK
         0doPmSURVkoW6gt/foXFqOoCgNjcg+qqQDzS6vaNjwuYPufpikItgpmAVi1eivgcnObQ
         ZkLzjLUSAYVLD2EWyui64uf1Rk0/bBRO8MubNQzf5dIDq10sD/YXHsPMNYt6wDCQ0zk3
         oBwZ2Yds2e+oX5+MCwtQrGDnA1TCJKvE9P4N4cZ8JQGqHQFUT2Bw1tkOoFBYuU6YRoH/
         KZBg2kT94hIyPKzh2E6PpqJo62fgnNjmuxD+y3xiSRsFpDq0n44gb1hqN412y4R5iDyF
         HQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1etITy7cj5GhtJLa/FOQQXW7yboxkS0n4AWEfPrYBhE=;
        b=jVix595IivO59jkU8Eo9WvEYdRaHRy3TjmPDI/hw9mNJBLoy9M29FP1YwQUyysWTWd
         JXk8ok3lDJxHVFab0kowLSwFhfyDCoiDz1my5s2snbJXBp2c6IMznoKJKFSIN6577Ccq
         mmnA39+j5y0U2VADeDAFSDZ6tXZWug/IUc9clj6/4agRbiZNeO0gTpyHgh8WcK/G6Pyp
         /T5TTbTNz00l38pRl7iOHMnHGMx7P/aZt6SxB9CVjSDmDvBmCaHCYr0NUl7CpfiP/IrZ
         5/HWBB6JN/QvfJfgOET3JjOyN1qwj/m7miSdsS3XJBnvthD/wjitT1DKxsTQakHEOWdF
         5jZw==
X-Gm-Message-State: AOAM531w5NFahZ5T62fYFVHJm8eDbbf8OSFmnl/LrWm9ik/gcYcj2N5O
        XEMMEdn4DpJqd3Bu7u8Nvj2xb7BQAU8ekALZwXfywg==
X-Google-Smtp-Source: ABdhPJyf27d0G3Qc/JOKGJQ1WR1jXyvXZJwqMV4HEIs881pPKts0F6S41TVLXiaBM4XZskAkhgkuyBI08GKfKpBz6fk=
X-Received: by 2002:aa7:cf16:: with SMTP id a22mr19218786edy.288.1614675041833;
 Tue, 02 Mar 2021 00:50:41 -0800 (PST)
MIME-Version: 1.0
References: <20210216163647.34264-1-vincent.knecht@mailoo.org>
In-Reply-To: <20210216163647.34264-1-vincent.knecht@mailoo.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 09:50:30 +0100
Message-ID: <CACRpkdacDYg+254gqaNjDMdu8n-LzvguxLwX2w8LeGCyLLGaNQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: input/touchscreen: add bindings for msg2638
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, Feb 16, 2021 at 5:38 PM Vincent Knecht
<vincent.knecht@mailoo.org> wrote:

> This adds dts bindings for the mstar msg2638 touchscreen.
>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>

This looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
