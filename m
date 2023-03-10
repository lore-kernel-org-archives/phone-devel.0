Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021B6C6FD19
	for <phone-devel@archiver.kernel.org>; Fri, 10 Mar 2023 22:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbjCJWvM (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjCJWvL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 10 Mar 2023 17:51:11 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D5110BA78
        for <phone-devel@vger.kernel.org>; Fri, 10 Mar 2023 14:51:09 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-53d277c1834so125793687b3.10
        for <phone-devel@vger.kernel.org>; Fri, 10 Mar 2023 14:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678488668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LQ2HzZ5/bi/kOKo7NEBlYoMYy0KUYQz8z6lYvJaO88=;
        b=CsRc5Yj4v6oMwTHZDXSBIJu1WUd+WKnNbbnBRzECCKZQKqAeYyk3g2skIyqllyml9N
         YkuB1zIVR4Gz09ofgcAlgItEpzD2ZN3zrZZc7yQDar9fCWLsETqJzHdA++8HZbrRUGIB
         a8WLKRX6xoN+4ZGFFJKJYeERlLfRbze0ycq2elEM1zAfUoNmLjjMQf2hxremPynCPFxg
         hoIlggBNAGgThOr1cX9poKYS0U9KhEqkA54OWmkqxtTU031rj5Q2CNrhAmArdrUbC7Ze
         5B90KoNaRJHfbtbuEAW+CvZriQxfb/bCQYgh72mBblBbL39CthVhQBJKMdIBJj8aurqr
         IFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678488668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LQ2HzZ5/bi/kOKo7NEBlYoMYy0KUYQz8z6lYvJaO88=;
        b=me6hwzpIf8r/9NWDXzzVGy1ZGOJxyG3Vqrrtd8KN0SknMCkKbzf8cURDMaCqV6S0H3
         +ycmL/yLwuGnG6qn5DcW3UTuFYQl6EFjIbxicl1VC7jW0SUmqlrSRPZytSBlGDgjE7Gu
         O97S5ZQNuyJMWAOBpzFogEZMRxAmFhoK0oNdifo83bAbQJyASQ/uORwmwPlJ46dGzlWS
         LYSsETXSO/pGKRCS3vCKGfPOOJ7f7BmLpAaUjSe0Eir1VKocxW4qmWQ2S5oTY0azVH4l
         9NjGxbBouGAcz/vi19kZOouB8kHigHGeO+jvNUsF8RCnsEepB2bM0iJ8+XhAmZhRp7LP
         8D5g==
X-Gm-Message-State: AO0yUKWuO7dq2yFeXZyEZ5rrOrps1jYNX6kkXqyXdkxloBSbLyEcDg3P
        1m1+kI42zHn4AgMI18LE7ORLMI2jNbL+X/8HMyYtGA==
X-Google-Smtp-Source: AK7set9Vgsn5Grv4otQPAm23jXoXW/OhNMlrjQMLAs7IGnb7QimXeWnLl/d1v7+vmSUynvjW6CwEXRyAR13UOuRdqy0=
X-Received: by 2002:a81:ad1e:0:b0:540:7a8d:2ae8 with SMTP id
 l30-20020a81ad1e000000b005407a8d2ae8mr944258ywh.10.1678488668485; Fri, 10 Mar
 2023 14:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20230310132144.2241-1-lujianhua000@gmail.com> <20230310132144.2241-2-lujianhua000@gmail.com>
 <6539f132-c740-b9b6-8810-0affd6ab91ba@linaro.org> <ZAt4fTNEnyLteaas@Gentoo>
In-Reply-To: <ZAt4fTNEnyLteaas@Gentoo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Mar 2023 23:50:57 +0100
Message-ID: <CACRpkdavjBPaNq1sRfi-FYiT7T3W19fU-mjha0pAtooUyf-8XQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
To:     Jianhua Lu <lujianhua000@gmail.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, Mar 10, 2023 at 7:35=E2=80=AFPM Jianhua Lu <lujianhua000@gmail.com>=
 wrote:
> On Fri, Mar 10, 2023 at 07:10:21PM +0100, Konrad Dybcio wrote:
> >
> > > +#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        =
\
> > > +           do {                                                 \
> > > +                   mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > > +                   mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > > +           } while (0)
> > This should be in the same file as mipi_dsi_dcs_write_seq, imo
> I have sent a patch to do it, upstream don't think this wrapper is a prop=
er
> approach to deal with dual dsi and wrap all of mipi_dsi_* function is
> useless.
> https://lore.kernel.org/lkml/20230310110542.6649-1-lujianhua000@gmail.com=
/

We can keep it locally if the fight isn't worthwhile, but I will try to ent=
er
the discussion.

Yours,
Linus Walleij
