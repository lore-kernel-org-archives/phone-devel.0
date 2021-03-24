Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5DFC433E1
	for <phone-devel@archiver.kernel.org>; Wed, 24 Mar 2021 09:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E02D5619FE
	for <phone-devel@archiver.kernel.org>; Wed, 24 Mar 2021 09:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhCXJOk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 24 Mar 2021 05:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhCXJOg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 24 Mar 2021 05:14:36 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF7AC061763
        for <phone-devel@vger.kernel.org>; Wed, 24 Mar 2021 02:14:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x7so1171150wrw.10
        for <phone-devel@vger.kernel.org>; Wed, 24 Mar 2021 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4rN1YksKNQ6jMnv83wrys0vsQCA6pM1XeLstkQR9zSk=;
        b=aaEalBsXBstsM7Ugh18M+hl8k/wTbYlQwQ6ihztFCEL9SFffFl/IlB3eU6LSKJs1k4
         GjK340N7lCr3K0iNQ2HLCSKfu9qwSSS5Mp8zQ/OAzufhpBV6bxJQJuLmIMW602QW0Z0i
         CTqj7hTA4262C48pcQPTWxgvKGSQ1LQgks/73S/V10RAeBK5hHJhx7ZbxahrIHGsK5bU
         crb2aPqZrt9ArMgFvNEf6/iL2Ia25u/EldQEsOKbOrKgyMUfulRjc6gCETsPm62Fki99
         ayEXOIgKaYa4YohjIIoMQ+HavVGjkXvTiQCd0/ZohrHC0rsOqSu+B+oZ12+Csh5u+2CE
         xVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4rN1YksKNQ6jMnv83wrys0vsQCA6pM1XeLstkQR9zSk=;
        b=mFAqjipkTi5yqLS89M5JI5AtXTLmErxpSFrl5KgfudFmFPymhEGrdVmyXy/z6V52r5
         xqi1GX9t4/6tYZF/aMVrJI3WL1qERznn2FIMmCzzSTRUwVM/Uk8el55xh0moMZVTAg+G
         3Iu9sSMo6hDdHKJ4l9U6xquaSrmd3OE1DWZCqaMYtaNHHdVsfuuhH8MGSrC0d7dQNVvu
         iImEZM1fnl8QkSV1jfeQCsz8wxGgHWaZfX53OPiqvi8or7bTP010anHTZI4gS7t3OPyJ
         cDxWI7iBrE7Oypl+c1ZZXc8wM5u6TdVao3cgha3mcYC8m4s6ZF0AHSoxIWWDTC5tEuJE
         r9UA==
X-Gm-Message-State: AOAM530WiNlo/hle1YWDSE64wz2YMeuy+0NIpSF/WtgjJtSE2f1vHdm8
        zm0jtJsNDzIRzdpfmVnZPE5BDucapgF0QQ==
X-Google-Smtp-Source: ABdhPJwiwVGAQSOrEM4tqzstTbRBmqfvaxH3KFKNSYNSQI1y++GJvlZicb7puOlrOD6JdzLf3utu9Q==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr2327816wrn.315.1616577275230;
        Wed, 24 Mar 2021 02:14:35 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id n1sm2536565wro.36.2021.03.24.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 02:14:34 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:14:32 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Jingoo Han <jingoohan1@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Message-ID: <20210324091432.GC2916463@dell>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan>
 <20210323083935.GF2916463@dell>
 <CAMuHMdUamD4rAY1Sn-3Fb9Xf1B9g0FY0Pob8rAFsFR0ZcNZ0rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUamD4rAY1Sn-3Fb9Xf1B9g0FY0Pob8rAFsFR0ZcNZ0rw@mail.gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 24 Mar 2021, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Tue, Mar 23, 2021 at 9:40 AM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 22 Mar 2021, Daniel Thompson wrote:
> > > On Sun, Feb 28, 2021 at 01:41:05PM +0100, Konrad Dybcio wrote:
> > > > Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.
> > > >
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > >
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> >
> > Why are you Reviewing/Acking a patch that was applied on the 10th?
> 
> Only 12 days later?!?
> 
> It's not uncommon to receive acks for patches after they have been
> applied upstream. But it is if the patch was applied 10 years and 9
> months ago!
> https://lore.kernel.org/linux-m68k/F5513AE92A5A1047AC2F91AEBB9202680288CBBA3983@E2K7-MS2.ds.strath.ac.uk/

That truly is next level! :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
