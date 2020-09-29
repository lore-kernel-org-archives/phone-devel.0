Return-Path: <SRS0=eYEv=DG=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDD3C4741F
	for <phone-devel@archiver.kernel.org>; Tue, 29 Sep 2020 07:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 674A920897
	for <phone-devel@archiver.kernel.org>; Tue, 29 Sep 2020 07:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z/FVuhB6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbgI2H71 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 29 Sep 2020 03:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgI2H71 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 29 Sep 2020 03:59:27 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEDEC0613D1
        for <phone-devel@vger.kernel.org>; Tue, 29 Sep 2020 00:59:25 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id s13so3605778wmh.4
        for <phone-devel@vger.kernel.org>; Tue, 29 Sep 2020 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z44OCwOHJFAg70e5aEAiWS8XZCl9H96J8tZarWdkMhw=;
        b=Z/FVuhB6HuycrwymG80hUaxXIvXS6rU4TG69hlvG+ssusxVSVTJLh0ht4r3+WubNj5
         pr1etCcepdla4i8XyhR+EHVnudUFAyVS4HcImrMUtW9/KE3fnqZPwX8gQkq3+Z7JUvne
         vhS3cq8/T0ve4f8JXT20BKpX7ZLj7xxHy3YTKepUFmJXieFECi1RrRyKCNXx8MMkfmna
         T7CA0BYn55VTGYB0MlioT8P1EiFkPRtaK21hPFWzIK3k0oCZSytZC3lOzUugRSolw25C
         x9FMzJeshW7diTqn154NjByRse9ZCJlSwLzXOGDNHYUSAD5sY2ZaWGZTCyIEsyocTbbP
         XpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z44OCwOHJFAg70e5aEAiWS8XZCl9H96J8tZarWdkMhw=;
        b=hUIotSwGsgOfSG/b/J1tmwJ20pBG/rJSsJKwgQvfyXLiA+bMlqPkA7bXd/Czj6rwwv
         CO8GGdOWfWCiGU8m+rXl4OB4byjdwZNLsQ/fIAwE9ji93OP1Q1ejnqBPwEHYZGWzs3K9
         5VwB6QHD3cDmtGLlkxQtkdV6esugMIk6Bcb26Svxs457gh2zsy0m43dfaBYYsN9tiWb4
         SkYb4xb+IfQm4xSdMj6EFZsmUVOQJxKpCqCZcbH2h4XqKD4K+ceJvEtWBPINzj0ORZ9M
         h/fI4f/LbblzXeASBxUr/Yjsfb/2D2X8vdjlvnbZ1Ot2tfSIRKlVwrwKg5jxORh4BAa1
         U4Ig==
X-Gm-Message-State: AOAM533Z+cgy1LuLoN9QGNR3f8A8DZnEbw88RQGIVwz0Ed60xJwF6Y9P
        83frzmvFrd23QFwZxvWy+Rwq29RPTH/+BUrDClBxGg==
X-Google-Smtp-Source: ABdhPJzIEZ5Ks8NozSFCE7r8LavP2lhCwbT/Q4oIeeySm7aOZ1AaUXYJS3rAIesL32tHY4cMAE2SVnySAJXWyvrB2hw=
X-Received: by 2002:a7b:c750:: with SMTP id w16mr727455wmk.16.1601366364393;
 Tue, 29 Sep 2020 00:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200927123542.553852-1-kholk11@gmail.com> <20200927123542.553852-3-kholk11@gmail.com>
 <CAMi1Hd1A-nRD57ETMnCbtKTFpQZ1f9-3D1SPx===BRx0f1FX7A@mail.gmail.com> <20200928215120.GP1681290@dtor-ws>
In-Reply-To: <20200928215120.GP1681290@dtor-ws>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Tue, 29 Sep 2020 13:28:48 +0530
Message-ID: <CAMi1Hd1YWXG=Ua5y74Zmd+cCOtHPRRLToH+dhTeAzNRbTQ71Gg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Input: Add Novatek NT36xxx touchscreen driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     kholk11@gmail.com, Rob Herring <robh+dt@kernel.org>,
        rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, Konrad Dybcio <konradybcio@gmail.com>,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue, 29 Sep 2020 at 03:21, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Sep 28, 2020 at 03:18:18PM +0530, Amit Pundir wrote:
> > On Sun, 27 Sep 2020 at 18:06, <kholk11@gmail.com> wrote:
> > >
> > > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> > >
> > > This is a driver for the Novatek in-cell touch controller and
> > > supports various chips from the NT36xxx family, currently
> > > including NT36525, NT36672A, NT36676F, NT36772 and NT36870.
> > >
> > > Functionality like wake gestures and firmware flashing is not
> > > included: I am not aware of any of these DrIC+Touch combo
> > > chips not including a non-volatile memory and it should be
> > > highly unlikely to find one, since the touch firmware is
> > > embedded into the DriverIC one, which is obviously necessary
> > > to drive the display unit.
> > >
> > > However, the necessary address for the firmware update
> > > procedure was included into the address table in this driver
> > > so, in the event that someone finds the need to implement it
> > > for a reason or another, it will be pretty straightforward to.
> > >
> > > This driver is lightly based on the downstream implementation [1].
> > > [1] https://github.com/Rasenkai/caf-tsoft-Novatek-nt36xxx
> > >
> >
> > This is so cool!
> >
> > Xiaomi PocoF1 phone uses same family touchscreen IC and I could
> > test this series on that phone as well.
> >
> > However I do have to make a minor change to get it working. The
> > downstream driver and even the github code you linked above use
> > GPIO mapped IRQ, and I had to switch to that to get touchscreen
> > working with your driver
> > https://github.com/pundiramit/linux/commit/0a73eb656c1e80787dc195641ce7b0076fddb38e.
> > I wonder if I'm missing any devicetree property other than interrupts?
>
> Simply specifying GPIO controller/pin as interrupt property should work,
> there should be no need to parse custom GPIO property and convert it to
> IRQ in the driver.
>

Indeed. I don't know what was tripping me off yesterday, but I got it
working today with interrupt properties. Thank you.

Regards,
Amit Pundir

> Thanks.
>
> --
> Dmitry
