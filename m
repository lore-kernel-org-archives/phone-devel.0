Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB0CC433FE
	for <phone-devel@archiver.kernel.org>; Mon,  4 Oct 2021 18:38:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC04261501
	for <phone-devel@archiver.kernel.org>; Mon,  4 Oct 2021 18:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238793AbhJDSkB (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 4 Oct 2021 14:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234678AbhJDSkB (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 4 Oct 2021 14:40:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBD7561452;
        Mon,  4 Oct 2021 18:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633372691;
        bh=x5bt+un83rZ53EMAYG2mxV6QukR6GDj1eslkVtR6NDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FIVwx0yzR+mo1u3ocDMsMG1G1PnzIEcIPjOkhwNCTJka+/FLXy7pCnv9m6CNxzTjB
         wnav7Ct14zlWziNmxRYIU83KRjTz0ZzwElSVH8bAix3xcGAcOxQmwMvrEyNUYRZISN
         a1/NipI6n7dt95i1ZjuRyv2ZxR0fyVx+j0ob1snUvqUl/Bj8DtCpZ2LpyE/DcdOYS1
         /cAbReJz2OepIb+uhd9yFoo3UUCtd1wCUbOYwypO9RD8Zo+WKF5OjfXyZnLKeBXN/K
         QJpUYIm8mnW5MFvFJapM9IrnSMvA0mmZzC6LwZAC6+I6+/ROKGtXED8+YShHxHRGPC
         qAai9lgTiyEkg==
Received: by mail-ed1-f53.google.com with SMTP id r18so68407868edv.12;
        Mon, 04 Oct 2021 11:38:11 -0700 (PDT)
X-Gm-Message-State: AOAM530B9vfbkKKqYVIlJYwADL6TszCjfimXsIIhcIEiRHtHg70ZCdh+
        UCayiKRkqAj+vqNFcxBMHBKA2kY6GKPtILXtUQ==
X-Google-Smtp-Source: ABdhPJx1cgQdv8Bc8FSVPhRofbbm1ROtX2bmVXKzC/0au6fnKhc7qAIXFjcufJkz9Lu+LRVqLW5+hwv3B8+lodTB6eM=
X-Received: by 2002:a17:906:70c4:: with SMTP id g4mr18422075ejk.363.1633372690322;
 Mon, 04 Oct 2021 11:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210928171231.12766-1-stephan@gerhold.net> <20210928171231.12766-9-stephan@gerhold.net>
 <YVtJIm6Tu2z+Ph/V@robh.at.kernel.org>
In-Reply-To: <YVtJIm6Tu2z+Ph/V@robh.at.kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 4 Oct 2021 13:37:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+nJH8WgSL0S4LAW6Ru_W-000+AxGQrtxskrPWViRqN5w@mail.gmail.com>
Message-ID: <CAL_Jsq+nJH8WgSL0S4LAW6Ru_W-000+AxGQrtxskrPWViRqN5w@mail.gmail.com>
Subject: Re: [PATCH 08/15] dt-bindings: arm: cpus: Document qcom,msm8916-smp enable-method
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy
        Shevchenko <andy.shevchenko@gmail.com>," 
        <~postmarketos/upstreaming@lists.sr.ht>,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Oct 4, 2021 at 1:34 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 28, 2021 at 07:12:24PM +0200, Stephan Gerhold wrote:
> > Document the qcom,msm8916-smp enable method. It is actually just
> > an alias for qcom,msm8226-smp since it should be implemented identically.
> >
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > index 11e3e09da2e5..5602a8f3c513 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > @@ -211,6 +211,7 @@ properties:
> >            - qcom,kpss-acc-v1
> >            - qcom,kpss-acc-v2
> >            - qcom,msm8226-smp
> > +          - qcom,msm8916-smp
>
> I thought arm64 is PSCI only.

I see the explanation now. Please add that to this commit as well and
a comment here that this is for 32-bit only.

Rob
