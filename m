Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E27FC433B4
	for <phone-devel@archiver.kernel.org>; Sun,  4 Apr 2021 19:38:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6442361382
	for <phone-devel@archiver.kernel.org>; Sun,  4 Apr 2021 19:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhDDTiu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 4 Apr 2021 15:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbhDDTir (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 4 Apr 2021 15:38:47 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0181CC061788
        for <phone-devel@vger.kernel.org>; Sun,  4 Apr 2021 12:38:40 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id l15so10563998ybm.0
        for <phone-devel@vger.kernel.org>; Sun, 04 Apr 2021 12:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hEMNHDnnEQTjGv+UBbBULrhzzRLe2F12R53/17VXjb0=;
        b=B9GsalE02xtsa8Ddda3CbCRC3tgdul4XcIcP0nXJWPj6ZBEBCDqu6TFaV+hf29YHOb
         GjT2WxqKW+UhQWV0uCrOip2FEtH07IjCUjX/Uo0i5GGfaJbUhw/GjjdcTMKTW0NXLHid
         SC//VYMBgq8daR/x4TFSRd0OQeZn4p0G3Akp5f0BTH+vU73ZFqD+Jkj4E8og0Fuj6sNW
         QzYIPCK5WFQxcVuLUq1Qjgc589t6idc1f2vbEc0+7rcDJr2t2QzhcLAAjZ2no2j5WB3Q
         qLtHlvP1nMpCJ9ZYD13KOvtaSjd38CpnlFpXjkqSOaUayAp7F0EnDNodE4frOB0U4V6B
         1hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEMNHDnnEQTjGv+UBbBULrhzzRLe2F12R53/17VXjb0=;
        b=bvlb2m4/WCe3eq5guIpXCj2dSSFri94QHUs5R4hCtBMAVgGMoGXVwFTx4+hVAxDaWk
         +UnXiVJGlwFbyI57LECjOlJYF1MTifxqDGGVI5iI4fy4ElgH6qST+HfP1kfmLynT/oN3
         Cegw79InIkkmfr4dulwhQqSP0vx+TE0OgEcLTL8TzmRmFGj+L7+acDAlque9c2577j+V
         khtGiXQUg3MoY6MHTibqREKXXk1RHK8SZOZO0km8F+WC+zoZb1mlcq3YwaxC32Tq5Y6x
         TE/akujZneumjT6THUXgGBEoxHQ62bKmWGsypndzfEQXSdCzYwaUSWKteP8Ds1nrQ46O
         /5/A==
X-Gm-Message-State: AOAM5307jbQZH5bhiqN3BVDI4SJoSHcA1y+G7EsLOg2L5upYF1i1BaJD
        ZjV3qL4grfLhQnUt9fQ4fvB6hWMYgiGJJN488IIXow==
X-Google-Smtp-Source: ABdhPJz7yKjYPXOvq/L5w95hcEIYgnl6cI3gbVvEXDXBNHYxPbIEf9kUM+pwpFesgz3Y3w/9LOYMcbJNw+oWaRy7XJ4=
X-Received: by 2002:a25:686:: with SMTP id 128mr30849619ybg.258.1617565120199;
 Sun, 04 Apr 2021 12:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <1612945128-23174-1-git-send-email-amit.pundir@linaro.org> <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
In-Reply-To: <13bd5e9d-3f3b-0b97-aa48-9a7bc551ddf6@somainline.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 5 Apr 2021 01:08:04 +0530
Message-ID: <CAMi1Hd1zaqimVjy9-LyXduie3r1prnePC9fjVsHm8zJ07FdEWQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add DSI and
 panel bits
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Angelo,

On Thu, 11 Feb 2021 at 00:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> Il 10/02/21 09:18, Amit Pundir ha scritto:
> > From: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > Enabling the Display panel for beryllium requires DSI
> > labibb regulators and panel dts nodes to be added.
> > It is also required to keep some of the regulators as
> > always-on.
> >
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
>
> Hello!
> Your patch looks good, however, I have a few concerns...
>
> > +&ibb {
> > +     regulator-min-microvolt = <4600000>;
> > +     regulator-max-microvolt = <6000000>;
> > +};
> > +
>
> I think you want to also configure overvoltage and overcurrent
> protection values for both LAB and IBB, as these regulators may be a bit
> dangerous if used without.

It turned out I can't boot if I set regulator-max-microamp lab/ibb
values from downstream DT. Verified it a few times and same result.
Here is the decompiled downstream DTB for reference:
https://pastebin.ubuntu.com/p/4nPxzq6zf7/, just in case.

I'm not sure if over current protection value is tied to max-microamp,
but I added it anyway along with pull-down and soft-start properties
in next version of this patch.

Regards,
Amit Pundir

> Besides that, even if it wouldn't be that dangerous, since the
> protection features are present, it would be nice to configure them
> properly as in the rare event that something bad happens, you would be
> able to save the hardware (or at least have a chance to!).
>
> > +&lab {
> > +     regulator-min-microvolt = <4600000>;
> > +     regulator-max-microvolt = <6000000>;
> > +};
> > +
>
> Same here.
>
> Yours,
> -- Angelo
