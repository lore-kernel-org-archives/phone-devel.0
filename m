Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DECBC83F1B
	for <phone-devel@archiver.kernel.org>; Wed, 30 Aug 2023 18:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243525AbjH3Ssp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245184AbjH3OoB (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 10:44:01 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E761A2
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:43:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-500bb392ab7so5115346e87.1
        for <phone-devel@vger.kernel.org>; Wed, 30 Aug 2023 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693406635; x=1694011435; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7y1PTlMIpI19ndr06GdGR/gezHXVIuarLmJLhteMMeY=;
        b=LYzzjbHgvGqKeGAc0j1Jmdyyz6FO1+DODQ4KJ9WUt6w2aRG++2plKYtoEyWxDiX8en
         lHIkhRnCXgg9AJdb2BHPr5i1HXPeYojczAsnVzbWKiQgsSqlkT6VcV6QoT3xyGm92WGP
         n5LhkCdaqb9m5AK9vgcTV1mWYC1HQy9F1DxjIkiF3zrEE8d5yy1jNscF8ER54RpbOkRb
         hqD0Hsu/kkelpidCNm5Zpe4GU/tK9JrNiInNtl16JLxRkvwcU2PSzwkn7bE/57iOKCWA
         J4Js6VPp5/baHjwIzrLzIsNWRTdMhRSG/CMSeVqmUfApjrXFRNKqQzx+TZcwj9qEUWec
         N5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693406635; x=1694011435;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7y1PTlMIpI19ndr06GdGR/gezHXVIuarLmJLhteMMeY=;
        b=DmsYEfWPMsjGoxrHE+OEpIK4V4jZaTDiowW+XEs1LunBsTt6dlD26vhqPYDqf4oPnX
         tBK3+3GzvU15puSYjNs8R2x2e7N1Ilrfgty7CPUQTaoUWY5Vd+dvnNZUcTCAn3KXJuWK
         BsQawbyjdPKq4YEjGq6i9o4S+FWzxIg5m6b3BJs2QYfunzxTVoo9/AOXKqQ9UbFqA8dJ
         F6jAanfXxYYSB9F1wBsywEV/hTjxI7hpNfPi+k+ZAQOV+haVaaoOu74b6szgDQMMYSfy
         Xt9iqeZ1pXkFXFpbQt/VXkQl9YFelMADHctFKfhMy7b72gAv39F0Z/NjTba+z2bNrbEM
         rbFw==
X-Gm-Message-State: AOJu0YxvfqO5HbEBnP8rUUFcCjJYzPkGZ51j07SLRPDjoqyWN+LIrsGZ
        D2fv5GRA9bF2TR0lMeVgBmbc7g==
X-Google-Smtp-Source: AGHT+IHeygykVFMcBkeCr9Jim8Aiw37Bu4dqw61S/Zwn8g9GABuB2bPsegjI40haOVmM0BZ3MWr+/Q==
X-Received: by 2002:a19:5e18:0:b0:500:95f7:c416 with SMTP id s24-20020a195e18000000b0050095f7c416mr1823828lfb.7.1693406634763;
        Wed, 30 Aug 2023 07:43:54 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l15-20020aa7d94f000000b0052568bf9411sm6787493eds.68.2023.08.30.07.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 07:43:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 30 Aug 2023 16:43:53 +0200
Message-Id: <CV5YJVXIL8OT.1ZWW3KVCHPTA5@otso>
Cc:     <cros-qcom-dts-watchers@chromium.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 02/11] nvmem: qfprom: Mark core clk as optional
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.15.2
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com>
 <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
In-Reply-To: <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed Aug 30, 2023 at 4:30 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Wed, Aug 30, 2023 at 2:58=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.=
com> wrote:
> >
> > On some platforms like sc7280 on non-ChromeOS devices the core clock
> > cannot be touched by Linux so we cannot provide it. Mark it as optional
> > as accessing qfprom works without it.
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/nvmem/qfprom.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Are you actually testing burning fuses from the OS, or are you just
> using the nvmem in "read-only" mode? From comments in the bindings, if
> you're trying to burn the fuses then the clock is required. If things
> are in read-only mode then the clock isn't required.

Hi Doug,

I definitely don't plan on burning any fuses on this phone. Not even
sure that's allowed by the TZ / boot stack.

>
> When I compare to the driver, it seems like the driver assumes that if
> more than one memory region is provided then you must be supporting
> burning fuses. The bindings agree that having 4 memory regions
> specified means that the nvmem supports burning and 1 memory region
> specified means read-only. The extra 3 memory regions in the nvmem are
> all about fuse burning, I believe.
>
> So maybe the right fix here is to just change your dts to specify one
> memory region?

I got feedback from Konrad that this here would be the preferred
approach compared to having a different dts for ChromeOS vs non-ChromeOS
devices. I don't feel strongly to either, for me it's also okay to
remove the extra memory regions and only have the main one used on
regular qcom devices.

Let me know what you think.

Regards
Luca

>
> -Doug

