Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874F1E71D21
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 12:44:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbjI2Mow (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 08:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbjI2Mow (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 08:44:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54B31A4
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 05:44:49 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so14753020a12.1
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695991488; x=1696596288; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILOYUpT4AgK5q+nU5tn+arMEdwkeAfGQJWwyqox7rq4=;
        b=VR+P4epeMNS6+ZPIxk9nIyrbMWsQICm/OSIrSl780HviCFVczH9xqy6Gs3eS3WcT3X
         kBzItbR9xjouTKeMP377uHvJyJMaR/0JcqFGs1ucpD3+d13p+klO6QYxcjm01gdfa3hh
         PPldWkQ0Tma1iAKsKBVaVk6WoTGkJm0k9uPPyIXKomK/vAfmn9CR0qyZOagXEzQIgHhq
         ejon7bqjsfFoBFjlsD18BVvLlww/LU4gK8KeO6tY+E8pj+LOv3bweGI37MYfPSd2Ff+/
         g7xVxO+rJUBU4Pa+9kd0xgS1UNoRIoofz0EexOcA150kqGeDLIWl+1fJvsOnPQ7e6Qje
         /GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695991488; x=1696596288;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILOYUpT4AgK5q+nU5tn+arMEdwkeAfGQJWwyqox7rq4=;
        b=jWHwVdICgT4r4QtvgPRxyT0V9jx0idYKde1Pctoi+sqVncHMnhUzw0pVqVkJS0xKT+
         RWaO5v8ViyH5RCha1R1QTNBSrdlKrxwxQJui6eI8LB26+m58lQptwsMpwnl5DPoAL2n5
         mEcy9mcAIuwtu5Po6g9hkgTJl72l9x9UM4tIKzLhZdnMorUimUv0cjGvw6C4r6DCciRq
         4Vmcqzi42rYXv6ERi5id47XntAwv2YyW1soJV2eYM4kn9cOlAbCx6ntWt3RXfcyOk0FC
         /DVdHYCuvJsuoirX9lH7zzilLifObNJgUPcirFv2V/FmoRwC0BJCiB95UcWsAgInEn8U
         fLLw==
X-Gm-Message-State: AOJu0YxdeW+qW9ME/gSnsL2VugQPd2eCRpwjcAs7KA81aaHYueYuILtV
        k8rbrX7+zCyJHdKfH+0AwHDE8A==
X-Google-Smtp-Source: AGHT+IH1568r9Fn3T/Uv2fQlT+CxZWy39xXf/j68AARuzWrDFj9gD9phmENKFlb7+fy84sFn1vxa6Q==
X-Received: by 2002:a17:907:2e01:b0:9a5:9038:b1e7 with SMTP id ig1-20020a1709072e0100b009a59038b1e7mr3479950ejc.36.1695991487947;
        Fri, 29 Sep 2023 05:44:47 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q6-20020a1709060e4600b0099bd6026f45sm12233886eji.198.2023.09.29.05.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:44:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 29 Sep 2023 14:44:47 +0200
Message-Id: <CVVET1A2CO26.3O47662JKAL6@otso>
To:     "Mark Brown" <broonie@kernel.org>
Cc:     "Weidong Wang" <wangweidong.a@awinic.com>,
        "Liam Girdwood" <lgirdwood@gmail.com>,
        "Jaroslav Kysela" <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC] ASoC: codecs: aw88261: Remove non-existing reset
 gpio
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com>
 <ZRbDW3OiAYyAkWgN@finisterre.sirena.org.uk>
In-Reply-To: <ZRbDW3OiAYyAkWgN@finisterre.sirena.org.uk>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri Sep 29, 2023 at 2:30 PM CEST, Mark Brown wrote:
> On Fri, Sep 29, 2023 at 12:28:10PM +0200, Luca Weiss wrote:
> > According to the AW88261 datasheet (V1.1) and device schematics I have
> > access to, there is no reset gpio present on the AW88261. Remove it.
>
> That looks to be the case according to
>
>    https://doc.awinic.com/doc/20230609wm/c815e155-60b7-40fb-889b-676b02e6=
7d0a.pdf

Nice to see the doc is also available there. Seems it only shows up on
the site search but not with Google

  https://www.awinic.com/en/search/all?titleSearch=3DAW88261

>
> (which is v1.5 FWIW), Weidong?
>
> > In case this looks okay, also to the driver author at Awinic, the
> > binding doc also needs to be updated to include this change and not
> > require (or even allow) the reset-gpios anymore.
>
> It would be easier to just send the proper patch to start off with, no
> need to resend if the change is confirmed...

Unfortunately the dt binding is a bit trickier to update since it's made
for both AW88261 and AW88395.

After spending a bit of time using non-Google search machines (Google
seems incapable of finding anything there) I found a datasheet for
AW88395 and that does appear to have a RSTN "Active low hardware reset"
pin so we should not remove that one.

Probably it's easier to separate the two dt bindings then, instead of
trying to keep them together?

Regards
Luca
