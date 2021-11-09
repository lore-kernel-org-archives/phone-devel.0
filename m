Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FF2C433EF
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDA3D61179
	for <phone-devel@archiver.kernel.org>; Tue,  9 Nov 2021 04:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242773AbhKIEpo (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 8 Nov 2021 23:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242763AbhKIEpn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 8 Nov 2021 23:45:43 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587F1C0613F5
        for <phone-devel@vger.kernel.org>; Mon,  8 Nov 2021 20:42:58 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id p11-20020a9d4e0b000000b0055a5741bff7so29088312otf.2
        for <phone-devel@vger.kernel.org>; Mon, 08 Nov 2021 20:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hRWrAVz0LbsjGfzT/KErKvm82LLvk3rt/5LNrrCj4jM=;
        b=k8LtbYvz/V8FJOqGJxyALA7GqYWynBUH520RA+hNxHBem4RnCwwK6YCLwweF0LCcnH
         4BIex3m870z6ZhvdQnLcfHM7XNK68wTrqQkDaTqysUGZqQq2GWtUzGIntFC2a2jLa4hj
         qsmMY3FoF+8JlwfacNNgHtKDw9ErBwNJxsbnhkH+zFnAe3FCjqFAK4pgSItnBCDNGhXt
         w9UqcIlc1ZDEaabVgGPH6WWDDWIvEgUK/ehJIAymx8qY+fcusnU75Ti+wb0t2GdyxWXq
         qg4rjaWAQJQtI2uyDbFLveQEiUt+ezSToGZE9+ncNwo5PBflEnagyIswz/JWyfInqaZ6
         dZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRWrAVz0LbsjGfzT/KErKvm82LLvk3rt/5LNrrCj4jM=;
        b=EUM7a/QlXCieGgbKbB4gUA3HlGV53rqF7P0jU29/D7fTohcJl8pPiFAtqIkyFb4KlV
         E8sBOMc3C8wrMM3+QyJrClYa0TowdFFeIR+4PMagVgMri3llqJ6PkFivXrwZsZUkqdd6
         SI0Y4PDzbs9Dum1RHE8tvu1lLyQc4OrQFVEubziYv9tM7r3i0SzwqR86dqpsjaIQK9X3
         Bm+1L8uxXjsU46qXi9pkqVyErhq34lGukdsrA1t5YMk7V6PzfvJ4B0u0lnHJcTjURJlB
         dtFXsWppCwn+QS/CaBqataVWGEBjaXZAAxfheocAFIX8ovbFVJbs0acexjCxX56wJ4tS
         cOOg==
X-Gm-Message-State: AOAM533dcigX5gZPJSrpGyJ4v+n8B+TCMSf/zQzde+UMQdWyMbxHlgnk
        YM9yep+W2grs/KfrItBhpRsMCuZ35MrHLTO2mveUqw==
X-Google-Smtp-Source: ABdhPJxiBqLFXtpx4U2A/SmFkodEEd+6sULFRqg+EnNMAnE2WeB72WVAAQ/aF3fE1KT6+Y/1vp13qdcNom199WfnBLk=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr3615949otk.179.1636432977687;
 Mon, 08 Nov 2021 20:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <20211027181350.91630-7-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-7-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:42:46 +0100
Message-ID: <CACRpkdbffWNHZZvP+cCU12umvt6T7cshAgxuDzu1OFanMVUFDQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] input: touchscreen: zinitix: Add touchkey support
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

> Zinitix touch controllers can use some of the sense lines for virtual
> keys (like those found on many phones). Add support for those keys.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
