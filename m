Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFABC83F1A
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243479AbjH3Sse (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245258AbjH3O6O (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 10:58:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD131A2
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:58:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-500aed06ffcso7337664e87.0
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693407487; x=1694012287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/+k6PD4xwGQdkLa4KX0Kf1ry0F1EIye4pGxjvLn9W4=;
        b=FE97Tt2vSFMwg0aorFk+5wkpNYRog7AbyH36pH6EqP6pU5jjOew0gkpabEciZA8tv8
         vfjv6v6TDjN0bKe8PsdejEy79wcTHZ0mP7At9zz+rA/Cof4ef3sQRrbH7YGWJ+UpofAu
         URjbLwNdW2qzkHkbW8PVZHNTOWAECgS9u2L8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693407487; x=1694012287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/+k6PD4xwGQdkLa4KX0Kf1ry0F1EIye4pGxjvLn9W4=;
        b=Mj7x/xiT2GeFtNYqcyVf3aS9Ywr+IuxiIixR/0jGZiOg5fQg8teG83Zpcx8rKY2yiz
         8X5h9RO0oR+DJ9vvWNxc+z3gciqWJw464FVb2uCBv5KiY7w3mB7zAns23M7S1c3YHS0l
         y/Hw2YmGqoHRWrDhQqvwtza56UWU8SPQ2tpZAqXn6f+0o0KF15Yu3+/im6WUWk3kAvw6
         gjro/x0RPCTVSrjcKb2C0/1pnaMlJQ3dmgRh05keTVMWkJ6P8kzz37h4UsuNm/24AiGl
         vAFjD2b2bpGZt9nqjKRbr8m7Bkz0kZIvlmjQhSN0FhRtjeYaDEnX2X0qp65xUdIkD2ew
         frmg==
X-Gm-Message-State: AOJu0Yx5106Dzbrp1X86lNofi2F63Uo0D7Mivp1aD0ztl+IY1aHrPf6f
        1P8WJSkoplFGOv9lur25j3YH9KjHl846az2JtM/NYYMq
X-Google-Smtp-Source: AGHT+IH+kyFBCHDeRyqxVt+ute0tyDn0+1JiFggXQoGasiFP961XoPfUb+qZ7hRBdY/8pAIXWOV/ng==
X-Received: by 2002:a05:6512:1595:b0:4fb:9631:4bb with SMTP id bp21-20020a056512159500b004fb963104bbmr1971824lfb.11.1693407487343;
        Wed, 30 Aug 2023 07:58:07 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id fx19-20020a1709069e9300b0098e0a937a6asm7243417ejc.69.2023.08.30.07.58.06
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 07:58:06 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fef2fafee2so103225e9.0
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:58:06 -0700 (PDT)
X-Received: by 2002:a05:600c:520e:b0:3fe:eb42:7ec with SMTP id
 fb14-20020a05600c520e00b003feeb4207ecmr336994wmb.1.1693407486198; Wed, 30 Aug
 2023 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com> <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
 <CV5YJVXIL8OT.1ZWW3KVCHPTA5@otso>
In-Reply-To: <CV5YJVXIL8OT.1ZWW3KVCHPTA5@otso>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Aug 2023 07:57:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhdORH=naTtoc+kCC4A7UdAJKwq=Te6B3qvXNGBwBieg@mail.gmail.com>
Message-ID: <CAD=FV=XhdORH=naTtoc+kCC4A7UdAJKwq=Te6B3qvXNGBwBieg@mail.gmail.com>
Subject: Re: [PATCH 02/11] nvmem: qfprom: Mark core clk as optional
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi,

On Wed, Aug 30, 2023 at 7:43=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On Wed Aug 30, 2023 at 4:30 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Aug 30, 2023 at 2:58=E2=80=AFAM Luca Weiss <luca.weiss@fairphon=
e.com> wrote:
> > >
> > > On some platforms like sc7280 on non-ChromeOS devices the core clock
> > > cannot be touched by Linux so we cannot provide it. Mark it as option=
al
> > > as accessing qfprom works without it.
> > >
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >  drivers/nvmem/qfprom.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Are you actually testing burning fuses from the OS, or are you just
> > using the nvmem in "read-only" mode? From comments in the bindings, if
> > you're trying to burn the fuses then the clock is required. If things
> > are in read-only mode then the clock isn't required.
>
> Hi Doug,
>
> I definitely don't plan on burning any fuses on this phone. Not even
> sure that's allowed by the TZ / boot stack.
>
> >
> > When I compare to the driver, it seems like the driver assumes that if
> > more than one memory region is provided then you must be supporting
> > burning fuses. The bindings agree that having 4 memory regions
> > specified means that the nvmem supports burning and 1 memory region
> > specified means read-only. The extra 3 memory regions in the nvmem are
> > all about fuse burning, I believe.
> >
> > So maybe the right fix here is to just change your dts to specify one
> > memory region?
>
> I got feedback from Konrad that this here would be the preferred
> approach compared to having a different dts for ChromeOS vs non-ChromeOS
> devices. I don't feel strongly to either, for me it's also okay to
> remove the extra memory regions and only have the main one used on
> regular qcom devices.
>
> Let me know what you think.

I don't hate the idea of leaving the extra memory regions in the dts.
They do describe the hardware, after all, even if the main OS can't
actually access those memory regions. ...though the same could also be
said about the clock you've removed. Said another way: if you want to
fully describe the hardware then the dts should have the extra memory
regions and the clock. If you are OK w/ just describing the hardware
in the way that the OS has access to then the dts should not have the
extra memory regions and not have the clock. Does that sound right?

If somehow you do end up with something like your patch, though,
you're still missing a bit. Specifically, you don't want to "enable
writing" a few lines below if you didn't get the clock, right?

-Doug
