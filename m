Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DCFC001DB
	for <phone-devel@archiver.kernel.org>; Mon,  7 Aug 2023 13:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjHGNct (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Aug 2023 09:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjHGNcs (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Aug 2023 09:32:48 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3B51724
        for <phone-devel@vger.kernel.org>; Mon,  7 Aug 2023 06:32:29 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5860c7fc2fcso46346957b3.2
        for <phone-devel@vger.kernel.org>; Mon, 07 Aug 2023 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691415091; x=1692019891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77FFwVNR6VccWA56eXDJXbo5f9GOe5qfBgpPLU1lyeI=;
        b=vo3pI61ugEwL+E90t+QyewuSiHEJNVoGpi5eDkheF1WzYk7EPT4hsCZVhWG7VNnGGP
         2kRtKNkTlYuQrdLFX7LfGgwUitZSW0StTJRCTUs37XihTdKrIu/fwlvA/ci06v5yCs1R
         uUywlRG6P9GZWUHrEGGWnHBDYztqtzzOjFfOnAIGrCzfhZrTU0w6GEqYpL13qOtd24zQ
         1RlO06m+u+cDMvY83wjCgz8lzdX4WVU6QPfF3oFckpbNQt2N0D50S17MLpOlA9vA1XLi
         10R1SmMkh2pHjsuzhbVDWnXx63r0jE7EtoThO4pktENrdl2IXyMN7bPdCSNVoZfCy0Oy
         v7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415091; x=1692019891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77FFwVNR6VccWA56eXDJXbo5f9GOe5qfBgpPLU1lyeI=;
        b=d13suKeUrJoYkyFnpK/l/njJpYlWcsLcKn3/L9vw4AzSe6UvJI8j8cQnRM3rMdZ3HP
         maKAhxMqC8udJChTu8isuDcRlu7BmJPAaKMDVfRrpG3bJCmkJga/KeX9ju6cRWpC1jlk
         eLQIfF6xfUnrQQzgIuXfja3+Kd4q9urXrN7Ju4bEkoObJ7oO4/vS0pCnhM1O/5pGZzq2
         03F3c9ILgKKhWqmNU9jtD1fOJNC4D3bPjFc0ue5h9pmF+wkSJ1ayk8CJwk5l5Cyi61Cg
         p2yFsaitnpXm+tiVatOfV+CwWnER6fZbyDgmOzA88kaceVHoXh/QXigxwqjd5GcmIa6T
         FHBQ==
X-Gm-Message-State: AOJu0YwOvy8r4d+odMXbM23J8zW4oUHP4vhdAKdk3rZpmW5z+ON+zcyp
        6/lgdHeFV/SN6AyS5SPLUQyjERqodFBvicDgnehpGQ==
X-Google-Smtp-Source: AGHT+IGIYZn00w6gD6Z/MkLFgzZSDuhV8m/QCC+e8oE+tOcEDDUxG8sSwO0x65+BCApTE3Zz6bXa9bBFs7SI2w2lL4o=
X-Received: by 2002:a25:cec8:0:b0:d3a:28bb:2c95 with SMTP id
 x191-20020a25cec8000000b00d3a28bb2c95mr7392239ybe.22.1691415091461; Mon, 07
 Aug 2023 06:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230727162909.6031-1-duje.mihanovic@skole.hr>
 <20230727162909.6031-3-duje.mihanovic@skole.hr> <ZMKd+CoWu7QjOxHo@smile.fi.intel.com>
 <13320053.uLZWGnKmhe@radijator>
In-Reply-To: <13320053.uLZWGnKmhe@radijator>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Aug 2023 15:31:19 +0200
Message-ID: <CACRpkdZdpHjh_CCmuT2ORpuZ=CbUECW7dBXsL+P+aNvfMYmEuA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] gpio: pxa: use dynamic allocation of base
To:     =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afaerber@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sun, Jul 30, 2023 at 11:18=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovi=
c@skole.hr> wrote:
> On Thursday, July 27, 2023 6:40:24 PM CEST Andy Shevchenko wrote:
> > > This will break some older PXA boards (such as Spitz) as they still
> > > seem to rely on fixed GPIO numbers with gpio_request and such.
> >
> > So...? Why do you think this patch can be accepted?
>
> Understandable, I'll drop it.

Or you can fix the real issue! This is what I had to do to fix the
OMAP, all the way down:

8e0285ab95a9 ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
078dc5194c0a ARM: omap2: Rewrite WLAN quirk to use GPIO descriptors
94075d16beef ARM: omap2: Get USB hub reset GPIO from descriptor
d5f4fa60d63a ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
c729baa86042 ARM: omap1: Exorcise the legacy GPIO header
df89de979f0e ARM: omap1: Make serial wakeup GPIOs use descriptors
084b6f216778 ARM: omap1: Fix up the Nokia 770 board device IRQs
e519f0bb64ef ARM/mmc: Convert old mmci-omap to GPIO descriptors
767d83361aaa Input: ads7846 - Convert to use software nodes
480c82daa3e4 ARM: omap1: Remove reliance on GPIO numbers from SX1
4c40db6249ff ARM: omap1: Remove reliance on GPIO numbers from PalmTE
fa1ae0cd897b ARM: omap1: Drop header on AMS Delta
c32c81f3dbdf ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
a47137a5134b mfd/omap1: htc-i2cpld: Convert to a pure GPIO driver
6efac0173cd1 ARM: OMAP1: OSK: fix ohci-omap breakage
45c5775460f3 usb: ohci-omap: Fix descriptor conversion
f3ef38160e3d usb: isp1301-omap: Convert to use GPIO descriptors
15d157e87443 usb: ohci-omap: Convert to use GPIO descriptors
e63201f19438 mmc: omap_hsmmc: Delete platform data GPIO CD and WP

And maybe some more. Yeah it's tough, but it can be done!

Yours,
Linus Walleij
