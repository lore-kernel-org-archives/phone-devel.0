Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75984C6FD19
	for <phone-devel@archiver.kernel.org>; Fri, 10 Mar 2023 23:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjCJXGI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 10 Mar 2023 18:06:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbjCJXGG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 10 Mar 2023 18:06:06 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14B5135B11
        for <phone-devel@vger.kernel.org>; Fri, 10 Mar 2023 15:05:57 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id o1so6827163ybu.13
        for <phone-devel@vger.kernel.org>; Fri, 10 Mar 2023 15:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678489557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1C5EaEX7RUXtbYsmEPMYf2+exssIXAhNPil5rJCHJc=;
        b=OzwRskF5Ih0lo0aILi+OoqYAwUlYwBG7zxkn3rbE69pckwIlvzquTfLYEFlP/lFB/q
         l0UepLZ2GlDrPh9DVI0tpvnKrTnSjtpOhOHGLcwFYeL7bxKMpMvb+nyF/Q3JHk2fjxys
         TbjJzP9lA5zBq21Jm7TguAabdqZpMqQTM9JTUlAkTtcIkxDcH9AdSL+V05EQO/RjmqDD
         YeUloj6KhxaVi7w9EWDEAGsvsjP9V60yRM9YThmwFbh2c+V7xVCgUte+7fEfiu3dq7/u
         yai9qCn/Cv+Sd0SDtFv2nB/yc5RQrJfTGqDH0VOAMcxtxin/75P1ktR+vz8Z2r4cGf2K
         WqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678489557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t1C5EaEX7RUXtbYsmEPMYf2+exssIXAhNPil5rJCHJc=;
        b=SmwRZVczAEMZTeXNnTGYs5J0YJQnneAD9s/oxsYjzAXoI+E4CiMG0HufvsfV9QO9bA
         fjEYlKCmJunK9iUxuxvQwTR6meG+ze0C79DYZspxENQVCLkvnvl3bOVdrFocQTsV0knn
         bK1FIJr6LoeF0SwZBfRWl6sK9SAlvvHee+Fkmzjy5P5ksFGNUWN3mFvraNruWZYeZrhX
         C3KpdYX0ohhUvvS1NBxb1V5lN1rDhJqnVuVzHbVC3dz3PWmUnUTT5qGk3qLuL6Z6BqIv
         XEt/aUW0bOuBMfXMsI7NN7irSsPSyAdu9UbJZT0C6c54RMBHLHG4pumWLQBkJX/tmRot
         l3Ow==
X-Gm-Message-State: AO0yUKUdtnq2esjKW4s6vQLDsCk6Mx9EUQlXwLAO1z3o6NPEJN6w7AGF
        pW8st289467CBDheqZ9Ss7nWeTnu2ub2o8CMrEadDg==
X-Google-Smtp-Source: AK7set/AXp8Coh32VeUVTutEizxPtbjJjz8lfxc31hn8uCQNy5KsUkfh9dktBb0fy9LNuoIzjVmbhAj73BsC0vyUcO8=
X-Received: by 2002:a5b:386:0:b0:b0a:7108:71e9 with SMTP id
 k6-20020a5b0386000000b00b0a710871e9mr2427934ybp.4.1678489556799; Fri, 10 Mar
 2023 15:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20230310110542.6649-1-lujianhua000@gmail.com> <87mt4k95zp.fsf@intel.com>
 <ZAsgd4zsgbvWT0U0@Gentoo> <87bkl090ia.fsf@intel.com>
In-Reply-To: <87bkl090ia.fsf@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 11 Mar 2023 00:05:44 +0100
Message-ID: <CACRpkdYwu5XKDcowggDMM0pSjuKdAJnZ8F92OdDyEWP7HJUC-A@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Add a mipi_dual_dsi_dcs_write_seq() macro
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc:     Jianhua Lu <lujianhua000@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

(CC Javier)

On Fri, Mar 10, 2023 at 2:52=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:

> >> > +          for (i =3D 0; i < ARRAY_SIZE(dsi); i++)                  =
  \
> >> > +                  mipi_dsi_dcs_write_seq(dsi[i], cmd, seq);        =
\
> >>
> >> This ignores errors.
> > mipi_dsi_dcs_write_seq is also a macro, contains error checks in the bo=
dy block.
>
> Ugh, I think it's pretty scary to hide control flow like return
> statements in macros like this.

The macros are written like this because:

#define mipi_dsi_generic_write_seq(dsi, seq...)
(...)
                static const u8 d[] =3D { seq };

Array of bytes

                ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));

So we can use use ARRAY_SIZE() in the macro and pass in any
arbitrary sequence, e.g.

mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01);

Any function-esque definitions will (as in your example) require a
length to be passed in so it would become:

mipi_dsi_generic_write_seq(dsi, 0xfb, 0x01, 2);

And if you grep mipi_dsi_generic_write_seq | wc -l you find all the
245 opportunities to get that last len wrong and cause an out-of-bounds
bug.

I think this macro is the lesser evil for this reason, also it saves code
that you otherwise have to do manually, and one should never put
a person to do a machine's job.

Any suggestions to rewrite the macro using varargs welcome.
I think it is not very easy to do without the preprocessor.

Yours,
Linus Walleij
