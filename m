Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E842EC433F5
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:41:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5416611AF
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242742AbhKIEon (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242726AbhKIEom (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Nov 2021 23:44:42 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047C6C0613F5
        for <phone-devel@vger.kernel.org>; Mon,  8 Nov 2021 20:41:56 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id u2so31518655oiu.12
        for <phone-devel@vger.kernel.org>; Mon, 08 Nov 2021 20:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSA7N9mCLquT1rd2wImQ3Ami6xqCzBhYDYxbfoazN4k=;
        b=Y9gyFDzcL9BP1DFZxJI+XpovLOx5lPURxi5EvHj8XntBd5CfTCfGFPnKETmHqHJvsE
         1qasAijOOo0MAzsLcdhx+uyaoSgidb9FHy8Hm+lhm9HGRqf+YySiPULFw60CfAhXamc8
         /Qm7bZSGVcSMuxp+eVRoa1g1Eb3JCuus4RNx9FHetRRhXHiuG34spSb3D0P/aAElH/ZE
         OhwCpI9ss9uoDf3FH4LE+++3g4FeBJ5uul7TayckUQk9Hv2VONcyxUZqeSVhPVFfl4vu
         Q22MPO5PkKbFoSxuBE8VeagXLPknXtmLmnxju71dTgfbHFvu0GSIwUa2CWCElyOFhpZS
         W9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSA7N9mCLquT1rd2wImQ3Ami6xqCzBhYDYxbfoazN4k=;
        b=QCGVrb3U/L1f5hmhANfeCQgiK7+Mj45mbhabS0BhTqIiY9E7upYicjcDj9Nmh7LqIE
         1WSTFHQXgU7MWf+SAJm8Jda4epNlwogDDN2NXCc0wzqYsU9PgiLkgkJPoDuz638mBlOq
         u5AbbSV6ssTsZWMjmLUWhcTtWKn9tHdh5HOS4paJPKbp+N5h/W9Fj+77eWvLJKTM7Nz6
         3xtbu+nFW8tAo1t+5RRYHXBzafD90rPW9Qq4ZTxoFSKRFcNH734OcHzim5r9w8Ne/6BT
         4kbZPa+LZi1DaZAVnSIOsjLNTli0edahv+pfUQ1jjlOp1FGhPY/X7uhmsasObFHgdtHK
         nRoQ==
X-Gm-Message-State: AOAM532l65a9LrGz8B50s9eNAbBShXfhxYHZQ5padSoMWebZ1IEocYRc
        M3INjTwAutwKLJH0QuJIs3HGPhDgyOZzGjlTlmKlLw==
X-Google-Smtp-Source: ABdhPJzvkyEHDjEXckfkD+M8/nBngNkvmoi95rRujcZk7+h5VicjnIaF5ti9YLbEY8bDbU7657FdlwK3LXVVQP4CYt0=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3116254ois.132.1636432916285;
 Mon, 08 Nov 2021 20:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-5-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-5-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:41:44 +0100
Message-ID: <CACRpkdZOPz1uCCnLMKJmivVFXW4YLbFF0PXe=LhyCTtXGtf9hQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] input: touchscreen: zinitix: Add compatible for bt532
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> Zinitix BT532 is another touch controller that seem to implement the
> same interface as an already supported BT541. Add it to the driver.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
