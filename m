Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEDBC7618E
	for <phone-devel@archiver.kernel.org>; Fri, 21 Apr 2023 09:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjDUJUZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 21 Apr 2023 05:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbjDUJUX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 21 Apr 2023 05:20:23 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D035FE9
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 02:20:21 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54f6f0dae19so5095657b3.0
        for <phone-devel@vger.kernel.org>; Fri, 21 Apr 2023 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682068820; x=1684660820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhFBbTnrvqR6mDfvWnCP3LyOJMAtBUaFpuunhT+4e7o=;
        b=r4wR+IdH7jTYl36uiLsjBKZrp9iQ9mcyzeIWA44aVLaBmlLsWoIZ7cP5hlZ8NO+ORj
         WwePE2341vBNNZfHqIIYHIt4CnJ1AReRi+ypauq6Ze6bIMn1FBRrqj0HKlN7+8utv+us
         65eqT3H25qcKogf2NRKY226L/5xLzPtveVD0yR3NPgucuGdo67xvDMxbWy/JPqVh4TQY
         BKt+MKQZ4yxIzYH92REUq3Bp8LWpIkty+/4kMy5sjswYVAU7inR0jYbcGgbeHmJpEz15
         UxxVsLDklf5Un6UshQfEqSW3wL0SH6Ox3Jbt+T7xAFMexIrEsKsVu6hlR+tqCiDe5RnE
         ZjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682068820; x=1684660820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhFBbTnrvqR6mDfvWnCP3LyOJMAtBUaFpuunhT+4e7o=;
        b=ZMfQ2PoakAvYPf8fGTIN+ZcW69rVy3VcZKNkFHlze6Zik7m1YGxi7P/6eVZVJObWrg
         vS6a8PhjAz07+VFupS1/FgvkEcBE0haGLdZrOcvJCIhuKW4Dnwqcu+9c1+Rjt3Tw20ml
         4PL6eHS86BTC5OQtaWKAbp48cX25R4N1w7iKHPjZHdJMWGxdFz9ko721rSCwkeVgtUoC
         zQhcptc0rbQiUj86V+Gzmm/jUPQaKV8cNhC+1irlxZT1yW1cP++KJsBuz9HTWaEpW1Vg
         CSWEAnN22IBY/8f9cAb5c/kqg7l2IKPDSK2bWrVcUzkgRZZLnoi45YxwBAwovMoRru4u
         pd6g==
X-Gm-Message-State: AAQBX9e0THPn6vGFE0b9Il6viho8vJ+PlFSAxcX2CMcOrFekbu/YKWld
        7HHZ86gtaywkyRpaHnuWwUAlrTcr5bu2Vj0+4DSv2g==
X-Google-Smtp-Source: AKy350Y4W5hG73IZ75W6wgz54If12e+2sonMIXOyKihzzRuCVU/aZi/kzOyU8POiZSBlgrP8DzO4b6g85DAQW7VxLG8=
X-Received: by 2002:a81:910b:0:b0:54f:b994:e258 with SMTP id
 i11-20020a81910b000000b0054fb994e258mr1362753ywg.4.1682068820563; Fri, 21 Apr
 2023 02:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1681646904.git.jahau@rocketmail.com> <9275af790e6e21b5cf661a2444effe4caf2be02e.1681646904.git.jahau@rocketmail.com>
 <CACRpkdZEtG=OjTECDO=SvFk89MqL10sKKMOABPEs-xxYv1hmqw@mail.gmail.com>
 <CACRpkdaRkJ-JVNqAOQLuOgDztDfUP7DBQU9QP7AMbnK=eN2HWQ@mail.gmail.com> <662eeda8-8605-4124-75d3-9df6bd81bcb7@rocketmail.com>
In-Reply-To: <662eeda8-8605-4124-75d3-9df6bd81bcb7@rocketmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 11:20:09 +0200
Message-ID: <CACRpkdaYaE+1GKNv5SczC+Xn8UuBonZcW4RSdbsU53HWTR_tTg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] dt-bindings: Add documentation for rt5033 mfd,
 regulator and charger
To:     Jakob Hauser <jahau@rocketmail.com>
Cc:     Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Beomho Seo <beomho.seo@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Raymond Hackley <raymondhackley@protonmail.com>,
        Pavel Machek <pavel@ucw.cz>, Axel Lin <axel.lin@ingics.com>,
        ChiYuan Huang <cy_huang@richtek.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Jakob,

