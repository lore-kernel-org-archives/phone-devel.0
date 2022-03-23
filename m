Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF635C433F5
	for <phone-devel@archiver.kernel.org>; Wed, 23 Mar 2022 14:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244959AbiCWO72 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 23 Mar 2022 10:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240477AbiCWO71 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 23 Mar 2022 10:59:27 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBF9811A4
        for <phone-devel@vger.kernel.org>; Wed, 23 Mar 2022 07:57:57 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id g9so727649ybf.1
        for <phone-devel@vger.kernel.org>; Wed, 23 Mar 2022 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHFyYzS6sfWkPynozwhvdG09XHmrM7p05a2OX3evjQc=;
        b=cy81ymLa5eN2qDfZxDw68v5na2PC4BDIhimnygQXky6D1UJ99bSgLma+iZLWg5j4kl
         seekZ+cgA6NSCtwQdvUrscXT8QwOhNAuZJ78lp6OqAox3QnCgnUTg2+M4a2zftN/EiQz
         4qz43c05ps0iKAhDALZ64d3Z+FoTMIw0q9tEYzfylJd2aIfXZnRNEEsS/MgTj6IWBvBs
         zl+WXf3ls4QuZgPWRIkenkUZqJdYkg1MxEw79sST5kMIBN4XJKc7XLocWFNS0ju4rHSh
         FYFlfPj1tvr4nCcmSg3bu1y+SV4v8QPf9tc+vaTKPBYHg3FfwRvF9V9yqiixBGdHhD5H
         HKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHFyYzS6sfWkPynozwhvdG09XHmrM7p05a2OX3evjQc=;
        b=4hIBb2NPdt+q9ftTPwCeG7pjkl92sxWTc6UN/ysl3RD9UnIdZplIMHatd1fueDVlFA
         HmMZA+zCMAGYPXTLUDLSQ67oB6dHCB7i63HuBhPX5h1lsxG0em9g8654en9r/Sl/JA6W
         vLOT15y5FxKw7UtSujtQYzt6GBkJvRempKEr/kxpZuhRV6lNiqCGUg8fGAaPQIG4byln
         nNTCeUs3msH9wulCiHTF7JYMIF6Ywu/TBXAZSLao162iWUz0Y4KsQpTUOWqFB9Q1f/Is
         sGtxx6PE/egHizvg6eRpjivft9RU7tNyekTemXfy3d9LfL8mw1ZjgJkNbD89k/Ase4rC
         rq4g==
X-Gm-Message-State: AOAM530NrIbhDrLAhAuEHnX27m1yoTPTYHwQZWRV5JCAfY+3Us+73XYN
        PH/nqFLPbN7g4FSVvk/g7kvYQugFQvpF30TWPSty7A==
X-Google-Smtp-Source: ABdhPJxrvLqQqxPwFm6tm5PCgwjMU95bY9rlkSBmL2z3XICqZAKoAjwFQW6qS1pwoNqpgg1jwxsYZweB27rVI5H65yM=
X-Received: by 2002:a25:f406:0:b0:628:c29b:5c39 with SMTP id
 q6-20020a25f406000000b00628c29b5c39mr308765ybd.369.1648047476675; Wed, 23 Mar
 2022 07:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220315233528.1204930-1-linus.walleij@linaro.org>
 <20220315233528.1204930-2-linus.walleij@linaro.org> <YjjNkyChcJcaJi11@robh.at.kernel.org>
In-Reply-To: <YjjNkyChcJcaJi11@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Mar 2022 15:57:44 +0100
Message-ID: <CACRpkdbz6Ua+0bTJMf-Qc7tju33CmEEgUsxH5KCS_zW3A_-SYA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: input: Add bindings for Immersion ISA1200
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, Mar 21, 2022 at 8:10 PM Rob Herring <robh@kernel.org> wrote:

> > +properties:
> > +  compatible:
> > +    description: One compatible per product using this chip. Each product
> > +      need deliberate custom values for things such as LRA resonance
> > +      frequency and these are not stored in the device tree, rather we
> > +      let the operating system look up the appropriate parameters from a
> > +      table.
> > +    enum:
> > +      - immersion,isa1200-janice
> > +      - immersion,isa1200-gavini
>
> Same device, different boards. I think I would put necessary properties
> in the DT.

That will be all of these (from the driver):

+struct isa1200_config {
+       u8 ldo_voltage;
+       bool pwm_in;
+       bool erm;
+       u8 clkdiv;
+       u8 plldiv;
+       u8 freq;
+       u8 duty;
+       u8 period;
+};

Example:

+/* Configuration for Janice, Samsung Galaxy S Advance GT-I9070 */
+static const struct isa1200_config isa1200_janice = {
+       .ldo_voltage = ISA1200_LDO_VOLTAGE_30V,
+       .pwm_in = false,
+       .clkdiv = ISA1200_HCTRL0_DIV_256,
+       .plldiv = 2,
+       .freq = 0,
+       .duty = 0x3b,
+       .period = 0x77,
+};

This is derived from the compatible rather than individual properties
or extra regulator and/or clock abstractions in line with:
Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml

Which was originally looking like so:
https://lore.kernel.org/dri-devel/20170813114448.20179-2-linus.walleij@linaro.org/

To which you replied:
https://lore.kernel.org/dri-devel/20170817204424.e2wdkmyp4vyx2qj3@rob-hp-laptop/

"Normally, we the physical panel is described which would imply all these
settings. Are there lots of panels with this controller that would
justify all these settings?"

In that case there was one (1)

In this case there are two (2) products that I know of. It does not have the
relationship between panel and panel controller products though, but...
it's not very different.

I don't think this chip was used a lot, I really tried to find other instances.
But they could exist of course.

If you are certain you want all of these in the device tree instead, I can
fix it of course, then I also want to know if e.g. regulator framework should
be employed for the (internal) LDO and clock framework for the internal
PLL divider so I don't have to rewrite the whole thing again.

Yours,
Linus Walleij
