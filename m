Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DECC433F5
	for <phone-devel@archiver.kernel.org>; Tue,  4 Jan 2022 21:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbiADVEx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 4 Jan 2022 16:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232349AbiADVEx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 4 Jan 2022 16:04:53 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E6E2C061785
        for <phone-devel@vger.kernel.org>; Tue,  4 Jan 2022 13:04:53 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id a26-20020a9d6e9a000000b0058f37eeb861so46255498otr.9
        for <phone-devel@vger.kernel.org>; Tue, 04 Jan 2022 13:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cCtePTanf/zW9lVfq/J1G105iUcs2zw4EeWuPDxMyOg=;
        b=SZR7F1/1uB7p6V+WD0+oJ3EQMwTYAYd2B1LlLdgSJPGsX33kqc58llm3enahv3FalU
         t5fahl+BMszCOIYXR4OcP7D2dFSfKtS5S+YHxGlvt8Xa/iKPreIlB9+sGLOeA6xShl9u
         JCft+yOXzE/xP/YYXpANG/OPXvALLTUGGuyKdmS23G16y3SkXu7NSfJiJ3wNOFjLuKiQ
         5sNHJzTFGZaGrtWXmw1epJboN8u+DF0+mZfvNIVPFHtg3wOQIWg8BV4LWW0XMwaSsZTi
         A7OegrgEEEOsPT/PEdwqnYla2jBPGXOzzAASsxHNN5aTnUmjG7elBZEaasscN/yMwgKo
         M/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCtePTanf/zW9lVfq/J1G105iUcs2zw4EeWuPDxMyOg=;
        b=1KrEc6UhwEwO2VC8HsBo1M88lP55azm1ncY0fJd1cAcnr8AiXa7eEoC58QpmKRFCgZ
         GwsUhhhD1vMHJ4Ic5+GeYp/46+1xxwsNUqIR+bGLpAJkvbJaQzrZ1UMjNggPkgRL3zzy
         mAh8OUshKDo+tcPrPpj9GdG1HxBdAqndXjRS6eWbZ8sTZS1iXVOmoJ0wweWApImvpXNO
         q5x3BpPvXBhjZ+aYvLLnSrntop1OCEKX65Uc6WR793Qg99za+R+ECQlIBUzpGjXB++cr
         dj3RGWJlvlCnk6657vp6BtJYHKKh5j97KyNrZf8Qyvaymgaouor0s63TBSDYLWrFsUBi
         oxIA==
X-Gm-Message-State: AOAM530q9wxIMn106y6N/99RrLv4wQXZk9ZrPL8KkKlzJQzwctMIIrDu
        0ZxJ+zlELtqvYAs64gSuYE04F2jIlTrpRWwlMMgReA==
X-Google-Smtp-Source: ABdhPJwUMXIwz4r+UdDrcL9aS4b+27UrKQWj5x7N6066VYRnyXlK1ovNwa/Fnwpyy5CAQR+HcBXlgATmy0ZFTLTG2Ok=
X-Received: by 2002:a9d:463:: with SMTP id 90mr37113104otc.35.1641330292493;
 Tue, 04 Jan 2022 13:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jan 2022 22:04:40 +0100
Message-ID: <CACRpkdaumfXijp_QGU8hL9TTmFYBNaaBe+_fuc1hCJnA_CfWNw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
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

Hi Nikita,

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> This series adds support for the touch-keys that can be present on some
> touchscreen configurations, adds the compatible for bt532 and fixes a
> small race condition bug in the driver probe function.

This appears unaddressed since October?
I see there are just some small nits in patch 5 & 6 to fix, then
it is finished.

Do you have time to pick it up for kernel v5.17 instead?
Make sure to collect all Reviewed-by on this series.

Yours,
Linus Walleij
