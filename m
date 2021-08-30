Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C07EC4320A
	for <phone-devel@archiver.kernel.org>; Mon, 30 Aug 2021 15:17:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AA0B60F45
	for <phone-devel@archiver.kernel.org>; Mon, 30 Aug 2021 15:17:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237542AbhH3PSf (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 30 Aug 2021 11:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237529AbhH3PSe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 30 Aug 2021 11:18:34 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B185EC061575
        for <phone-devel@vger.kernel.org>; Mon, 30 Aug 2021 08:17:40 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id bi4so16478192oib.9
        for <phone-devel@vger.kernel.org>; Mon, 30 Aug 2021 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UodsSaybFS+B/HzELWo0xvW1DgkRVgPuzmD8NNmWe0g=;
        b=p4KTvOb1gEM/lV2CwtI4iTGc5YVBABSnKjewNuL7KmIC4Q7I1u6/v1CtNgMkncaiak
         AsnI+n9gL3bUkrolaCG9MvtXJtGxpghgQIkRM0ZXhkmKkTz+Ux49bFB5JAfUD8t+fnmm
         jqnc1FisWV1GAxKoiuthJc08CJ3T72m8SX7M6/4Mzy9otlIwP9RGZwEy6Fz4GUiWNNrs
         VgzuJXXYxwZA1AaXqHYEVo6Uyuu/aB19cc1Bi2YjK/6I1NN/n97CVqvVdrqZ3j/ZK64Y
         QByeylBNs75MHvbbKS1oSy89y3mwupgUWAC8xaaJfq7HNe7VIm+LRHPYCyPxy+4pSPNy
         8UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UodsSaybFS+B/HzELWo0xvW1DgkRVgPuzmD8NNmWe0g=;
        b=Nm6D3whCdq6XCjZlNvSzSe2AwSfNnO1KuFP+T8oTU2qtpqcFTfsUQ1ja+prsnOuwqT
         TeLjN0okmJiu00Bs2FvY7x7P1hE2I1T2CFUQRUA8Z2Tnj7BolEHFQQQ/2erVWGb9JfkL
         xJT4T4vGlgfz7vQcVdQ0EOXFXpgVGe/+383PHZrKqB+DkUiFmRUswOhIzu7k0pSHqikA
         XbSydX+t7UVDXxFAvXvaStNAU3QjUvE3Uvnvlho91RWdT28xU5WwnNp//rWOR0v0W+nE
         zZqT12S4yGFH6NdNrdnAiegZuUbE5SyI9KZ/c/Ra/pJqlvsw7vy7NYlsjogSfkKhDG/+
         1OsA==
X-Gm-Message-State: AOAM530ZHyeHi8/SFNbXRr5WeU8fxTMQJX+Lb1qfJkt6xyyZc+Xb5aLg
        8ldP2h5JQ92FsRKtNp7fIBWiig==
X-Google-Smtp-Source: ABdhPJx8IcG+eengfDoikLbEaWjNE5uCt6ZewPDPXr4Vy0UnZPy7waFs5hfr5egwUvXGzPrNdSnsIA==
X-Received: by 2002:aca:3c09:: with SMTP id j9mr10427025oia.115.1630336659461;
        Mon, 30 Aug 2021 08:17:39 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m24sm3021107oie.50.2021.08.30.08.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 08:17:39 -0700 (PDT)
Date:   Mon, 30 Aug 2021 10:17:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI
 PLL reference
Message-ID: <YSz2kVKv8jhz7/n8@yoga>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
 <20210829203027.276143-2-marijn.suijten@somainline.org>
 <CAA8EJprQ03ipZzO+1vgt9W7jFbLXgsYR0n-oJxVB-142x8dgRA@mail.gmail.com>
 <17d19b93-dbe5-cc85-f302-b52cd8eeed56@somainline.org>
 <CAA8EJpqd7_5510TodALnX13Wo0MufYm2G=r6vw9sy=VURrewyw@mail.gmail.com>
 <YSznouVZ93sUd6xa@Marijn-Arch-PC.localdomain>
 <CAA8EJpoRo6rPgpUeT9X0K4UPu5d8-YBP=BJ3AAejD+wujhmv+g@mail.gmail.com>
 <YSzqR2yq3MtdPnIG@Marijn-Arch-PC.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSzqR2yq3MtdPnIG@Marijn-Arch-PC.localdomain>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon 30 Aug 09:25 CDT 2021, Marijn Suijten wrote:

> On Mon, Aug 30, 2021 at 05:18:37PM +0300, Dmitry Baryshkov wrote:
> > On Mon, 30 Aug 2021 at 17:14, Marijn Suijten
> > <marijn.suijten@somainline.org> wrote:
> > >
> > > On Mon, Aug 30, 2021 at 04:24:58PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, 30 Aug 2021 at 11:28, Marijn Suijten
> > > > <marijn.suijten@somainline.org> wrote:
> > > > >
> > > > > Hi Dmitry,
> > > > >
> > > > > On 8/30/21 3:18 AM, Dmitry Baryshkov wrote:
> > > > > > On Sun, 29 Aug 2021 at 23:30, Marijn Suijten
> > > > > > <marijn.suijten@somainline.org> wrote:
> > > > > >>
> > > > > >> The 28NM DSI PLL driver for msm8960 calculates with a 27MHz reference
> > > > > >> clock and should hence use PXO, not CXO which runs at 19.2MHz.
> > > > > >>
> > > > > >> Note that none of the DSI PHY/PLL drivers currently use this "ref"
> > > > > >> clock; they all rely on (sometimes inexistant) global clock names and
> > > > > >> usually function normally without a parent clock.  This discrepancy will
> > > > > >> be corrected in a future patch, for which this change needs to be in
> > > > > >> place first.
> > > > > >>
> > > > > >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > > > >
> > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > >
> > > > > > Checked the downstream driver, it always uses 27 MHz clock in calculations.
> > > > >
> > > > >
> > > > > Given our concerns for msm8974 not updating DT in parallel with the
> > > > > kernel (hence the need for a global-name fallback because "ref" is
> > > > > missing from the DT), should we worry about the same for apq8064?  That
> > > > > is, is there a chance that the kernel but not the firmware is upgraded
> > > > > leading to the wrong parent clock being used?  The msm8960 variant of
> > > > > the 28nm PLL driver uses parent_rate in a few places and might read
> > > > > cxo's 19.2MHz erroneously instead of using pxo's 27MHz.
> > > >
> > > > Checked the code. It uses .parent_names =  "pxo", so changing ref
> > > > clock should not matter. We'd need to fix ref clocks and after that we
> > > > can switch parent names to fw_name.
> > >
> > > Correct, hence why this patch is ordered before the switch to .fw_name.
> > > These patches can't go in the same series if apq8064 doesn't update its
> > > firmware in parallel with the kernel just like msm8974.  Do you know if
> > > this is the case?  If so, how much time do you think should be between
> > > the DT fix (this patch) and migrating the drivers?
> > 
> > You can have parent_data with .fw_name and .name in it.  .name will be
> > used as a fallback if .fw_name doesn't match.
> 
> The problem is that it will always find the "ref" clock which references
> &cxo_board until the DT is updated with this patch to use &pxo_board
> instead.  Question is, will the kernel and DT usually/always be updated
> in parallel?
> 

Afaik these devices all boots off a boot.img, which means that it's
unlikely that a new kernel is installed on a device with an older DT.
None of them would boot mainline off the DT that shipped with the
original product.

As such, if I pick this patch up as a fix for 5.15 you can respin the
other two patches and they can land in 5.16 and I would be surprised if
anyone will run into any issues with it.


I.e. I've applied this patch.

Regards,
Bjorn
