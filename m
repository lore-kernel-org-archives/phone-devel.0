Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FE1C43334
	for <phone-devel@archiver.kernel.org>; Wed,  8 Jun 2022 17:53:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbiFHRxE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Jun 2022 13:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbiFHRxD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Jun 2022 13:53:03 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3311D65CB
        for <phone-devel@vger.kernel.org>; Wed,  8 Jun 2022 10:53:02 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31336535373so66406977b3.2
        for <phone-devel@vger.kernel.org>; Wed, 08 Jun 2022 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=auWYjGrmO12LzarWgU8/f/He/qw8x0OfWAJAXSy8JA4=;
        b=ScaOGpRUTXvnCQlaUrqa38bGJWp6nx5WeYWo3sJhv9wR70OzuWBoJqnVw8uPBX+mQE
         IOn50VGwJcfsKLLTvE4jmR2ASgUPbmm7sL40828LtRfaHsF/DdThZcGrwzH3hr9j9vb3
         TD3SKF9DHaiJFIZDMdwB0heHW4RWLZfFFfBO71SJGQA0ZA2F0e7U39Cm3KGk5sTafI+0
         vncXdN7eelTAPPl1PPZR6otF9GZO7/sW84Q8yo05NgvFIX4JUK2l1VldaNhND6Kvw3ck
         8QihL/x7Xscyb2F+V8QKI/fhPijESsm8BQat2LTeNlF/2sOptnQrwJyszbte9VPetVGh
         lZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auWYjGrmO12LzarWgU8/f/He/qw8x0OfWAJAXSy8JA4=;
        b=tpUl1eybcMTzRQrx22gBYxK2dwya5p6tkAY0iNk4VQN5MabpTQ+kDcRPh7rbjkU8pA
         G4TIWAM29vL9LqPTfycA57FQr5/EjmOh7TXOU7/BCs+KSN4WgQWlaPOaP4Usir9c+Zkq
         h7BOu9BWDARabiaxPlaYiN/aNjgydbb3qvO/JCUmCmBXJi64VGe5XNlMxWBBqq6zeX1L
         8lBk/UFdHRwVgtn6UanJrLdJCH5Q4N6RCw2Z0QcHmuc86pMSLxo2o4Pl4eQ+EWffpyxa
         k/vFKYKU1cvdLCYoAuYKkrtCVZ38k5Xe0tEp3O/UshDg75/IH5qO8C5RbPztwKe4f0nE
         n4/A==
X-Gm-Message-State: AOAM5326YW7tyRrNiiXPoDEnDXLglwfGIv/d9WlM7p2nGrMwnp8m2PJy
        YHTaV42pZ/2G3JQbVTROYg71PJ+YacLSTB+ljn+jgw==
X-Google-Smtp-Source: ABdhPJxMIOaoKBRXUno4tnLibt0f7B15Qao1xtz+Mhz7w4xpjucvfVG0wz6VQHFD4YznuOECgMzAPjK+B35JLGEpuAE=
X-Received: by 2002:a81:b45:0:b0:30c:1c31:604b with SMTP id
 66-20020a810b45000000b0030c1c31604bmr40100617ywl.114.1654710781368; Wed, 08
 Jun 2022 10:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220401001810.81507-1-jo@jsfamily.in> <BY5PR02MB700935F5817128CB7C3991CDD9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
 <BY5PR02MB70099A0E4C060E52284DCE46D9A59@BY5PR02MB7009.namprd02.prod.outlook.com>
 <CAO_48GH5V2-Z0cqGJoF68hzZjqhY6_aGxReSk+ByC_zrLWusYQ@mail.gmail.com> <BY5PR02MB7009AA50A0F7D570877DA646D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB7009AA50A0F7D570877DA646D9A49@BY5PR02MB7009.namprd02.prod.outlook.com>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Wed, 8 Jun 2022 23:22:49 +0530
Message-ID: <CAO_48GEvQhMOst0KhM9CU9y1cv3q+4hbXM9MentRn7QPTs_mQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/panel: nt36672a: add backlight support
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Joel,

On Wed, 8 Jun 2022 at 22:10, Joel Selvaraj <jo@jsfamily.in> wrote:
>
> Hi Sumit,
>
> On 08/06/22 22:00, Sumit Semwal wrote:
> > This is entirely my fault - It somehow missed my radar, and I didn't
> > queue it up. I will push it via drm-misc tree tonight. Apologies
> > again!
>
> No problem. Thanks for the update! So it will land on upcoming 5.19-rcs
> or 5.20-rc?
Not for 5.19-rcs for sure, but I think it should make it for 5.20-rcs?
>
> > Best,
> > Sumit.
>
> Best Regards,
> Joel Selvaraj

Best,
Sumit.
