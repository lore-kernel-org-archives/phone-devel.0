Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CE1C197A0
	for <phone-devel@archiver.kernel.org>; Fri, 17 Nov 2023 08:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345736AbjKQItl (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 17 Nov 2023 03:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345723AbjKQItj (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 17 Nov 2023 03:49:39 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1346D4F
        for <phone-devel@vger.kernel.org>; Fri, 17 Nov 2023 00:49:35 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-da041ffef81so1809728276.0
        for <phone-devel@vger.kernel.org>; Fri, 17 Nov 2023 00:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700210975; x=1700815775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fg3YPX5Dy+CQX12ys+Q6QMbQjdpnTP0C/HigltSDFY=;
        b=Tz3UWd6EkA+MEpNFaYoudS/WKE+j/ZaFOD6egZQAR2qnkVg6M1AVuYEic578SmtuNK
         g5QBXr3Gh4Xz2OnaeYJkCKHdaSIAFatAqfvtJAbnsa3qFkSMdV7VsaJDm8OiyoFish6F
         cJF7oY2W+gmkBa+NlKJUNGsG37XJTOAkazxJjqZvwaGqDTLsngAgScFWKIY8z7dIo37D
         E3X0YAazMijX7YnZXd4u0Yqs9Gg2ak6QRLBHvPx+pSVp/J27CUZS3ucxcCsaynWWU5Hl
         8zmNB+ac91rY/SHtXecsJNSqor5ErZnktpTkEZC2lCE27eOESFqIfrDJMzZbyGYhZWr1
         fobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210975; x=1700815775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fg3YPX5Dy+CQX12ys+Q6QMbQjdpnTP0C/HigltSDFY=;
        b=aDLXIOYwJ6ilkiubxhcpfAHgXl5YMw7Lp8868OcvfnXKKk020J11oSnzJg0+f/OnJ+
         Q4jbpYk3a97V9LQ7LRODXGixZvVrj54pqVR1haWxmjnujJiFW0HbJhqUhDhHogDq42i2
         vL9fl0kZvOeaeQPyt5+dtu/+om6gNZ7mrv/bBtc/GHmy/LVuhjVZDU38k9yXHRMhegqY
         yg8nSydHEcXNkADE4gtbDby4Ou9NvyMpW5XuYf1LTKzbAQTGRctCctecUFJRob4zkN6/
         aDPDfH8eU7FBkV3maFycgGyKiv2Q+644jpMCOnNXqeMpagOsFvAUr/a49Ho97lVxaYuO
         Wkyw==
X-Gm-Message-State: AOJu0Yxw2Kk83/l9dRFQB2b3v+nuLhW8DBdf6uLs3/Av09Il/LFCH45D
        1skNqdFPGx2bmp1vtbub+adILBOkfr5Xh+F86t5CkA==
X-Google-Smtp-Source: AGHT+IFYhDoHCjgQK3p6R3RwwqaeYz2G8wdxXKbFS2D8YfO3O8hqxeedYpiMAEMMfvXeYoSosyPEdusuHlhtcdD01WQ=
X-Received: by 2002:a25:74c9:0:b0:da0:447a:e9d8 with SMTP id
 p192-20020a2574c9000000b00da0447ae9d8mr19574769ybc.10.1700210974960; Fri, 17
 Nov 2023 00:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20231105102944.1974512-1-avri.altman@wdc.com>
In-Reply-To: <20231105102944.1974512-1-avri.altman@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Nov 2023 09:49:22 +0100
Message-ID: <CACRpkdZB_auHQan5Jq5FbO0wqnC6ns5Y_SzqPN7t2gGkhq9jHg@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Remove obsolete quirk for Sandisk cards
To:     Avri Altman <avri.altman@wdc.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Nov 5, 2023 at 11:30=E2=80=AFAM Avri Altman <avri.altman@wdc.com> w=
rote:

> This quirk applies to an old set of Sandisk cards that are no longer
> being sold for many years now, and it is vanishingly unlikely that will
> ever meet a V6.7 kernel.
>
> I came across those old cards when I tried to decide what to do with
> Sandisk cards that their quirk is designated by OEM id. For many years
> we read wrong oemid, reading 16 bits instead of 8. Fixing it however,
> turned out to be impractical, and it's better that each eMMC vendor will
> handle its own devices.
>
> Signed-off-by: Avri Altman <avri.altman@wdc.com>

NAK why are you assuming these are not in use with v6.7?

One of these eMMC cards is in use on Nokia n900 which has an
active user community:
https://wiki.postmarketos.org/wiki/Nokia_N900_(nokia-n900)

I am using several of them on different ST-Ericsson U8500-based
systems, including the HREF reference design that even Ulf is
using now and then.

Yours,
Linus Walleij