On Thu, Apr 20, 2023 at 11:16=E2=80=AFPM Jakob Hauser <jahau@rocketmail.com=
> wrote:
> > On Thu, Apr 20, 2023 at 9:59=E2=80=AFAM Linus Walleij <linus.walleij@li=
naro.org> wrote:

> > On second thought, these are really weird properties to have on the
> > *charger* isn't it?
> >
> > It is really *battery* restrictions.
> >
> > A charger can charge many different batteries with different CC/CV
> > settings.

(...)
> I was first a bit confused by the term "battery". I associated that term
> with the driver "rt5033-battery". But I think that thought was wrong.
> The driver "rt5033-battery" is just the fuel gauge.

Yeah that is a different thing altogether, it should be named
rt5033-fuel-gauge if I could turn back time, I would review it
and say this, perhaps the confusion can be fixed. Mistakes
were made.

> The properties we talk about here are the settings for the charger. They
> tell the charger how it should behave. It makes sense to process those
> settings within the charger driver.

It may make sense to *parse* this in the charger driver, by
following the monitored-battery phandle to inspect the battery
properties and get the information you need.

The architecture of any Linux driver does not really concern
the DT bindings, the bindings should reflect the hardware.
The hardware has a charger, and the charger is monitoring
a battery, so it needs to be its own DT node.

> The fuel gauge, on the other hand,
> returns information like actual voltage and percentage.

The fuel gauge should probably have a phandle to the same
battery for compleness sake, but may not need it. If it ever needs
any battery properties, it should definately have that.

> According to your remarks, the properties could be "outsourced" into a
> battery node. (Btw. I have double-checked the property names.)
>
>      battery: battery {
>          compatible =3D "simple-battery";
>          precharge-current-microamp =3D <450000>;
>          constant-charge-current-max-microamp =3D <1000000>;
>          charge-term-current-microamp =3D <150000>;
>          precharge-upper-limit-microvolt =3D <3500000>;
>          constant-charge-voltage-max-microvolt =3D <4350000>;
>      };
>
>      pmic@34 {
>          compatible =3D "richtek,rt5033";
>          ....
>          charger {
>              compatible =3D "richtek,rt5033-charger";
>              monitored-battery =3D <&battery>;
>              extcon =3D <&muic>;
>          };
>      };

Yups this is how it should look :)

> Personally I would choose the current implementation for two reasons
> (possibly weak ones):

The device tree binding isn't any "implementation", and make sure
to not go into the trap that DT bindings should be done to be
convenient for any specific Linux driver to use.

> 2) At least in my mind it's still the setup for the charger. It sets up
> a the charging behavior of a certain consumer device. And the choice of
> their values is limited to the hardware of the charger. Accordingly the
> dt-bindings would say what the charger hardware is capable to do.
> Therefore I'd say it's reasonable to have those values in the charger
> node and use vendor properties.
>
> I agree to you that actually the physical battery is determining how
> these values should be set. In the end, as far as I can see, it is a
> representation thing in the devicetree. At least in our case here.

The DT bindings should reflect the hardware, and not what some
or any driver "would like to see" (to make its life easier...)

As these things are programmed into registers, clearly the
hardware is adoptable for different batteries, and the purpose
of these registers is to support different batteries. Ergo: they
belong in a battery node.

> Not sure how to proceed here. I would stick to the current
> implementation. If someone strongly prefers the "battery" representation
> style, I'm open to switch to this.

Again this is not an implementation but a hardware description.

It should use a phandle to a montored-battery and follow that to
read the battery properties.

> However, I'm not sure how the dt-bindings would look like in that case.

Just like you sketched above, just reuse simple-battery if the battery
is hardcoded into the platform, such as soldered in or has a form
factor such that no different battery can be fitted.

> Those battery properties would not be part of the RT5033 node, thus they
> basically would not be part of the RT5033 documentation. Again I think
> it makes sense to handle those properties within the charger node as
> "charger settings" properties.

Why?

This is like saying that the number of pixels on your monitor should
be part of the graphics card DT node as "configuration". And we
clearly do not do that.

Yours,
Linus Walleij
